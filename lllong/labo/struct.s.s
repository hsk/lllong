	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %return
	pushq	%rax
	movb	$3, (%rsp)
	movsbq	1(%rsp), %rdi
	callq	_print_l
	popq	%rax
	ret


.subsections_via_symbols
