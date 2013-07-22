	.section	__TEXT,__text,regular,pure_instructions
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
## BB#0:                                ## %entry
	vmovss	%xmm0, -4(%rsp)
	vmovss	%xmm0, -12(%rsp)
	vmovss	%xmm0, -8(%rsp)
	vmovss	-8(%rsp), %xmm0
	ret

	.globl	_print_f
	.align	4, 0x90
_print_f:                               ## @print_f
## BB#0:                                ## %entry
	vmovss	%xmm0, -4(%rsp)
	ret

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI2_0:
	.long	1065353216              ## float 1.000000e+00
                                        ##  (0x3f800000)
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rax
	vmovss	LCPI2_0(%rip), %xmm0
	callq	_print_f
	popq	%rax
	ret


.subsections_via_symbols
