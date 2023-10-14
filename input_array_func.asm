.global	input_array_func
.include "macros.asm"
.include "literals.asm"

# function:
#	Input array from console
# locals:
#	stack (+00) - index of the current array element
# arguments:
#	stack (+04) - N - array items number (input)
#	stack (+08) - array address	 (input)
.text
input_array_func:
	addi		sp, sp, -4		# obtain stack for local variable
	li		t0, 0			# initialize array index
	sw		t0, +0(sp)		# store array index
input_array_loop:
	outputText 	(lit_iaiw)		# print hint for user
	inputInt					# input next item
	lw		t1, +0(sp)		# load current item index from local variable
	li		t2, 4			# load array item size (bytes)
	mul		t2, t1, t2		# calculate current item offset
	lw		t3, +8(sp)		# load array address
	add		t3, t3, t2		# calculate current item address
	sw		a0, (t3)			# store current item
	addi		t1, t1, 1		# increment current index
	sw		t1, +0(sp)		# store array index
	lw		t2, +4(sp)		# load array items number from function argument
	blt		t1, t2, input_array_loop	# branch if current item index less than array size
input_array_end:
	addi		sp, sp, 4		# restore stack position
	ret					# return
