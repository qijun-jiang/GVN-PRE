	.file	"test/fldry.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$.L.str, %edi
	movl	$8, %esi
	xorb	%al, %al
	callq	printf
	callq	Proc0
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4619567317775286272     # double 7
.LCPI1_1:
	.quad	4617315517961601024     # double 5
.LCPI1_2:
	.quad	4607182418800017408     # double 1
	.text
	.globl	Proc0
	.align	16, 0x90
	.type	Proc0,@function
Proc0:                                  # @Proc0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
	callq	clock
	movq	%rax, -160(%rbp)
	movl	$0, -148(%rbp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	-148(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99999999, -148(%rbp)   # imm = 0x5F5E0FF
	jbe	.LBB1_2
# BB#3:                                 # %for.end
	callq	clock
	subq	-160(%rbp), %rax
	movq	%rax, -176(%rbp)
	movl	$56, %edi
	callq	malloc
	movq	%rax, PtrGlbNext(%rip)
	movl	$56, %edi
	callq	malloc
	movabsq	$4630826316843712512, %rcx # imm = 0x4044000000000000
	movq	%rax, PtrGlb(%rip)
	movq	PtrGlbNext(%rip), %rdx
	movq	%rdx, (%rax)
	movq	PtrGlb(%rip), %rax
	movl	$0, 8(%rax)
	movq	PtrGlb(%rip), %rax
	movl	$10001, 12(%rax)        # imm = 0x2711
	movq	PtrGlb(%rip), %rax
	movq	%rcx, 16(%rax)
	movq	PtrGlb(%rip), %rdi
	addq	$24, %rdi
	movl	$.L.str1, %esi
	callq	strcpy
	leaq	-112(%rbp), %rdi
	movq	%rdi, %r13
	movl	$.L.str2, %esi
	callq	strcpy
	movabsq	$4621819117588971520, %rax # imm = 0x4024000000000000
	movq	%rax, Array2Glob+3320(%rip)
	callq	clock
	movq	%rax, -160(%rbp)
	movl	$0, -148(%rbp)
	leaq	-144(%rbp), %r15
	leaq	-72(%rbp), %r12
	leaq	-80(%rbp), %rbx
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_13:                               # %for.inc42
                                        #   in Loop: Header=BB1_4 Depth=1
	vmovsd	-64(%rbp), %xmm0
	vmulsd	-56(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vdivsd	-56(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	vmovsd	-72(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmulsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vsubsd	-56(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	leaq	-56(%rbp), %rdi
	callq	Proc2
	incl	-148(%rbp)
.LBB1_4:                                # %for.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #     Child Loop BB1_9 Depth 2
	cmpl	$99999999, -148(%rbp)   # imm = 0x5F5E0FF
	ja	.LBB1_14
# BB#5:                                 # %for.body10
                                        #   in Loop: Header=BB1_4 Depth=1
	callq	Proc5
	callq	Proc4
	movabsq	$4611686018427387904, %rax # imm = 0x4000000000000000
	movq	%rax, -56(%rbp)
	movabsq	$4613937818241073152, %rax # imm = 0x4008000000000000
	movq	%rax, -64(%rbp)
	movq	%r15, %rdi
	movl	$.L.str3, %esi
	callq	strcpy
	movl	$10000, -80(%rbp)       # imm = 0x2710
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	Func2
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, BoolGlob(%rip)
	jmp	.LBB1_6
	.align	16, 0x90
.LBB1_7:                                # %while.body
                                        #   in Loop: Header=BB1_6 Depth=2
	vmovsd	.LCPI1_1(%rip), %xmm0
	vmulsd	-56(%rbp), %xmm0, %xmm0
	vsubsd	-64(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vmovsd	-64(%rbp), %xmm1
	vmovsd	-56(%rbp), %xmm0
	movq	%r12, %rdi
	callq	Proc7
	vmovsd	.LCPI1_2(%rip), %xmm0
	vaddsd	-56(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
.LBB1_6:                                # %while.cond
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	-64(%rbp), %xmm0
	vucomisd	-56(%rbp), %xmm0
	ja	.LBB1_7
# BB#8:                                 # %while.end
                                        #   in Loop: Header=BB1_4 Depth=1
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-56(%rbp), %xmm0
	movl	$Array1Glob, %edi
	movl	$Array2Glob, %esi
	callq	Proc8
	movq	PtrGlb(%rip), %rdi
	callq	Proc1
	movb	$65, -74(%rbp)
	jmp	.LBB1_9
	.align	16, 0x90
.LBB1_12:                               # %for.inc34
                                        #   in Loop: Header=BB1_9 Depth=2
	incb	-74(%rbp)
.LBB1_9:                                # %for.cond24
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	Char2Glob(%rip), %eax
	movsbl	-74(%rbp), %ecx
	cmpl	%eax, %ecx
	jg	.LBB1_13
# BB#10:                                # %for.body28
                                        #   in Loop: Header=BB1_9 Depth=2
	movl	-80(%rbp), %r14d
	movsbl	-74(%rbp), %edi
	movl	$67, %esi
	callq	Func1
	cmpl	%eax, %r14d
	jne	.LBB1_12
# BB#11:                                # %if.then
                                        #   in Loop: Header=BB1_9 Depth=2
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	Proc6
	jmp	.LBB1_12
.LBB1_14:                               # %for.end44
	movl	-44(%rbp), %eax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp17:
	.size	Proc0, .Ltmp17-Proc0
	.cfi_endproc

	.globl	Proc1
	.align	16, 0x90
	.type	Proc1,@function
Proc1:                                  # @Proc1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movabsq	$4617315517961601024, %rax # imm = 0x4014000000000000
	movq	%rax, 16(%rdi)
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	vmovsd	16(%rax), %xmm0
	vmovsd	%xmm0, 16(%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rax)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp23:
	.size	Proc1, .Ltmp23-Proc1
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4621819117588971520     # double 10
.LCPI3_1:
	.quad	-4616189618054758400    # double -1
	.text
	.globl	Proc2
	.align	16, 0x90
	.type	Proc2,@function
Proc2:                                  # @Proc2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	vmovsd	(%rdi), %xmm0
	vaddsd	.LCPI3_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmovsd	.LCPI3_1(%rip), %xmm0
	.align	16, 0x90
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	Char1Glob(%rip), %eax
	cmpl	$65, %eax
	jne	.LBB3_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	vaddsd	-24(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, -24(%rbp)
	vsubsd	IntGlob(%rip), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	vmovsd	%xmm1, (%rax)
	movl	$0, -28(%rbp)
.LBB3_3:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, -28(%rbp)
	jne	.LBB3_1
# BB#4:                                 # %for.end
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp29:
	.size	Proc2, .Ltmp29-Proc2
	.cfi_endproc

	.globl	Proc3
	.align	16, 0x90
	.type	Proc3,@function
Proc3:                                  # @Proc3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	cmpq	$0, PtrGlb(%rip)
	je	.LBB4_2
# BB#1:                                 # %if.then
	movq	PtrGlb(%rip), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	movabsq	$4636737291354636288, %rax # imm = 0x4059000000000000
	movq	%rax, IntGlob(%rip)
.LBB4_3:                                # %if.end
	vmovsd	IntGlob(%rip), %xmm0
	movq	PtrGlb(%rip), %rsi
	addq	$16, %rsi
	movl	$10, %edi
	movb	$1, %al
	callq	Proc7
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp35:
	.size	Proc3, .Ltmp35-Proc3
	.cfi_endproc

	.globl	Proc4
	.align	16, 0x90
	.type	Proc4,@function
Proc4:                                  # @Proc4
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp38:
	.cfi_def_cfa_offset 16
.Ltmp39:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp40:
	.cfi_def_cfa_register %rbp
	movsbl	Char1Glob(%rip), %eax
	cmpl	$65, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	orl	BoolGlob(%rip), %eax
	movl	%eax, -8(%rbp)
	movb	$66, Char2Glob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp41:
	.size	Proc4, .Ltmp41-Proc4
	.cfi_endproc

	.globl	Proc5
	.align	16, 0x90
	.type	Proc5,@function
Proc5:                                  # @Proc5
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	movb	$65, Char1Glob(%rip)
	movl	$0, BoolGlob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp47:
	.size	Proc5, .Ltmp47-Proc5
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI7_0:
	.quad	4636737291354636288     # double 100
	.text
	.globl	Proc6
	.align	16, 0x90
	.type	Proc6,@function
Proc6:                                  # @Proc6
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
.Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp52:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, (%rsi)
	movl	-8(%rbp), %edi
	callq	Func3
	testl	%eax, %eax
	jne	.LBB7_2
# BB#1:                                 # %if.then
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
.LBB7_2:                                # %if.end
	movl	-8(%rbp), %eax
	cmpl	$9999, %eax             # imm = 0x270F
	ja	.LBB7_5
# BB#3:                                 # %if.end
	testl	%eax, %eax
	jne	.LBB7_12
	jmp	.LBB7_4
.LBB7_5:                                # %if.end
	cmpl	$10000, %eax            # imm = 0x2710
	je	.LBB7_9
# BB#6:                                 # %if.end
	cmpl	$10001, %eax            # imm = 0x2711
	jne	.LBB7_7
# BB#11:                                # %sw.bb4
	movq	-16(%rbp), %rax
	movl	$10000, (%rax)          # imm = 0x2710
	jmp	.LBB7_12
.LBB7_9:                                # %sw.bb1
	vmovsd	IntGlob(%rip), %xmm0
	vucomisd	.LCPI7_0(%rip), %xmm0
	jbe	.LBB7_10
.LBB7_4:                                # %sw.bb
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	jmp	.LBB7_12
.LBB7_7:                                # %if.end
	cmpl	$10003, %eax            # imm = 0x2713
	jne	.LBB7_12
# BB#8:                                 # %sw.bb6
	movq	-16(%rbp), %rax
	movl	$10001, (%rax)          # imm = 0x2711
	jmp	.LBB7_12
.LBB7_10:                               # %if.else
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
.LBB7_12:                               # %sw.epilog
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp53:
	.size	Proc6, .Ltmp53-Proc6
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI8_0:
	.quad	4611686018427387904     # double 2
	.text
	.globl	Proc7
	.align	16, 0x90
	.type	Proc7,@function
Proc7:                                  # @Proc7
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp58:
	.cfi_def_cfa_register %rbp
	vmovsd	%xmm0, -16(%rbp)
	vmovsd	%xmm1, -24(%rbp)
	movq	%rdi, -32(%rbp)
	vmovsd	-16(%rbp), %xmm0
	vaddsd	.LCPI8_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vaddsd	-24(%rbp), %xmm0, %xmm0
	movq	-32(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp59:
	.size	Proc7, .Ltmp59-Proc7
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI9_0:
	.quad	4617315517961601024     # double 5
.LCPI9_1:
	.quad	4607182418800017408     # double 1
	.text
	.globl	Proc8
	.align	16, 0x90
	.type	Proc8,@function
Proc8:                                  # @Proc8
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
.Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp64:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	vmovsd	%xmm0, -32(%rbp)
	vmovsd	%xmm1, -40(%rbp)
	vmovsd	-32(%rbp), %xmm0
	vaddsd	.LCPI9_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	vcvttsd2si	%xmm0, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	-40(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	vcvttsd2si	-48(%rbp), %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	incl	%eax
	movslq	%eax, %rax
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-48(%rbp), %xmm0
	vcvttsd2si	%xmm0, %eax
	addl	$30, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-48(%rbp), %xmm0
	vmovsd	%xmm0, -56(%rbp)
	vmovsd	.LCPI9_1(%rip), %xmm0
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	vmovsd	-48(%rbp), %xmm1
	vcvttsd2si	%xmm1, %eax
	movslq	%eax, %rax
	imulq	$408, %rax, %rax        # imm = 0x198
	addq	-24(%rbp), %rax
	vcvttsd2si	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	vaddsd	-56(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, -56(%rbp)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	-48(%rbp), %xmm0, %xmm1
	vucomisd	-56(%rbp), %xmm1
	jae	.LBB9_2
# BB#3:                                 # %for.end
	vcvttsd2si	-48(%rbp), %ecx
	leal	-1(%rcx), %eax
	movslq	%eax, %rax
	movslq	%ecx, %rcx
	imulq	$408, %rcx, %rcx        # imm = 0x198
	addq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vaddsd	.LCPI9_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movabsq	$4617315517961601024, %rax # imm = 0x4014000000000000
	vcvttsd2si	-48(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	-16(%rbp), %rdx
	vmovsd	(%rdx,%rcx,8), %xmm0
	leal	20(%rcx), %edx
	movslq	%edx, %rdx
	imulq	$408, %rdx, %rdx        # imm = 0x198
	addq	-24(%rbp), %rdx
	vmovsd	%xmm0, (%rdx,%rcx,8)
	movq	%rax, IntGlob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp65:
	.size	Proc8, .Ltmp65-Proc8
	.cfi_endproc

	.globl	Func1
	.align	16, 0x90
	.type	Func1,@function
Func1:                                  # @Func1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp68:
	.cfi_def_cfa_offset 16
.Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp70:
	.cfi_def_cfa_register %rbp
	movb	%dil, -5(%rbp)
	movb	%sil, -6(%rbp)
	movb	-5(%rbp), %al
	movb	%al, -7(%rbp)
	movb	%al, -8(%rbp)
	movsbl	-6(%rbp), %eax
	movsbl	-8(%rbp), %ecx
	cmpl	%eax, %ecx
	je	.LBB10_2
# BB#1:                                 # %if.then
	movl	$0, -4(%rbp)
	jmp	.LBB10_3
.LBB10_2:                               # %if.else
	movl	$10000, -4(%rbp)        # imm = 0x2710
.LBB10_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp71:
	.size	Func1, .Ltmp71-Func1
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI11_0:
	.quad	4607182418800017408     # double 1
.LCPI11_1:
	.quad	4619567317775286272     # double 7
	.text
	.globl	Func2
	.align	16, 0x90
	.type	Func2,@function
Func2:                                  # @Func2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp74:
	.cfi_def_cfa_offset 16
.Ltmp75:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp76:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, -32(%rbp)
	vmovsd	.LCPI11_0(%rip), %xmm1
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_3:                               # %if.then
                                        #   in Loop: Header=BB11_1 Depth=1
	movb	$65, -33(%rbp)
	vaddsd	-32(%rbp), %xmm1, %xmm0
	vmovsd	%xmm0, -32(%rbp)
.LBB11_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	vucomisd	-32(%rbp), %xmm1
	jb	.LBB11_4
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB11_1 Depth=1
	vcvttsd2si	-32(%rbp), %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movsbl	(%rcx,%rax), %edi
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx,%rax), %esi
	callq	Func1
	vmovsd	.LCPI11_0(%rip), %xmm1
	testl	%eax, %eax
	jne	.LBB11_1
	jmp	.LBB11_3
.LBB11_4:                               # %while.end
	movsbl	-33(%rbp), %eax
	cmpl	$87, %eax
	jl	.LBB11_7
# BB#5:                                 # %land.lhs.true
	movsbl	-33(%rbp), %eax
	cmpl	$90, %eax
	jg	.LBB11_7
# BB#6:                                 # %if.then14
	movabsq	$4619567317775286272, %rax # imm = 0x401C000000000000
	movq	%rax, -32(%rbp)
.LBB11_7:                               # %if.end15
	movsbl	-33(%rbp), %eax
	cmpl	$88, %eax
	jne	.LBB11_9
# BB#8:                                 # %if.then19
	movl	$1, -4(%rbp)
	jmp	.LBB11_12
.LBB11_9:                               # %if.else
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rdi
	callq	strcmp
	testl	%eax, %eax
	jle	.LBB11_11
# BB#10:                                # %if.then23
	vmovsd	-32(%rbp), %xmm0
	vaddsd	.LCPI11_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	movl	$1, -4(%rbp)
	jmp	.LBB11_12
.LBB11_11:                              # %if.else25
	movl	$0, -4(%rbp)
.LBB11_12:                              # %return
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp77:
	.size	Func2, .Ltmp77-Func2
	.cfi_endproc

	.globl	Func3
	.align	16, 0x90
	.type	Func3,@function
Func3:                                  # @Func3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp80:
	.cfi_def_cfa_offset 16
.Ltmp81:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp82:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movl	%edi, -12(%rbp)
	cmpl	$10001, %edi            # imm = 0x2711
	jne	.LBB12_2
# BB#1:                                 # %if.then
	movl	$1, -4(%rbp)
	jmp	.LBB12_3
.LBB12_2:                               # %if.end
	movl	$0, -4(%rbp)
.LBB12_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp83:
	.size	Func3, .Ltmp83-Func3
	.cfi_endproc

	.type	Version,@object         # @Version
	.data
	.globl	Version
Version:
	.asciz	 "1.1"
	.size	Version, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "calculate floating dhrystones using doubles size %d\n"
	.size	.L.str, 53

	.type	PtrGlbNext,@object      # @PtrGlbNext
	.comm	PtrGlbNext,8,8
	.type	PtrGlb,@object          # @PtrGlb
	.comm	PtrGlb,8,8
	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "DHRYSTONE PROGRAM, SOME STRING"
	.size	.L.str1, 31

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "DHRYSTONE PROGRAM, 1'ST STRING"
	.size	.L.str2, 31

	.type	Array2Glob,@object      # @Array2Glob
	.comm	Array2Glob,20808,16
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "DHRYSTONE PROGRAM, 2'ND STRING"
	.size	.L.str3, 31

	.type	BoolGlob,@object        # @BoolGlob
	.comm	BoolGlob,4,4
	.type	Array1Glob,@object      # @Array1Glob
	.comm	Array1Glob,408,16
	.type	Char2Glob,@object       # @Char2Glob
	.comm	Char2Glob,1,1
	.type	Char1Glob,@object       # @Char1Glob
	.comm	Char1Glob,1,1
	.type	IntGlob,@object         # @IntGlob
	.comm	IntGlob,8,8

	.section	".note.GNU-stack","",@progbits
