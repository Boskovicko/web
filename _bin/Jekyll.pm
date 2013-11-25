package Jekyll;

use Article;
use Moose;
use CLASS;
use File::Find::Rule;

has 'articles' => (is => 'ro', isa => 'ArrayRef');

sub BUILD
{
    my $self = shift;
    my $args = shift;
    my @paths = File::Find::Rule->file()->name('*.md')->in($args->{root});
    my @articles = map { Article->new(file => $_) } @paths;
    $self->{articles} = \@articles;
}

CLASS->meta->make_immutable;

'sdg';
