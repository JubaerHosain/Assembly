               .data
num1:          .word 100
num2:          .word 200

               .text
               lw $s0, num1
               lw $s1, num2
               sub $s2, $s0, $s1
               
               li $v0, 1
               move $a0, $s2
               syscall