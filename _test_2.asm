.include "macros.asm"
.include "literals.asm"

# main program
.text
_test_02:
	la		a1, lit_B		# load text address
	lw		a2, arr_2A_sz		# load array size
	la		a3, arr_2B		# load array address
	print_array	(a1, a2, a3)

	la		a1, lit_A		# load text address
	lw		a2, arr_2A_sz		# load array size
	la		a3, arr_2A		# load array address
	print_array	(a1, a2, a3)

	lw		a1, arr_2A_sz		# load array actual size
	la		a2, arr_2A		# load array A address
	la		a3, arr_2B		# load array B address
	form_B		(a1, a2, a3)

	la		a1, lit_B		# load text address
	lw		a2, arr_2A_sz		# load array size
	la		a3, arr_2B		# load array address
	print_array	(a1, a2, a3)
	
	done
.data
			.align	2
	arr_2A_sz:	.word	2
	arr_2A:		.word	64
			.word	-44
	arr_2B:		.word	0
			.word	0