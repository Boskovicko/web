package Text;

use Modern::Perl;
use Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA = 'Exporter';
@EXPORT = ();
@EXPORT_OK = 'regex_find_all';

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

'sdg';
