               .data
cout:          .asciiz "Enter a number: "
message:       .asciiz "The factorial of this number is: "
number:        .word 0
answer:        .word 0
               .globl main
              
               .text
main: 
               #Enter number from user
               li $v0, 4
               la $a0, cout
               syscall
               
               li $v0, 5
               syscall
               
               sw $v0, number
               
               #Call factorial function
               lw $a0, number
               jal factorial
               sw $v0, answer
               
               #Print answer
               li $v0, 4
               la $a0, message
               syscall
               
               li $v0, 1
               lw $a0, answer
               syscall
               
               #End programme
               li $v0, 10
               syscall
               #--------------------
               #Factorial function
               .globl factorial
factorial:
               subu $sp, $sp, 8
               sw $ra, ($sp)
               sw $s0, 4($sp)
               
               #Best case
               li $v0, 1
               beq $a0, 0, done
               
               #factorial(n-1)
               move $s0, $a0
               sub $a0, $a0, 1
               jal factorial
               
               #n*factorial(n-1)
               mul $v0, $s0, $v0
            
               done:
                    lw $ra, ($sp)
                    lw $s0, 4($sp)
                    addu $sp, $sp, 8
                    jr $ra 
