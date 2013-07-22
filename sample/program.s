	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:                                ## %entry
	subq	$24, %rsp
	movl	%edi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	xorps	%xmm0, %xmm0
	movq	_ship@GOTPCREL(%rip), %rax
	movups	%xmm0, (%rax)
	movq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	callq	_glutInit
	movl	$640, %edi              ## imm = 0x280
	movl	$480, %esi              ## imm = 0x1E0
	callq	_glutInitWindowSize
	movb	$1, %al
	testb	%al, %al
	jne	LBB0_2
## BB#1:                                ## %ok15
	leaq	L_.str1767(%rip), %rdi
	callq	_glutGameModeString
	callq	_glutEnterGameMode
	jmp	LBB0_3
LBB0_2:                                 ## %else16
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	callq	_glutCreateWindow
LBB0_3:                                 ## %..leave
	xorl	%edi, %edi
	callq	_glutInitDisplayMode
	movl	$3042, %edi             ## imm = 0xBE2
	callq	_glEnable
	movl	$2896, %edi             ## imm = 0xB50
	callq	_glEnable
	movl	$16384, %edi            ## imm = 0x4000
	callq	_glEnable
	leaq	_main_display(%rip), %rdi
	callq	_glutDisplayFunc
	leaq	_main_loop(%rip), %rsi
	movl	$20, %edi
	xorl	%edx, %edx
	callq	_glutTimerFunc
	leaq	_downKey(%rip), %rdi
	callq	_glutSpecialFunc
	leaq	_upKey(%rip), %rdi
	callq	_glutSpecialUpFunc
	movq	_game@GOTPCREL(%rip), %rdi
	callq	_Game_new
	callq	_glutMainLoop
	movl	$33, %edi
	callq	_print_i
	callq	_aaa
	movl	$0, 20(%rsp)
	xorl	%eax, %eax
	addq	$24, %rsp
	ret

	.globl	_main_loop
	.align	4, 0x90
_main_loop:                             ## @main_loop
## BB#0:                                ## %entry
	pushq	%rax
	movl	%edi, 4(%rsp)
	movq	_game@GOTPCREL(%rip), %rdi
	callq	*16(%rdi)
	callq	_glutPostRedisplay
	leaq	_main_loop(%rip), %rsi
	movl	$20, %edi
	xorl	%edx, %edx
	callq	_glutTimerFunc
	popq	%rax
	ret

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI2_0:
	.quad	4636033603912859648     ## double 90
LCPI2_1:
	.quad	4607182418800017408     ## double 1
LCPI2_2:
	.quad	4666723172467343360     ## double 1.0E+4
LCPI2_3:
	.quad	4647503709213818880     ## double 500
LCPI2_4:
	.quad	4650265682422792192     ## double 802
LCPI2_5:
	.quad	4647591670144040960     ## double 505
LCPI2_6:
	.quad	4644337115725824000     ## double 320
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main_display
	.align	4, 0x90
