.data
    myText: .asciiz "hello world \n"

.text
    li $v0, 4
    la $a0, myText
    syscall