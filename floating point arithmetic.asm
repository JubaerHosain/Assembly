               .data
number1:       .float 5.38
number2:       .float 4.99
newline:       .asciiz "\n"
number3:       .double 5.38
number4:       .double 4.99

               .text
               #float
               lwc1 $f4, number1
               lwc1 $f6, number2
               
               li $v0, 2
               add.s $f12, $f4, $f6
               syscall
               
               #double part
               ldc1 $f4, number3
               ldc1 $f6, number4
               
               li $v0, 4
               la $a0, newline
               syscall
             
               li $v0, 3
               add.d $f12, $f4, $f6
               syscall
               
               