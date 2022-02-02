.data
	A: .word 12, -4, 9, 7, 11, 8
.text
.globl main
main:	la $t0, A			# base address of A
	addi $t1, $t0, 16		# final array address
reset:	move $t2 $t0		# set $t2 to base address
	li $t3, 0			# swap flag set 0

L0:	lw $t4, 0($t2)		# load from [$t2] to $t4
LI:	lw $t5, 4($t2)		# load from [$t2 + 4] to $t5
	sub $t6, $t5, $t4
	bltz $t6, L2			# branch L2 when $t4 > $t5
	addi $t2, $t2, 4		# to next address
	sub $t6, $t1, $t2
	bltz $t6, L3			# branch L3 when $t2 > $t1
	j L0				# jump L0
L2:	sw $t4, 4($t2)		# store $t4 to [$t2 + 4]
	sw $t5, 0($t2)		# store $t5 to [$t2]
	addi $t3, $t3, 1		# set flag
	addi $t2, $t2, 4		# to next address
	sub $t6, $t1, $t2
	bltz $t6, L3			# branch L3 when $t2 > $t1
	j L0				# jump L0
L3:	bgtz $t3, reset		# branch reset if flag set
	lw $a0, 0($t0)
	jal print
	jal space
	lw $a0, 4($t0)
	jal print
	jal space
	lw $a0, 8($t0)
	jal print
	jal space
	lw $a0, 12($t0)
	jal print
	jal space
	lw $a0, 16($t0)
	jal print
	jal space
	lw $a0, 20($t0)
	jal print
	li $v0, 10
	syscall			# exit
space:	li $a0, 32
	li $v0, 11
	syscall
	jr $ra
print:	li $v0, 1
	syscall
	jr $ra