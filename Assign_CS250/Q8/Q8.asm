.data
output: .string "The product is : "
input: .string "Input value : "

.text
main:
	li a7,4
	lui a0,%hi(input)
	addi a0,a0,%lo(input)
	ecall
	
	li a7,5   #input value
	ecall
	addi x6,a0,0	#store in x6
	
	li a7,4
	lui a0,%hi(input)
	addi a0,a0,%lo(input)
	ecall
	
	li a7,5   #input value
	ecall
	addi x7,a0,0	#store in x6
	addi sp,sp,-8
	jal x1,multiply_proc
	ld x5,8(sp)
	li a7,4
	la a0,output
	ecall
	li a7,1		
	add a0,x5,x0
	ecall
	jal done


multiply_proc: 
	mul x29,x7,x6
	sd x29,8(sp)	
	jalr x0,0(x1)
	
done:
	
