#include <stdio.h>
#include <stdlib.h>
#include <math.h>


// Using a struct to store key-value pairs of happy numbers and their respective norms.

typedef struct{
    double norm;
    int happyN;
}Pair;

//Function prototypes
int isHappy(int num, Pair numPair[]);
double getNorm(int num);
void bubbleSort(Pair happyNumber[], int len);


int len=0;
int counter = 0;
int tmp =0;
int main() {
    Pair numPair[1000000];
//getting user inputs for the argument range
    int a1, a2;
    printf("\nEnter first argument (a whole number): ");
    scanf("%d", &a1);
    printf("Enter second argument (another whole number): ");
    scanf("%d", &a2);
//swap the order if the first argument is greater than the second argument
    if (a1>a2) {
        tmp  = a1;
        a1 = a2;
        a2 = tmp;
    }   
// Check if the number within the range is a happy number and store all the happy numbers inside of the array of struct(norm, happyN) size 1000000
    for (int i=a1; i<=a2; i++) {	
        if (isHappy(i, numPair)==1 ){
         numPair[counter].norm = getNorm(i);
         numPair[counter].happyN = i;
         len++;
	 counter++;
        }
    }
    bubbleSort(numPair, len);
    int count=0;
    for(int j = 0; j<len; j++)
    {
        printf("%d\n", numPair[j].happyN);
	count++;
        if (count==9)
        {
            break; 
        } 
    }
    
}



/*
  calculates the happy number
  return 1 for ture or 0 for false.
*/
int isHappy(int num, Pair numPair[]) {
    int temp = num;
    int sum = 0;
    int m = 0;
    while(sum!=1 && sum!=4) {
        sum = 0;
        while (temp>0) {
            m= temp % 10;
            sum += m*m;
            temp/=10;
        }
    temp = sum;
   }

}

/*
  Find and return the norm of a happy number.
  return norm - norm of the happy number.
*/  
double getNorm(int happy) {
    // Using long variables to deal with large arguments and avoid overflows.
    long happyN = happy;
    long sum = happyN*happyN;
    long m = 0;
    while(happyN != 1) {
        m = 0;
        while(happyN > 0){
            m += (happyN % 10)*(happyN % 10);
            happyN /= 10;
        }
    happyN = m;
    sum += happyN*happyN;
    }
    double norm = sqrt(sum);
    return norm;
}



// sort the array list using bubble sort
void bubbleSort(Pair numPair[], int len)
{
    Pair temp;
    
    for(int i = 0; i<len-1; i++)
    {
        for(int j = 0; j< len-1-i; j++)
        {
            if( numPair[j].norm < numPair[j+1].norm)
            {
                temp = numPair[j];
                numPair[j] = numPair[j+1];
        	numPair[j+1] = temp;
            }
        }
    }   
}
