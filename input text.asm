               .data
message:       .asciiz  "Enter your name: "
outputMessage: .asciiz  "Your name is "
inputText:     .space  30

               .text
main:
               li $v0, 4
               la $a0, message
               syscall
               
               li $v0, 8
               la $a0, inputText
               li $a1, 30
               syscall
               
               li $v0, 4
               la $a0, outputMessage
               syscall
               
               li $v0, 4
               la $a0, inputText
               syscall
               
               li $v0, 10
               syscall
               