.text
.globl main
main:	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0		# n assignment to $t1
	li $t0, 1			# set k = 1
	li.d $f0, 0.0			# initialize sum = 0

# Signage Stage
sign:	andi $t2, $t0, 1		# 0 even, 1 odd
	bgtz $t2, odd		# $t1 > 0
	li.d $f6, -1.0			# even, set $f6 = -1
	j divi				# jump to division stage
odd:	li.d $f6, 1.0			# odd, set $f6 = 1
# Divide & Conquer Stage
divi:	mtc1 $t0, $f2		# convert k to double
	cvt.d.w $f2, $f2
	li.d $f4, 2.0
	mul.d $f2, $f2, $f4		# 2k
	li.d $f4, -1.0
	add.d $f2, $f2, $f4		# 2k - 1
	div.d $f6, $f6, $f2		# r4 / (2k - 1)
	add.d $f0, $f0, $f6		# add to sum
	addi $t0, $t0, 1		# increment k
	sub $t2, $t0, $t1
	blez $t2, sign		# loop again if k not greater than n
	li.d $f2, 4.0
	mul.d $f0, $f0, $f2		# otherwise multiply for result
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 3
	mov.d $f12, $f0
	syscall			# print result
	li $v0, 10
	syscall			# exit
.data
	str1: .asciiz "Enter unsigned integer n: "
	str2: .asciiz "pi approximation: "
