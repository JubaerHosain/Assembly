               .data
               
               .text
               addiu $t0, $zero, 100
               addiu $t2, $zero, 2
               
               srl $t1, $t0, 2
               
               li $v0,1
               move $a0, $t1
               syscall
                
               li $v0, 10
               syscall