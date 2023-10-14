.global	input_N_func
.include "macros.asm"
.include "literals.asm"

# function:
#	Input N from console    (size of array)
# arguments:
#	stack (+00) - N minimum (input)
#	stack (+04) - N maximum (input)
#	stack (+08) - N	      (output)
.text
input_N_func:
	outputText	(lit_iain)		# print hint for user
	inputInt					# input N - array size
	lw		t1, +0(sp)		# load minimum array size (value)
	lw		t2, +4(sp)		# load maximum array size (value)
	blt		a0, t1, input_N_func	# check minimum array size
	bgt		a0, t2, input_N_func	# check maximum array size
	lw		t0, +8(sp)		# load result address
	sw		a0, (t0)			# store N (result)
	ret					# return
