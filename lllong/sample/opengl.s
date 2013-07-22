	.section	__TEXT,__text,regular,pure_instructions
	.globl	_color
	.align	4, 0x90
_color:                                 ## @color
## BB#0:                                ## %leave1791
	pushq	%rbx
	subq	$48, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rax
	movq	%rax, 40(%rsp)
	movss	%xmm0, 36(%rsp)
	movss	%xmm1, 32(%rsp)
	movss	%xmm2, 28(%rsp)
	movss	%xmm3, 24(%rsp)
	leaq	8(%rsp), %rdx
	movq	_GL_FRONT_AND_BACK@GOTPCREL(%rip), %rax
	movq	_GL_DIFFUSE@GOTPCREL(%rip), %rcx
	movss	36(%rsp), %xmm0
	movss	%xmm0, 8(%rsp)
	movss	32(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movss	28(%rsp), %xmm0
	movss	%xmm0, 16(%rsp)
	movss	24(%rsp), %xmm0
	movss	%xmm0, 20(%rsp)
	movl	(%rcx), %esi
	movl	(%rax), %edi
	callq	_glMaterialfv
	movq	(%rbx), %rax
	cmpq	40(%rsp), %rax
	jne	LBB0_2
## BB#1:                                ## %SP_return
	addq	$48, %rsp
	popq	%rbx
	ret
LBB0_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail

	.globl	_aaa
	.align	4, 0x90
_aaa:                                   ## @aaa
## BB#0:                                ## %entry
	movl	$3, -4(%rsp)
	movl	-4(%rsp), %eax
	ret


.subsections_via_symbols
