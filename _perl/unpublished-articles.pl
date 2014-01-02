#!/usr/bin/env perl

use lib "./lib";
use Modern::Perl;
use feature 'say';
use Jekyll;

my $root = shift @ARGV || '../_posts';
my $jekyll = Jekyll->new(root => $root);
say for
    map { $_->path }
    grep { not $_->head->published }
    $jekyll->all_articles;
