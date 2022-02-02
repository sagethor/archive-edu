## Assignment 3
	.text
	.globl main

main:
	li $v0, 5		# syscall input int
	syscall
	add $t7, $v0, $0	# input int to $t7
	blez $t7, exit		# if $t7 is not a natural number, exit program
	addi $t0, $0, 1		# case 1, n = 1
	addi $t1, $0, 1			# set $t1 = 1
	li $v0, 1			# output $t1
	add $a0, $t1, 0
	syscall
	jal space
	beq $t0, $t7, exit		# test input = 1
	addi $t0, $t0, 1	# case 2, n = 2
	addi $t2, $0, 1		# set $t2 = 1
	li $v0, 1			# output $t2
	add $a0, $t2, 0
	syscall
	jal space
	beq $t0, $t7, exit		# test input = 2
loop:
	addi $t0, $t0, 1	# case 3, n >= 3
	add $t3, $t1, $t2		# set $t3 = $t1 + $t2
	li $v0, 1			# output $t3
	add $a0, $t3, 0
	syscall
	jal space
	add $t1, $t2, $0		# shift $t2 to $t1
	add $t2, $t3, $0		# shift $t3 to $t2
	beq $t0, $t7, exit		# test input = $t0
	j loop				# otherwise repeat loop
exit:
	li $v0, 10		# exit syscall
	syscall
space:
	li $v0, 11
	li $a0, ' '
	syscall
	jr $ra

## EOF