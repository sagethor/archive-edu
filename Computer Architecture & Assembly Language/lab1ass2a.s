## Assignment 2a
	.text
	.globl main

main:
	addi $s3, $0, 3 # initialize i = 3
	la $s6, A # load address A
	la $s7, B # load address B

	add $t0, $s3, $s3 # 2*i
	add $t0, $t0, $s6 # address A[2*i]
	lb $t1, ($t0) # A[2*i]
	sub $t2, $t1, $t1 # A[2*i] - A[2*i]
	sb $t2, 3($s7) # B[3] = A[2*i] - A[2*i]
	
	li $v0, 10 # exit syscall
	syscall

.data
	A: .byte 0 1 2 3 4 5 6 7 8 9
	B: .byte 0 0 0

## EOF