.data

array:
.word 6,7,2,9,1

space: .string " "
output1: .string "\nThe initial array is: "
output2: .string "\nThe sorted array is: "

.text
main:

	la s1,array
	
	li s2,5

	la a0,output1
	addi a7,zero,4
	ecall

	li t0,1
	la s1,array
loop1:
	bgt t0,s2,loop_end1
	lw a0,0(s1)
	li a7,1
	ecall
	addi s1,s1,4
	la a0,space
	addi a7,zero,4
	ecall
	addi t0,t0,1
	jal loop1
	
loop_end1:

	li t0,0
	addi t5,s2,-1
l1:
	bge t0,t5,l1_end
	
	li t2,0
	sub t1,t5,t0
	la s1,array
	l2:
		bge t2,t1,l2_end
		lw t3,0(s1)
		lw t4,4(s1)
		bgt t3,t4,l3
		jal l3_end
		l3:
			mv t6,t3
			mv t3,t4
			mv t4,t6
		l3_end:
		sw t3,(s1)
		addi s1,s1,4
		sw t4,(s1)
		addi t2,t2,1
		jal l2
	l2_end:
	addi t0,t0,1
	jal l1
l1_end:

	la a0,output2
	addi a7,zero,4
	ecall

	li t0,1
	la s1,array
loop:
	bgt t0,s2,loop_end
	lw a0,0(s1)
	li a7,1
	ecall
	addi s1,s1,4
	la a0,space
	addi a7,zero,4
	ecall
	addi t0,t0,1
	jal loop
loop_end: