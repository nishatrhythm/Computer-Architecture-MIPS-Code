.data
	ms1: .asciiz "Enter 1st number: "
	ms2: .asciiz "Enter 2nd number: "
	ms3: .asciiz "After swapping the 1st number is: "
	ms4: .asciiz "\nAfter swapping the 2nd number is: "
	
.text
main:
	li $v0, 4
	la $a0, ms1
	syscall
	
	#taking the input
	li $v0,5
	syscall
	move $s0,$v0
	
	li $v0, 4
	la $a0, ms2
	syscall
	
	#taking the input
	li $v0,5
	syscall
	move $s1,$v0
	
	jal swap
	
	li $v0, 10
	syscall

	
	swap:
	add $t1,$zero,$s0
	add $s0,$zero,$s1
	add $s1,$zero,$t1
	
	li $v0, 4
	la $a0, ms3
	syscall
	
	li $v0, 1
	move $a0,$s0
	syscall
	
	li $v0, 4
	la $a0, ms4
	syscall
	
	li $v0, 1
	move $a0,$s1
	syscall
	jr $ra
