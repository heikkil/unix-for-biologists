#!/usr/bin/env perl
use Modern::Perl;
use autodie;

my $file = shift;
$file ||= 'questions_with_answers.org';

open my $F, "<", $file;

our $OUT;    # output files

my $question = 0;


while (<$F>) {
    # sessions
    #say if /^\* /;

    if (/^\* /) {
	my $line = $_;
	chomp;
	s/[^:]+:/Questions/;
	s/ +/_/g;
	my $outfile = $_. ".txt"; say $outfile;
	open $OUT, ">", $outfile;
	say $OUT $line;
    }


    $question = 1 if /^\*\*/;
    $question = 0 if /\\pause/;

    next if /^\*\*/;
    next if /^\#/;
    s/\- +//;
    s/\\texttt\{([^}]+)\}/$1/g;
    s/\\land /\^/g;
    s|\\_|_|g;
    # print out question lines
    print $OUT $_ if $question;

}
