.data
infix: .string "a*b+c*d)"	#one extra bracket at end to detect end of string
input: .string "The given expression is: ("
output: .string "\nPostfix is: "

.text
main:
	li a7,4
	la a0,input
	ecall
	
	li a7,4
	la a0,infix
	ecall
	
	li a7,4
	la a0,output
	ecall
	
	la t1,infix
	addi sp,sp,-1
	li t3,'!'
	sb t3,1(sp)
	addi sp,sp,-1
	li t3,'('
	sb t3,1(sp)
loop:
	lb t2,1(sp)
	li t3,'!'
	beq t2,t3,done
	lb a1,0(t1)
	li t2,'('
	beq a1,t2,push
	li t2,'+'
	beq a1,t2,popadd
	li t2,'-'
	beq a1,t2,popadd
	li t2,'^'
	beq a1,t2,push
	li t2,'*'
	beq a1,t2,prod
	li t2,'/'
	beq a1,t2,prod
	li t2,')'
	beq a1,t2,pop
	jal print
	
push:	
	addi sp,sp,-1
	sb a1,1(sp)
	addi t1,t1,1
	jal loop
	
popadd:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,push
	lb a0,1(sp)
	li a7,11
	ecall
	addi sp,sp,1
	jal popadd	
	
pop:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,here
	lb a0,1(sp)
	li a7,11
	ecall
	addi sp,sp,1
	jal pop
	
	
	here:
		addi sp,sp,1
		addi t1,t1,1
		jal loop

prod:
	lb t3,1(sp)
	li t2,'+'
	beq t2,t3,push
	li t2,'-'
	beq t2,t3,push
	li t2,'('
	beq t2,t3,push
	lb a0,1(sp)
	li a7,11
	ecall
	addi sp,sp,1
	jal prod
	

print:
	lb a0,0(t1)
	li a7,11
	ecall
	addi t1,t1,1
	jal loop
	
done:
	