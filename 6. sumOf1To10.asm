.data
	message: .asciiz "Sum of 1 to 10 is: "
.text
	main:
		# Initialize i = 0
		li $t0, 1
		#li $t0, 11
		j forLoop
		
		li $v0, 10
		syscall
		
		# Check if(i>10) then exit
	forLoop:
		bgt $t0, 10, Exit
		#bgt $t0, 20, Exit
		# sum = sum + i
		add $t1, $t1, $t0
		
		# Increment i (i++)
		addi $t0, $t0, 1
		j forLoop
		
	Exit:
		li, $v0, 4
		la $a0, message
		syscall
		
		# Print total Sum of 1 to 10
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall