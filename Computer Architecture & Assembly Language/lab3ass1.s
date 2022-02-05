## Assignment 1
	.text
	.globl main
main:
	la $a0, prompta		# print prompta
	li $v0, 4
	syscall
	li $v0, 5
	syscall			# assign A to $t0 (assuming int)
	add $t0, $v0, $0	

	la $a0, promptb		# print promptb
	li $v0, 4
	syscall
	li $v0, 5
	syscall			# assign B to $t1 (assuming int)
	add $t1, $v0, $0

	la $a0, promptc		# print promptc
	li $v0, 4
	syscall
	li $v0, 5
	syscall			# assign C to $t2 (assuming int)
	add $t2, $v0, $0

	li $t6, -1		# load negation immediate $t6
	xor $t3, $t0, $t6	# $t3 = A'
	or $t3, $t3, $t2	# $t3 = (A' + C)
	xor $t3, $t3, $t6	# $t3 = (A' + C)'

	and $t4, $t0, $t1	# $t4 = AB
	xor $t4, $t4, $t6	# $t4 = (AB)'

	and $t5, $t3, $t4	# $t5 = (A' + C)' (AB)'

	la $a0, result		# print result
	li $v0, 4
	syscall
	li $v0, 1		# print value of F as integer
	add $a0, $t5, $0
	syscall

exit:
	li $v0, 10	# exit syscall
	syscall

.data
	prompta: .asciiz "input A: "
	promptb: .asciiz "input B: "
	promptc: .asciiz "input C: "
	result: .asciiz "F = "
## EOF
