               .data
true:          .asciiz   "The numbers are equal\n"
false:         .asciiz   "The numbers are not equal\n"
number1:       .double   4.9999
number2:       .double   4.9999

               .text
               lwc1 $f2, number1
               lwc1 $f4, number2
               
               c.eq.d $f2, $f4
               bc1f exit
               
               li $v0, 4
               la $a0, true
               syscall
               
               li $v0, 10
               syscall
               
               exit:
                   li $v0, 4
                   la $a0, false
                   syscall
               