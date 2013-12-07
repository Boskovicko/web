package Preamble;

use Modern::Perl;
use Moose;
use YAML::Tiny;
use vars '$AUTOLOAD';

has 'raw' => (is => 'ro', isa => 'YAML::Tiny');
has 'hash' => (is => 'ro', isa => 'HashRef');
has 'source' => (is => 'ro', isa => 'Str');

sub BUILD
{
    my $self = shift;
    my $args = shift;
    $self->{source} = $args->{string} . "\n" || '';
    $self->{raw} = YAML::Tiny->new->read_string($self->source);
    $self->{hash} = $self->raw->[0];
}

sub published
{
    my $self = shift;
    my $published = $self->hash->{published} || 'true';
    return not ($published eq 'false');
}

sub tags
{
    my $self = shift;
    my $raw_tags = $self->hash->{tags} || '';
    return $raw_tags if (ref($raw_tags) eq 'ARRAY');
    return [split /\s+/, $raw_tags];
}

sub AUTOLOAD
{
    my $self = shift;
    (my $method = $AUTOLOAD) =~ s/.*:://;
    return $self->hash->{$method};
}

'sdg';
