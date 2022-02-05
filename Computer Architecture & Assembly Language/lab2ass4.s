## Assignment 4
	.text
	.globl main

main:
	li $v0, 5		# syscall input int
	syscall
	add $t7, $v0, $0	# input int to $t7
	addi $t6, $t7, -9999	# test N > 9999 exit condition
	bgtz $t6, exit
	addi $t6, $t7, -1000	# test N < 1000 exit condition
	bltz $t6, exit

	addi $t6, $0, 1000	# THOUSANDS
	divu $t7, $t6			# NNNN / 1000 to $LO
	mflo $t1			# quotient N
	mfhi $t2			# remainder NNN
	add $t0, $t1, $0		# $t0 = sum 1 digit

	addi $t6, $0, 100	# HUNDREDS
	divu $t2, $t6			# NNN / 100 to $LO
	mflo $t1			# quotient N
	mfhi $t2			# remainder NN
	add $t0, $t1, $t0		# $t0 = sum 2 digit
	addi $t6, $0, 10	# TENS & ONES
	divu $t2, $t6			# NN / 10 to $LO
	mflo $t1			# quotient N
	mfhi $t2			# remainder N
	add $t0, $t1, $t0		# $t0 = sum 3 digit
	add $t0, $t2, $t0		# $t0 = sum 4 digit
	li $v0, 1		# print sum result
	add $a0, $t0, $0
	syscall
exit:
	li $v0, 10		# exit syscall
	syscall

## EOF