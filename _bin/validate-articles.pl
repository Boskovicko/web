#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use List::Util qw/any none/;
use File::Basename 'basename';
use Jekyll::Site;

sub regex_find_all
{
    my $regex = shift;
    my $string = shift;
    my $matches = [];
    my $line_no = 1;
    for my $line (split /\n/, $string) {
        while ($line =~ /$regex/g) {
            push $matches, [$line_no, $-[0]+1];
        }
        $line_no++;
    }
    return $matches;
}

my @rules = (
    {
        condition => sub { length(shift->head->author) <= 3 },
        message => "Krátké jméno autora, není to jen značka?",
        regex => qr/^author:/
    }, {
        condition => sub { none { $_ =~ /\d{1,2}-20\d{2}/ } @{shift->head->tags} },
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
    }, {
        condition => sub { shift->body =~ /m2/ },
        message => "Myšleno metr čtvereční? Pišme m².",
        regex => qr/m2/
    }
);

my $root = shift @ARGV || '_posts';
my $site = Jekyll::Site->new(root => $root);

for my $post ($site->all_posts) {
    next unless $post->head->published;
    for my $rule (@rules) {
        next unless $rule->{condition}->($post);
        my $occurences = $rule->{regex} ?
            regex_find_all($rule->{regex}, $post->source) :
            [[0, 0]];
        for my $loc (@$occurences) {
            printf "%s:%i:%i:%s\n", $post->path, $loc->[0], $loc->[1], $rule->{message};
        }
    }
}
