#!/usr/bin/perl
# Converts FASTA format (.fasta, .fsa, .fas) to PHYLIP

# define program usage
$usage = "\nUsage: $0 FASTA_filename";
$ARGV[0] or die $usage;

	### Make array of names ###

my @name;
my $num_seq = 0;

# open FASTA file
open ( FASTA, $ARGV[0] ) || die "Can't open $ARGV[0]";

# read contents and make an array of names, as well as calculate the number of sequences
while ( $line = <FASTA> ){
  if( $line =~ /\A>(.*)\s/ ){
    push @name, $1;
    $num_seq++;
  }
  push @file, $line;	#turn the entire file into an array for use below
}

# close FASTA file
close FASTA;

	### Make array of sequences ###

# join @file into a string
$file = join( '', @file );
#$file =~ /(>.*\n){1}(.*\s)/;
#print $1;

# split $file into another array only consisting of sequences
my @seq = split( />.*\n/, $file );

# remove newlines from @seq
for( $i = 0; $i < @seq; $i++){
  $seq[$i] =~ s/\n//g;
}

shift(@seq);

	### Calculations for proper spacing in output ###

# find the sequence with the longest name
my $longest_name = '';
for ( $i = 0; $i < @name; $i++ ){
  if (length $name[$i] > length $longest_name){
    $longest_name = $name[$i];
  }
}

# proper spacing is +3 spaces past longest name
$max_space = (length $longest_name) + 3;

	### Calculate length of alignment ###

# in a proper alignment, all sequences are the same length
$len_seq = length ($seq[0]);

	### Print output in phylip format ###

# print number of taxa, followed by length of alignment
print "\n$num_seq $len_seq\n";

# print taxon names and sequences, separated by tab
for( $i = 0; $i < @name; $i++ ){
  print $name[$i];
  $space_ct = $max_space - length($name[$i]);
  for( $j = 1; $j <= $space_ct; $j++ ){
    print " ";
  }
  print $seq[$i], "\n";
}
 
exit;