.globl	main
.include "macros.asm"
.include "literals.asm"

# main program
.text
main:
	lw		a1, arr_A_min_Size	# load minimum array size
	lw		a2, arr_A_max_Size	# load maximum array size
	la		a3, arr_A_size		# load actual array size address
	input_N		(a1, a2, a3)

	lw		a1, arr_A_size		# load array A size
	la		a2, arr_A_ptr		# load array A pointer address
	alloc_array	(a1, a2)

	lw		a1, arr_A_size		# load array A size
	la		a2, arr_B_ptr		# load array B pointer address
	alloc_array	(a1, a2)

	lw		a1, arr_A_size		# load array A size
	lw		a2, arr_A_ptr		# load array A pointer address
	input_array	(a1, a2)

	la		a1, lit_A		# load text address
	lw		a2, arr_A_size		# load array A size
	lw		a3, arr_A_ptr		# load array A address
	print_array	(a1, a2, a3)

	lw		a1, arr_A_size		# load array A size
	lw		a2, arr_A_ptr		# load array A address
	lw		a3, arr_B_ptr		# load array B address
	form_B		(a1, a2, a3)

	la		a1, lit_B		# load text address
	lw		a2, arr_A_size		# load array A size
	lw		a3, arr_B_ptr		# load array B address
	print_array	(a1, a2, a3)

	done
.data
			.align	2
	arr_A_min_Size:	.word	1
	arr_A_max_Size:	.word	10
	arr_A_size:	.word	0
	arr_A_ptr:	.word	0
	arr_B_ptr:	.word	0
