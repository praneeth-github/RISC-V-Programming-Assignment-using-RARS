.data
n: .word 10
output: .string "Sum of first 10 numbers:"
ans: .float 0

.text
main:
	li,a7,4
	la a0,output
	ecall
	lw t1,n
	la t2,ans
	li t3,2
	addi t4,t1,1
	mul t2,t4,t1
	div t2,t2,t3

	mv a0,t2
	li a7,1
	ecall

	li a0,0
	li a7,93	
	ecall