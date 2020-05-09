               .data
               .text
               addi $t0, $zero, 100
               addi $t1, $zero, 3
               
               div $t0, $t1
               mflo $s0                #quoitient stored at $s0
               mfhi $s1                #reminder stored at $s1
               
               li $v0, 1
               add $a0, $zero, $s0
               syscall
               
               li $v0, 1
               add $a0, $zero, $s1
               syscall
