	.section	__TEXT,__text,regular,pure_instructions
	.globl	_f
	.align	4, 0x90
_f:                                     ## @f
## BB#0:                                ## %leave2748
	subq	$24, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, 16(%rsp)
	movss	%xmm0, 12(%rsp)
	movss	%xmm1, 8(%rsp)
	movss	12(%rsp), %xmm0
	movss	%xmm0, (%rsp)
	movss	8(%rsp), %xmm0
	movss	%xmm0, 4(%rsp)
	movq	(%rax), %rax
	cmpq	16(%rsp), %rax
	jne	LBB0_2
## BB#1:                                ## %SP_return
	addq	$24, %rsp
	ret
LBB0_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI1_0:
	.long	1066192077              ## float 1.1
LCPI1_1:
	.long	1074580685              ## float 2.2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rax
	movss	LCPI1_0(%rip), %xmm0
	movss	LCPI1_1(%rip), %xmm1
	callq	_f
	movl	$0, 4(%rsp)
	movl	4(%rsp), %eax
	popq	%rdx
	ret


.subsections_via_symbols
