.data
	array: .space 2000 #2000 bytes
	space: .asciiz " "
	howMany: .asciiz "Enter the number of integer less than 500: "
	inputMsg: .asciiz "Enter the element of array :-\n"
	outputMsg: .asciiz "Array: "
.text
main:
	#print the string stored in howMany
	li $v0, 4
	la $a0, howMany
	syscall
	
	#Define the number of integers that should be input
	li $v0, 5
	syscall
	move $s1, $v0 #s1=5 integers
	
	mul $s1,$s1,4 # s1=20 bytes

	
	#print the string stored in howMany
	li $v0, 4
	la $a0, inputMsg
	syscall
	addi $s0, $zero, 0
inputLoop:
	beq $s0, $s1, output
	#take input form user
	li $v0, 5
	syscall
	move $t1, $v0
	#store value in array
	sw $t1, array($s0) # array[0]=$t1    0,4,8,12,16,20
	addi $s0, $s0,4
	j inputLoop
output:
	li $v0, 4
	la $a0, outputMsg
	syscall
	
	addi $s0,$zero,0
printLoop:
	beq $s0, $s1, exit
	lw $t4, array($s0)
	#print the instant array position value
	li $v0, 1 #printing an integer
	move $a0, $t4
	syscall
	#print a space after a number
	li $v0, 4
	la $a0, space
	syscall
	#increment like i++
	addi, $s0, $s0,4
	j printLoop
exit:
	li $v0, 10
	syscall
