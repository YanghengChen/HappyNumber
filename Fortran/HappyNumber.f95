program happy
  implicit none
! a struct that contains happy number and its norm
  type Pairs
    integer (kind = 8) :: happyN
    double precision   :: norm
  end type Pairs
! ask the user input for the number range
    integer (kind = 8)                           :: a1, a2, temp
    integer (kind =8)                            ::i,j
    type(Pairs)                                   ::pair
    type(Pairs), dimension(:), allocatable        ::numPairs
    write(*, "(a)", advance="no") "Enter First Argument: "
    read (*, *) a1
    write(*, "(a)", advance="no") "Enter Second Argument: "
    read (*, *) a2
! swap the min and max range if min range is greater then the max range
  if (a1 > a2) then
    temp = a1
    a1 = a2
    a2 = temp
  end if
! if there is happy numbers within the range the store the happy numbers and its norm into the array of structs.
  do i = a1 , a2+1
    if(is_happy (i)) then 
        pair%happyN = i
        pair%norm = find_norm(i)
        call append_list(numPairs, pair)
    end if
  end do 
  
  call sort(numPairs, size(numPairs))
  if(size(numPairs) >10) then
        do j = 1,10
                write(*,"(i0)")numPairs(j)%happyN
        end do
        deallocate (numPairs)
  else if (size(numPairs) ==0) then
                write(*, "(a)", advance="no")"NO BODY IS HAPPY!"
  else 
        do j =1, size(numPairs)
                write(*,"(i0)")numPairs%happyN
        end do
        deallocate (numPairs)
  end if 
  print *
contains

! two function below calculate the happy numbers
! reference: https://rosettacode.org/wiki/Happy_numbers#Fortran
  function sum_digits_squared (number) result (result)

    implicit none
    integer (kind = 8), intent (in) :: number
    integer (kind = 8):: result
    integer (kind = 8):: digit
    integer (kind = 8):: rest
    integer (kind = 8):: work

    result = 0
    work = number
    do
      if (work == 0) then
        exit
      end if
      rest = work / 10
      digit = work - 10 * rest
      result = result + digit * digit
      work = rest
    end do

  end function sum_digits_squared

  function is_happy (number) result (result)

    implicit none
    integer (kind = 8), intent (in) :: number
    logical :: result
    integer (kind = 8):: turtoise
    integer (kind = 8):: hare

    turtoise = number
    hare = number
    do
      turtoise = sum_digits_squared (turtoise)
      hare = sum_digits_squared (sum_digits_squared (hare))
      if (turtoise == hare) then
        exit
      end if
    end do
    result = turtoise == 1

  end function is_happy
  
  
! Function that finds the norm of a happy number.
! Norm is of double precision data type.
function find_norm(happynum) result(norm)
  integer (kind = 8), intent(in) :: happynum
  integer (kind = 8)             :: dsum, norm_sum
  double precision               :: norm 
  
  norm_sum = happynum**2 
  dsum = happynum
  do while (sum_digits_squared(dsum) /= 1)
    norm_sum = norm_sum + (sum_digits_squared(dsum))**2
    dsum = sum_digits_squared(dsum)
  end do
  norm = norm_sum + 1
  norm = dsqrt(norm)
end function find_norm

! Subroutine that appends an element to a list.
! Reference: "https://stackoverflow.com/questions/28048508/how-to-add-new-element-to-dynamical-array-in-fortran-90"
subroutine append_list(list, element)
  integer                                                 :: i, isize
  type(Pairs), intent(in)                               :: element
  type(Pairs), dimension(:), allocatable, intent(inout) :: list
  type(Py'pairs), dimension(:), allocatable                :: clist

  if(allocated(list)) then
    isize = size(list)
    allocate(clist(isize+1))
    do i=1,isize          
      clist(i) = list(i)
    end do
    clist(isize+1) = element
    deallocate(list)
    call move_alloc(clist, list)
  else
    allocate(list(1))
    list(1) = element
  end if
end subroutine append_List

! Subroutine that sorts the array in decending order using selection sort
! Reference:"https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap08/sorting.f90"
subroutine  sort(arr, size)
  type(Pairs), dimension(1:), intent(inout) :: arr
  integer, intent(in)                         :: size
  integer                                     :: i, location

  ! ignore the last number because it will always be the lowest
  do i = 1, size-1             
  ! call the findMaximum function to find the maxium in the array                  
    location = findMaximum(arr, i, size) 
    ! Call the swap function to sway the current value with the maximum
    call swap(arr(i), arr(location))           
  end do
end subroutine sort
! Function that returns the location of the maximum
! Reference: "https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap08/sorting.f90"
function  findMaximum(arr, start, finish) result(maxpos)
  type(Pairs), dimension(1:), intent(in) :: arr
  integer, intent(in)                      :: start, finish
  integer                                  :: location, i, maxpos
  double precision                         :: maximum

  ! Assume the first number is the maximum
  maximum  = arr(start)%norm              
  ! Record its current position
  location = start                        
  ! Start the next element
  do i = start+1, finish                  
  ! check if the current number is greater than the maximum
    if (arr(i)%norm > maximum) then  
    ! Find the next maximum vaule
      maximum  = arr(i)%norm      
    ! record the new maximum value position        
      location = i                        
    end if
  end do
   ! Return the position of maximum
  maxpos = location                      
end function  findMaximum
! Subroutine that swaps the values of its two arguments.
! The elements that are to be swapped are of the Numpair structure.
! Reference: "https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap08/sorting.f90"
subroutine  swap(a, b)
  type(Pairs), intent(inout) :: a, b
  type(Pairs)                :: temp

  temp = a
  a = b
  b = temp
end subroutine  swap

end program happy

