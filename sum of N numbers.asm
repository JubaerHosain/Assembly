                 .data
prompt:          .asciiz "\nPlease enter an integer for N= "
result:          .asciiz "The sum of 1 to N integer is "
bye:             .asciiz "Bye. Have a good day "
                 .globl main
                 
                 .text
main: 
                li $v0, 4
                la $a0, prompt
                syscall
                
                li $v0, 5
                syscall
                
                blez $v0, end
                li $t0, 0
loop:
                add $t0, $t0, $v0
                addi $v0, $v0, -1
                bnez $v0, loop
                
                li $v0, 4
                la $a0, result
                syscall
                
                li $v0, 1
                move $a0, $t0
                syscall
                b main
end:
               li $v0, 4
               la $a0, bye
               syscall
               
               li $v0, 10
               syscall
               
