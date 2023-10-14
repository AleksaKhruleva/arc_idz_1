.include "macros.asm"
.include "literals.asm"

# main program
.text
_test_01:
	la		a1, lit_B		# load text address
	lw		a2, arr_1A_sz		# load array A size
	la		a3, arr_1B		# load array B address
	print_array	(a1, a2, a3)

	la		a1, lit_A		# load text address
	lw		a2, arr_1A_sz		# load array A size
	la		a3, arr_1A		# load array A address
	print_array	(a1, a2, a3)

	lw		a1, arr_1A_sz		# load array actual size
	la		a2, arr_1A		# load array A address
	la		a3, arr_1B		# load array B address
	form_B 		(a1, a2, a3)

	la		a1, lit_B		# load text address
	lw		a2, arr_1A_sz		# load array A size
	la		a3, arr_1B		# load array B address
	print_array	(a1, a2, a3)
	
	done
.data
			.align	2
	arr_1A_sz:	.word	5
	arr_1A:		.word	1
			.word	2
			.word	3
			.word	4
			.word	5
	arr_1B:		.word	0
			.word	0
			.word	0
			.word	0
			.word	0