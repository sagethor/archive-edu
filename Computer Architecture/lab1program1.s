# program1 is used in assignments 1 and 2
.text 0x00400000
 .globl main
main:
lw $10, Number1($0) # this instruction loads a word from RAM
ori $11, $0, 1 #OR immediate instruction
ori $9, $0, 1
#compute the factorial of Number ($10)!
factloop:
bge $11, $10, factexit #branch grater or equal instruction
mul $9, $10, $9 #multiply contents of registers $10 and $9
sub $10, $10, 1 #subtract 1 from contents of register $10 and place
result in reg $10
j factloop #jump to label factloop
factexit:
#the computation of the factorial number has finished at this point
#Is the result in register $9 correct? The result in $9 is in hex form
 li $2, 10 #load immediate number 10 in register $2
 syscall
 .data 0x10000000
 .align 2
Number1: .word 18