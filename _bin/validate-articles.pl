#!/usr/bin/env perl

use utf8;
use open qw/:std :utf8/;
use FindBin qw($Bin);
use lib $Bin;
use Modern::Perl;
use List::Util qw/any none/;
use Jekyll;

sub validate_article
{
    my $article = shift;
    my $jekyll = shift;
    my $warnings = 0;

    my $warn = sub {
        my $reason = shift;
        warn $jekyll->article_path($article), ": ", $reason, "\n";
        $warnings++;
    };

    if (length($article->head->author) <= 3) {
        $warn->("Krátké jméno autora: „" . $article->head->author . "“, není to jen značka?");
    }

    if (none { $_ =~ /\d{2}-20\d{2}/ } @{$article->head->tags}) {
        $warn->("Nechybí tag pro tiskové vydání?");
    }

    if (any { $_ =~ /\// } @{$article->head->tags}) {
        $warn->("Lomítko v názvech témat, dělá neplechu v URL.");
    }

    return $warnings;
}

my $root = shift @ARGV || '_posts';
my $jekyll = Jekyll->new(root => $root);
my $warnings = 0;

for my $article ($jekyll->all_articles) {
    next unless $article->head->published;
    $warnings += validate_article($article, $jekyll);
}

say scalar $jekyll->all_articles, " článků, $warnings varování.";
