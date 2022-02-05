## Assignment 4
	.text
	.globl main

main:
	li $v0, 6		# float N to $f4
	syscall
	add.s $f4, $f4, $f0	# assuming $f4 initialized at 0

	li.s $f5, 1.0		# float xi starts $f5 = 1.0
	jal recurs

	li $v0, 2		# print result cube root
	add.s $f12, $f12, $f5	# assuming $f12 initialized at 0
	syscall
	j exit

recurs:
	li.s $f6, 2.0		# load float immediate 2.0 for multiply
	mul.s $f7, $f5, $f6 	# 2 * xi
	mul.s $f8, $f5, $f5	# xi^2
	div.s $f8, $f0, $f8	# N / xi^2
	add.s $f8, $f8, $f7	# 2 * xi + N / xi^2
	li.s $f6, 3.0		# load float immediate 3.0 for divide
	div.s $f5, $f8, $f6	# xi+1 = (2 * xi + N / xi2) / 3
	mul.s $f6, $f5, $f5	# calculate (xi+1)^3 for diff
	mul.s $f6, $f5, $f6
	sub.s $f6, $f6, $f4	# calculate diff
	abs.s $f6, $f6		# abs(diff)
	li.s $f7, 0.000001	# load value of epsilon to .000001
	c.lt.s $f7, $f6		# compare if abs(diff) > epsilon
	bc1t recurs		# branch if condition met
	jr $ra			# if no conditions met, then diff within pos/neg epsilon, return

exit:
	li $v0, 10		# exit syscall
	syscall
## EOF
