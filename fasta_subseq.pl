#!/usr/bin/perl
# fasta_subseq.pl
# modified from guillory_assn05.2.pl

# Prompt user for .fasta sequence and clean input
print "Enter input data filename (FASTA format only): ";
$INPUT = <STDIN>; chomp $INPUT;
#$INPUT = "atp1.fasta";

# Read input file
open( FASTA, $INPUT ) || die "Can't open $input: $!\n";
while( $LINE = <FASTA> ){
  if( $LINE =~ /\A>/ ){
    $HEAD = $LINE;
  }else{
    $DNA = $LINE;
  }
}
close FASTA;

# Prompt user for other required variables and clean input
print "Enter start coordinate: "; $START = <STDIN>;  chomp $START;   # Desired start coordinate, included in output
print "Enter end coordinate: ";   $END = <STDIN>;    chomp $END;     # Desired end coordinate, included in output
print "Enter strand (fwd/rev): "; $STRAND = <STDIN>; chomp $STRAND;  # Specify forward or reverse strand

# Extract specified sequence;
$SEQ=substr($DNA, $START-1, $END-($START-1));

# Calculate reverse compliment if using a reverse strand
if( $STRAND =~ /rev/ ){
  $SEQ = reverse($SEQ);
  $SEQ =~ tr/ACTGactg/TGACtgac/;
}

# Print to STDOUT in FASTA format
print ">$INPUT";
print "_$START";
print "_$END";
print "_$STRAND";
print "\n$SEQ";

exit;