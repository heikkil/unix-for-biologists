#!/usr/bin/env perl
use Modern::Perl;
use autodie;

# open input file
my $file = shift;
$file ||= 'questions_with_answers.org';
open my $F, "<", $file;

our $OUT;    # output files
my $question = 0;

while (<$F>) {
    # sessions
    # open a new file for each section
    if (/^\* /) {
	my $line = $_;
	chomp;
	s/[^:]+:/Questions/;
	s/ +/_/g;
	my $outfile = $_. ".txt"; say $outfile;
	open $OUT, ">", $outfile;
	say $OUT $line;
	next;
    }

    # what defines the range of lines in questions
    $question = 1 if /^\*\*/;
    $question = 0 if /\\pause/;

    # every frame needs to be numbered
    print $_  if /^\*\*/ and not /^\*\* *(\d+\.)/; # debug
    print $OUT "$1 " and next if /^\*\* *(\d+\.)/;
    next if /^\#/;
    s/\- +//;
    s/\\texttt\{([^}]+)\}/$1/g;
    s/\\land /\^/g;
    s|\\_|_|g;
    # print out question lines
    print $OUT $_ if $question;

}
