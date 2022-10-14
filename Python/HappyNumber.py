import math
import operator

def happy(n):
    past = set()			
    while n != 1:
        n = sum(int(i)**2 for i in str(n))
        if n in past:
            return False
        past.add(n)
    return True
    
def FindNorm(n):
      norm = n**2
      m=0
      while(n!=1):
          m=0
          while(n>0):
              m += (n%10)**2
              n //= 10
          n = m
          norm += n**2     
      norm = math.sqrt(norm)
      return norm
            
     
 
def main():
    arg1 = int(input("Enter the first argument: "))
    arg2 = int(input("Enter the second argument: "))
    
    print("\nFirst Argument: " + str(arg1))
    print("Second Argument: " + str(arg2))
    if arg1>arg2:
        temp = arg1
        arg1 = arg2
        arg2 = temp

    print("\nFirst Argument: " + str(arg1))
    print("Second Argument: " + str(arg2))
   
    dicList = {}
    for i in range(arg1, arg2 + 1):
        if happy(i):
            dicList[FindNorm(i)] = i
        
    if(len(dicList) == 0):
        print("NO BODY IS HAPPY!")
    else:
        count =0
        for j in sorted(dicList.keys(),reverse=True):
            print(dicList[j])
            count+=1
            if(count>9):
                break	
        
main()
 
 
 
 
 
