# Check if an integer is positive or negative

.data
	message1: .asciiz "Enter an integer: "
	message2: .asciiz "The number is positive.\n"
	message3: .asciiz "The number is negative.\n"

.text
	main:
		li $v0, 4
		la $a0, message1
		syscall
		
		# Taking the input
		li $v0, 5
		syscall
		move $s0, $v0
		
		addi $t1, $zero, 0
		slt  $t0, $s0, $t1
		
		beq $t0, 0, positive
		
					
		#Print message when negative
		li $v0, 4
		la $a0,  message3
		syscall
		
		j Exit
		
		#Print message when positive
	positive:
		li $v0, 4
		la $a0,  message2
		syscall
		
		#Exit from the program
	Exit:
		li $v0, 10
		syscall
