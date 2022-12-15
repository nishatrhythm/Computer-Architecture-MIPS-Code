.data
	array: .space 2000
	space: .asciiz " "
	howMany: .asciiz "Enter the number of integer less than 500 : "
	inputMsg: .asciiz "Enter the element of array :-\n"
	evenMsg: .asciiz "Even numbers are: "
.text
main:
	#Next 3 line will print "Enter the number of integer : "
	li $v0, 4
	la $a0, howMany
	syscall

	#Define the number of integers that should be input
	li $v0, 5
	syscall
	move $s1, $v0

	mul $s1,$s1,4

	addi $s2, $zero, 2
	
	li $v0, 4
	la $a0, inputMsg
	syscall
	addi $s0, $zero, 0
inputLoop:
	beq $s0, $s1, output
	#Taking user input
	li $v0, 5
	syscall
	move $t1, $v0
	
	sw $t1, array($s0)
	addi $s0, $s0,4
	j inputLoop
output:
	li $v0, 4
	la $a0, evenMsg
	syscall
	addi $s0, $zero, 0
outputLoop:
	beq $s0, $s1, exit
	lw $s3, array($s0)
	div $s3, $s2 # hi=reminder lo=result
	mfhi $s4
	#Checking even or not
	beqz $s4, printEven
	addi $s0, $s0, 4
	j outputLoop
printEven:
	li $v0, 1
	move $a0, $s3
	syscall

	li $v0, 4
	la $a0, space
	syscall
	
	addi $s0, $s0, 4
	j outputLoop
exit:
	li $v0, 10
	syscall
