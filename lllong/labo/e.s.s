	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movb	$3, -24(%rsp)
	xorl	%eax, %eax
	ret


.subsections_via_symbols
