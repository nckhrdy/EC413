############################################################################
#                       Lab 3
#                       EC413
#										Nicholas Hardy
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	        # declare a zero terminate string
WordAvg:   .word 0		# use this variable for part 6
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0		# string with carriage return and line feed
InLenW:	.word   4       	# initialize to number of words in input1 and input2
InLenB:	.word   16      	# initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
Empty: .space 12	# put some empty spaces here so the starting addr of Text is clear
Text: .asciiz " \n It is exciting to watch flying fish after a hard day of work. I do not know why some fish prefer flying and other fish would rather swim. It seems like the fish just woke up one day and decided, Hey, today is the day to fly away \n "	# a big string
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurrences of letter "f" in Text string

    li $t0, 0             #initializing the for loop variable i = 0
    li $t1, 0             #counter variable 
    lw $t2, Hello_len     #load the size of the word hello
    la $t3, Hello         #load address of Hello
    li $t4, 'f'           #character ascii we are counting

loop1: 
    bge $t0,$t2,endLoop1  #if greater or equal end the loop and jump to label
    add $t3,$t3,1         #else add 1 to the address spot
    lb $t5,0($t3)         #load value character of hello into register t5
    beq $t4,$t5,count     #if t5 is equal to 'f' then jump to count
    add $t0,$t0,1         #else increment i + 1
    j loop1               #restart loop

count: 
  add $t1,$t1,1           #add one to the count variable
  add $t0,$t0,1           #add one to i
  j loop1                 #jump back to loop1

endLoop1:              #print statements
  xor $a0,$a0,$a0       #set contents of a0 to zero
  add $a0,$a0,$t1      #add the value of the count variable to reg a0
  li $v0,1              #tell the machine to run funciton 
  syscall             #system call to print to console i/o





################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 8 and less than AnInt
#

  li	$t0, 8		#initializing counter i at 8
  lw	$t1, AnInt	#load the whole word for AnInt
  xor	$a0, $a0, $a0   #sets contents of a0 to 0
	
Loop2:
        # Check if $t0 is greater than or equal to $t1
	bge	$t0, $t1, endLoop2      
        # Add $t0 to $a0
	add	$a0, $a0, $t0		
	# Load the value 1 into $v0, indicating that we want to print an integer
	li	$v0, 1
	# Print the value of $a0
	syscall
	# Clear the value in $a0
	xor	$a0, $a0, $a0
	
	# Load the memory address of the string "space" into $a0
	la	$a0, space
	# Load the value 4 into $v0, indicating that we want to print a string
	li	$v0, 4
	# Print the string stored at the memory address in $a0
	syscall
	# Clear the value in $a0
	xor	$a0, $a0, $a0
	
	# Increment $t0 by 1
	add	$t0, $t0, 1
	# Jump back to the beginning of the loop
	j	Loop2	

endLoop2:	
	# Clear the value in $a0
	xor	$a0, $a0, $a0 


###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input2 (with spaces)
#

        li $t0, 0         # Initialize i to 0
        lw $t3, InLenB    # Load the length of the Input2 array into register $t3
        la $t4, Input2    # Load the address of the Input2 array into register $t4
        xor $a0, $a0, $a0 # Set register $a0 to 0 (clear it)

loop3:
	bge $t0, $t3, endLoop3   # Check if i has exceeded the length of Input2

	lb $t5, 0($t4)           # Load a byte of Input2 into $t5
	add $a0, $a0, $t5        # Add the byte to the accumulator
	li $v0, 1                # Load the print integer syscall code into $v0
	syscall                  # Print the byte
	xor $a0, $a0, $a0        # Clear the accumulator
	
	la $a0, space            # Load the address of the space character into $a0
	li $v0, 4                # Load the print string syscall code into $v0
	syscall                  # Print the space character
	xor $a0, $a0, $a0        # Clear $a0
	
	add $t4, $t4, 1          # Increment the address of Input2 to point to the next byte
	add $t0, $t0, 1          # Increment the loop counter
	j loop3                  # Jump back to the beginning of the loop

endLoop3:
	xor	$a0, $a0, $a0    #clear $a0


###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input1 to Copy
#

la	$t0, Input1                # Load the address of Input1 into t0
	la	$t1, Copy          # Load the address of Copy into t1
	li	$t3, 0             # Initialize a counter i to 0
	li	$t4, 4             # Load the size of the array in words

loop4:
	bge	$t3, $t4, endLoop4 # Exit loop if i >= array size
	lw	$t2, 0($t0)         # Load a word from Input1[i] into t2
	sw	$t2, 0($t1)         # Store the word in Copy[i]
	add	$t3, $t3, 1         # Increment counter i
	add	$t0, $t0, 4         # Move to the next word in Input1
	add	$t1, $t1, 4         # Move to the next word in Copy
	j	loop4               # Jump back to the start of the loop

endLoop4:
        xor	$a0, $a0, $a0       # Clear a0 to prepare for next operation


#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the integer average of the contents of array Input1
#

la	$t0, Input1
	li	$t3, 0		# Sum
	li	$t4, 0		# Counter
	lw	$t5, InLenW	# 4

loop5:
	bge	$t4, $t5, endLoop5
	lw	$t6, 0($t0)
	add	$t0, $t0, 4

	add	$t3, $t3, $t6
	add	$t4, $t4, 1
	j	loop5

endLoop5:
	div	$t7, $t3, $t5		# Integer average
	mflo	$t8			# Store integer part of quotient
	xor 	$a0, $a0, $a0		
	add	$a0, $a0, $t8
	li	$v0, 1
	syscall


#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 15 integers that are divisible by either 7 and 13 (with space)
#

        li	$t0, 0		# Counter for the number
	li	$t1, 15		# Number of ints wanted
	li 	$s2, 0		# Counter increment
	li	$t5, 13		# Div value
	li	$s0, 7		# Div value

	
loop6:
	bge	$s2, $t1, endLoop6
	div	$t2, $t0, $s0	# Div by 7
	mfhi	$t3
	div	$t6, $t0, $t5	# Div by 13
	mfhi	$t7
	beqz	$t7, print
	beqz	$t3, print
	add	$t0, $t0, 1		
	j loop6

print:
	

	xor	$a0, $a0, $a0
	add	$a0, $a0, $t0
	li	$v0, 1
	syscall
	
	xor 	$a0, $a0, $a0
	la	$a0, space
	li	$v0, 4
	syscall
	
	add	$t0, $t0, 1
	add	$s2, $s2, 1
	j	loop6
	
endLoop6:
        xor	$a0, $a0, $a0       # Clear a0 to prepare for next operation


#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 5 lines each with 3 integers (with spaces between the integers)
# This must be implemented using a nested loop.
#

li	$t0, 0		# Initialize counter to 0
	li 	$s2, 0		# Initialize counter increment to 0
	li	$t5, 13		# Set value to divide by (13)
	li	$s0, 7		# Set value to divide by (7)
	li	$s1, 3		# Set number of lines to print
	li	$s3, 0		# Initialize loop counter to 0
	li	$s4, 5		# Set loop counter limit
	li	$s5, 0		# Initialize outer loop counter to 0
	
O_loop7:
	bge	$s5, $s4, end_O_loop	# Exit outer loop if counter exceeds limit
	
loop7:
	bge	$s2, $s1, endloop7	# Exit inner loop if counter increment exceeds number of lines

	div	$t2, $t0, $s0	# Divide counter by 7
	mfhi	$t3		# Get remainder

	div	$t6, $t0, $t5	# Divide counter by 13
	mfhi	$t7		# Get remainder
	
	beqz	$t7, Print7	# If counter is not divisible by 13, skip printing
	beqz	$t3, Print7	# If counter is not divisible by 7, skip printing
	
	add	$t0, $t0, 1	# Increment counter by 1
	j loop7		# Jump back to inner loop

Print7:
	xor	$a0, $a0, $a0	# Clear argument for syscall
	add	$a0, $a0, $t0	# Set argument to counter value
	li	$v0, 1		# Set syscall code to print integer
	syscall			# Print counter value
	
	xor 	$a0, $a0, $a0	# Clear argument for syscall
	la	$a0, space	# Set argument to space string
	li	$v0, 4		# Set syscall code to print string
	syscall			# Print space string
	
	add	$t0, $t0, 1	# Increment counter by 1
	add	$s2, $s2, 1	# Increment inner loop counter by 1
	j	loop7		# Jump back to inner loop
	
endloop7:
	xor 	$s2, $s2, $s2	# Reset inner loop counter
	add 	$s5, $s5, 1	# Increment outer loop counter

	la	$a0,Enter	# Set argument to newline string
        	li	$v0,4		# Set syscall code to print string
        	syscall		# Print newline string
	
	j	O_loop7	# Jump back to outer loop
	
end_O_loop:
	xor $a0, $a0, $a0	# Clear argument for syscall

Exit:
	jr $ra			# Return from subroutin