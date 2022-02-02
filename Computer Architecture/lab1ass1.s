## Assignment 1
	.text
	.globl main

main:
	ori $4, $2, 8
	add $10, $9, $10

	li $v0, 10 # exit syscall
	syscall

## EOF