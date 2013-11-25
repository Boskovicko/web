package Jekyll;

use Article;
use Moose;
use File::Find::Rule;

has 'articles' => (
    is => 'ro',
    isa => 'ArrayRef',
    traits => ['Array'],
    handles => { 'all_articles' => 'elements' }
);

sub BUILD
{
    my $self = shift;
    my $args = shift;
    my @paths = File::Find::Rule->file()->name('*.md')->in($args->{root});
    $self->{articles} = [map { Article->new(file => $_) } @paths];
}

sub tags
{
    my $self = shift;
    my %tags;
    for my $a ($self->all_articles) {
        for my $t (@{$a->head->tags}) {
            $tags{$t} = [] unless $tags{$t};
            push $tags{$t}, $a;
        }
    }
    return \%tags;
}

'sdg';
