	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rbx
	subq	$96, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rax
	movq	%rax, 88(%rsp)
	movq	$100, 16(%rsp)
	movl	$100, %edi
	callq	_print_l
	movq	(%rbx), %rax
	cmpq	88(%rsp), %rax
	jne	LBB0_2
## BB#1:                                ## %SP_return
	addq	$96, %rsp
	popq	%rbx
	ret
LBB0_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail


.subsections_via_symbols
