.data

input: .string "\nEnter input: "
output1: .string "\nSum of first "
output2: .string " numbers is "

a: .string 

.text
main:

	li a7,4
	la a0,input
	ecall

	li a7,5
	ecall

	mv t1,a0

	li t2,0
	li t3,2
	addi t4,t1,1
	mul t2,t4,t1
	div t2,t2,t3


	addi x10,t2,0
	addi x31,x0,10	
	rem x5,x10,x31	#x5=x10%10
	div x7,x10,x31	#x7=x10/10

	addi x5,x5,'0'	#second digit
	addi x7,x7,'0'	#first digit

	li a7,4
	la a0,output1
	ecall

	mv a0,t1
	li a7,1
	ecall

	li a7,4
	la a0,output2
	ecall

	la t4,a
	sb x5,1(t4)
	sb x7,(t4)
	la a0,a
	li a7,4
	ecall