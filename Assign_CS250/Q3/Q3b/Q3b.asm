.data
input: .string "Enter value of N: "
output: .string "\nSum is:"

.text
main:
	la a0,input
	li a7,4
	ecall
	
	li a7,5
	ecall
	mv t1,a0
	la a0,output
	li a7,4
	ecall
	li t2,0
	li t3,2
	addi t4,t1,1
	mul t2,t4,t1
	div t2,t2,t3
	add a0,x0,t2
	li a7,1
	ecall