_main_display:                          ## @main_display
## BB#0:                                ## %leave59
	pushq	%rbx
	subq	$48, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rax
	movq	%rax, 40(%rsp)
	movl	$640, 36(%rsp)          ## imm = 0x280
	movl	$480, 32(%rsp)          ## imm = 0x1E0
	movl	$16640, %edi            ## imm = 0x4100
	callq	_glClear
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$640, %edx              ## imm = 0x280
	movl	$480, %ecx              ## imm = 0x1E0
	callq	_glViewport
	movl	$5889, %edi             ## imm = 0x1701
	callq	_glMatrixMode
	callq	_glLoadIdentity
	movsd	LCPI2_0(%rip), %xmm0
	movsd	LCPI2_1(%rip), %xmm2
	movsd	LCPI2_2(%rip), %xmm3
	cvtsi2sdl	32(%rsp), %xmm1
	cvttsd2si	%xmm1, %ecx
	movl	36(%rsp), %eax
	cltd
	idivl	%ecx
	xorps	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	callq	_gluPerspective
	leaq	12(%rsp), %rdx
	movl	$1092616192, 28(%rsp)   ## imm = 0x41200000
	movss	28(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	LCPI2_3(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	movss	28(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	LCPI2_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 16(%rsp)
	movss	28(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	LCPI2_5(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 20(%rsp)
	movl	$1065353216, 24(%rsp)   ## imm = 0x3F800000
	movl	$16384, %edi            ## imm = 0x4000
	movl	$4611, %esi             ## imm = 0x1203
	callq	_glLightfv
	movl	$5888, %edi             ## imm = 0x1700
	callq	_glMatrixMode
	callq	_glLoadIdentity
	movl	$770, %edi              ## imm = 0x302
	movl	$1, %esi
	callq	_glBlendFunc
	movsd	LCPI2_6(%rip), %xmm2
	movq	$0, (%rsp)
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm3, %xmm3
	xorps	%xmm4, %xmm4
	xorps	%xmm5, %xmm5
	xorps	%xmm6, %xmm6
	movsd	LCPI2_1(%rip), %xmm7
	callq	_gluLookAt
	movq	_game@GOTPCREL(%rip), %rax
	callq	*24(%rax)
	callq	_glFlush
	movq	(%rbx), %rax
	cmpq	40(%rsp), %rax
	jne	LBB2_2
## BB#1:                                ## %SP_return
	addq	$48, %rsp
	popq	%rbx
	ret
LBB2_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail

	.globl	_Game_new
	.align	4, 0x90
_Game_new:                              ## @Game_new
## BB#0:                                ## %leave142
	movq	%rdi, -8(%rsp)
	movl	$0, 32(%rdi)
	movq	-8(%rsp), %rax
	movl	$3, 4(%rax)
	movq	-8(%rsp), %rax
	movl	$1, (%rax)
	leaq	_Game_title_draw(%rip), %rax
	leaq	_Game_title(%rip), %rcx
	movq	-8(%rsp), %rdx
	movl	$0, 12(%rdx)
	movq	-8(%rsp), %rdx
	movq	%rcx, 16(%rdx)
	movq	-8(%rsp), %rcx
	movq	%rax, 24(%rcx)
	ret

	.globl	_Game_title
	.align	4, 0x90
_Game_title:                            ## @Game_title
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	incl	12(%rdi)
	movq	_key@GOTPCREL(%rip), %rax
	movl	16(%rax), %eax
	testq	%rax, %rax
	je	LBB4_2
## BB#1:                                ## %ok189
	movq	-8(%rsp), %rax
	movl	$0, 12(%rax)
	leaq	_Game_title_end(%rip), %rax
	movq	-8(%rsp), %rcx
	movq	%rax, 16(%rcx)
LBB4_2:                                 ## %leave175
	ret

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI5_0:
	.quad	-4587338432941916160    ## double -90
LCPI5_1:
	.quad	4607182418800017408     ## double 1
LCPI5_4:
	.quad	4629463133531502805     ## double 31.157
LCPI5_5:
	.quad	4644032207957302182     ## double 302.668
LCPI5_6:
	.quad	4628210288410163675     ## double 26.706
LCPI5_7:
	.quad	4646263838329687507     ## double 429.5215
LCPI5_8:
	.quad	4638980488589345817     ## double 135.7555
LCPI5_9:
	.quad	4646185535509603811     ## double 425.0705
LCPI5_10:
	.quad	4639058791409429512     ## double 137.981
LCPI5_11:
	.quad	4632713888037534171     ## double 53.412
LCPI5_12:
	.quad	4629894986514521129     ## double 33.3825
LCPI5_13:
	.quad	4641407876011940381     ## double 204.746
LCPI5_14:
	.quad	-4587407394311210271    ## double -89.02
LCPI5_15:
	.quad	4631774254196529824     ## double 46.7355
LCPI5_16:
	.quad	-4592850627779585114    ## double -37.8335
LCPI5_17:
	.quad	4641486178832024076     ## double 206.9715
LCPI5_18:
	.quad	-4592537416499250332    ## double -40.059
LCPI5_19:
	.quad	4646342141149771203     ## double 433.9725
LCPI5_20:
	.quad	-4585528126629201576    ## double -115.726
LCPI5_21:
	.quad	4641094664731605598     ## double 195.844
LCPI5_22:
	.quad	-4585841337909536358    ## double -111.275
LCPI5_23:
	.quad	-4582355674943253905    ## double -193.6185
LCPI5_24:
	.quad	4641172967551689294     ## double 198.0695
LCPI5_25:
	.quad	-4579574737357724713    ## double -289.315
LCPI5_26:
	.quad	4646146384099561964     ## double 422.845
LCPI5_27:
	.quad	-4582277372123170210    ## double -195.844
LCPI5_28:
	.quad	-4579809645817975800    ## double -275.962
LCPI5_29:
	.quad	4631147831635860259     ## double 42.2845
LCPI5_30:
	.quad	-4582512280583421297    ## double -189.1675
LCPI5_31:
	.quad	-4579927100048101343    ## double -269.2855
LCPI5_32:
	.quad	-4591284571377911202    ## double -48.961
LCPI5_33:
	.quad	-4589405303695902507    ## double -62.314
LCPI5_34:
	.quad	4639606911150015382     ## double 153.5595
LCPI5_35:
	.quad	-4578282740826343735    ## double -362.7565
LCPI5_36:
	.quad	-4579183223257306235    ## double -311.57
LCPI5_37:
	.quad	-4576755835834711671    ## double -449.551
LCPI5_38:
	.quad	-4583765125704760426    ## double -153.5595
LCPI5_39:
	.quad	-4582747189043672383    ## double -182.491
LCPI5_40:
	.quad	-4580476407261245211    ## double -247.0305
LCPI5_41:
	.quad	-4578791709156887757    ## double -333.825
LCPI5_42:
	.quad	-4584078336985095209    ## double -144.6575
LCPI5_43:
	.quad	-4579339828897473626    ## double -302.668
LCPI5_44:
	.quad	-4584313245445346296    ## double -137.981
LCPI5_45:
	.quad	-4576873290064837214    ## double -442.8745
LCPI5_46:
	.quad	-4592224205218915549    ## double -42.2845
LCPI5_47:
	.quad	-4578361043646427431    ## double -358.3055
LCPI5_48:
	.quad	-4576325170324251345    ## double -474.0315
	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI5_2:
	.long	1049414861              ## float 0.27500001
LCPI5_3:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Game_title_draw
	.align	4, 0x90
_Game_title_draw:                       ## @Game_title_draw
## BB#0:                                ## %entry
	pushq	%rax
	callq	_glPushMatrix
	movsd	LCPI5_0(%rip), %xmm0
	movsd	LCPI5_1(%rip), %xmm2
	xorps	%xmm1, %xmm1
	xorps	%xmm3, %xmm3
	callq	_glRotated
	movq	_game@GOTPCREL(%rip), %rax
	movl	12(%rax), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	xorps	%xmm1, %xmm1
	movsd	LCPI5_1(%rip), %xmm2
	xorps	%xmm3, %xmm3
	callq	_glRotated
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movss	LCPI5_3(%rip), %xmm3
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_4(%rip), %xmm1
	movsd	LCPI5_5(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_6(%rip), %xmm1
	movsd	LCPI5_7(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_8(%rip), %xmm1
	movsd	LCPI5_9(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_8(%rip), %xmm1
	movsd	LCPI5_9(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_10(%rip), %xmm1
	movsd	LCPI5_11(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_4(%rip), %xmm1
	movsd	LCPI5_5(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_10(%rip), %xmm1
	movsd	LCPI5_11(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_12(%rip), %xmm1
	movsd	LCPI5_13(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_4(%rip), %xmm1
	movsd	LCPI5_5(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_16(%rip), %xmm1
	movsd	LCPI5_17(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_12(%rip), %xmm1
	movsd	LCPI5_13(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_12(%rip), %xmm1
	movsd	LCPI5_13(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_10(%rip), %xmm1
	movsd	LCPI5_11(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_18(%rip), %xmm1
	movsd	LCPI5_19(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_16(%rip), %xmm1
	movsd	LCPI5_17(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_20(%rip), %xmm1
	movsd	LCPI5_21(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_22(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI5_7(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_18(%rip), %xmm1
	movsd	LCPI5_19(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_18(%rip), %xmm1
	movsd	LCPI5_19(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_20(%rip), %xmm1
	movsd	LCPI5_21(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_23(%rip), %xmm1
	movsd	LCPI5_24(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_20(%rip), %xmm1
	movsd	LCPI5_21(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_25(%rip), %xmm1
	movsd	LCPI5_26(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_27(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI5_26(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_23(%rip), %xmm1
	movsd	LCPI5_24(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_23(%rip), %xmm1
	movsd	LCPI5_24(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_28(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI5_11(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_25(%rip), %xmm1
	movsd	LCPI5_26(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_23(%rip), %xmm1
	movsd	LCPI5_24(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_14(%rip), %xmm1
	movsd	LCPI5_15(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_28(%rip), %xmm1
	movsd	LCPI5_11(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_30(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_31(%rip), %xmm1
	movsd	LCPI5_32(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_33(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI5_8(%rip), %xmm1
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI5_34(%rip), %xmm1
	movsd	LCPI5_35(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI5_36(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_30(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_30(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_8(%rip), %xmm1
	movsd	LCPI5_33(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_34(%rip), %xmm1
	movsd	LCPI5_35(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_34(%rip), %xmm1
	movsd	LCPI5_35(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_37(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI5_15(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_36(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_30(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_38(%rip), %xmm1
	movsd	LCPI5_39(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_31(%rip), %xmm1
	movsd	LCPI5_32(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_38(%rip), %xmm1
	movsd	LCPI5_39(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_40(%rip), %xmm1
	movsd	LCPI5_41(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_31(%rip), %xmm1
	movsd	LCPI5_32(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_38(%rip), %xmm1
	movsd	LCPI5_39(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_42(%rip), %xmm1
	movsd	LCPI5_43(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_40(%rip), %xmm1
	movsd	LCPI5_41(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_42(%rip), %xmm1
	movsd	LCPI5_43(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_44(%rip), %xmm1
	movsd	LCPI5_45(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_40(%rip), %xmm1
	movsd	LCPI5_41(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_42(%rip), %xmm1
	movsd	LCPI5_43(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_46(%rip), %xmm1
	movsd	LCPI5_47(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_44(%rip), %xmm1
	movsd	LCPI5_45(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_46(%rip), %xmm1
	movsd	LCPI5_47(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_29(%rip), %xmm1
	movsd	LCPI5_36(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_15(%rip), %xmm1
	movsd	LCPI5_37(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_15(%rip), %xmm1
	movsd	LCPI5_37(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI5_48(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI5_18(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_46(%rip), %xmm1
	movsd	LCPI5_47(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI5_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI5_3(%rip), %xmm3
	callq	_color
	movsd	LCPI5_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_46(%rip), %xmm1
	movsd	LCPI5_47(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_18(%rip), %xmm1
	movsd	LCPI5_48(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI5_44(%rip), %xmm1
	movsd	LCPI5_45(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	callq	_glPopMatrix
	popq	%rax
	ret

	.globl	_Game_title_end
	.align	4, 0x90
_Game_title_end:                        ## @Game_title_end
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	incl	12(%rdi)
	movq	-8(%rsp), %rax
	movl	12(%rax), %eax
	cmpq	$61, %rax
	jl	LBB6_2
## BB#1:                                ## %ok905
	movq	-8(%rsp), %rax
	leaq	_Game_init(%rip), %rcx
	movq	%rcx, 16(%rax)
LBB6_2:                                 ## %leave891
	ret

	.globl	_Game_demo
	.align	4, 0x90
_Game_demo:                             ## @Game_demo
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_ranking
	.align	4, 0x90
_Game_ranking:                          ## @Game_ranking
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_init
	.align	4, 0x90
_Game_init:                             ## @Game_init
## BB#0:                                ## %leave925
	pushq	%rax
	movq	%rdi, (%rsp)
	movl	$0, 32(%rdi)
	movq	(%rsp), %rax
	movl	$3, 4(%rax)
	movq	(%rsp), %rax
	movl	$1, (%rax)
	leaq	_Game_game_draw(%rip), %rax
	leaq	_Game_stageStart(%rip), %rcx
	movq	(%rsp), %rdx
	movl	$0, 12(%rdx)
	movq	(%rsp), %rdx
	movq	%rcx, 16(%rdx)
	movq	(%rsp), %rcx
	movq	%rax, 24(%rcx)
	movq	(%rsp), %rdi
	callq	*16(%rdi)
	popq	%rax
	ret

	.globl	_Game_stageStart
	.align	4, 0x90
_Game_stageStart:                       ## @Game_stageStart
## BB#0:                                ## %entry
	pushq	%rax
	movq	%rdi, (%rsp)
	movl	12(%rdi), %eax
	cmpq	$241, %rax
	jl	LBB10_2
## BB#1:                                ## %ok965
	movq	(%rsp), %rax
	leaq	_Game_game(%rip), %rcx
	movq	%rcx, 16(%rax)
LBB10_2:                                ## %leave964
	movq	(%rsp), %rdi
	callq	_Game_game
	popq	%rax
	ret

	.globl	_Game_game
	.align	4, 0x90
_Game_game:                             ## @Game_game
## BB#0:                                ## %entry
	pushq	%rax
	movq	%rdi, (%rsp)
	movl	12(%rdi), %eax
	andq	$3, %rax
	cmpq	$3, %rax
	jne	LBB11_2
## BB#1:                                ## %ok988
	movq	(%rsp), %rax
	addl	$10, 32(%rax)
LBB11_2:                                ## %leave987
	movq	(%rsp), %rax
	incl	12(%rax)
	callq	_Ship_move
	popq	%rax
	ret

	.globl	_Game_game_draw
	.align	4, 0x90
_Game_game_draw:                        ## @Game_game_draw
## BB#0:                                ## %entry
	pushq	%rax
	callq	_Ship_draw
	popq	%rax
	ret

	.globl	_Game_damage
	.align	4, 0x90
_Game_damage:                           ## @Game_damage
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_boss
	.align	4, 0x90
_Game_boss:                             ## @Game_boss
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_nextStage
	.align	4, 0x90
_Game_nextStage:                        ## @Game_nextStage
## BB#0:                                ## %leave1035
	movq	%rdi, -8(%rsp)
	incl	(%rdi)
	leaq	_Game_stageStart(%rip), %rax
	movq	-8(%rsp), %rcx
	movq	%rax, 16(%rcx)
	ret

	.globl	_Game_continue
	.align	4, 0x90
_Game_continue:                         ## @Game_continue
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_nameEntry
	.align	4, 0x90
_Game_nameEntry:                        ## @Game_nameEntry
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Game_ending
	.align	4, 0x90
_Game_ending:                           ## @Game_ending
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	ret

	.globl	_downKey
	.align	4, 0x90
_downKey:                               ## @downKey
## BB#0:                                ## %entry
	movb	%dil, -1(%rsp)
	movl	%esi, -8(%rsp)
	movl	%edx, -12(%rsp)
	movb	-1(%rsp), %al
	cmpb	$99, %al
	ja	LBB19_3
## BB#1:                                ## %entry
	cmpb	$32, %al
	jne	LBB19_9
## BB#2:                                ## %switch10584
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 16(%rax)
	ret
LBB19_3:                                ## %entry
	addb	$-100, %al
	cmpb	$3, %al
	ja	LBB19_9
## BB#4:                                ## %entry
	movzbl	%al, %ecx
	leaq	LJTI19_0(%rip), %rax
	movslq	(%rax,%rcx,4), %rcx
	addq	%rax, %rcx
	jmpq	*%rcx
LBB19_7:                                ## %switch10582
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 8(%rax)
	ret
LBB19_5:                                ## %switch10580
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, (%rax)
	ret
LBB19_8:                                ## %switch10583
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 12(%rax)
LBB19_9:                                ## %leave1056
	ret
LBB19_6:                                ## %switch10581
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 4(%rax)
	ret
	.align	2, 0x90
L19_0_set_7 = LBB19_7-LJTI19_0
L19_0_set_5 = LBB19_5-LJTI19_0
L19_0_set_8 = LBB19_8-LJTI19_0
L19_0_set_6 = LBB19_6-LJTI19_0
LJTI19_0:
	.long	L19_0_set_7
	.long	L19_0_set_5
	.long	L19_0_set_8
	.long	L19_0_set_6

	.globl	_upKey
	.align	4, 0x90
_upKey:                                 ## @upKey
## BB#0:                                ## %entry
	subq	$24, %rsp
	movb	%dil, 23(%rsp)
	movl	%esi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movb	23(%rsp), %al
	cmpb	$99, %al
	ja	LBB20_4
## BB#1:                                ## %entry
	cmpb	$27, %al
	jne	LBB20_2
## BB#10:                               ## %switch10865
	callq	_glutLeaveGameMode
	xorl	%edi, %edi
	callq	_exit
	jmp	LBB20_11
LBB20_4:                                ## %entry
	addb	$-100, %al
	cmpb	$3, %al
	ja	LBB20_11
## BB#5:                                ## %entry
	movzbl	%al, %ecx
	leaq	LJTI20_0(%rip), %rax
	movslq	(%rax,%rcx,4), %rcx
	addq	%rax, %rcx
	jmpq	*%rcx
LBB20_8:                                ## %switch10862
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 8(%rax)
	addq	$24, %rsp
	ret
LBB20_2:                                ## %entry
	cmpb	$32, %al
	jne	LBB20_11
## BB#3:                                ## %switch10864
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 16(%rax)
	addq	$24, %rsp
	ret
LBB20_11:                               ## %leave1084
	addq	$24, %rsp
	ret
LBB20_6:                                ## %switch10860
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	addq	$24, %rsp
	ret
LBB20_9:                                ## %switch10863
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 12(%rax)
	addq	$24, %rsp
	ret
LBB20_7:                                ## %switch10861
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 4(%rax)
	addq	$24, %rsp
	ret
	.align	2, 0x90
L20_0_set_8 = LBB20_8-LJTI20_0
L20_0_set_6 = LBB20_6-LJTI20_0
L20_0_set_9 = LBB20_9-LJTI20_0
L20_0_set_7 = LBB20_7-LJTI20_0
LJTI20_0:
	.long	L20_0_set_8
	.long	L20_0_set_6
	.long	L20_0_set_9
	.long	L20_0_set_7

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI21_0:
	.quad	4643985272004935680     ## double 300
LCPI21_1:
	.quad	-4579386764849840128    ## double -300
LCPI21_2:
	.quad	4642648265865560064     ## double 240
LCPI21_3:
	.quad	-4580723770989215744    ## double -240
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Ship_move
	.align	4, 0x90
_Ship_move:                             ## @Ship_move
## BB#0:                                ## %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movabsq	$4621819117588971520, %rax ## imm = 0x4024000000000000
	movq	%rax, -8(%rbp)
	movq	_key@GOTPCREL(%rip), %rax
	movl	8(%rax), %ecx
	testq	%rcx, %rcx
	je	LBB21_2
## BB#1:                                ## %ok1119
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	(%rcx), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rcx)
LBB21_2:                                ## %endif1122
	movl	12(%rax), %ecx
	testq	%rcx, %rcx
	je	LBB21_4
## BB#3:                                ## %ok1132
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	(%rcx), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rcx)
LBB21_4:                                ## %endif1135
	movl	(%rax), %ecx
	testq	%rcx, %rcx
	je	LBB21_6
## BB#5:                                ## %ok1145
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	8(%rcx), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, 8(%rcx)
LBB21_6:                                ## %endif1148
	movl	4(%rax), %eax
	testq	%rax, %rax
	je	LBB21_8
## BB#7:                                ## %ok1158
	movq	_ship@GOTPCREL(%rip), %rax
	movsd	8(%rax), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, 8(%rax)
LBB21_8:                                ## %endif1161
	movq	%rsp, %rax
	leaq	-16(%rax), %rcx
	movq	%rcx, %rsp
	movabsq	$4643985272004935680, %rcx ## imm = 0x4072C00000000000
	movq	%rcx, -16(%rax)
	movq	_ship@GOTPCREL(%rip), %rax
	movabsq	$4642648265865560064, %rdx ## imm = 0x406E000000000000
	movq	%rsp, %rsi
	leaq	-16(%rsi), %rdi
	movq	%rdi, %rsp
	movq	%rdx, -16(%rsi)
	movsd	(%rax), %xmm0
	ucomisd	LCPI21_0(%rip), %xmm0
	jbe	LBB21_10
## BB#9:                                ## %ok1173
	movq	%rcx, (%rax)
LBB21_10:                               ## %endif1176
	movsd	LCPI21_1(%rip), %xmm0
	ucomisd	(%rax), %xmm0
	jbe	LBB21_12
## BB#11:                               ## %ok1186
	movabsq	$-4579386764849840128, %rcx ## imm = 0xC072C00000000000
	movq	%rcx, (%rax)
LBB21_12:                               ## %endif1189
	movsd	8(%rax), %xmm0
	ucomisd	LCPI21_2(%rip), %xmm0
	jbe	LBB21_14
## BB#13:                               ## %ok1200
	movabsq	$4642648265865560064, %rcx ## imm = 0x406E000000000000
	movq	%rcx, 8(%rax)
LBB21_14:                               ## %endif1203
	movsd	LCPI21_3(%rip), %xmm0
	ucomisd	8(%rax), %xmm0
	jbe	LBB21_16
## BB#15:                               ## %ok1213
	movabsq	$-4580723770989215744, %rcx ## imm = 0xC06E000000000000
	movq	%rcx, 8(%rax)
LBB21_16:                               ## %leave1117
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI22_0:
	.long	1049414861              ## float 0.27500001
LCPI22_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI22_2:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Ship_draw
	.align	4, 0x90
_Ship_draw:                             ## @Ship_draw
## BB#0:                                ## %leave1227
	subq	$24, %rsp
	callq	_glPushMatrix
	movq	_ship@GOTPCREL(%rip), %rax
	movsd	(%rax), %xmm0
	movsd	8(%rax), %xmm1
	xorps	%xmm2, %xmm2
	callq	_glTranslated
	movabsq	$4624633867356078080, %rax ## imm = 0x402E000000000000
	movq	%rax, 16(%rsp)
	movabsq	$4629137466983448576, %rax ## imm = 0x403E000000000000
	movq	%rax, 8(%rsp)
	movl	$9, %edi
	callq	_glBegin
	movss	LCPI22_0(%rip), %xmm1
	movss	LCPI22_1(%rip), %xmm0
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm3
	callq	_color
	movsd	LCPI22_2(%rip), %xmm2
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	subsd	16(%rsp), %xmm0
	movsd	8(%rsp), %xmm1
	xorps	%xmm2, %xmm2
	callq	_glVertex3d
	movsd	8(%rsp), %xmm1
	movsd	16(%rsp), %xmm0
	xorps	%xmm2, %xmm2
	callq	_glVertex3d
	xorps	%xmm1, %xmm1
	subsd	8(%rsp), %xmm1
	movsd	16(%rsp), %xmm0
	xorps	%xmm2, %xmm2
	callq	_glVertex3d
	xorps	%xmm1, %xmm1
	subsd	8(%rsp), %xmm1
	xorps	%xmm0, %xmm0
	subsd	16(%rsp), %xmm0
	xorps	%xmm2, %xmm2
	callq	_glVertex3d
	callq	_glEnd
	callq	_glPopMatrix
	addq	$24, %rsp
	ret

	.globl	_Stage_init
	.align	4, 0x90
_Stage_init:                            ## @Stage_init
## BB#0:                                ## %entry
	movq	%rdi, -8(%rsp)
	movq	_game@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	decl	%eax
	cmpl	$18, %eax
	ja	LBB23_22
## BB#1:                                ## %entry
	leaq	LJTI23_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB23_2:                                ## %switch12730
	movq	-8(%rsp), %rax
	leaq	_Stage_1(%rip), %rcx
	jmp	LBB23_21
LBB23_3:                                ## %switch12731
	movq	-8(%rsp), %rax
	leaq	_Stage_2(%rip), %rcx
	jmp	LBB23_21
LBB23_4:                                ## %switch12732
	movq	-8(%rsp), %rax
	leaq	_Stage_3(%rip), %rcx
	jmp	LBB23_21
LBB23_5:                                ## %switch12733
	movq	-8(%rsp), %rax
	leaq	_Stage_4(%rip), %rcx
	jmp	LBB23_21
LBB23_6:                                ## %switch12734
	movq	-8(%rsp), %rax
	leaq	_Stage_5(%rip), %rcx
	jmp	LBB23_21
LBB23_7:                                ## %switch12735
	movq	-8(%rsp), %rax
	leaq	_Stage_6(%rip), %rcx
	jmp	LBB23_21
LBB23_8:                                ## %switch12736
	movq	-8(%rsp), %rax
	leaq	_Stage_7(%rip), %rcx
	jmp	LBB23_21
LBB23_9:                                ## %switch12737
	movq	-8(%rsp), %rax
	leaq	_Stage_8(%rip), %rcx
	jmp	LBB23_21
LBB23_10:                               ## %switch12738
	movq	-8(%rsp), %rax
	leaq	_Stage_9(%rip), %rcx
	jmp	LBB23_21
LBB23_11:                               ## %switch12739
	movq	-8(%rsp), %rax
	leaq	_Stage_10(%rip), %rcx
	jmp	LBB23_21
LBB23_12:                               ## %switch127310
	movq	-8(%rsp), %rax
	leaq	_Stage_11(%rip), %rcx
	jmp	LBB23_21
LBB23_13:                               ## %switch127311
	movq	-8(%rsp), %rax
	leaq	_Stage_12(%rip), %rcx
	jmp	LBB23_21
LBB23_14:                               ## %switch127312
	movq	-8(%rsp), %rax
	leaq	_Stage_13(%rip), %rcx
	jmp	LBB23_21
LBB23_15:                               ## %switch127313
	movq	-8(%rsp), %rax
	leaq	_Stage_14(%rip), %rcx
	jmp	LBB23_21
LBB23_16:                               ## %switch127314
	movq	-8(%rsp), %rax
	leaq	_Stage_15(%rip), %rcx
	jmp	LBB23_21
LBB23_17:                               ## %switch127315
	movq	-8(%rsp), %rax
	leaq	_Stage_16(%rip), %rcx
	jmp	LBB23_21
LBB23_18:                               ## %switch127316
	movq	-8(%rsp), %rax
	leaq	_Stage_17(%rip), %rcx
	jmp	LBB23_21
LBB23_19:                               ## %switch127317
	movq	-8(%rsp), %rax
	leaq	_Stage_18(%rip), %rcx
	jmp	LBB23_21
LBB23_20:                               ## %switch127318
	movq	-8(%rsp), %rax
	leaq	_Stage_ending(%rip), %rcx
LBB23_21:                               ## %switch127318
	movq	%rcx, (%rax)
LBB23_22:                               ## %leave1270
	ret
	.align	2, 0x90
L23_0_set_2 = LBB23_2-LJTI23_0
L23_0_set_3 = LBB23_3-LJTI23_0
L23_0_set_4 = LBB23_4-LJTI23_0
L23_0_set_5 = LBB23_5-LJTI23_0
L23_0_set_6 = LBB23_6-LJTI23_0
L23_0_set_7 = LBB23_7-LJTI23_0
L23_0_set_8 = LBB23_8-LJTI23_0
L23_0_set_9 = LBB23_9-LJTI23_0
L23_0_set_10 = LBB23_10-LJTI23_0
L23_0_set_11 = LBB23_11-LJTI23_0
L23_0_set_12 = LBB23_12-LJTI23_0
L23_0_set_13 = LBB23_13-LJTI23_0
L23_0_set_14 = LBB23_14-LJTI23_0
L23_0_set_15 = LBB23_15-LJTI23_0
L23_0_set_16 = LBB23_16-LJTI23_0
L23_0_set_17 = LBB23_17-LJTI23_0
L23_0_set_18 = LBB23_18-LJTI23_0
L23_0_set_19 = LBB23_19-LJTI23_0
L23_0_set_20 = LBB23_20-LJTI23_0
LJTI23_0:
	.long	L23_0_set_2
	.long	L23_0_set_3
	.long	L23_0_set_4
	.long	L23_0_set_5
	.long	L23_0_set_6
	.long	L23_0_set_7
	.long	L23_0_set_8
	.long	L23_0_set_9
	.long	L23_0_set_10
	.long	L23_0_set_11
	.long	L23_0_set_12
	.long	L23_0_set_13
	.long	L23_0_set_14
	.long	L23_0_set_15
	.long	L23_0_set_16
	.long	L23_0_set_17
	.long	L23_0_set_18
	.long	L23_0_set_19
	.long	L23_0_set_20

	.globl	_ptn7
	.align	4, 0x90
_ptn7:                                  ## @ptn7
## BB#0:                                ## %entry
	ret

	.globl	_ptn1
	.align	4, 0x90
_ptn1:                                  ## @ptn1
## BB#0:                                ## %entry
	ret

	.globl	_ptn2r
	.align	4, 0x90
_ptn2r:                                 ## @ptn2r
## BB#0:                                ## %entry
	ret

	.globl	_ptn2c
	.align	4, 0x90
_ptn2c:                                 ## @ptn2c
## BB#0:                                ## %entry
	ret

	.globl	_ptn2l
	.align	4, 0x90
_ptn2l:                                 ## @ptn2l
## BB#0:                                ## %entry
	ret

	.globl	_ptn3r
	.align	4, 0x90
_ptn3r:                                 ## @ptn3r
## BB#0:                                ## %entry
	ret

	.globl	_ptn3l
	.align	4, 0x90
_ptn3l:                                 ## @ptn3l
## BB#0:                                ## %entry
	ret

	.globl	_tmsu
	.align	4, 0x90
_tmsu:                                  ## @tmsu
## BB#0:                                ## %entry
	ret

	.globl	_tmsl
	.align	4, 0x90
_tmsl:                                  ## @tmsl
## BB#0:                                ## %entry
	ret

	.globl	_tmsr
	.align	4, 0x90
_tmsr:                                  ## @tmsr
## BB#0:                                ## %entry
	ret

	.globl	_boss1
	.align	4, 0x90
_boss1:                                 ## @boss1
## BB#0:                                ## %entry
	ret

	.globl	_ptn_hatena
	.align	4, 0x90
_ptn_hatena:                            ## @ptn_hatena
## BB#0:                                ## %entry
	ret

	.globl	_ptn4l
	.align	4, 0x90
_ptn4l:                                 ## @ptn4l
## BB#0:                                ## %entry
	ret

	.globl	_ptn4r
	.align	4, 0x90
_ptn4r:                                 ## @ptn4r
## BB#0:                                ## %entry
	ret

	.globl	_Stage_1
	.align	4, 0x90
_Stage_1:                               ## @Stage_1
## BB#0:                                ## %entry
	pushq	%rax
	movq	%rdi, (%rsp)
	movl	8(%rdi), %eax
	cmpl	$3539, %eax             ## imm = 0xDD3
	ja	LBB38_50
## BB#1:                                ## %entry
	cmpl	$2939, %eax             ## imm = 0xB7B
	ja	LBB38_49
## BB#2:                                ## %entry
	cmpl	$659, %eax              ## imm = 0x293
	ja	LBB38_16
## BB#3:                                ## %entry
	cmpl	$303, %eax              ## imm = 0x12F
	ja	LBB38_6
## BB#4:                                ## %entry
	cmpl	$300, %eax              ## imm = 0x12C
	jne	LBB38_52
## BB#5:                                ## %switch14080
	callq	_ptn7
	popq	%rax
	ret
LBB38_50:                               ## %entry
	cmpl	$3540, %eax             ## imm = 0xDD4
	jne	LBB38_52
## BB#51:                               ## %switch140823
	callq	_boss1
	jmp	LBB38_52
LBB38_49:                               ## %entry
	cmpl	$2940, %eax             ## imm = 0xB7C
	je	LBB38_46
	jmp	LBB38_52
LBB38_16:                               ## %entry
	cmpl	$2519, %eax             ## imm = 0x9D7
	ja	LBB38_39
## BB#17:                               ## %entry
	cmpl	$2099, %eax             ## imm = 0x833
	ja	LBB38_47
## BB#18:                               ## %entry
	cmpl	$1529, %eax             ## imm = 0x5F9
	ja	LBB38_45
## BB#19:                               ## %entry
	cmpl	$1079, %eax             ## imm = 0x437
	ja	LBB38_24
## BB#20:                               ## %entry
	cmpl	$660, %eax              ## imm = 0x294
	je	LBB38_43
## BB#21:                               ## %entry
	cmpl	$665, %eax              ## imm = 0x299
	jne	LBB38_22
## BB#44:                               ## %switch14087
	callq	_ptn2c
	popq	%rax
	ret
LBB38_6:                                ## %entry
	cmpl	$307, %eax              ## imm = 0x133
	ja	LBB38_9
## BB#7:                                ## %entry
	cmpl	$304, %eax              ## imm = 0x130
	jne	LBB38_52
## BB#8:                                ## %switch14081
	callq	_ptn1
	popq	%rax
	ret
LBB38_39:                               ## %entry
	cmpl	$2520, %eax             ## imm = 0x9D8
	je	LBB38_42
## BB#40:                               ## %entry
	cmpl	$2525, %eax             ## imm = 0x9DD
	je	LBB38_42
## BB#41:                               ## %entry
	cmpl	$2530, %eax             ## imm = 0x9E2
	jne	LBB38_52
LBB38_42:                               ## %switch140819
	callq	_ptn4l
	callq	_ptn4r
	popq	%rax
	ret
LBB38_47:                               ## %entry
	cmpl	$2100, %eax             ## imm = 0x834
	jne	LBB38_52
## BB#48:                               ## %switch140818
	callq	_ptn_hatena
	popq	%rax
	ret
LBB38_9:                                ## %entry
	cmpl	$311, %eax              ## imm = 0x137
	ja	LBB38_12
## BB#10:                               ## %entry
	cmpl	$308, %eax              ## imm = 0x134
	jne	LBB38_52
	jmp	LBB38_11
LBB38_45:                               ## %entry
	cmpl	$1530, %eax             ## imm = 0x5FA
	jne	LBB38_52
LBB38_46:                               ## %switch140817
	callq	_tmsu
	callq	_tmsl
	callq	_tmsr
	popq	%rax
	ret
LBB38_12:                               ## %entry
	cmpl	$312, %eax              ## imm = 0x138
	je	LBB38_11
## BB#13:                               ## %entry
	cmpl	$316, %eax              ## imm = 0x13C
	je	LBB38_15
## BB#14:                               ## %entry
	cmpl	$320, %eax              ## imm = 0x140
	jne	LBB38_52
LBB38_15:                               ## %switch14085
	callq	_ptn1
	popq	%rax
	ret
LBB38_11:                               ## %switch14083
	callq	_ptn1
	popq	%rax
	ret
LBB38_24:                               ## %entry
	cmpl	$1199, %eax             ## imm = 0x4AF
	ja	LBB38_32
## BB#25:                               ## %entry
	cmpl	$1083, %eax             ## imm = 0x43B
	ja	LBB38_28
## BB#26:                               ## %entry
	cmpl	$1080, %eax             ## imm = 0x438
	jne	LBB38_52
	jmp	LBB38_27
LBB38_32:                               ## %entry
	cmpl	$1203, %eax             ## imm = 0x4B3
	ja	LBB38_35
## BB#33:                               ## %entry
	cmpl	$1200, %eax             ## imm = 0x4B0
	jne	LBB38_52
	jmp	LBB38_34
LBB38_43:                               ## %switch14086
	callq	_ptn2r
	popq	%rax
	ret
LBB38_22:                               ## %entry
	cmpl	$670, %eax              ## imm = 0x29E
	jne	LBB38_52
## BB#23:                               ## %switch14088
	callq	_ptn2l
	popq	%rax
	ret
LBB38_28:                               ## %entry
	cmpl	$1084, %eax             ## imm = 0x43C
	je	LBB38_27
## BB#29:                               ## %entry
	cmpl	$1088, %eax             ## imm = 0x440
	je	LBB38_31
## BB#30:                               ## %entry
	cmpl	$1092, %eax             ## imm = 0x444
	jne	LBB38_52
LBB38_31:                               ## %switch140812
	callq	_ptn3r
	popq	%rax
	ret
LBB38_35:                               ## %entry
	cmpl	$1204, %eax             ## imm = 0x4B4
	je	LBB38_34
## BB#36:                               ## %entry
	cmpl	$1208, %eax             ## imm = 0x4B8
	je	LBB38_38
## BB#37:                               ## %entry
	cmpl	$1212, %eax             ## imm = 0x4BC
	jne	LBB38_52
LBB38_38:                               ## %switch140816
	callq	_ptn3l
	popq	%rax
	ret
LBB38_52:                               ## %leave1402
	popq	%rax
	ret
LBB38_27:                               ## %switch140810
	callq	_ptn3r
	popq	%rax
	ret
LBB38_34:                               ## %switch140814
	callq	_ptn3l
	popq	%rax
	ret

	.globl	_Stage_2
	.align	4, 0x90
_Stage_2:                               ## @Stage_2
## BB#0:                                ## %leave1640
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_3
	.align	4, 0x90
_Stage_3:                               ## @Stage_3
## BB#0:                                ## %leave1647
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_4
	.align	4, 0x90
_Stage_4:                               ## @Stage_4
## BB#0:                                ## %leave1654
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_5
	.align	4, 0x90
_Stage_5:                               ## @Stage_5
## BB#0:                                ## %leave1661
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_6
	.align	4, 0x90
_Stage_6:                               ## @Stage_6
## BB#0:                                ## %leave1668
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_7
	.align	4, 0x90
_Stage_7:                               ## @Stage_7
## BB#0:                                ## %leave1675
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_8
	.align	4, 0x90
_Stage_8:                               ## @Stage_8
## BB#0:                                ## %leave1682
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_9
	.align	4, 0x90
_Stage_9:                               ## @Stage_9
## BB#0:                                ## %leave1689
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_10
	.align	4, 0x90
_Stage_10:                              ## @Stage_10
## BB#0:                                ## %leave1696
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_11
	.align	4, 0x90
_Stage_11:                              ## @Stage_11
## BB#0:                                ## %leave1703
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_12
	.align	4, 0x90
_Stage_12:                              ## @Stage_12
## BB#0:                                ## %leave1710
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_13
	.align	4, 0x90
_Stage_13:                              ## @Stage_13
## BB#0:                                ## %leave1717
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_14
	.align	4, 0x90
_Stage_14:                              ## @Stage_14
## BB#0:                                ## %leave1724
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_15
	.align	4, 0x90
_Stage_15:                              ## @Stage_15
## BB#0:                                ## %leave1731
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_16
	.align	4, 0x90
_Stage_16:                              ## @Stage_16
## BB#0:                                ## %leave1738
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_17
	.align	4, 0x90
_Stage_17:                              ## @Stage_17
## BB#0:                                ## %leave1745
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_18
	.align	4, 0x90
_Stage_18:                              ## @Stage_18
## BB#0:                                ## %leave1752
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_ending
	.align	4, 0x90
_Stage_ending:                          ## @Stage_ending
## BB#0:                                ## %leave1759
	movq	%rdi, -8(%rsp)
	ret

	.globl	_GLUT_RGBA              ## @GLUT_RGBA
.zerofill __DATA,__common,_GLUT_RGBA,4,2
	.section	__DATA,__data
	.globl	_GLUT_DOUBLE            ## @GLUT_DOUBLE
	.align	2
_GLUT_DOUBLE:
	.long	2                       ## 0x2

	.globl	_GLUT_DEPTH             ## @GLUT_DEPTH
	.align	2
_GLUT_DEPTH:
	.long	16                      ## 0x10

	.globl	_GLUT_KEY_LEFT          ## @GLUT_KEY_LEFT
_GLUT_KEY_LEFT:
	.byte	100                     ## 0x64

	.globl	_GLUT_KEY_UP            ## @GLUT_KEY_UP
_GLUT_KEY_UP:
	.byte	101                     ## 0x65

	.globl	_GLUT_KEY_RIGHT         ## @GLUT_KEY_RIGHT
_GLUT_KEY_RIGHT:
	.byte	102                     ## 0x66

	.globl	_GLUT_KEY_DOWN          ## @GLUT_KEY_DOWN
_GLUT_KEY_DOWN:
	.byte	103                     ## 0x67

	.globl	_GLUT_KEY_SPACE         ## @GLUT_KEY_SPACE
_GLUT_KEY_SPACE:
	.byte	32                      ## 0x20

	.globl	_GL_COLOR_BUFFER_BIT    ## @GL_COLOR_BUFFER_BIT
	.align	2
_GL_COLOR_BUFFER_BIT:
	.long	16384                   ## 0x4000

	.globl	_GL_QUADS               ## @GL_QUADS
	.align	2
_GL_QUADS:
	.long	7                       ## 0x7

	.globl	_GL_LINE_LOOP           ## @GL_LINE_LOOP
	.align	2
_GL_LINE_LOOP:
	.long	2                       ## 0x2

	.globl	_GL_POLYGON             ## @GL_POLYGON
	.align	2
_GL_POLYGON:
	.long	9                       ## 0x9

	.globl	_GL_PROJECTION          ## @GL_PROJECTION
	.align	2
_GL_PROJECTION:
	.long	5889                    ## 0x1701

	.globl	_GL_DEPTH_BUFFER_BIT    ## @GL_DEPTH_BUFFER_BIT
	.align	2
_GL_DEPTH_BUFFER_BIT:
	.long	256                     ## 0x100

	.globl	_GL_MODELVIEW           ## @GL_MODELVIEW
	.align	2
_GL_MODELVIEW:
	.long	5888                    ## 0x1700

	.globl	_GL_DEPTH_TEST          ## @GL_DEPTH_TEST
	.align	2
_GL_DEPTH_TEST:
	.long	2929                    ## 0xb71

	.globl	_GL_BLEND               ## @GL_BLEND
	.align	2
_GL_BLEND:
	.long	3042                    ## 0xbe2

	.globl	_GL_SRC_ALPHA           ## @GL_SRC_ALPHA
	.align	2
_GL_SRC_ALPHA:
	.long	770                     ## 0x302

	.globl	_GL_ONE_MINUS_SRC_ALPHA ## @GL_ONE_MINUS_SRC_ALPHA
	.align	2
_GL_ONE_MINUS_SRC_ALPHA:
	.long	771                     ## 0x303

	.globl	_GL_ONE                 ## @GL_ONE
	.align	2
_GL_ONE:
	.long	1                       ## 0x1

	.globl	_GL_LIGHT0              ## @GL_LIGHT0
	.align	2
_GL_LIGHT0:
	.long	16384                   ## 0x4000

	.globl	_GL_LIGHTING            ## @GL_LIGHTING
	.align	2
_GL_LIGHTING:
	.long	2896                    ## 0xb50

	.globl	_GL_POSITION            ## @GL_POSITION
	.align	2
_GL_POSITION:
	.long	4611                    ## 0x1203

	.globl	_GL_DIFFUSE             ## @GL_DIFFUSE
	.align	2
_GL_DIFFUSE:
	.long	4609                    ## 0x1201

	.globl	_GL_FRONT_AND_BACK      ## @GL_FRONT_AND_BACK
	.align	2
_GL_FRONT_AND_BACK:
	.long	1032                    ## 0x408

	.globl	_fullscreen             ## @fullscreen
.zerofill __DATA,__common,_fullscreen,4,2
	.section	__TEXT,__const
L_.str1767:                             ## @.str1767
	.asciz	 "640x480:32@60"

	.comm	_game,40,4              ## @game
	.comm	_key,20,4               ## @key
	.comm	_ship,16,3              ## @ship

.subsections_via_symbols
