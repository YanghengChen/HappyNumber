import java.util.HashSet;
import java.util.Scanner;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.Iterator;
import java.util.Collections;


 public class HappyNumber{
 
	 public static void main(String[] args){
	      // int counter  = 0;
	      int arg1, arg2;
	      Scanner nums = new Scanner(System.in);
	  
	  
	      System.out.println("Enter the first argument");
	      arg1 = nums.nextInt();
	      System.out.println("Enter the second argument");
	      arg2 = nums.nextInt();  
	      
	     //reverse the range if argument2 is less than argument1. 
	      int temp = 0;
	      if(arg1> arg2)
	      {
	         temp = arg1;
	         arg1=arg2;
	         arg2 = temp;
	      }
	      
	      Map<Double, Integer> treeMap = new TreeMap<Double, Integer>(Collections.reverseOrder());
	      for(int num = arg1,counter  =0; counter <(arg2-arg1); num++, counter++)
	      {
	          if(happy(num)) // if the it is a happy number then  add it into the treemap 
	          {
	            treeMap.put(FindNorm(num),num);
	          }
	      }
	          if(treeMap.isEmpty()) // if the treemap is empty then the number is not a happy number 
	          {
	            System.out.println("NOBODY IS HAPPY!");
	          }
	          else  // iterator through the tree map and print out the top 10 happy numbers in reverse order.
	          {
	            Iterator<Map.Entry<Double, Integer>> it = treeMap.entrySet().iterator();
	            Map.Entry<Double, Integer> entry = null;
	            int print = 0;
	            while(it.hasNext() && print<=9)
	            {
	              entry = it.next();
	              System.out.println(entry.getValue());
	              print++;
	            }
	          }
	      

	      
	  }
  public static boolean happy(int number){
      int m = 0;
      int digit = 0;
      HashSet<Integer> cycle = new HashSet<Integer>();
      
      // loop that seperate multiple digit numbers into individual 
      while(number != 1 && cycle.add(number)){             // cycle.add records the previous sum to the cycle hashset
          m = 0;
          while(number > 0){
              digit = (int)(number % 10);
              m += digit*digit;
              number /= 10;
          }
          number = m;  // set it to the sum we currenly have 
      }
      return number == 1;
  }
  

  public static double FindNorm(int number) // function that calculates the norm of all happy numbers 
  {
    double norm = number*number;
    int m = 0;
        while(number!=1)
        {
          m = 0;
          while(number>0)
          {
            m += (number%10)*(number%10);
            number /=10;
           }
          number = m;
          norm += number*number;
        }
        norm =Math.sqrt(norm);
        
        return norm;
  }
  
  
  
}