#! /usr/bin/perl

# Prompt user for $count
print "Enter starting value: ";
$count = <STDIN>;
$sum = 0;

#Prompt user for $max
print "Enter maximum value: ";
$max = <STDIN>;

#Clean up input
chomp $count;
chomp $max;

while( $count < $max ){
  print $count, "\n";
  $sum += $count;
  $count += 1;
}

print "The final count: $count\n";
print "The sum total was: $sum\n";

exit;
