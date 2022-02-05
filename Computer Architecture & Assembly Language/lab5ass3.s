		.data 0x10000860
vector_A:	.word 1, 2, 3, 4, 0, 0, 0, 0
		.data 0x10000880
matrix_B:	.word 1, 2, 3, 4, 5, 6, 7, 8
		.data 0x10000C80
		.word 2, 3, 4, 5, 6, 7, 8, 9
		.data 0x10001080
		.word 3, 4, 5, 6, 7, 8, 9, 10
		.data 0x10001480
		.word 4, 5, 6, 7, 8, 9, 10, 11
		.data 0x10000840
vector_C:	.word 0, 0, 0, 0, 0, 0, 0, 0
		.text 0x00400000
		.globl main
main:
	la $8, vector_A		# stored in consecutive memory spaces (4 bytes)
	la $9, matrix_B		# row base address separated by 1024 bytes
	la $10, vector_C	# stored in consecutive memory spaces (4 bytes)
	addi $11, $10, 32	# final address
iteration:
	beq $11, $10, exit	# if start of the 9th iteration, stop
	li $2, 0		# reset result
	lw $12, 0($8)
	lw $13, 0($9)
	mult $12, $13
	mflo $12
	add $2, $2, $12

	lw $14, 4($8)
	lw $15, 1024($9)
	mult $14, $15
	mflo $14
	add $2, $2, $14

	lw $12, 8($8)
	lw $13, 2048($9)
	mult $12, $13
	mflo $12
	add $2, $2, $12

	lw $14, 12($8)
	lw $15, 3072($9)
	mult $14, $15
	mflo $14
	add $2, $2, $14

	sw $2, 0($10)
	addi $10, $10, 4		# proceed to next result entry
	addi $9, $9, 4			# advance to next column address
	j iteration

exit:
	li $2, 10
	syscall

	

