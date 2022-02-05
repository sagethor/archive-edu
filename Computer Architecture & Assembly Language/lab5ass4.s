.data 0x10000800
	OR_0: .word 1, 2, 3, 4, 5, 6
	OR_1: .word 7, 8, 9, 10, 11, 12
	OR_2: .word 13, 14, 15, 16, 17, 18
	OR_3: .word 19, 20, 21, 22, 23, 24
	OR_4: .word 25, 26, 27, 28, 29, 30
	OR_5: .word 31, 32, 33, 34, 35, 36
.data 0x10000900
	TR_0: .word 0, 0, 0, 0, 0, 0
	TR_1: .word 0, 0, 0, 0, 0, 0
	TR_2: .word 0, 0, 0, 0, 0, 0
	TR_3: .word 0, 0, 0, 0, 0, 0
	TR_4: .word 0, 0, 0, 0, 0, 0
	TR_5: .word 0, 0, 0, 0, 0, 0
.text 0x00400000
		.globl main
main:
	la $4, OR_0
	li $5, 0
	jal transload
	la $4, OR_1
	li $5, 4
	jal transload
	la $4, OR_2
	li $5, 8
	jal transload
	la $4, OR_3
	li $5, 12
	jal transload
	la $4, OR_4
	li $5, 16
	jal transload
	la $4, OR_5
	li $5, 20
	jal transload
	j exit
transload:
	lw $8, 0($4)	# load all from original row
	lw $9, 4($4)
	lw $10, 8($4)
	lw $11, 12($4)
	lw $12, 16($4)
	lw $13, 20($4)

	la $14, TR_0
	add $14, $14, $5
	sw $8, 0($14)
	la $14, TR_1
	add $14, $14, $5
	sw $9, 0($14)
	la $14, TR_2
	add $14, $14, $5
	sw $10, 0($14)
	la $14, TR_3
	add $14, $14, $5
	sw $11, 0($14)
	la $14, TR_4
	add $14, $14, $5
	sw $12, 0($14)
	la $14, TR_5
	add $14, $14, $5
	sw $13, 0($14)
	jr $ra
exit:
	li $2, 10
	syscall

	

