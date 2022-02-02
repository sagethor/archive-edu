## Assignment 5
	.text
	.globl main

main:
	la $a0, rget
	jal pstring
	li $v0, 6		# float r to $f4
	syscall
	li.s $f4, 0.0
	add.s $f4, $f4, $f0

	la $a0, Lget
	jal pstring
	li $v0, 6		# float L to $f5
	syscall
	li.s $f5, 0.0
	add.s $f5, $f5, $f0

	li.s $f6, 3.1415927410125732421875	# $f6 for pi

	mul.s $f7, $f4, $f4	# r^2
	mul.s $f7, $f6, $f7	# pi * r^2

	mul.s $f8, $f4, $f5	# r*L
	mul.s $f8, $f6, $f8	# pi*r*L

	add.s $f9, $f8, $f7	# S

	la $a0, Sgive
	jal pstring
	li $v0, 2		# print result surface
	li.s $f12, 0.0
	add.s $f12, $f9, $f12
	syscall
exit:
	li $v0, 10		# exit syscall
	syscall
pstring:
	li $v0, 4
	syscall
	jr $ra
.data
	rget: .asciiz "r = "
	Lget: .asciiz "L = "
	Sgive: .asciiz "S = "

## EOF
