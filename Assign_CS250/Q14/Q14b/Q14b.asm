.data
infix: .string "a*(b+c)*d)"	#one extra bracket at end to detect end of string
input: .string "The given expression is: ("
output: .string "\nPrefix is: "
rev: .string "            "
postfix: .string "            "
prefix: .string "            "

.text
	la t2,infix
	addi t2,t2,8
	la t4,rev
	addi t5,x0,0
	addi t6,x0,9
reverse:
	beq t5,t6,cal
	lb t3,0(t2)
	li t0,'('
	beq t0,t3,a
	li t0,')'
	beq t0,t3,b1
	jal hi
a:	li t3,')'
	jal hi
b1:	li t3,'('
	mv t1,t3

hi:	
	sb t3,0(t4)
	addi t4,t4,1
	addi t2,t2,-1
	addi t5,t5,1
	jal reverse
	
	
	
cal:	la t1,rev
	li t3,')'
	sb t3,9(t1)

main:
	la t6,postfix
	li a7,4
	la a0,input
	ecall
	
	li a7,4
	la a0,infix
	ecall
	
	li a7,4
	la a0,output
	ecall
	
	la t1,rev
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
	lb a3,0(t1)

	li t2,'('
	beq a3,t2,push
	li t2,'+'
	beq a3,t2,popadd
	li t2,'-'
	beq a3,t2,popadd
	li t2,'^'
	beq a3,t2,push
	li t2,'*'
	beq a3,t2,prod
	li t2,'/'
	beq a3,t2,prod
	li t2,')'
	beq a3,t2,pop
	jal print
	
push:	
	addi sp,sp,-1
	sb a3,1(sp)
	addi t1,t1,1
	jal loop
	
popadd:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,push
	
	lb t4,1(sp)
	sb t4,0(t6)
	addi t6,t6,1
	addi t5,t5,1
	
	addi sp,sp,1
	jal popadd	
	
pop:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,here
	
	lb t4,1(sp)
	sb t4,0(t6)
	addi t6,t6,1
	
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
	
	lb t4,1(sp)
	sb t4,0(t6)
	addi t6,t6,1
	
	addi sp,sp,1
	jal prod
	

print:
	lb t4,0(t1)
	addi t1,t1,1
	sb t4,0(t6)
	addi t6,t6,1
	jal loop
	
done:
	la t2,postfix
	addi t2,t2,8
	la t4,prefix
	addi t5,x0,0
	addi t6,x0,9
reverse1:
	beq t5,t6,final
	lb t3,0(t2)
	li t0,'('
	beq t0,t3,a12
	li t0,')'
	beq t0,t3,b11
	jal hi1
a12:	li t3,')'
	jal hi1
b11:	li t3,'('
	mv t1,t3

hi1:	
	sb t3,0(t4)
	addi t4,t4,1
	addi t2,t2,-1
	addi t5,t5,1
	jal reverse1
	
final:

	la a0,prefix
	li a7,4
	ecall