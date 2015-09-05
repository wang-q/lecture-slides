#!/usr/bin/perl

package World;
use Moose;
with 'MooseX::Getopt';

has 'size' => ( isa => 'Int', is => 'rw', default => 100, );
has 'rate' => ( isa => 'Num', is => 'rw', default => 0.05, );
has 'target' => (
    isa       => 'Str',
    is        => 'ro',
    default   => 'METHINKS IT IS LIKE A WEASEL',
    metaclass => 'NoGetopt',
);
has 'current_generation' => (
    isa       => 'ArrayRef[Weasel]',
    is        => 'rw',
    metaclass => 'NoGetopt',
);

sub BUILD {
    my $self = shift;

    # first generation
    my @population;
    for ( 1 .. $self->size ) {
        my $individual = Weasel->new(
            target => $self->target,
            rate   => $self->rate,
        );
        push @population, $individual;
    }
    $self->{current_generation}
        = [ sort { $b->fitness <=> $a->fitness } @population ];

    return;
}

sub new_generation {
    my $self = shift;

    my @population;
    for ( 1 .. $self->size ) {
        my $child = $self->best->spawn;
        push @population, $child;
    }
    @population = sort { $b->fitness <=> $a->fitness } @population;

    $self->current_generation( [@population] );
}

sub best {
    my $self = shift;
    $self->current_generation->[0];
}

sub run {
    my $self = shift;
    $self->new_generation until $self->best->perfect;
}

after new_generation => sub {
    my $self = shift;
    print $self->best->to_string;
};

after run => sub {
    my $self = shift;
    print "\n[Report]\n";
    print "Population size:  ${\$self->size}\n";
    print "Mutation rate:    ${\$self->rate}\n";
    print "Final generation: ${\$self->best->generation}\n";
};

1;

package Mutation;
use Moose::Role;

use String::Compare;

has 'fitness' => ( isa => 'Num', is => 'rw', lazy_build => 1 );

sub _build_fitness {
    my $self = shift;
    return String::Compare::char_by_char( $self->string, $self->target );
}

sub inherit_string {
    my $self = shift;
    return join '',
        map { $self->mutate($_) } 0 .. ( length $self->parent->string ) - 1;
}

sub random_str {
    my $self = shift;
    return join '',
        map { $self->random_char } 0 .. ( length $self->target ) - 1;
}

sub random_char {
    my $self = shift;
    return ( 'A' .. 'Z', ' ' )[ rand(27) ];
}

sub mutate {
    my $self   = shift;
    my $idx    = shift;
    my $target = substr( $self->parent->string, $idx, 1 );

    # locking to target
    #return $target if $target eq substr( $self->target, $idx, 1 );
    return $target unless rand() < $self->rate;
    return $self->random_char;
}

1;

package Weasel;
use Moose;
with 'Mutation';

has 'target'     => ( isa => 'Str',    is => 'ro', );
has 'rate'       => ( isa => 'Num',    is => 'ro', );
has 'parent'     => ( isa => 'Weasel', is => 'ro', );
has 'generation' => ( isa => 'Int',    is => 'ro', );
has 'string'     => ( isa => 'Str',    is => 'ro', );

sub BUILD {
    my $self = shift;

    # build generation
    if ( $self->parent ) {
        $self->{generation} = $self->parent->generation + 1;
    }
    else {
        $self->{generation} = 0;
    }

    # build string
    if ( $self->parent ) {
        $self->{string} = $self->inherit_string;
    }
    else {
        $self->{string} = $self->random_str;
    }

    return;
}

sub perfect {
    my $self = shift;
    return $self->fitness > 0.9999;
}

sub spawn {
    my $self  = shift;
    my $child = Weasel->new(
        parent => $self,
        target => $self->target,
        rate   => $self->rate,
    );
    return $child;
}

sub to_string {
    my $self = shift;
    return
          " ${\sprintf('%04d', $self->generation)}: "
        . "[${ \$self->string }] "
        . "(${\sprintf('%1.4f', $self->fitness)})\n";
}

1;

package main;
my $world = World->new_with_options;
$world->run;

__END__

>perl weasels.pl --size 50 --rate 0.025
