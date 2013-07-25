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
	leaq	L_.str1848(%rip), %rdi
	callq	_glutGameModeString
	callq	_glutEnterGameMode
	jmp	LBB0_3
LBB0_2:                                 ## %else16
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	callq	_glutCreateWindow
LBB0_3:                                 ## %..leave
	movl	_GLUT_RGBA(%rip), %edi
	callq	_glutInitDisplayMode
	movl	_GL_BLEND(%rip), %edi
	callq	_glEnable
	movl	_GL_LIGHTING(%rip), %edi
	callq	_glEnable
	movl	_GL_LIGHT0(%rip), %edi
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
	movl	$0, 20(%rsp)
	xorl	%eax, %eax
	addq	$24, %rsp
	ret

	.globl	_color
	.align	4, 0x90
_color:                                 ## @color
## BB#0:                                ## %leave49
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
	movss	36(%rsp), %xmm0
	movss	%xmm0, 8(%rsp)
	movss	32(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movss	28(%rsp), %xmm0
	movss	%xmm0, 16(%rsp)
	movss	24(%rsp), %xmm0
	movss	%xmm0, 20(%rsp)
	movl	_GL_DIFFUSE(%rip), %esi
	movl	_GL_FRONT_AND_BACK(%rip), %edi
	callq	_glMaterialfv
	movq	(%rbx), %rax
	cmpq	40(%rsp), %rax
	jne	LBB1_2
## BB#1:                                ## %SP_return
	addq	$48, %rsp
	popq	%rbx
	ret
LBB1_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail

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
LCPI3_0:
	.quad	4636033603912859648     ## double 90
LCPI3_1:
	.quad	4607182418800017408     ## double 1
LCPI3_2:
	.quad	4666723172467343360     ## double 1.0E+4
LCPI3_3:
	.quad	4647503709213818880     ## double 500
LCPI3_4:
	.quad	4650265682422792192     ## double 802
LCPI3_5:
	.quad	4647591670144040960     ## double 505
LCPI3_6:
	.quad	4644337115725824000     ## double 320
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main_display
	.align	4, 0x90
_main_display:                          ## @main_display
## BB#0:                                ## %leave84
	pushq	%rbx
	subq	$48, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rax
	movq	%rax, 40(%rsp)
	movl	$640, 36(%rsp)          ## imm = 0x280
	movl	$480, 32(%rsp)          ## imm = 0x1E0
	movl	_GL_COLOR_BUFFER_BIT(%rip), %edi
	orl	_GL_DEPTH_BUFFER_BIT(%rip), %edi
	callq	_glClear
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$640, %edx              ## imm = 0x280
	movl	$480, %ecx              ## imm = 0x1E0
	callq	_glViewport
	movl	_GL_PROJECTION(%rip), %edi
	callq	_glMatrixMode
	callq	_glLoadIdentity
	movsd	LCPI3_0(%rip), %xmm0
	movsd	LCPI3_1(%rip), %xmm2
	movsd	LCPI3_2(%rip), %xmm3
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
	mulsd	LCPI3_3(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	movss	28(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	LCPI3_4(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 16(%rsp)
	movss	28(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	LCPI3_5(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 20(%rsp)
	movl	$1065353216, 24(%rsp)   ## imm = 0x3F800000
	movl	_GL_POSITION(%rip), %esi
	movl	_GL_LIGHT0(%rip), %edi
	callq	_glLightfv
	movl	_GL_MODELVIEW(%rip), %edi
	callq	_glMatrixMode
	callq	_glLoadIdentity
	movl	_GL_ONE(%rip), %esi
	movl	_GL_SRC_ALPHA(%rip), %edi
	callq	_glBlendFunc
	movsd	LCPI3_6(%rip), %xmm2
	movq	$0, (%rsp)
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm3, %xmm3
	xorps	%xmm4, %xmm4
	xorps	%xmm5, %xmm5
	xorps	%xmm6, %xmm6
	movsd	LCPI3_1(%rip), %xmm7
	callq	_gluLookAt
	movq	_game@GOTPCREL(%rip), %rax
	callq	*24(%rax)
	callq	_glFlush
	movq	(%rbx), %rax
	cmpq	40(%rsp), %rax
	jne	LBB3_2
## BB#1:                                ## %SP_return
	addq	$48, %rsp
	popq	%rbx
	ret
LBB3_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail

	.globl	_Game_new
	.align	4, 0x90
_Game_new:                              ## @Game_new
## BB#0:                                ## %leave168
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
	je	LBB5_2
## BB#1:                                ## %ok215
	movq	-8(%rsp), %rax
	movl	$0, 12(%rax)
	leaq	_Game_title_end(%rip), %rax
	movq	-8(%rsp), %rcx
	movq	%rax, 16(%rcx)
LBB5_2:                                 ## %leave201
	ret

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI6_0:
	.quad	-4587338432941916160    ## double -90
LCPI6_1:
	.quad	4607182418800017408     ## double 1
LCPI6_4:
	.quad	4629463133531502805     ## double 31.157
LCPI6_5:
	.quad	4644032207957302182     ## double 302.668
LCPI6_6:
	.quad	4628210288410163675     ## double 26.706
LCPI6_7:
	.quad	4646263838329687507     ## double 429.5215
LCPI6_8:
	.quad	4638980488589345817     ## double 135.7555
LCPI6_9:
	.quad	4646185535509603811     ## double 425.0705
LCPI6_10:
	.quad	4639058791409429512     ## double 137.981
LCPI6_11:
	.quad	4632713888037534171     ## double 53.412
LCPI6_12:
	.quad	4629894986514521129     ## double 33.3825
LCPI6_13:
	.quad	4641407876011940381     ## double 204.746
LCPI6_14:
	.quad	-4587407394311210271    ## double -89.02
LCPI6_15:
	.quad	4631774254196529824     ## double 46.7355
LCPI6_16:
	.quad	-4592850627779585114    ## double -37.8335
LCPI6_17:
	.quad	4641486178832024076     ## double 206.9715
LCPI6_18:
	.quad	-4592537416499250332    ## double -40.059
LCPI6_19:
	.quad	4646342141149771203     ## double 433.9725
LCPI6_20:
	.quad	-4585528126629201576    ## double -115.726
LCPI6_21:
	.quad	4641094664731605598     ## double 195.844
LCPI6_22:
	.quad	-4585841337909536358    ## double -111.275
LCPI6_23:
	.quad	-4582355674943253905    ## double -193.6185
LCPI6_24:
	.quad	4641172967551689294     ## double 198.0695
LCPI6_25:
	.quad	-4579574737357724713    ## double -289.315
LCPI6_26:
	.quad	4646146384099561964     ## double 422.845
LCPI6_27:
	.quad	-4582277372123170210    ## double -195.844
LCPI6_28:
	.quad	-4579809645817975800    ## double -275.962
LCPI6_29:
	.quad	4631147831635860259     ## double 42.2845
LCPI6_30:
	.quad	-4582512280583421297    ## double -189.1675
LCPI6_31:
	.quad	-4579927100048101343    ## double -269.2855
LCPI6_32:
	.quad	-4591284571377911202    ## double -48.961
LCPI6_33:
	.quad	-4589405303695902507    ## double -62.314
LCPI6_34:
	.quad	4639606911150015382     ## double 153.5595
LCPI6_35:
	.quad	-4578282740826343735    ## double -362.7565
LCPI6_36:
	.quad	-4579183223257306235    ## double -311.57
LCPI6_37:
	.quad	-4576755835834711671    ## double -449.551
LCPI6_38:
	.quad	-4583765125704760426    ## double -153.5595
LCPI6_39:
	.quad	-4582747189043672383    ## double -182.491
LCPI6_40:
	.quad	-4580476407261245211    ## double -247.0305
LCPI6_41:
	.quad	-4578791709156887757    ## double -333.825
LCPI6_42:
	.quad	-4584078336985095209    ## double -144.6575
LCPI6_43:
	.quad	-4579339828897473626    ## double -302.668
LCPI6_44:
	.quad	-4584313245445346296    ## double -137.981
LCPI6_45:
	.quad	-4576873290064837214    ## double -442.8745
LCPI6_46:
	.quad	-4592224205218915549    ## double -42.2845
LCPI6_47:
	.quad	-4578361043646427431    ## double -358.3055
LCPI6_48:
	.quad	-4576325170324251345    ## double -474.0315
	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI6_2:
	.long	1049414861              ## float 0.27500001
LCPI6_3:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Game_title_draw
	.align	4, 0x90
_Game_title_draw:                       ## @Game_title_draw
## BB#0:                                ## %entry
	pushq	%rax
	callq	_glPushMatrix
	movsd	LCPI6_0(%rip), %xmm0
	movsd	LCPI6_1(%rip), %xmm2
	xorps	%xmm1, %xmm1
	xorps	%xmm3, %xmm3
	callq	_glRotated
	movq	_game@GOTPCREL(%rip), %rax
	movl	12(%rax), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	xorps	%xmm1, %xmm1
	movsd	LCPI6_1(%rip), %xmm2
	xorps	%xmm3, %xmm3
	callq	_glRotated
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movss	LCPI6_3(%rip), %xmm3
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_4(%rip), %xmm1
	movsd	LCPI6_5(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_6(%rip), %xmm1
	movsd	LCPI6_7(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_8(%rip), %xmm1
	movsd	LCPI6_9(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_8(%rip), %xmm1
	movsd	LCPI6_9(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_10(%rip), %xmm1
	movsd	LCPI6_11(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_4(%rip), %xmm1
	movsd	LCPI6_5(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_10(%rip), %xmm1
	movsd	LCPI6_11(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_12(%rip), %xmm1
	movsd	LCPI6_13(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_4(%rip), %xmm1
	movsd	LCPI6_5(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_16(%rip), %xmm1
	movsd	LCPI6_17(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_12(%rip), %xmm1
	movsd	LCPI6_13(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_12(%rip), %xmm1
	movsd	LCPI6_13(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_10(%rip), %xmm1
	movsd	LCPI6_11(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_18(%rip), %xmm1
	movsd	LCPI6_19(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_16(%rip), %xmm1
	movsd	LCPI6_17(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_20(%rip), %xmm1
	movsd	LCPI6_21(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_22(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI6_7(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_18(%rip), %xmm1
	movsd	LCPI6_19(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_18(%rip), %xmm1
	movsd	LCPI6_19(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_20(%rip), %xmm1
	movsd	LCPI6_21(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_23(%rip), %xmm1
	movsd	LCPI6_24(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_20(%rip), %xmm1
	movsd	LCPI6_21(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_25(%rip), %xmm1
	movsd	LCPI6_26(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_27(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI6_26(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_23(%rip), %xmm1
	movsd	LCPI6_24(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_23(%rip), %xmm1
	movsd	LCPI6_24(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_28(%rip), %xmm1
	xorps	%xmm0, %xmm0
	movsd	LCPI6_11(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_25(%rip), %xmm1
	movsd	LCPI6_26(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_23(%rip), %xmm1
	movsd	LCPI6_24(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_14(%rip), %xmm1
	movsd	LCPI6_15(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_28(%rip), %xmm1
	movsd	LCPI6_11(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_30(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_31(%rip), %xmm1
	movsd	LCPI6_32(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_33(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI6_8(%rip), %xmm1
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	movsd	LCPI6_34(%rip), %xmm1
	movsd	LCPI6_35(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	movsd	LCPI6_36(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_30(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_30(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_8(%rip), %xmm1
	movsd	LCPI6_33(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_34(%rip), %xmm1
	movsd	LCPI6_35(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_34(%rip), %xmm1
	movsd	LCPI6_35(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_37(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI6_15(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_36(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_30(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_38(%rip), %xmm1
	movsd	LCPI6_39(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_31(%rip), %xmm1
	movsd	LCPI6_32(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_38(%rip), %xmm1
	movsd	LCPI6_39(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_40(%rip), %xmm1
	movsd	LCPI6_41(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_31(%rip), %xmm1
	movsd	LCPI6_32(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_38(%rip), %xmm1
	movsd	LCPI6_39(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_42(%rip), %xmm1
	movsd	LCPI6_43(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_40(%rip), %xmm1
	movsd	LCPI6_41(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_42(%rip), %xmm1
	movsd	LCPI6_43(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_44(%rip), %xmm1
	movsd	LCPI6_45(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_40(%rip), %xmm1
	movsd	LCPI6_41(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_42(%rip), %xmm1
	movsd	LCPI6_43(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_46(%rip), %xmm1
	movsd	LCPI6_47(%rip), %xmm2
	xorps	%xmm0, %xmm0
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_44(%rip), %xmm1
	movsd	LCPI6_45(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_46(%rip), %xmm1
	movsd	LCPI6_47(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_29(%rip), %xmm1
	movsd	LCPI6_36(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_15(%rip), %xmm1
	movsd	LCPI6_37(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_15(%rip), %xmm1
	movsd	LCPI6_37(%rip), %xmm2
	callq	_glVertex3d
	movsd	LCPI6_48(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movsd	LCPI6_18(%rip), %xmm1
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_46(%rip), %xmm1
	movsd	LCPI6_47(%rip), %xmm2
	callq	_glVertex3d
	callq	_glEnd
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI6_2(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	movss	LCPI6_3(%rip), %xmm3
	callq	_color
	movsd	LCPI6_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	_glNormal3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_46(%rip), %xmm1
	movsd	LCPI6_47(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_18(%rip), %xmm1
	movsd	LCPI6_48(%rip), %xmm2
	callq	_glVertex3d
	xorps	%xmm0, %xmm0
	movsd	LCPI6_44(%rip), %xmm1
	movsd	LCPI6_45(%rip), %xmm2
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
	jl	LBB7_2
## BB#1:                                ## %ok931
	movq	-8(%rsp), %rax
	leaq	_Game_init(%rip), %rcx
	movq	%rcx, 16(%rax)
LBB7_2:                                 ## %leave917
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
## BB#0:                                ## %leave951
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
	jl	LBB11_2
## BB#1:                                ## %ok992
	movq	(%rsp), %rax
	leaq	_Game_game(%rip), %rcx
	movq	%rcx, 16(%rax)
LBB11_2:                                ## %leave991
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
	jne	LBB12_2
## BB#1:                                ## %ok1015
	movq	(%rsp), %rax
	addl	$10, 32(%rax)
LBB12_2:                                ## %leave1014
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
## BB#0:                                ## %leave1062
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
	cmpb	%al, _GLUT_KEY_UP(%rip)
	jne	LBB20_1
## BB#6:                                ## %switch1085_0
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, (%rax)
	ret
LBB20_1:                                ## %switch1085_case1
	cmpb	%al, _GLUT_KEY_DOWN(%rip)
	jne	LBB20_2
## BB#7:                                ## %switch1085_1
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 4(%rax)
	ret
LBB20_2:                                ## %switch1085_case2
	cmpb	%al, _GLUT_KEY_LEFT(%rip)
	jne	LBB20_3
## BB#8:                                ## %switch1085_2
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 8(%rax)
	ret
LBB20_3:                                ## %switch1085_case3
	cmpb	%al, _GLUT_KEY_RIGHT(%rip)
	jne	LBB20_4
## BB#9:                                ## %switch1085_3
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 12(%rax)
	jmp	LBB20_10
LBB20_4:                                ## %switch1085_case4
	cmpb	%al, _GLUT_KEY_SPACE(%rip)
	jne	LBB20_10
## BB#5:                                ## %switch1085_4
	movq	_key@GOTPCREL(%rip), %rax
	movl	$1, 16(%rax)
	ret
LBB20_10:                               ## %leave1083
	ret

	.globl	_upKey
	.align	4, 0x90
_upKey:                                 ## @upKey
## BB#0:                                ## %entry
	subq	$24, %rsp
	movb	%dil, 23(%rsp)
	movl	%esi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movb	23(%rsp), %al
	cmpb	%al, _GLUT_KEY_UP(%rip)
	jne	LBB21_1
## BB#7:                                ## %switch1118_0
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	addq	$24, %rsp
	ret
LBB21_1:                                ## %switch1118_case1
	cmpb	%al, _GLUT_KEY_DOWN(%rip)
	jne	LBB21_2
## BB#8:                                ## %switch1118_1
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 4(%rax)
	addq	$24, %rsp
	ret
LBB21_2:                                ## %switch1118_case2
	cmpb	%al, _GLUT_KEY_LEFT(%rip)
	jne	LBB21_3
## BB#9:                                ## %switch1118_2
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 8(%rax)
	addq	$24, %rsp
	ret
LBB21_3:                                ## %switch1118_case3
	cmpb	%al, _GLUT_KEY_RIGHT(%rip)
	jne	LBB21_4
## BB#10:                               ## %switch1118_3
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 12(%rax)
	addq	$24, %rsp
	ret
LBB21_4:                                ## %switch1118_case4
	cmpb	%al, _GLUT_KEY_SPACE(%rip)
	jne	LBB21_5
## BB#11:                               ## %switch1118_4
	movq	_key@GOTPCREL(%rip), %rax
	movl	$0, 16(%rax)
	jmp	LBB21_12
LBB21_5:                                ## %switch1118_case5
	cmpb	$27, %al
	jne	LBB21_12
## BB#6:                                ## %switch1118_5
	callq	_glutLeaveGameMode
	xorl	%edi, %edi
	callq	_exit
	addq	$24, %rsp
	ret
LBB21_12:                               ## %leave1116
	addq	$24, %rsp
	ret

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI22_0:
	.quad	4643985272004935680     ## double 300
LCPI22_1:
	.quad	-4579386764849840128    ## double -300
LCPI22_2:
	.quad	4642648265865560064     ## double 240
LCPI22_3:
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
	je	LBB22_2
## BB#1:                                ## %ok1157
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	(%rcx), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rcx)
LBB22_2:                                ## %endif1160
	movl	12(%rax), %ecx
	testq	%rcx, %rcx
	je	LBB22_4
## BB#3:                                ## %ok1170
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	(%rcx), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rcx)
LBB22_4:                                ## %endif1173
	movl	(%rax), %ecx
	testq	%rcx, %rcx
	je	LBB22_6
## BB#5:                                ## %ok1183
	movq	_ship@GOTPCREL(%rip), %rcx
	movsd	8(%rcx), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, 8(%rcx)
LBB22_6:                                ## %endif1186
	movl	4(%rax), %eax
	testq	%rax, %rax
	je	LBB22_8
## BB#7:                                ## %ok1196
	movq	_ship@GOTPCREL(%rip), %rax
	movsd	8(%rax), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, 8(%rax)
LBB22_8:                                ## %endif1199
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
	ucomisd	LCPI22_0(%rip), %xmm0
	jbe	LBB22_10
## BB#9:                                ## %ok1211
	movq	%rcx, (%rax)
LBB22_10:                               ## %endif1214
	movsd	LCPI22_1(%rip), %xmm0
	ucomisd	(%rax), %xmm0
	jbe	LBB22_12
## BB#11:                               ## %ok1224
	movabsq	$-4579386764849840128, %rcx ## imm = 0xC072C00000000000
	movq	%rcx, (%rax)
LBB22_12:                               ## %endif1227
	movsd	8(%rax), %xmm0
	ucomisd	LCPI22_2(%rip), %xmm0
	jbe	LBB22_14
## BB#13:                               ## %ok1238
	movabsq	$4642648265865560064, %rcx ## imm = 0x406E000000000000
	movq	%rcx, 8(%rax)
LBB22_14:                               ## %endif1241
	movsd	LCPI22_3(%rip), %xmm0
	ucomisd	8(%rax), %xmm0
	jbe	LBB22_16
## BB#15:                               ## %ok1251
	movabsq	$-4580723770989215744, %rcx ## imm = 0xC06E000000000000
	movq	%rcx, 8(%rax)
LBB22_16:                               ## %leave1155
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI23_0:
	.long	1049414861              ## float 0.27500001
LCPI23_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI23_2:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Ship_draw
	.align	4, 0x90
_Ship_draw:                             ## @Ship_draw
## BB#0:                                ## %leave1265
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
	movl	_GL_POLYGON(%rip), %edi
	callq	_glBegin
	movss	LCPI23_0(%rip), %xmm1
	movss	LCPI23_1(%rip), %xmm0
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm3
	callq	_color
	movsd	LCPI23_2(%rip), %xmm2
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
	cmpl	$1, %eax
	jne	LBB24_1
## BB#20:                               ## %switch1311_0
	movq	-8(%rsp), %rax
	leaq	_Stage_1(%rip), %rcx
	jmp	LBB24_38
LBB24_1:                                ## %switch1311_case1
	cmpl	$2, %eax
	jne	LBB24_2
## BB#21:                               ## %switch1311_1
	movq	-8(%rsp), %rax
	leaq	_Stage_2(%rip), %rcx
	jmp	LBB24_38
LBB24_2:                                ## %switch1311_case2
	cmpl	$3, %eax
	jne	LBB24_3
## BB#22:                               ## %switch1311_2
	movq	-8(%rsp), %rax
	leaq	_Stage_3(%rip), %rcx
	jmp	LBB24_38
LBB24_3:                                ## %switch1311_case3
	cmpl	$4, %eax
	jne	LBB24_4
## BB#23:                               ## %switch1311_3
	movq	-8(%rsp), %rax
	leaq	_Stage_4(%rip), %rcx
	jmp	LBB24_38
LBB24_4:                                ## %switch1311_case4
	cmpl	$5, %eax
	jne	LBB24_5
## BB#24:                               ## %switch1311_4
	movq	-8(%rsp), %rax
	leaq	_Stage_5(%rip), %rcx
	jmp	LBB24_38
LBB24_5:                                ## %switch1311_case5
	cmpl	$6, %eax
	jne	LBB24_6
## BB#25:                               ## %switch1311_5
	movq	-8(%rsp), %rax
	leaq	_Stage_6(%rip), %rcx
	jmp	LBB24_38
LBB24_6:                                ## %switch1311_case6
	cmpl	$7, %eax
	jne	LBB24_7
## BB#26:                               ## %switch1311_6
	movq	-8(%rsp), %rax
	leaq	_Stage_7(%rip), %rcx
	jmp	LBB24_38
LBB24_7:                                ## %switch1311_case7
	cmpl	$8, %eax
	jne	LBB24_8
## BB#27:                               ## %switch1311_7
	movq	-8(%rsp), %rax
	leaq	_Stage_8(%rip), %rcx
	jmp	LBB24_38
LBB24_8:                                ## %switch1311_case8
	cmpl	$9, %eax
	jne	LBB24_9
## BB#28:                               ## %switch1311_8
	movq	-8(%rsp), %rax
	leaq	_Stage_9(%rip), %rcx
	jmp	LBB24_38
LBB24_9:                                ## %switch1311_case9
	cmpl	$10, %eax
	jne	LBB24_10
## BB#29:                               ## %switch1311_9
	movq	-8(%rsp), %rax
	leaq	_Stage_10(%rip), %rcx
	jmp	LBB24_38
LBB24_10:                               ## %switch1311_case10
	cmpl	$11, %eax
	jne	LBB24_11
## BB#30:                               ## %switch1311_10
	movq	-8(%rsp), %rax
	leaq	_Stage_11(%rip), %rcx
	jmp	LBB24_38
LBB24_11:                               ## %switch1311_case11
	cmpl	$12, %eax
	jne	LBB24_12
## BB#31:                               ## %switch1311_11
	movq	-8(%rsp), %rax
	leaq	_Stage_12(%rip), %rcx
	jmp	LBB24_38
LBB24_12:                               ## %switch1311_case12
	cmpl	$13, %eax
	jne	LBB24_13
## BB#32:                               ## %switch1311_12
	movq	-8(%rsp), %rax
	leaq	_Stage_13(%rip), %rcx
	jmp	LBB24_38
LBB24_13:                               ## %switch1311_case13
	cmpl	$14, %eax
	jne	LBB24_14
## BB#33:                               ## %switch1311_13
	movq	-8(%rsp), %rax
	leaq	_Stage_14(%rip), %rcx
	jmp	LBB24_38
LBB24_14:                               ## %switch1311_case14
	cmpl	$15, %eax
	jne	LBB24_15
## BB#34:                               ## %switch1311_14
	movq	-8(%rsp), %rax
	leaq	_Stage_15(%rip), %rcx
	jmp	LBB24_38
LBB24_15:                               ## %switch1311_case15
	cmpl	$16, %eax
	jne	LBB24_16
## BB#35:                               ## %switch1311_15
	movq	-8(%rsp), %rax
	leaq	_Stage_16(%rip), %rcx
	jmp	LBB24_38
LBB24_16:                               ## %switch1311_case16
	cmpl	$17, %eax
	jne	LBB24_17
## BB#36:                               ## %switch1311_16
	movq	-8(%rsp), %rax
	leaq	_Stage_17(%rip), %rcx
	jmp	LBB24_38
LBB24_17:                               ## %switch1311_case17
	cmpl	$18, %eax
	jne	LBB24_18
## BB#37:                               ## %switch1311_17
	movq	-8(%rsp), %rax
	leaq	_Stage_18(%rip), %rcx
	jmp	LBB24_38
LBB24_18:                               ## %switch1311_case18
	cmpl	$19, %eax
	jne	LBB24_39
## BB#19:                               ## %switch1311_18
	movq	-8(%rsp), %rax
	leaq	_Stage_ending(%rip), %rcx
LBB24_38:                               ## %switch1311_18
	movq	%rcx, (%rax)
LBB24_39:                               ## %leave1308
	ret

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
	cmpl	$300, %eax              ## imm = 0x12C
	jne	LBB39_1
## BB#25:                               ## %switch1465_0
	callq	_ptn7
	popq	%rax
	ret
LBB39_1:                                ## %switch1465_case1
	cmpl	$304, %eax              ## imm = 0x130
	je	LBB39_26
## BB#2:                                ## %switch1465_case2
	cmpl	$308, %eax              ## imm = 0x134
	je	LBB39_26
## BB#3:                                ## %switch1465_case3
	cmpl	$312, %eax              ## imm = 0x138
	je	LBB39_26
## BB#4:                                ## %switch1465_case4
	cmpl	$316, %eax              ## imm = 0x13C
	je	LBB39_26
## BB#5:                                ## %switch1465_case5
	cmpl	$320, %eax              ## imm = 0x140
	jne	LBB39_6
LBB39_26:                               ## %switch1465_5
	callq	_ptn1
	popq	%rax
	ret
LBB39_6:                                ## %switch1465_case6
	cmpl	$660, %eax              ## imm = 0x294
	jne	LBB39_7
## BB#27:                               ## %switch1465_6
	callq	_ptn2r
	popq	%rax
	ret
LBB39_7:                                ## %switch1465_case7
	cmpl	$665, %eax              ## imm = 0x299
	jne	LBB39_8
## BB#28:                               ## %switch1465_7
	callq	_ptn2c
	popq	%rax
	ret
LBB39_8:                                ## %switch1465_case8
	cmpl	$670, %eax              ## imm = 0x29E
	jne	LBB39_9
## BB#29:                               ## %switch1465_8
	callq	_ptn2l
	popq	%rax
	ret
LBB39_9:                                ## %switch1465_case9
	cmpl	$1080, %eax             ## imm = 0x438
	je	LBB39_30
## BB#10:                               ## %switch1465_case10
	cmpl	$1084, %eax             ## imm = 0x43C
	je	LBB39_30
## BB#11:                               ## %switch1465_case11
	cmpl	$1088, %eax             ## imm = 0x440
	je	LBB39_30
## BB#12:                               ## %switch1465_case12
	cmpl	$1092, %eax             ## imm = 0x444
	jne	LBB39_13
LBB39_30:                               ## %switch1465_12
	callq	_ptn3r
	popq	%rax
	ret
LBB39_13:                               ## %switch1465_case13
	cmpl	$1200, %eax             ## imm = 0x4B0
	je	LBB39_31
## BB#14:                               ## %switch1465_case14
	cmpl	$1204, %eax             ## imm = 0x4B4
	je	LBB39_31
## BB#15:                               ## %switch1465_case15
	cmpl	$1208, %eax             ## imm = 0x4B8
	je	LBB39_31
## BB#16:                               ## %switch1465_case16
	cmpl	$1212, %eax             ## imm = 0x4BC
	jne	LBB39_17
LBB39_31:                               ## %switch1465_16
	callq	_ptn3l
	popq	%rax
	ret
LBB39_17:                               ## %switch1465_case17
	cmpl	$1530, %eax             ## imm = 0x5FA
	je	LBB39_34
## BB#18:                               ## %switch1465_case18
	cmpl	$2100, %eax             ## imm = 0x834
	jne	LBB39_19
## BB#32:                               ## %switch1465_18
	callq	_ptn_hatena
	popq	%rax
	ret
LBB39_19:                               ## %switch1465_case19
	cmpl	$2520, %eax             ## imm = 0x9D8
	je	LBB39_33
## BB#20:                               ## %switch1465_case20
	cmpl	$2525, %eax             ## imm = 0x9DD
	je	LBB39_33
## BB#21:                               ## %switch1465_case21
	cmpl	$2530, %eax             ## imm = 0x9E2
	jne	LBB39_22
LBB39_33:                               ## %switch1465_19
	callq	_ptn4l
	callq	_ptn4r
	popq	%rax
	ret
LBB39_22:                               ## %switch1465_case22
	cmpl	$2940, %eax             ## imm = 0xB7C
	jne	LBB39_23
LBB39_34:                               ## %switch1465_17
	callq	_tmsu
	callq	_tmsl
	callq	_tmsr
	jmp	LBB39_35
LBB39_23:                               ## %switch1465_case23
	cmpl	$3540, %eax             ## imm = 0xDD4
	jne	LBB39_35
## BB#24:                               ## %switch1465_23
	callq	_boss1
	popq	%rax
	ret
LBB39_35:                               ## %leave1459
	popq	%rax
	ret

	.globl	_Stage_2
	.align	4, 0x90
_Stage_2:                               ## @Stage_2
## BB#0:                                ## %leave1721
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_3
	.align	4, 0x90
_Stage_3:                               ## @Stage_3
## BB#0:                                ## %leave1728
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_4
	.align	4, 0x90
_Stage_4:                               ## @Stage_4
## BB#0:                                ## %leave1735
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_5
	.align	4, 0x90
_Stage_5:                               ## @Stage_5
## BB#0:                                ## %leave1742
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_6
	.align	4, 0x90
_Stage_6:                               ## @Stage_6
## BB#0:                                ## %leave1749
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_7
	.align	4, 0x90
_Stage_7:                               ## @Stage_7
## BB#0:                                ## %leave1756
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_8
	.align	4, 0x90
_Stage_8:                               ## @Stage_8
## BB#0:                                ## %leave1763
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_9
	.align	4, 0x90
_Stage_9:                               ## @Stage_9
## BB#0:                                ## %leave1770
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_10
	.align	4, 0x90
_Stage_10:                              ## @Stage_10
## BB#0:                                ## %leave1777
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_11
	.align	4, 0x90
_Stage_11:                              ## @Stage_11
## BB#0:                                ## %leave1784
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_12
	.align	4, 0x90
_Stage_12:                              ## @Stage_12
## BB#0:                                ## %leave1791
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_13
	.align	4, 0x90
_Stage_13:                              ## @Stage_13
## BB#0:                                ## %leave1798
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_14
	.align	4, 0x90
_Stage_14:                              ## @Stage_14
## BB#0:                                ## %leave1805
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_15
	.align	4, 0x90
_Stage_15:                              ## @Stage_15
## BB#0:                                ## %leave1812
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_16
	.align	4, 0x90
_Stage_16:                              ## @Stage_16
## BB#0:                                ## %leave1819
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_17
	.align	4, 0x90
_Stage_17:                              ## @Stage_17
## BB#0:                                ## %leave1826
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_18
	.align	4, 0x90
_Stage_18:                              ## @Stage_18
## BB#0:                                ## %leave1833
	movq	%rdi, -8(%rsp)
	ret

	.globl	_Stage_ending
	.align	4, 0x90
_Stage_ending:                          ## @Stage_ending
## BB#0:                                ## %leave1840
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
L_.str1848:                             ## @.str1848
	.asciz	 "640x480:32@60"

	.comm	_game,40,4              ## @game
	.comm	_key,20,4               ## @key
	.comm	_ship,16,3              ## @ship

.subsections_via_symbols
