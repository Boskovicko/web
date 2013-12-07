use Sane::Perl;
use Test::Most;
use Article;
use Text 'regex_find_all';

my $sample = do { local $/; <DATA> };
my $a = Article->new(string => $sample);
is($a->head->title, 'Titulek článku');
is($a->head->author, 'Žibřid Maniš');
ok(!$a->head->published);
is($a->body, "Text.\n");
is_deeply($a->head->tags, [qw/foo bar baz/]);
is_deeply(regex_find_all(qr/ba/, $a->source), [[6, 11], [6, 15]]);
is_deeply(regex_find_all(qr/^author:/, $a->head->source), [[3, 1]]);

done_testing();

__DATA__
---
title: Titulek článku
published: false
author: Žibřid Maniš
category: XXX
tags: foo bar baz
---
Text.
