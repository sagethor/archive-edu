## Assignment 4
	.text
	.globl main

main:
	li $v0, 4 # syscall for printing string
	la $a0, namequery # load question
	syscall

	li $v0, 8 # syscall for input string
	la $a0, name # load bytespace into address
	li $a1, 20 # allocate bytespace for string
	move $t0, $a0 # save string to t0
	syscall

# Removes newline from name (snippet from http://zeta.albion.edu/~dreimann/Spring2012/courses/cs354/projects/palindrome.php)

	la	$s0, name	# $s0 contains base address of name
	add	$s2, $0, $0	# $s2 = 0
	addi	$s3, $0, '\n'	# $s3 = '\n'
loop:
	lb	$s1, 0($s0)	# load character into $s0
	beq	$s1, $s3, end	# Break if byte is newline
	addi	$s2, $s2, 1	# increment counter
	addi	$s0, $s0, 1	# increment name address
	j	loop
end:
	sb	$0, 0($s0)	#replace newline with 0

	li $v0, 4 # print syscall
	la $a0, greet # load greet
	syscall

	li $v0, 4 # print syscall
	la $a0, name # load name
	syscall

	li $s0, 0 # index 0

	li $v0, 4 # print syscall
	la $a0, ing # load ing
	syscall

	li $v0, 5 # syscall for input int
	syscall

	andi $a0, $v0, 1 # bitwise AND immediate into $a0

	li $v0, 4 # print syscall
	beq $a0, 1, oddity
evenity:
	la $a0, even # print even
	syscall

	j exit
oddity:
	la $a0, odd # print odd
	syscall

	j exit
exit:
	li $v0, 4 # print syscall
	la $a0, good # load good
	syscall

	li $v0, 4 # print syscall
	la $a0, name # load name
	syscall

	li $v0, 4 # print syscall
	la $a0, bye # load bye
	syscall

	li $v0, 10 # exit syscall
	syscall

.data
	namequery: .asciiz "What's your name?\n"
	name: .space(20)
	greet: .asciiz "\nHello "
	ing: .asciiz ", please input an integer and press Enter\n"
	odd: .asciiz "\nThe integer is odd\n"
	even: .asciiz "The integer is even\n"
	int: .word 0
	good: .asciiz "Goodbye "
	bye: .asciiz ", thank you for your input.\n"
	newline: .asciiz "\n"
## EOF