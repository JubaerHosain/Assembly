               .data
number1:       .float 100.0
number2:       .float 4.50
newline:       .asciiz "\n"
number3:       .double 5.00
number4:       .double 4.00

               .text
               #float
               lwc1 $f4, number1
               lwc1 $f6, number2
               
               li $v0, 2
               div.s $f12, $f4, $f6
               syscall
               
               #double part
               ldc1 $f4, number3
               ldc1 $f6, number4
               
               li $v0, 4
               la $a0, newline
               syscall
             
               li $v0, 3
               mul.d $f12, $f4, $f6
               syscall
               
               li $v0, 10
               syscall
               
               
