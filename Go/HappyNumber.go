package main

import "fmt"
import "sort"  
import "math" 

func happy(n int) bool {
	m := make(map[int]bool)
	for n > 1 {
		m[n] = true
		var x int
		// for ( int i = n, j = 0; )
		for x, n = n, 0; x > 0; x /= 10 {
			d := x % 10
			n += d * d
		}
		if m[n] {
			return false
		}
	}
	return true
}

func findNorm(num int) float64 {
  sum := num * num
  m := 0
  for num != 1 {
    m = 0
    for num > 0 {
      m += (num % 10) * (num % 10)
      num /= 10
    }
    num = m
    sum += num * num
  }
  var norm float64 = math.Sqrt(float64(sum))
  return norm
}


func main() {
    var arg1 int
    var arg2 int
    fmt.Println("Enter Your First Argument: ")
    fmt.Scanln(&arg1)
    fmt.Println("Enter Your Second Argument: ")
    fmt.Scanln(&arg2)
    
    
    var temp int = 0
    if(arg1 > arg2){
        temp = arg1
        arg1 = arg2
        arg2 = temp
    }
     m := make(map[float64]int)
    for num := arg1; num <=arg2; num++ {
        if(happy(num)){
            m[findNorm(num)]= num
        }
    }
    if(len(m)==0){
        fmt.Println("NO BODY IS HAPPY!")
    }else{
          count := 0
          keys := make([]float64, 0, len(m))
          for k := range m{
            keys = append(keys, k)
          }
          sort.Sort(sort.Reverse(sort.Float64Slice(keys)))
        
          for _, k := range keys {
            fmt.Println(m[k])
            count++
            if(count >9){
                break;
            }
        }

    }
        
    }


