use Test::Most;
use Article;
use utf8;

my $sample = do { local $/; <DATA> };
my $a = Article->new(text => $sample);
isa_ok($a, Article->CLASS);
is($a->head->title, 'Titulek článku');
is($a->head->author, 'Žibřid Maniš');
ok(!$a->head->published);
is($a->body, "Text.\n");

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
