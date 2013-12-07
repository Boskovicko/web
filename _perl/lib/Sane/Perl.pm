package Sane::Perl;

use strict;
use warnings;
use utf8;

sub import {
    warnings->import();
    strict->import();
    utf8->import();
    feature->import(":5.16");
    binmode STDOUT, ':encoding(utf-8)';
    binmode STDERR, ':encoding(utf-8)';
}

'sdg';
