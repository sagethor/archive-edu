## Assignment 1
	.text
	.globl main

main:
	li $v0, 5		# syscall input int
	syscall
	add $t0, $v0, $0	# input signed int to $t0
	li $v0, 5		# syscall input int
	syscall
	add $t1, $v0, $0	# input signed int to $t1
	slt $t2, $t1, $t0	# if $t1 < $t0, $t2 = 1, otherwise 0
	blez $t2, tzero		# $t0 is less ($t2 = 0), otherwise $t1
tone:
	add $a0, $t1, $0	# load $t1 for print
	j exit
tzero:
	add $a0, $t0, $0	# load $t0 for print
exit:
	li $v0, 1		# syscall print int
	syscall
	li $v0, 10		# exit syscall
	syscall

## EOF