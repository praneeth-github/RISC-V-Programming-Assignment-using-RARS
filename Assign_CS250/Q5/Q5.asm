.data
input: .string "Enter a 2 digit number:"

a: .string

.text
main:
	li a7,4
	la a0,input
	ecall
	
	li a7,5   
	ecall
	addi x10,a0,0
	addi x6,x0,10	
	addi t3,x0,100
	rem x5,x10,x6	#x5=x10%10
	div x7,x10,x6	#x7=x10/10
	
	addi x5,x5,'0'	#second digit
	addi x7,x7,'0'	#first digit

	
	la t4,a
	sb x5,1(t4)
	sb x7,(t4)
	la a0,a
	li a7,1
	ecall