               .data
print:         .asciiz "Enter the valu of e: "
message:       .asciiz "The value of e is "

               .text
main:  
               li $v0, 4
               la $a0, print
               syscall
               
               li $v0, 7
               syscall
               
               li $v0, 4
               la $a0, message
               syscall
               
               li $v0, 3
               add.d $f12, $f0, $f10
               syscall
               
               li $v0, 10
               syscall
                
              