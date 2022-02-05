# quad_sol_mod.s
.globl main

main:		# INPUT READ
	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 5
	syscall
	move $t1, $v0	# a acquired

	li $v0, 4
	la $a0, str2
	syscall

	li $v0, 5
	syscall
	move $t2, $v0	# b acquired

	li $v0, 4
	la $a0, str3
	syscall

	li $v0, 5
	syscall
	move $t3, $v0	# c acquired

		# DISCRIMINANT
		# D = b^2 - 4*a*c
	mul $t5, $t1, $t3	# a*c to $t5
	mul $t4, $t2, $t2	# b^2 to $t4
	mul $t5, $t5, 4		# 4*a*c to $t5
	li $s0, 1		# sqrt partial result, sqrt(D)
	sub $t6, $t4, $t5	# D to $t6
	tlt $t6, $0		# if D < 0, exception
		# Calculating int sqrt by x*x = D
	move $s1, $t6		# move D to $s1 for safety

sqrtloop:	# sqrt(D)
	mult $s0, $s0
	mflo $s2
	bge $s2, $s1, endsqrt
	addi $s0, 1
endsqrt:
	neg $s2, $t2		# -b to $s2
	li $t0, 2		# 2 to $t0
	add $s3, $s2, $s0	# -b + sqrt(D) to $s3
	sub $s4, $s2, $s0	# -b - sqrt(D) to $s4
	mul $s5, $t1, $t0	# 2*a to $s5
	div $s6, $s3, $s5	# first int sol
	div $s7, $s4, $s5	# second int sol

		# PRINT
	li $v0, 4
	la $a0, str4
	syscall

	li $v0, 1
	move $a0, $s6
	syscall

	li $v0, 4
	la $a0, str5
	syscall

	li $v0, 1
	move $a0, $s7
	syscall

	li $v0, 10
	syscall

.data
	str1: .asciiz "Please enter coefficient a of equation a*x^2 + b*x + c: "
	str2: .asciiz "Please enter coefficient b of equation a*x^2 + b*x + c: "
	str3: .asciiz "Please enter coefficient c of equation a*x^2 + b*x  + c: "
	str4: .asciiz "The first integer solution is: "
	str5: .asciiz "\nThe second integer solution is: "