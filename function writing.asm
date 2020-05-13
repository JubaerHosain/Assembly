               .data
string:        .asciiz "Hi, I am Jubaer Hosain\n"

               .text
               
               main:
               jal displayString
                   
               li $v0, 10
               syscall
               
               
               displayString:
               li $v0, 4
               la $a0, string
               syscall