#!/usr/bin/env perl

use utf8;
use open qw/:std :utf8/;
use FindBin qw($Bin);
use lib $Bin;
use Modern::Perl;
use List::Util qw/any none/;
use Text 'regex_find_all';
use Jekyll;

my $root = shift @ARGV || '_posts';
my $jekyll = Jekyll->new(root => $root);
my @rules = (
    {
        condition => sub { length(shift->head->author) <= 3 },
        message => "Krátké jméno autora, není to jen značka?",
        regex => qr/^author:/,
        where => 'head'
    }, {
        condition => sub { none { $_ =~ /\d{2}-20\d{2}/ } @{shift->head->tags} },
        message => "Nechybí tag pro tiskové vydání?",
        regex => qr/tags:/,
        where => 'head'
    }, {
        condition => sub { any { $_ =~ /\// } @{shift->head->tags} },
        message => "Lomítko v názvech témat, dělá neplechu v URL.",
        regex => qr/tags:/,
        where => 'head'
    }, {
        condition => sub { shift->body =~ /\s+-\s+/ },
        message => "Rozdělovník místo pomlčky?",
        regex => qr/(?<=\s)-\s+/,
        where => 'body'
    }
);

for my $article ($jekyll->all_articles) {
    next unless $article->head->published;
    for my $rule (@rules) {
        next unless $rule->{condition}->($article);
        my $occurences = regex_find_all($rule->{regex}, $article->source);
        for my $loc (@$occurences) {
            printf "%s:%i:%i:%s\n", $article->path, $loc->[0], $loc->[1], $rule->{message};
        }
    }
}
