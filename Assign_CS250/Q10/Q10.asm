.data

array1:
.word 1,2,3,4,5
array2:
.word 6,7,2,9,1
array3:
.word 0,0,0,0,0


space: .string " "
output1: .string "\nThe array1 is: "
output2: .string "\nThe array2 is: "
output: .string "\nThe sum of 2 arrays is: "


.text
main:

	la s1,array1
	la s2,array2


	li t3,5

	la a0,output1
	addi a7,zero,4
	ecall

	li t4,1

l1:
	bgt t4,t3,l1_end
	ld a0,0(s1)
	li a7,1
	ecall
	addi s1,s1,4
	la a0,space
	addi a7,zero,4
	ecall
	addi t4,t4,1
	jal l1
l1_end:

	la a0,output2
	addi a7,zero,4
	ecall

	li t4,1

l2:
	bgt t4,t3,l2_end
	ld a0,0(s2)
	li a7,1
	ecall
	addi s2,s2,4
	la a0,space
	addi a7,zero,4
	ecall
	addi t4,t4,1
	jal l2
l2_end:

	li t4,1

	la a0,output
	addi a7,zero,4
	ecall

	la s1,array1
	la s2,array2
	la s0,array3
loop:	
	bgt t4,t3,done
	ld t5,0(s1)
	ld t6,0(s2)
	add a0,t5,t6
	addi s1,s1,4
	addi s2,s2,4		
	li a7,1	
	ecall
	sw a0,(s0)
	addi s0,s0,4
	la a0,space
	addi a7,zero,4
	ecall
	addi t4,t4,1
	jal loop
done: