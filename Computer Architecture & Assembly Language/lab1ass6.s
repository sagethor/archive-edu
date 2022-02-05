## Assignment 6
	.text
	.globl main

main:
	li $v0, 4 # syscall print string
	la $a0, querya # load querya
	syscall

	li $v0, 5 # syscall input int
	syscall
	add $t0, $v0, $0 # assign a

	li $v0, 4 # syscall print string
	la $a0, queryb # load queryb
	syscall

	li $v0, 5 # syscall input int
	syscall
	add $t1, $v0, $0 #assign b

	li $v0, 4 # syscall print string
	la $a0, result # load querya
	syscall

temp:
	add $t2, $t0, $0 # a
	add $t3, $t1, $0 # b
gcd:
	beq $t3, $t2, first
	sub $t4, $t3, $t2 # c = b - a
	bgtz $t4, second
third: # a > b
	sub $t2, $t2, $t3
	j gcd
second: # a < b
	sub $t3, $t3, $t2
	j gcd
first: # a = b
	add $t4, $t0, $0
lcm:
	multu $t0, $t1
	mflo $t2
	divu $t2, $t4

	li $v0, 1 # syscall print int
	mflo $a0
	syscall
exit:
	li $v0, 10 # exit syscall
	syscall
.data
	querya: .asciiz  "Please input integer A:\n"
	queryb: .asciiz "Please input integer B:\n"
	result: .asciiz "LCM is:\n"
## EOF