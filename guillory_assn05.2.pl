#!/usr/bin/perl
# guillory_assn05.2.pl

# Enter desired values here
$DNA='AAACTGCTAGCGGGACTCGGAAACTGCGCGGAAACTGCGCTAGCTCGGATACGCTAGCTAGCTT';
$NAME="Wilson's_genome";

$START=1;	# Desired start coordinate, included in output strand
$END=10;	# Desired end coordinate, included in output strand
$STRAND=1;	# 1 = forward strand; 2 = reverse strand

# Extract specified sequence;
$SEQ=substr($DNA, $START-1, $END-($START-1));

# Calculate reverse compliment if using a reverse strand
if( $STRAND == 2 ){
  $SEQ=reverse($SEQ);
  $STRAND="rev";
}else{
  $STRAND="fwd";
}

# Print to STDOUT in FASTA format
print ">$NAME";
print "_$START";
print "_$END";
print "_$STRAND";
print "\n$SEQ";

exit;