               .data
array:         .word     1000:3
newline:       .asciiz    "\n" 

               .text
main:          
               addi $t0, $zero, 0
               
               while:
                    beq $t0, 12, exit
                    lw $t6, array($t0)
                    addi $t0, $t0, 4
               
                    li $v0, 1
                    move $a0, $t6
                    syscall
                    
                    li $v0, 4
                    la $a0, newline
                    syscall
                    
                    j while
                    
               exit:
                    li $v0, 10
                    syscall
