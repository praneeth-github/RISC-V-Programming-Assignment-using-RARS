.data
print: .string "Hello World\n"

.text
main:
	li a7,4
	lui a0,%hi(print)
	addi a0,a0,%lo(print)
	ecall
	

