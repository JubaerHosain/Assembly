               .data
num1:          .word 100
num2:          .word 10

               .text
               lw $s0, num1
               lw $s1, num2
               mul $t0, $s0, $s1
               
               li $v0, 1
               add $a0, $zero, $t0
               syscall