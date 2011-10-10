#!/usr/bin/env perl
use Modern::Perl;
use autodie;

my $file = 'tasks_with_answers.org';

open my $F, "<", $file;

#my $header = 1;
my $question = 0;
while (<$F>) {
    # sessions
    say if /^\* /;

#    $question = 1 if /^\- /;
    $question = 1 if /^\*\*/;
    $question = 0 if /\\pause/;

    next if /^\*\*/;
    next if /^\#/;
    s/\- //;
    s/\\texttt\{([^}]+)\}/$1/;

    # print out question lines
    print if $question;

}
