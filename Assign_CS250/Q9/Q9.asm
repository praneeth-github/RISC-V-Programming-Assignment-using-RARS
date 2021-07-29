.data
output: .string "The factorial is : "
input: .string "Input value : "

.text
main:
	li a7,4
	la a0,input
	ecall
	
	li a7,5   #input value
	ecall
	addi x10,a0,0	#store in x10
	
	li x11,1
	li t1,1
	
l1:
	bgt t1,x10,l1_end
	addi sp,sp,-8
	jal x1,multiply_proc
	ld x5,8(sp)
	add x11,x5,x0
	addi t1,t1,1
	jal l1
l1_end:	
	mv a0,x11
	li a7,1
	ecall
	jal done


multiply_proc: 
	mul x11,t1,x11
	sd x11,8(sp)	
	jalr x0,0(x1)
	
done:
