############################################################################
#                       Lab 3
#                       EC413
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

  li	$t0, 0		#initializing counter i
  lw	$t1, AnInt	#load the whole word for AnInt
	xor	$a0, $a0, $a0  #sets contents of a0 to 0
	

Loop2:
	bge	$t0, $t1, endLoop2
	add	$a0, $a0, $t0		# Printing the int
	li	$v0, 1
	syscall
	xor	$a0, $a0, $a0
	
	la	$a0, space
	li	$v0, 4
	syscall
	xor	$a0, $a0, $a0
	
	add	$t0, $t0, 1
	j	Loop2	

endLoop2:	
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










###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input1 to Copy
#













#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the integer average of the contents of array Input1
#















#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 15 integers that are divisible by either 7 and 13 (with space)
#













#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 5 lines each with 3 integers (with spaces between the integers)
# This must be implemented using a nested loop.
#

Exit:
	jr $ra