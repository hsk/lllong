	.section	__TEXT,__text,regular,pure_instructions
	.globl	_color
	.align	4, 0x90
_color:                                 ## @color
## BB#0:                                ## %entry
	movss	%xmm0, -4(%rsp)
	movss	%xmm1, -8(%rsp)
	movss	%xmm2, -12(%rsp)
	movss	%xmm3, -16(%rsp)
	ret

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI1_0:
	.long	1049414861              ## float 2.750000e-01
                                        ##  (0x3e8ccccd)
LCPI1_1:
	.long	1065353216              ## float 1.000000e+00
                                        ##  (0x3f800000)
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rax
	movss	LCPI1_0(%rip), %xmm0
	movss	LCPI1_1(%rip), %xmm3
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_color
	popq	%rax
	ret


.subsections_via_symbols
