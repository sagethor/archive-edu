## Assignment 6
	.text
	.globl main

main:
	la $a0, prompt		# print prompt
	jal pstring

	li $v0, 6		# float input to $f4
	syscall
	li.s $f4, 0.0
	add.s $f4, $f0, $f4

	la $t0, array		# initialize list address into $t0
	addi $t1, $t0, 32	# assuming fixed array of 8 single precision (4 byte) floats
	li.s $f5, 0.0		# initialize sum $f5 = 0

summ:
	l.s $f6 ($t0)		# load float element from array into $f6
	c.lt.s $f6, $f4		# test if element less than input float
	bc1t addy		# if true, add
	j kip			# otherwise jump kip
addy:
	add.s $f5, $f5, $f6	# otherwise add $f6 to sum $f5
kip:
	addi $t0, $t0, 4	# increment by one array element
	bne $t1, $t0, summ	# continue iterating over each float until done
	li.s $f6, 0.0		# set $f6 to 0
	c.lt.s $f6, $f5		# test if sum > 0
	bc1f notGreat		# if false, branch to notGreat
	la $a0, result		# print result from $f5
	jal pstring
	li $v0, 2
	li.s $f12, 0.0
	add.s $f12, $f5, $f12
	syscall
exit:
	li $v0, 10		# exit syscall
	syscall
notGreat:
	la $a0, less
	jal pstring
	j exit
pstring:
	li $v0, 4
	syscall
	jr $ra
.data
	prompt: .asciiz "input real number: "
	result: .asciiz "result: "
	array: .float 1.355, 2.670, 3.566, 4.560, 5.980, 7.665, 12.340, 18.540
	less: .asciiz "No numbers less than input value."
## EOF