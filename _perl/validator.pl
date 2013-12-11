#!/usr/bin/env perl

use lib "./lib";
use Sane::Perl;
use List::Util qw/any none/;
use Text 'regex_find_all';
use File::Basename 'basename';
use Jekyll;

my $root = shift @ARGV || '../_posts';
my $jekyll = Jekyll->new(root => $root);
my @rules = (
    {
        condition => sub { length(shift->head->author) <= 3 },
        message => "Krátké jméno autora, není to jen značka?",
        regex => qr/^author:/
    }, {
        condition => sub { none { $_ =~ /\d{2}-20\d{2}/ } @{shift->head->tags} },
        message => "Nechybí tag pro tiskové vydání?",
        regex => qr/^tags:/
    }, {
        condition => sub { any { $_ =~ /\// } @{shift->head->tags} },
        message => "Lomítko v názvech témat, dělá neplechu v URL.",
        regex => qr/^tags:/
    }, {
        condition => sub { shift->body =~ /\s+-\s+/ },
        message => "Rozdělovník místo pomlčky?",
        regex => qr/(?<=\s)-\s+/
    }, {
        condition => sub { shift->body =~ /^\s+$/m },
        message => "Nadbytečné bílé znaky na řádku.",
        regex => qr/^\s+$/
    }, {
        condition => sub { basename(shift->path) !~ /^[\w\-\.\/]+$/ },
        message => "Nepovolené znaky v názvu souboru."
    }, {
        condition => sub { shift->body =~ /\s+$/ },
        message => "Nadbytečné bílé znaky na konci řádku.",
        regex => qr/\s+$/
    }, {
        condition => sub { shift->body =~ /\.{3}/ },
        message => "Trojtečka (...) místo výpustku (…).",
        regex => qr/\.{3}/
    }
);

for my $article ($jekyll->all_articles) {
    next unless $article->head->published;
    for my $rule (@rules) {
        next unless $rule->{condition}->($article);
        my $occurences = $rule->{regex} ?
            regex_find_all($rule->{regex}, $article->source) :
            [[0, 0]];
        for my $loc (@$occurences) {
            printf "%s:%i:%i:%s\n", $article->path, $loc->[0], $loc->[1], $rule->{message};
        }
    }
}
