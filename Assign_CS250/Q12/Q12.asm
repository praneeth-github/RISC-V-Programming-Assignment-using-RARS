.data

a: .string "Enter value of N:"

b: .string " "

.text
main:

	la a0,a
	addi a7,zero,4
	ecall

	addi a7,zero,5
	ecall
	
	beq a0,x0,loop_end
	add a6,a0,x0

	addi t3,a0,-2

	li t4,0
	li t5,1
	li t6,1

	addi a0,t4,0
	addi a7,zero,1
	ecall
	
	beq a6,t5,loop_end
	


	la a0,b
	addi a7,zero,4
	ecall

	addi a0,t5,0
	addi a7,zero,1
	ecall

	la a0,b
	addi a7,zero,4
	ecall

loop:
	bgt t6,t3,loop_end
	sw t6,0(sp)
	jal fib
	addi a7,zero,1
	ecall
	la a0,b
	addi a7,zero,4
	ecall
	addi t6,t6,1
	jal loop


fib:
	addi sp,sp,-8
	sw ra,0(sp)
	sw fp,4(sp)
	add fp,sp,zero
	
	lw t0,8(fp)
	slti t1,t0,2
	beq t1,zero,l1
	
	addi a0,zero,1
	j exit

l1:
	addi t0,t0,-1
	
	addi sp,sp,-4
	sw t0,0(sp)
	jal fib
	
	addi sp,sp,4
	
	add t1,a0,zero
	
	lw t0,8(fp)
	addi t0,t0,-2
	
	addi sp,sp,-4
	sw t1,0(sp)
	addi sp,sp,-4
	sw t0,0(sp)
	jal fib
	
	addi sp,sp,4
	lw t1,0(sp)
	addi sp,sp,4
	
	add a0,t1,a0

exit:
	lw ra,0(sp)
	lw fp,4(sp)
	addi sp,sp,8
	jr ra
	
loop_end: