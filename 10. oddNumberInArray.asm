.data

msg: .asciiz "Enter the element of array\n"
array: .space 200#Allocated 200 bytes of space
blank: .asciiz "  ”
OddMsg: .asciiz "Odd numbers are: "

#.text section
.text
main:
li $v0, 4
la $a0, msg
syscall

addi $s0, $zero,-4
# $s0=-4,like i=-4 in C PL

for_loop:
addi $s0, $s0,4
#increment like i++
beq $s0, 40, branch
li $v0, 5
syscall
move $t1, $v0
sw $t1, array($s0)#array[i]=$t1
#puts input to the array index
j for_loop

branch:
li $v0, 4
la $a0, OddMsg
syscall

addi $s0, $zero,-4
#s0=-4

check_odd:
addi $s0, $s0,4
#increment like i++
beq $s0,40, exit
lw $s3, array($s0)#$s3=array[i]
addi $s2, $zero, 2
div $s3, $s2
mfhi $s4
# mfhi i.e. move from hi.hi(special register) stores
 #remainder manually.mfhi just copies hi value
bne $s4,0,print_odd
#(odd number)%2!=0
j check_odd 
  
print_odd:
li $v0,1
move $a0, $s3
syscall
#taking gap
li $v0, 4
la $a0,blank
syscall 
j check_odd

#Successfully exit
exit:
li $v0, 10
syscall
