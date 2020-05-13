               .data
equal:         .asciiz "The numbers are equal"
notequal:      .asciiz "The numbers are not equal"

               .text
               addi $t0, $zero, 20
               addi $t1, $zero, 20
               
               bne $t0, $t1, else
               
               li $v0, 4
               la $a0, equal
               syscall
               
               li $v0, 10
               syscall
else:
               li $v0, 4
               la $a0, notequal
               syscall
               
               
               