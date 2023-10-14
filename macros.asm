# macro:
#	Input array size (N)
# arguments:
#	min - minimum array size (register, input)
#	max - maximum array size (register, input)
#	N   - actual array size  (register, output)
.macro	input_N (%min, %max, %N)
	addi	sp, sp, -12		# obtain stack for arguments
	sw	%min, +0(sp)		# store min - minimum array size
	sw	%max, +4(sp)		# store max - maximum array size
	sw	%N, +8(sp)		# store N - actual array size address
	jal	input_N_func		# call function
	addi	sp, sp, 12		# free stack
.end_macro


# macro:
#	Allocate memory for array
# arguments:
#	N - array items number (register, input)
#	A - array pointer	     (register, output)
.macro	alloc_array (%N, %A)
	addi	sp, sp, -8		# obtain stack for arguments
	li	t2, 4			# load array item size (bytes)
	mul	t1, %N, t2		# calculate array size (bytes)
	sw	t1, +0(sp)		# store array size (bytes)
	sw	%A, +4(sp)		# store A - array pointer
	jal	malloc_func		# call function
	addi	sp, sp, 8		# free stack
.end_macro


# macro:
#	Input array items
# arguments:
#	N - array size (register, input)
#	A - array      (register, input)
.macro	input_array (%N, %A)
	addi	sp, sp, -8		# obtain stack for arguments
	sw	%N, +0(sp)		# store N - array size
	sw	%A, +4(sp)		# store A - array address
	jal	input_array_func		# call function
	addi	sp, sp, 8		# free stack
.end_macro


# macro:
#	Print array
# arguments:
#	T - text		     (register, input)
#	N - array items number (register, input)
#	A - array address	     (register, output)
.macro	print_array (%T, %N, %A)
	addi	sp, sp, -12		# obtain stack for arguments
	sw	%T, +0(sp)		# store T - text
	sw	%N, +4(sp)		# store N - array items number
	sw	%A, +8(sp)		# store A - array address
	jal	print_array_func		# call function
	addi	sp, sp, 12		# free stack
.end_macro


# macro:
#	Form array B
# arguments:
#	N - array items number (register, input)
#	A - array address	     (register, input)
#	B - array address      (register, input)
.macro	form_B (%N, %A, %B)
	addi	sp, sp, -12		# obtain stack for arguments
	sw	%N, +0(sp)		# store N - array items number
	sw	%A, +4(sp)		# store A - array address
	sw	%B, +8(sp)		# store B - array address
	jal	form_B_func		# call function
	addi	sp, sp, 12		# free stack
.end_macro


# macro:
#	Input integer
# arguments:
#
.macro	inputInt
	li	a7, 5
	ecall
.end_macro


# macro:
#	Print text to console
# arguments:
#
.macro	outputText(%text)
	la	a0, %text
	li	a7, 4
	ecall
.end_macro


# macro:
#	Exit the program with code 0
# arguments:
#
.macro	done
	li	a7, 10
	ecall
.end_macro
