               .data
message:       .asciiz  "The numbers are not equal"
message1:       .asciiz  "The numbers are equal"
               .text
main:
               addi $t0, $zero, 20
               addi $t1, $zero, 200
               
               slt $s0, $t0, $t1
               bne $s0, $zero, printMessage
               li $v0, 4
               la $a0, message1
               syscall
               
               li $v0, 10
               syscall
               
printMessage:
               li $v0, 4
               la $a0, message
               syscall