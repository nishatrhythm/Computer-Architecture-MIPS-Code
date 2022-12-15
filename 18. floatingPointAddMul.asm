.data
     ms1: .asciiz "Enter first floating number: "
     ms2: .asciiz "Enter second floaing number: "
     ms3: .asciiz "After addition the value is: "
     ms4: .asciiz "\nAfter multiplication the value is: "
.text

#give user message to enter number
li $v0,4
la $a0,ms1
syscall

#read the user input
li $v0,6    #for read float
syscall

#store input ,taken from user
mov.s $f1,$f0

#give user message to enter number
li $v0,4
la $a0,ms2
syscall

#read the user input
li $v0,6    #for read float
syscall

#store input ,taken from user
mov.s $f2,$f0

add.s  $f12,$f1,$f2

#display the message of answer
li $v0,4
la $a0,ms3
syscall

#display the answer
li $v0,2    #for print float
syscall

mul.s   $f12,$f1,$f2

#display the message of answer
li $v0,4
la $a0,ms4
syscall

#display the answer
li $v0,2      #for print float
syscall
