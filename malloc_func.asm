.global	malloc_func
# function:
#	Allocate memory block
# arguments:
#	stack (+00) - memory block size (input)
#	stack (+04) - pointer address   (output)
.text
malloc_func:
	lw	a0, +0(sp)		# load memory block size
	li	a7, 9			# allocate heap memory
	ecall
	lw	t0, +4(sp)		# load pointer address
	sw	a0, (t0)			# store allocated memory address
	ret				# return
