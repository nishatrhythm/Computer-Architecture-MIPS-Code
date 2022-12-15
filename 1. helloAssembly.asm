#Print a message
.data
	myMessage: .asciiz "Hello Assembly!\n"
	
.text
	main:
	
	# Print message
	li $v0, 4
	la $a0, myMessage
	syscall
	
	# Exit from the program
	li $v0, 10
	syscall