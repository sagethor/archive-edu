## Assignment 2
	.text
	.globl main

main:
	li $t0, -2		# reset error counter, $t0 = -3
inputa:
	la $a0, prompta		# print prompta
	jal pstring
	li $v0, 5		# int A to $t7
	syscall
	add $t7, $v0, $0

	addi $t1, $t7, -1000	# check upper range
	bgtz $t1, errora
	addi $t1, $t7, -1	# check lower range
	bltz $t1, errora
	j inputb		# otherwise proceed to inputb
errora:
	addi $t0, $t0, 1	# increment error counter
	beq $t0, $0, force	# this is the 3rd error, so force[quit]
	la $a0, error
	jal pstring
	j inputa
inputb:
	la $a0, promptb		# print promptb
	jal pstring
	li $v0, 5		# int B to $t6
	syscall
	add $t6, $v0, $0

	addi $t1, $t6, -1000	# check upper range
	bgtz $t1, errorb
	addi $t1, $t6, -1	# check lower range
	bltz $t1, errorb
	add $t8, $t6, $0	# save multiplicand in $t8
	li $t9, 1		# set multiplier counting register $t9
	j product		# otherwise proceed to product
errorb:
	addi $t0, $t0, 1	# increment error counter
	bgez $t0, force		# this is the 3rd error, so force[quit]
	la $a0, error
	jal pstring
	j inputb
product:			# using $t6 as product register, $t7 as multiplier
	sll $t6, $t6, 1		# multiply $t6 by 2 via shift
	add $t9, $t9, $t9	# double multiplier counting register $t9
	blt $t7, $t9, subtrac	# branch if $t9 > $t7
	j product		# otherwise continue shift multiplying
subtrac:
	sub $t6, $t6, $t8	# subtract multiplicand from product
	addi $t9, $t9, -1
	bne $t7, $t9, subtrac	# if still not equal ($t9 > $t7), continue loop
result:
	li $v0, 1		# print value integer
	add $a0, $t6, $0
	syscall
	j exit
force:
	la $a0, forcex
	jal pstring
exit:
	li $v0, 10		# exit syscall
	syscall
pstring:
	li $v0, 4
	syscall
	jr $ra
.data
	prompta: .asciiz "input integer A: "
	promptb: .asciiz "input integer B: "
	error: .asciiz "input range error\n"
	forcex: .asciiz "error limit exceeded"
## EOF

