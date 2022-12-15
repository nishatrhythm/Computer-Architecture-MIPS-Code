.data
     msg1: .asciiz "Enter any number: "            #input message
     msg2: .asciiz "Square of the number is: "     #output message
     
.text
Main:
     #input message
      la $a0,msg1   # Load and Print String
      li $v0,4
      syscall
     
     #Taking integer input
      li $v0,5  #Read Int
      syscall
      move $t0,$v0
      
     jal Square   #Jump and Link to Square function
     
     #Terminating the program
       li $v0,10  #Exit the program
       syscall
Square:
       mul $t1,$t0,$t0  #Multiple
   
       #Output message
        la $a0,msg2  # Load and print String 
        li $v0,4
        syscall
       
       #Printing square of the number
        move $a0,$t1   #Move the value of $t1 to $a0
        li $v0,1       #Print Int
        syscall
       jr $ra
