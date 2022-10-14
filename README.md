# HappyNumbersProject
#Yang Chen
#CSC330
#10/12/2022



## Commands to complie Java
Java mainly used treeMap that stores the Happy number and its norm in kay-value pair, and use the iterator to trace through the treeMap and print out the value in decending order according to its norm and breaks the counter after it printed the first ten happy numbers.

-javac HappyNumber.java
-java HappyNumber


## Commands to complie Python
Python uses dictionary to store the key_value pair and since the dictionary does not do the sorting automaticlly, we need to use the sorted command and set the reversed equal to true in order to get the desire output.

-python3 HappyNumber.py


## Commands to complie C
C uses bubble sort to sort the array of struct with size of 1000000 in decending order by comparing its key(norm) from the range of initial argument 1 to its len, some how my code does complie but still having segment fault.

-gcc HappyNumber.c -lm
-./a.out



## Commands to complie C#
C# shared the same logic as java, and C# also has something called SortedDictionary that sort the key-value pair inside of the dictionary in ascending order, so all I have do to is to use the .Reverse() command to make it descending order and use counter to stop the program once it printed out ten happy numbers.

-mcs HappyNumber.cs
-mono HappyNumber.exe



## Commands to complie Perl

-chmod u+x HappyNumber.pl
-Perl HappyNumber.pl



## Commands to complie Go

-go run HappyNumber.go



## Commands to complie Fortran

-gfortran HappyNumber.f95
-a.out



## Code to complie Lisp

-chmod u+x HappyNumber.lisp
-./HappyNumber.lisp

