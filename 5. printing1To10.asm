.data
	seperator: .asciiz ", "

.text
	main:
		# Initialize i = 0
		li $t0, 1
		#li $t0, 11
		j forLoop
		
		li $v0, 10
		#li $v0, 20
		syscall
		
		# Check if(i>10) then exit
	forLoop:
		bgt $t0, 10, Exit
		#bgt $t0, 20, Exit
	
		# Print the value of i
		li $v0, 1
		move $a0, $t0
		syscall
	
		# No seperator for the last number
		beq $t0, 10, Exit
		#beq $t0, 20, Exit
	
		# Print a seperator
		li $v0, 4
		la $a0, seperator
		syscall
	
		# Increment i (i++)
		addi $t0, $t0, 1
		j forLoop
	
	Exit:
		li $v0, 10
		syscall