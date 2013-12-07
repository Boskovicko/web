package Article;

use Modern::Perl;
use Preamble;
use Moose;
use File::Slurp 'read_file';
use Cwd 'abs_path';

has 'path'   => (is => 'ro', isa => 'Maybe[Str]');
has 'head'   => (is => 'ro', isa => 'Preamble');
has 'body'   => (is => 'rw', isa => 'Str');
has 'source' => (is => 'ro', isa => 'Str');

sub BUILD
{
    my $self = shift;
    my $args = shift;

    $self->{source} = $args->{string} || read_file($args->{file}) || '';
    $self->{path} = abs_path($args->{file}) if $args->{file};

    my @docs = split(/^---.*\n/m, $self->source);

    if (@docs == 1) {
        # Just body, no preamble
        $self->{head} = Preamble->new;
        $self->{body} = shift @docs;
    } elsif (@docs == 2 || (@docs == 3 && shift @docs eq '')) {
        # Body + preamble, optional intro header
        $self->{head} = Preamble->new(string => shift @docs);
        $self->{body} = shift @docs;
    } else {
        # God knows what
        die "Invalid article structure";
    }
}

'sdg';
