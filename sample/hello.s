	.def	 _main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main
	.align	16, 0x90
_main:                                  # @main
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	calll	___main
	movl	$L_.str4, (%esp)
	calll	_println
	movl	$0, -4(%ebp)
	movl	-4(%ebp), %eax
	addl	$8, %esp
	popl	%ebp
	ret

	.data
L_.str4:                                # @.str4
	.asciz	 "hello world"


