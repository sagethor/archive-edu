## Assignment 5
	.text
	.globl main

main:
	li $v0, 5		# syscall input int
	syscall
	add $t7, $v0, $0	# input int to $7 (max +2,147,483,647 signed)
	bltz $t7, exit		# test N < 0 exit condition
	
	lui $t6, 0x3b9a		# set upper bits for 1,000,000,000 to $t6
	ori $t6, $t6, 0xca00	# imm or lower bits for 1,000,000,00 and $t6 upper bits to $t6
	add $t0, $0, $0		# set sum $t0 = 0
	addi $t5, $0, 10	# $t5 = 10 constant
loop:
	divu $t7, $t6		# quotient $LO, remainder $HI
	mfhi $t7		# set $t7 to remainder
	mflo $t1		# set $t1 to quotient
	add $t0, $t1, $t0	# add $t1 to sum $t0
	divu $t6, $t5		# shift $t6 to next digit place
	mflo $t6
	bne $t7, $0, loop	# keep looping as long as remainder != 0
	divu $t0, $t5		# max sum less than 100 (82 for +1,999,999,999)
	mflo $t0
	mfhi $t1
	add $t0, $t1, $t0	# add tens and ones

	divu $t0, $t5		# max second sum less than 100 (10 for +1,999,999,999)
	mflo $t0
	mfhi $t1
	add $t0, $t1, $t0	# add tens and ones

	li $v0, 1		# print unsigned int $t0
	add $a0, $t0, $0
	syscall

exit:
	li $v0, 10		# exit syscall
	syscall
## EOF