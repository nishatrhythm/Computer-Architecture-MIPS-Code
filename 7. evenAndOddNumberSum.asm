.data
	message1: .asciiz "Sum of Even numbers: "
	message2: .asciiz "\nSum of Odd numbers: "
.text
	main:
		li $t0, 0	# Initial sum of even number = 0
		li $t1, 0 	# Initial sum of odd number = 0
		
		li $s2, 2
		li $s0, 0
		
	forLoop:
		beq $s0, 20, Exit
		addi $s0, $s0, 1
		
		div $s0, $s2
		mfhi $s3	# Store remainder
		
		# If remainder = 0, then add in evenSum
		beq $s3, 0, evenSum
		#else add in oddSum
		j oddSum 
		
		j forLoop
		
		# evenSum calculation
	evenSum:
		add $t0, $t0, $s0
		j forLoop
		
		# oddSum calculation
	oddSum:
		add $t1, $t1, $s0
		j forLoop
	
	Exit: 
		# Messsage of evenSum
		li $v0, 4
		la $a0, message1
		syscall
		
		# Print even number sum
		li $v0, 1
		move $a0, $t0
		syscall
		
		# Message of oddSum
		li $v0, 4
		la $a0, message2
		syscall
		
		# Print even number sum
		li $v0, 1
		move $a0, $t1
		syscall
		
		# Exit from the program
		li $v0, 10
		syscall