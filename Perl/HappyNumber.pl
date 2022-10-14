#!/usr/bin/perl

# Happy number project
use strict;
use warnings;
use diagnostics;
use List::Util qw(sum);
use Math::Complex;


# Check if a number is happy. 
# Reference: "rosettacode.org".
sub ishappy {
  my $s = shift;
  while ($s > 6 && $s != 89) {
    $s = sum(map { $_**2 } split(//,$s));
  }
  return $s == 1;
}

# Find the norm of a happy number.
# Reference: "rosettacode.org".
sub findNorm {
  my $n = shift;
  my $norm = $n**2;
  while ($n != 1) {
    $n = (sum(map { $_**2 } split(//,$n)));
    $norm += $n**2;
  }
  $norm = sqrt($norm);
  return $norm;
}



# Main starts here.

print "\nEnter first argument: ";
my $a1 = <>;
print "Enter second argument: ";
my $a2 = <>;

#Switch the order if the first argument is greater than the second argument.
  if ($a1 > $a2){
    ($a1, $a2) = ($a2, $a1);
  }

  # Store the norm and happy numbers in key-value pair using hash
  my %Pairs;
  for (my $i = $a1; $i<=$a2; $i++) {
    if (ishappy($i)) {
      $Pairs{$i} = findNorm($i);
    }
  }
  
  #Set the size equal to the number of keys.
  my $size = keys %Pairs;
  if ($size == 0) {
    print "NOBODY'S HAPPY!\n";
  } else {   
    my $j = 1; 
    # Reference: "https://www.oreilly.com/library/view/perl-cookbook/1565922433/ch02s02.html".
    # Sort the keys of the hash by its values.  
    foreach my $num (reverse sort {$Pairs{$a} <=> $Pairs{$b}} keys %Pairs) {
      print "$num\n";
      $j++;
      if ($j>10) {
        last;
      }
    }
  }
  print "\n"; 