package Jekyll;

use Modern::Perl;
use Article;
use Moose;
use File::Find::Rule;
use Cwd 'abs_path';

has 'root' => (is => 'ro', isa => 'Str');
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

    $self->{root} = abs_path($args->{root});
    my @paths = File::Find::Rule->file()->name('*.md')->in($self->root);
    $self->{articles} = [map { Article->new(file => $_) } @paths];
}

sub tags
{
    my $self = shift;
    my $tags;
    for my $article ($self->all_articles) {
        for my $tag (@{$article->head->tags}) {
            $tags->{$tag} ||= [];
            push $tags->{$tag}, $article;
        }
    }
    return $tags;
}

sub authors
{
    my $self = shift;
    my $authors;
    for my $article ($self->all_articles) {
        for my $name ($article->head->author) {
            $authors->{$name} ||= [];
            push $authors->{$name}, $article;
        }
    }
    return $authors;
}

'sdg';
