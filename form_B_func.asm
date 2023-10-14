.global	form_B_func

# function:
#	Calculate array B
#	Rule 27. Form array B from elements of array A.
#	Array elements ending with the number 4 are halved.
# arguments:
#	stack (+00) - N - array items number (input)
#	stack (+04) - array A address	 (input)
#	stack (+08) - array B address	 (input)
.text
form_B_func:
	li	t0, 0			# initialize array item counter
	lw	t3, +0(sp)		# load arrays items number
	lw	t1, +4(sp)		# load array A address
	lw	t2, +8(sp)		# load array B address
	li	t4, 10			# initialize divisor
form_B_loop:
	lw	t5, (t1)			# load current item of array A
	rem	t6, t5, t4		# calculate remainder to find the last digit of a number
form_B_test1:				# for positive item
	addi	t6, t6, -4		# try make it zero
	bnez	t6, form_B_test2		# branch if remainder not equal zero to next test
	li	t6, 2			# initialize divisor
	div	t5, t5, t6		# do rule 27
	j	form_B_next		# jump to form_B_next
form_B_test2:				# for negative item
	addi	t6, t6, 8		# try make it zero
	bnez	t6, form_B_next		# branch if remainder not equal zero
	li	t6, 2			# initialize multiplier
	mul	t5, t5, t6		# do rule 27
	j	form_B_next		# jump to form_B_next
form_B_next:
	sw	t5, (t2)			# store item to array B
	addi	t1, t1, 4		# move to next element of array A
	addi	t2, t2, 4		# move to next element of array B
	addi	t0, t0, 1		# increment array items counter
	blt	t0, t3, form_B_loop	# branch if counter less than array items number
form_B_end:
	ret				# return
