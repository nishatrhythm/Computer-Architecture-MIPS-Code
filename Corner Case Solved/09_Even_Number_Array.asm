.data
	array: .space 2000 #2000 bytes
	space: .asciiz" "
	Size: .asciiz"Enter the number of integers less than 500: "
	inputMsg: .asciiz"\nEnter the elements of array: "
	evenMsg: .asciiz" are Even Numbers in the Array."
	errorMsg: .asciiz"There is no even number in the Array."
.text
main:
	#print string Size
	li $v0,4
	la $a0,Size
	syscall
	
	#Number of input
	li $v0,5 #for taking input
	syscall
	move $s1,$v0 #s1=5 integers
	
	mul $s1,$s1,4 #s1=20 bytes
	
	addi $s2,$zero,2 #for finding reminder , s2=2
	
	#printing inputMsg, asking for elements of the array
	li $v0,4
	la $a0, inputMsg
	syscall
	addi $s0,$zero,0 #i=0
	
	li $s7,0
	inputLoop:
		#s0 will be 0,4,8,12,16.... if S0==20, exit the loop
		beq $s0,$s1, output #S0==s1, go to output, finished taking input
		li $v0,5 #taking input
		syscall
		move $t1,$v0
		
		#store value in array
		sw $t1, array($s0) #array[0]= $t1 0,4,8,12,16
		addi $s0,$s0,4 #i=i+4
		j inputLoop
	output:
		addi $s0,$zero,0 #i=0		
	printLoop:		
		beq $s0,$s1,Exit #i==20, exit
		lw $s3, array($s0) #s3=array[i]
		div $s3,$s2 #lo= (quotient), hi=$s2 (reminder)
		mfhi $s4 #s4=reminder
		
		#checking even or not
		beqz $s4, printEven #if reminder==0,then even #for finding Odd numbers, here beqz will be replaced with bnez 
		#increment index, s0= s0+4
		addi $s0,$s0,4 #i=i+4
		j printLoop
		printEven:
			addi $s7,$s7,1
			li $v0,1 #for integer print
			move $a0,$s3
			syscall
		
			li $v0,4
			la $a0, space
			syscall
		
			addi $s0,$s0,4 #i=i+4
			j printLoop
		
	Exit:
		beqz $s7,EvenNai
		li $v0,4
		la $a0, evenMsg
		syscall
		li $v0,10
		syscall	
		EvenNai:
			li $v0,4
			la $a0,errorMsg
			syscall
			li $v0,10
			syscall	
