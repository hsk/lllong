	.file	"gc.c"
.lcomm _object_list,4,4
.lcomm _stack_bottom,4,4
	.section        __TEXT,__text,regular,pure_instructions
	.globl	_gc_init
	.def	_gc_init;	.scl	2;	.type	32;	.endef
_gc_init:
LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, _object_list
	leal	-4(%ebp), %eax
	movl	%eax, _stack_bottom
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE6:
	.def	_mark;	.scl	3;	.type	32;	.endef
_mark:
LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L11
L3:
	movl	_object_list, %eax
	testl	%eax, %eax
	je	L12
L5:
	movl	_object_list, %eax
	movl	%eax, -12(%ebp)
L10:
	movl	-12(%ebp), %eax
	addl	$12, %eax
	cmpl	8(%ebp), %eax
	ja	L6
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	8(%ebp), %eax
	jbe	L6
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L13
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %eax
	addl	$12, %eax
	movl	%eax, -16(%ebp)
	jmp	L8
L9:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_mark
	addl	$4, -16(%ebp)
L8:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	$4, %eax
	cmpl	-16(%ebp), %eax
	ja	L9
	jmp	L13
L6:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L10
	jmp	L2
L11:
	nop
	jmp	L2
L12:
	nop
	jmp	L2
L13:
	nop
L2:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE7:
	.section .rdata,"dr"
LC0:
	.ascii "free %p\12\0"
	.text
	.def	_sweep;	.scl	3;	.type	32;	.endef
_sweep:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	_object_list, %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L16
	movl	-12(%ebp), %eax
	movl	%eax, -24(%ebp)
	leal	-32(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L16
L19:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L17
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L16
L17:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L16:
	cmpl	$0, -12(%ebp)
	je	L18
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L19
L18:
	leal	-32(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jne	L14
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L14
	movl	$0, _object_list
L14:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.section .rdata,"dr"
LC1:
	.ascii "start gc\0"
LC2:
	.ascii "stack_top %p stack_bottom %p\12\0"
LC3:
	.ascii "gc end\0"
	.text
	.globl	_gc
	.def	_gc;	.scl	2;	.type	32;	.endef
_gc:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC1, (%esp)
	call	_puts
	movl	_object_list, %eax
	testl	%eax, %eax
	je	L22
	leal	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	_stack_bottom, %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L23
L24:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_mark
	movl	-16(%ebp), %eax
	addl	$4, %eax
	movl	%eax, -16(%ebp)
L23:
	movl	-16(%ebp), %edx
	movl	_stack_bottom, %eax
	cmpl	%eax, %edx
	jb	L24
	call	_sweep
L22:
	movl	$LC3, (%esp)
	call	_puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.section .rdata,"dr"
LC4:
	.ascii "newobj %ld\12\0"
LC5:
	.ascii "alloc error\0"
LC6:
	.ascii "newobj %p\12\0"
	.text
	.globl	_newobj
	.def	_newobj;	.scl	2;	.type	32;	.endef
_newobj:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	addl	$15, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L26
	call	_gc
	movl	8(%ebp), %eax
	addl	$15, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L26
	movl	$LC5, (%esp)
	call	_puts
	movl	$-1, (%esp)
	call	_exit
L26:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	_object_list, %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, _object_list
	movl	_object_list, %eax
	movl	-16(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	_object_list, %eax
	movl	_object_list, %edx
	leal	12(%edx), %ecx
	movl	8(%ebp), %edx
	sall	$2, %edx
	addl	%ecx, %edx
	movl	%edx, 4(%eax)
	movl	_object_list, %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	addl	$12, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
