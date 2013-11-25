package Article;

use Preamble;
use Moose;
use CLASS;
use File::Slurp;

has 'path' => (is => 'ro', isa => 'Maybe[Str]');
has 'head' => (is => 'ro', isa => 'Preamble');
has 'body' => (is => 'rw', isa => 'Str');

sub BUILD
{
    my $self = shift;
    my $args = shift;
    my $text = $args->{string} || $args->{text} || read_file($args->{file}) || '';
    my @parts = $self->split_documents($text);
    unshift @parts, '' while (@parts < 2);
    $self->{path} = $args->{file};
    $self->{head} = Preamble->new(text => shift @parts);
    $self->{body} = shift @parts;
}

sub split_documents
{
    my $self = shift;
    my $text = shift;
    $text =~ s/^---.*\n//; # remove optional intro separator
    my @parts = split(/^---.*\n/m, $text);
    return @parts;
}

CLASS->meta->make_immutable;

'sdg';
