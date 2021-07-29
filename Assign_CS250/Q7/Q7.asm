.data
a: .string "Enter two numbers:"
b: .string "GCD of these two numbers is :"

.text
main:

	li a0,1
	la a1,a
	li a2,18
	li a7,64
	ecall

	li a7,5
	ecall

	mv t1,a0
	li a7,5
	ecall
	mv t2,a0

	li t3,1


loop_head:
	bgt t3,t1,loop_end
	bgt t3,t2,loop_end

	rem t4,t1,t3
	beqz t4,x
	j z

x:
	rem t4,t2,t3
	beqz t4,y
	j z

y:
	mv t5,t3

z:
	addi t3,t3,1
	j loop_head
loop_end:

	li a0,1
	la a1,b
	li a2,29
	li a7,64
	ecall

	mv a0,t5
	li a7,1
	ecall

	li a0,0
	li a7,93
	ecall