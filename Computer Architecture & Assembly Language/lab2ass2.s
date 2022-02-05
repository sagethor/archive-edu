## Assignment 2
	.text
	.globl main

main:
	li $v0, 5 # syscall for input int
	syscall

	andi $a0, $v0, 1 # bitwise AND immediate into $a0

	li $v0, 4 # print syscall
	beq $a0, 1, oddity
evenity:
	la $a0, even # print even
	syscall

	j exit
oddity:
	la $a0, odd # print odd
	syscall
exit:
	li $v0, 10 # exit syscall
	syscall

.data
	odd: .asciiz "odd\n"
	even: .asciiz "even\n"
## EOF