.data
	array: .space 100
	msg1:.asciiz "enter element number( not greater than 25 ):"
	msg2: .asciiz "Enter the value of array element:"
	msg3: .asciiz "Maximum number: "
.text
main:

	# print message for element number
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Take Element number from user
	li $v0, 5
	syscall
	move $t5, $v0 # $t5= number of element
	
	#message for taking value from user
	li $v0, 4
	la $a0, msg2
	syscall

	addi $s0, $zero, 0 # for array index $s0=0
	addi $s1, $zero, 1 # loop counter i=1,  $s1=1
	
	#this loop for taking number of array
	takinginput:
	bgt $s1, $t5, CheckingLoop
	
	#take value from user
	li $v0, 5
	syscall
	move $t1, $v0
	
	#value store in array
	sw $t1, array($s0) #array[0]=$t1
	addi $s0, $s0, 4
	addi $s1,$s1,1  # i=i+1
	j takinginput
	
	CheckingLoop:
	addi $s0,$zero,0  # array index
	addi $s1,$zero,0  # loop counter i=0
	lw $t3, array($s0) # max in $t3  (max=array[0])
	
	findmax:
	addi $s1,$s1,1 # i=1
	beq $s1, $t5, exit
	addi, $s0, $s0, 4
	lw $t4, array($s0)
	
	#check like if(max<arr[i])
	slt $t0, $t3, $t4   # if(max<arr[i]), $t0=1  else if(max>arr[i]), $t0=0
	
	#if before statment is true
	bnez $t0 max
	j findmax
	
	#maximum value put into max($t3)
	max:
	move $t3, $t4
	j findmax
	
	exit:
	#message for maximum number
	li $v0, 4
	la $a0, msg3
	syscall
	
	#print the maximum number
	li $v0, 1
	move $a0, $t3
	syscall
	
	#successfully exit
	li $v0, 10
	syscall
