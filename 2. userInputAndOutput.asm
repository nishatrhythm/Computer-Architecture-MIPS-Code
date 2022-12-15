# Input from user and output it

.data
	message1: .asciiz "Enter an integer: "
	message2: .asciiz "You entered: "

.text
	main:
		li $v0, 4
		la $a0, message1
		syscall
		
		# Taking the input
		li $v0, 5
		syscall
		move $s0, $v0
				
		#Print message
		li $v0, 4
		la $a0,  message2
		syscall
		
		#Print the integer
		li $v0, 1
		move $a0, $s0
		syscall
		
		#Exit from the program
		li $v0, 10
		syscall