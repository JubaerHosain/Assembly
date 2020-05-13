               .data
print:         .asciiz "Enter your age: "
message:       .asciiz "Your age is "

               .text
main:
               li $v0, 4
               la $a0, print
               syscall
               
               li $v0, 5
               syscall
               move $t0, $v0
               
               li $v0, 4
               la $a0, message
               syscall
               
               li $v0, 1
               move $a0, $t0
               syscall
               
               li $v0, 10
               syscall
                
              