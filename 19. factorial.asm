.data
    input: .asciiz "Enter an integer: "
    output: .asciiz "Factorial of the given number: "
    output2: .asciiz "The factorial of real negative number is a complex number.\n"
       
.text
    li        $v0, 4
    la        $a0, input
    syscall
    #input
    li        $v0, 5
    syscall
    move      $a0, $v0   #a0=n
    
    # function call
    slt $t0, $a0, $zero
    bne $t0, $zero, isNegative
    
    jal      factorial       # save next instruction address to $ra 					and jump factorial
    move      $t0, $v0        # $t0 = $v0
    
    li        $v0, 4
    la        $a0, output
    syscall
    
    # print the result
    li        $v0, 1        # system call #1 - print int
    move      $a0, $t0      # $a0 = $t0
    syscall 
   
    # return 0 and exit
    li        $v0, 10        # $v0 = 10
    syscall
factorial:
    addi    $sp, $sp, -8
    # save $s0 and $ra
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, 0, else     #if $a0!=0 go to else
    addi    $v0, $zero, 1    # return 1
    j fact_return

else:
    # backup $a0
    move    $s0, $a0
    addi    $a0, $a0, -1 # n -= 1
    jal     factorial
    mult    $s0, $v0 # return x*Fact(x-1) 
    mflo    $v0      #$lo
    
fact_return:
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra
    
isNegative:
    li $v0, 4
    la $a0, output2
    syscall