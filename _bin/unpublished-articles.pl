#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;
use Jekyll::Site;

my $root = shift @ARGV || '_posts';
my $site = Jekyll::Site->new(root => $root);
say for
    map { $_->path }
    grep { not $_->head->published }
    $site->all_posts;
