## Assignment 6
	.text
	.globl main

main:
	li $v0, 8		# syscall input string
	la $a0, str		# load byte space into address
	li $a1, 20		# allot byte space for string
	move $t7, $a0		# save string to t0
	syscall

	la $t7, str		# load str address to $t7
	add $t0, $t7, $0	# set $t0 to $t7

	li $t5, 'A'		# ABSENT (A)
	addi $t3, $0, 2		# counting
absent:
	lb $t2, 0($t0)		# load next $t2
	addi $t6, $t2, -10	# $t6 = 0 for '\n'
	addi $t0, $t0, 1	# increment address
	and $t2, $t2, $t5	# check if $t2 = 'A' = 33
	andi $t2, $t2, 1	# set $t2 = 1 to decrement if so
	sub $t3, $t3, $t2
	beq $t3, 0, false
	bne $t6, $0, absent	# if not end of string, loop

	li $t5, 'L'		# LATES (L)
	lb $t1, 0($t7)			# load base $t1
	addi $t7, $t7, 1
	lb $t2, 0($t7)			# load next $t2
lates:
	addi $t7, $t7, 1		# increment address
	lb $t3, 0($t7)			# load next $t3
	and $t6, $t3, $t2		# goto false if $t3 = $t2 = $t1 = 'L', otherwise continue
	and $t6, $t6, $t1
	beq $t6, $t5, false
	add $t1, $t2, $0		# shift $t2 to $t1
	add $t2, $t3, $0		# shift $t3 to $t2
	addi $t6, $t3, -10		# $t6 = 0 for '\n'
	bne $t6, $0, lates		# if not end of string, loop
true:
	li $v0, 4		# print TRUE
	la $a0, tru
	syscall
	j exit
false:
	li $v0, 4		# print FALSE
	la $a0, fal
	syscall
exit:
	li $v0, 10		# exit syscall
	syscall
.data
	fal: .asciiz  "false\n"
	tru: .asciiz "true\n"
	str: .space(20)
## EOF