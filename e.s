	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rax
	leaq	L_.str68(%rip), %rdi
	callq	_println
	movl	$0, 4(%rsp)
	movl	4(%rsp), %eax
	popq	%rdx
	ret

	.section	__TEXT,__const
L_.str68:                               ## @.str68
	.asciz	 "\343\201\202\343\201\204\343\201\206\343\201\210a"


.subsections_via_symbols
