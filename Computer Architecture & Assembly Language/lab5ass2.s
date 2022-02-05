.data 0x10000480
Array_A:	.word 5, 5, 5, 5, 5, 10, 10, 10, 10, 10
Array_B:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.text
.globl main
main:
la $2, Array_A
la $3, Array_B
li $6, 1		# result = 1
li $4, 10		# number of elements
loop:
	lw $5, 0($2)
	lw $7, 0($3)
	add $5, $5, $7	# Array_A[i] + Array_B[i]
	mult $6, $5		# multiply result by sum
	mflo $6		# get new result
	addi $2, $2, 4
	addi $3, $3, 4
	addi $4, $4, -1
	bgt $4, $0, loop
exit:
li $2, 10
	syscall
