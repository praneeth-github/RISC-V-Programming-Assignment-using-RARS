.data 
output: .string "\nThe Fibonacci Numbers:\n"
input: .string "Enter the value of n: "
space: .string " "

.text
main:
	add x5,x0,x0
	li a7,4
	lui a0,%hi(input)
	addi a0,a0,%lo(input)
	ecall
	
	li a7,5   #input value
	ecall
	addi x6,a0,0	#store in x6
	beq x6,x0,done
	
	li a7,4
	lui a0,%hi(output)
	addi a0,a0,%lo(output)
	ecall
	
	li a7,1			
	add a0,x0,x0	#print0
	ecall
	addi x30,x0,1
	beq x6,x30,done		#check if n==1
	
	
	li a7,4
	lui a0,%hi(space)
	addi a0,a0,%lo(space)
	ecall
	
	
here:			
	li a7,1			#print1
	addi x31,x0,1
	add a0,x31,x0
	ecall
	addi x30,x0,2
	beq x6,x30,done
	li a7,4
	lui a0,%hi(space)
	addi a0,a0,%lo(space)
	ecall
	 
	
	
	
here1:	
	addi x6,x6,-2
	add x30,x0,x0   # x30=0
	addi x31,x0,1	# x31=1
	
loop1:
	bge x5,x6,done	
	
	add x29,x30,x31
	add x30,x0,x31
	add x31,x0,x29
	
	li a7,1			#for printing the number,code 1 
	add a0,x29,x0
	ecall
	
	li a7,4
	lui a0,%hi(space)
	addi a0,a0,%lo(space)
	ecall
	
	addi x5,x5,1
	blt x5,x6,loop1
done:
