## Assignment 5
	.text
	.globl main

main: # declaring variables for testing. assume run after simulator reinitialized. (t0, t1 = 0)
	la $s2, D # base address array D
	addi $s1, $0, 4 # b = 4
	addi $s0, $0, 3 # i = 3
loop: # 10 lines of code. I think that's pretty good.
	add $t2, $t1, $t1 # 2*j
	add $t3, $t0, $t2 # i + 2*j
	sll $t2, $t2, 2 # multiply by 4
	add $t2, $t2, $s2 # address A[2*j]
	sw $t3 ($t2) # A[2*j] = i + 2*j
	addi $t1, $t1, 1 # j++
	bne $t1, $s1, loop # loop j < b
	add $t1, $0, $0 # reset j = 0
	addi $t0, $t0, 1 # i++
	bne $t0, $s0, loop # loop i < a
exit: # this is just to prevent an error
	li $v0, 10 # exit syscall
	syscall
.data # more testing related stuff.
	D: .word 0:10 # array of 10 words, init 0
## EOF