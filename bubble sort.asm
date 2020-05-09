#Bubble sort algorithm 
#Author: Md Jubaer Hosain
#BSSE1119
#################################Data Section######################################################
               
               .data
Space:         .asciiz "  "
Prompt:        .asciiz "Enter Array Size: "
Mesg1:         .asciiz "Enter "
Mesg2:         .asciiz " Number To The Array: \n"
Mesg3:         .asciiz "Befor Sorting The Array Is: "
Mesg4:         .asciiz "\nAfter Sorting The Array Is: " 

Array:         .word 1000                        
               .globl main
               
###############################Text Section########################################################
               .text
    main:           
               la $a0, Prompt                     #Load address of Prompt to $a0
               li $v0, 4                          #Load $v0=4 for printing a string
               syscall                            #System call to print Prompt   
               
               li $v0, 5                          #Load $v0=5 for reading an integer(array size)
               syscall                            #System call
               move $t0, $v0                      #move value of $v0 to $t0 "($t0 contain array size)"
 
               la $a0, Mesg1                      #
               li $v0, 4                          #
               syscall                            #for printing the Mesg1
               
               addu $a0, $t0, 0                   #copy the value of $t0(array size) to argument register $a0
               li $v0, 1                          #Load $v0=1 for printing an integer
               syscall
               
               la $a0, Mesg2                      #
               li $v0, 4                          #
               syscall                            #for printing Mesg2
               
               addu $t1, $zero, 0                 #$t1=0  ($t1 as i)
               addu $t2, $zero, 0                 #$t2 for array index
               loop:                              #loop for storing the values to the array
               li $v0, 5                          #
               syscall                            #System call for reading integer
               
               sw $v0, Array($t2)                 #Store integer to the array
               addu $t2, $t2, 4                   #array index increase as 4 Byte
               addu $t1, $t1, 1                   #i=i+1
               bgeu $t1, $t0, PrintBeforeSorting              #if i>=array size exit this loop
               j loop   
###################################################################################################    
    PrintBeforeSorting:
              la $a0, Mesg3                      #
              li $v0, 4                          #
              syscall                            #for printing Mesg3
              
              addu $t1, $zero, 0                 #$t1=0  ($t1 as i)
              addu $t2, $zero, 0                 #$t2 for array index
              while:                             #this loop for printing the array before sorting
              bgeu $t1, $t0, BubbleSort           #if i>= array size exit this loop and go to bubble sort level
              lw $a0, Array($t2)                 #Load word from array to argument register $a0
              li $v0, 1                          #
              syscall                            #System call for printing integer
              
              la $a0, Space                      #
              li $v0, 4                          #
              syscall                            #System call for printing string(here a space)
              
              addu $t1, $t1, 1                   #i=i+1
              addu $t2, $t2, 4                   #$t2 increase as 4 Byte
              j while
###################################################################################################          
   BubbleSort:
             
              addi $t1, $zero, -1                # i=-1
              addu $t2, $zero, 0                 # j=0
              addu $t3, $zero, 0                 #for array index
              addu $t4, $zero, 0                 #for array index
            
              loop1:
              addi $t1, $t1, 1                   #i=i+1(primarily i=0)
              bgeu $t1, $t0, PrintAfterSorting
              
              addu $t2, $t1, 1                   #j=i+1
              loop2:
              bgeu $t2, $t0, loop1              #if j>=array size go to loop1
              mul $t3, $t1, 4                   #array index i*4
              mul $t4, $t2, 4                   #array index j*4
              addu $t2, $t2, 1
              
              lw $t5, Array($t3)                #load value of index $t3 to $t5
              lw $t6, Array($t4)                #load value of index $t4 to $t6
              
              bgt $t5, $t6, swap                # if array[i] > array[j] then swap
              blt $t5, $t6, loop2
              
              swap:                             #swap $t5 and $t6
              move $t7, $t5
              move $t5, $t6
              move $t6, $t7
              sw $t5, Array($t3)                #store value after swapping
              sw $t6, Array($t4)                #
              j loop2 
###################################################################################################
              
        PrintAfterSorting:
              la $a0, Mesg4                     #
              li $v0, 4                          #
              syscall                            #for printing Mesg3
              
              addu $t1, $zero, 0                 #$t1=0  ($t1 as i)
              addu $t2, $zero, 0                 #$t2 for array index
              while1:                             #this loop for printing the array before sorting
              bgeu $t1, $t0, exit           #if i>= array size exit this loop and go to bubble sort level
              lw $a0, Array($t2)                 #Load word from array to argument register $a0
              li $v0, 1                          #
              syscall                            #System call for printing integer
              
              la $a0, Space                      #
              li $v0, 4                          #
              syscall                            #System call for printing string(here a space)
              
              addu $t1, $t1, 1                   #i=i+1
              addu $t2, $t2, 4                   #$t2 increase as 4 Byte
              j while1
           
#############################Programme is Finished Here############################################ 
       exit:
          li $v0, 10
          syscall     
              
                
             
               
               
               
               
               
               
               
               
               
               
               
