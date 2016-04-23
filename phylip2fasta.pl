#!/usr/bin/perl
# Converts PHYLIP format (.phy) to FASTA

# define program usage
$usage = "\nUsage: $0 PHYLIP_filename";
$ARGV[0] or die $usage;

# open PHYLIP file
open ( PHYLIP, $ARGV[0] ) || die "Can't open $ARGV[0]";

# read contents and separate names and sequences into two different arrays
my @name;
while ( $line = <PHYLIP> ){
  if( $line =~ /(.*) {3,}(.*)/ ){
    print ">$1\n$2\n";
  }
}

# close PHYLIP file
close PHYLIP;

exit;