package Preamble;

use Moose;
use CLASS;
use YAML::Tiny;
use vars '$AUTOLOAD';

has '_raw' => (is => 'ro', isa => 'YAML::Tiny');
has '_hash' => (is => 'ro', isa => 'HashRef');

sub BUILD
{
    my $self = shift;
    my $args = shift;
    my $text = $args->{text} || '';
    $self->{_raw} = YAML::Tiny->new->read_string("$text\n");
    $self->{_hash} = $self->_raw->[0];
}

sub published
{
    my $self = shift;
    my $published = $self->_hash->{published} || 'true';
    return not ($published eq 'false');
}

sub AUTOLOAD
{
    my $self = shift;
    (my $method = $AUTOLOAD) =~ s/.*:://;
    return $self->_hash->{$method};
}

CLASS->meta->make_immutable;

'sdg';
