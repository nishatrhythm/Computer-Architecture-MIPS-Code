.data
	message1: .asciiz "Enter 1st number: "
	message2: .asciiz "Enter 2nd number: "
	message3: .asciiz "Numbers are equal.\n"
	message4: .asciiz "Numbers are not equal.\n"
	
.text
	main:
		li $v0, 4
		la $a0, message1
		syscall

		# Input 1st number
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, message2
		syscall

		# Input 2nd number
		li $v0, 5
		syscall
		move $t2, $v0

		# Check if equal
		beq $t1, $t2 Equal
		j notEqual
		
		
		# Message for equal
	Equal:
		li $v0, 4
		la $a0, message3
		syscall
		
		j Exit
		
		# Message for not equal
	notEqual:
		li $v0, 4
		la $a0, message4
		syscall
		
		j Exit
		
		# Exit from the program
	Exit:
		li $v0, 10
		syscall