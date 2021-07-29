.data

array:
.word 1,3,5,6,7

space: .string " "
output1: .string "\nThe array is: "
enter: .string "\n"
input1: .string "\nEnter the element to be searched: "
output2: .string " is at "
output3: .string " position"
output4: .string " is not present is the array"

.text
main:

						#Execute the code step by step !!!!!

	la s1,array

	li s2,5

	la a0,output1
	addi a7,zero,4
	ecall

	li t0,1
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

	la a0,input1
	addi a7,zero,4
	ecall

	addi a7,zero,5
	ecall

	addi s3,a0,0

	li t1,0
	addi t2,s2,-1

loop:
	bgt t1,t2,loop_end
	sub t3,t2,t1
	li t4,2
	div t3,t3,t4
	add t3,t3,t1
	la s1,array
	li t5,4
	mul t5,t5,t3
	add s1,s1,t5
	lw t6,0(s1)
	beq t6,s3,l2
	jal l2_end
	l2:
		jal done
	l2_end:
	bgt t6,s3,l3
	jal l3_end
	l3:
		addi t2,t3,-1
		jal l4
	l3_end:
	addi t1,t3,1
	l4:
	jal loop
loop_end:

	la a0,enter
	addi a7,zero,4
	ecall

	addi a0,s3,0
	addi a7,zero,1
	ecall

	la a0,output4
	addi a7,zero,4
	ecall

	jal return

done:

	la a0,enter
	addi a7,zero,4
	ecall

	addi a0,s3,0
	addi a7,zero,1
	ecall

	la a0,output2
	addi a7,zero,4
	ecall

	addi a0,t3,1
	addi a7,zero,1
	ecall
	
	la a0,output3
	addi a7,zero,4
	ecall

return:
