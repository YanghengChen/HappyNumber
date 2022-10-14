using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HappyNums
{
    class Program
    {
        public static bool ishappy(int n)   //Rosetta code 
        {
            List<int> cache = new List<int>();
            int sum = 0;
            while (n != 1)
            {
                if (cache.Contains(n))
                {
                    return false;
                }
                cache.Add(n);
                while (n != 0)
                {
                    int digit = n % 10;
                    sum += digit * digit;
                    n /= 10;
                }
                n = sum;
                sum = 0;
            }
           return true;            
        }
        public static double FindNorm(int n)
        {
            double norm = n*n;
            int m =0;
            while(n!=1)
            {
                m=0;
                while(n>0)
                {
                    m+=(n%10)*(n%10);
                    n /= 10;
                }
                n = m;
                norm += n*n;
                
            }
            norm = Math.Sqrt(norm);
            return norm;
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Enter the first argument:");
            int arg1 = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter the second argument:");
            int arg2 = int.Parse(Console.ReadLine());
            
            int temp=0;
            if(arg1>arg2)
            {
                temp = arg1;
                arg1 = arg2;
                arg2 = temp;
            }
            
            SortedDictionary<double, int> numberD = new SortedDictionary<double, int>();
            
            for( int num = arg1, counter = 0; counter < (arg2-arg1); num++, counter ++)
            {
                if(ishappy(num))
                {
                    numberD.Add(FindNorm(num),num);
                }
            }
                if(numberD.Count()==0)
                {
                      Console.WriteLine("NO BODY IS HAPPY!");
                }
                else 
                {
                    int count = 0;
                    
                  
                        foreach(var y in numberD.Reverse())
                        {
                           Console.WriteLine(y.Value+ "----"+count);
                           count++;
                           if(count >9)
                             break;
                        }
                        
                    
                }
                
        }
    }
}