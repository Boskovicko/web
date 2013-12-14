use Sane::Perl;
use Test::Most tests => 3;
use Test::WWW::Mechanize;

my $root = 'http://boskovicko.cz';
my $mech = Test::WWW::Mechanize->new;

$mech->get_ok($root, 'Titulka je dostupná');

$mech->get_ok($root . '/cislo.phtml?section=1&iss_id=511', 'Přesměrování URL ze starého webu');
$mech->content_contains("Advent začal");
