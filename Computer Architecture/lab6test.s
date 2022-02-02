.globl main
main:
	li $t1, 1
	mtc1 $t1, $f2
	cvt.d.w $f2, $f2
	li $v0, 3
	mov.d $f12, $f2
	syscall
	li $v0, 10
	syscall			# exit