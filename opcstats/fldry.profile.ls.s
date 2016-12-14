	.file	"fldry.profile.ls.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Ltmp6:
	.cfi_offset %rbx, -24
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$97, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -12(%rbp)
	movl	%eax, -16(%rbp)
	movq	%rbx, -24(%rbp)
	movl	$.L.str, %edi
	movl	$8, %esi
	xorb	%al, %al
	callq	printf
	callq	Proc0
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	main, .Ltmp7-main
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
.Ltmp11:
	.cfi_def_cfa_offset 16
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp13:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
.Ltmp14:
	.cfi_offset %rbx, -56
.Ltmp15:
	.cfi_offset %r12, -48
.Ltmp16:
	.cfi_offset %r13, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
	incl	EdgeProfCounters+4(%rip)
	callq	clock
	movq	%rax, -160(%rbp)
	movl	$0, -148(%rbp)
	incl	EdgeProfCounters+8(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+12(%rip)
	incl	EdgeProfCounters+20(%rip)
	incl	-148(%rbp)
	incl	EdgeProfCounters+24(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99999999, -148(%rbp)   # imm = 0x5F5E0FF
	jbe	.LBB1_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+16(%rip)
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
	incl	EdgeProfCounters+28(%rip)
	leaq	-144(%rbp), %r15
	leaq	-72(%rbp), %r12
	leaq	-80(%rbp), %rbx
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_14:                               # %for.inc42
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+64(%rip)
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
	incl	EdgeProfCounters+88(%rip)
	incl	-148(%rbp)
	incl	EdgeProfCounters+92(%rip)
.LBB1_4:                                # %for.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #     Child Loop BB1_9 Depth 2
	cmpl	$99999999, -148(%rbp)   # imm = 0x5F5E0FF
	ja	.LBB1_15
# BB#5:                                 # %for.body10
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+32(%rip)
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
	incl	EdgeProfCounters+40(%rip)
	jmp	.LBB1_6
	.align	16, 0x90
.LBB1_7:                                # %while.body
                                        #   in Loop: Header=BB1_6 Depth=2
	incl	EdgeProfCounters+44(%rip)
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
	incl	EdgeProfCounters+52(%rip)
.LBB1_6:                                # %while.cond
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	-64(%rbp), %xmm0
	vucomisd	-56(%rbp), %xmm0
	ja	.LBB1_7
# BB#8:                                 # %while.end
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+48(%rip)
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-56(%rbp), %xmm0
	movl	$Array1Glob, %edi
	movl	$Array2Glob, %esi
	callq	Proc8
	movq	PtrGlb(%rip), %rdi
	callq	Proc1
	movb	$65, -74(%rbp)
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB1_9
	.align	16, 0x90
.LBB1_13:                               # %for.inc34
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+80(%rip)
	incb	-74(%rbp)
	incl	EdgeProfCounters+84(%rip)
.LBB1_9:                                # %for.cond24
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	Char2Glob(%rip), %eax
	movsbl	-74(%rbp), %ecx
	cmpl	%eax, %ecx
	jg	.LBB1_14
# BB#10:                                # %for.body28
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+60(%rip)
	movl	-80(%rbp), %r14d
	movsbl	-74(%rbp), %edi
	movl	$67, %esi
	callq	Func1
	cmpl	%eax, %r14d
	jne	.LBB1_11
# BB#12:                                # %if.then
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+68(%rip)
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	Proc6
	incl	EdgeProfCounters+76(%rip)
	jmp	.LBB1_13
	.align	16, 0x90
.LBB1_11:                               # %for.body28.if.end_crit_edge
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+72(%rip)
	jmp	.LBB1_13
.LBB1_15:                               # %for.end44
	incl	EdgeProfCounters+36(%rip)
	movl	-44(%rbp), %eax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp19:
	.size	Proc0, .Ltmp19-Proc0
	.cfi_endproc

	.globl	Proc1
	.align	16, 0x90
	.type	Proc1,@function
Proc1:                                  # @Proc1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp22:
	.cfi_def_cfa_offset 16
.Ltmp23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp24:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+96(%rip)
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
.Ltmp25:
	.size	Proc1, .Ltmp25-Proc1
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
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp30:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+100(%rip)
	movq	%rdi, -16(%rbp)
	vmovsd	(%rdi), %xmm0
	vaddsd	.LCPI3_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	incl	EdgeProfCounters+104(%rip)
	vmovsd	.LCPI3_1(%rip), %xmm0
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_6:                                # %if.end5
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+124(%rip)
	incl	EdgeProfCounters+132(%rip)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	Char1Glob(%rip), %eax
	cmpl	$65, %eax
	jne	.LBB3_2
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+108(%rip)
	vaddsd	-24(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, -24(%rbp)
	vsubsd	IntGlob(%rip), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	vmovsd	%xmm1, (%rax)
	movl	$0, -28(%rbp)
	incl	EdgeProfCounters+116(%rip)
	jmp	.LBB3_4
	.align	16, 0x90
.LBB3_2:                                # %for.cond.if.end_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+112(%rip)
.LBB3_4:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, -28(%rbp)
	jne	.LBB3_6
# BB#5:                                 # %if.then4
	incl	EdgeProfCounters+120(%rip)
	incl	EdgeProfCounters+128(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp31:
	.size	Proc2, .Ltmp31-Proc2
	.cfi_endproc

	.globl	Proc3
	.align	16, 0x90
	.type	Proc3,@function
Proc3:                                  # @Proc3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+136(%rip)
	movq	%rdi, -16(%rbp)
	cmpq	$0, PtrGlb(%rip)
	je	.LBB4_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+140(%rip)
	movq	PtrGlb(%rip), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	incl	EdgeProfCounters+148(%rip)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	incl	EdgeProfCounters+144(%rip)
	movabsq	$4636737291354636288, %rax # imm = 0x4059000000000000
	movq	%rax, IntGlob(%rip)
	incl	EdgeProfCounters+152(%rip)
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
.Ltmp37:
	.size	Proc3, .Ltmp37-Proc3
	.cfi_endproc

	.globl	Proc4
	.align	16, 0x90
	.type	Proc4,@function
Proc4:                                  # @Proc4
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp40:
	.cfi_def_cfa_offset 16
.Ltmp41:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp42:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+156(%rip)
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
.Ltmp43:
	.size	Proc4, .Ltmp43-Proc4
	.cfi_endproc

	.globl	Proc5
	.align	16, 0x90
	.type	Proc5,@function
Proc5:                                  # @Proc5
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp46:
	.cfi_def_cfa_offset 16
.Ltmp47:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp48:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+160(%rip)
	movb	$65, Char1Glob(%rip)
	movl	$0, BoolGlob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp49:
	.size	Proc5, .Ltmp49-Proc5
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
.Ltmp52:
	.cfi_def_cfa_offset 16
.Ltmp53:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp54:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+164(%rip)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, (%rsi)
	movl	-8(%rbp), %edi
	callq	Func3
	testl	%eax, %eax
	je	.LBB7_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+168(%rip)
	jmp	.LBB7_3
.LBB7_2:                                # %if.then
	incl	EdgeProfCounters+172(%rip)
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
	incl	EdgeProfCounters+176(%rip)
.LBB7_3:                                # %if.end
	movl	-8(%rbp), %eax
	cmpl	$9999, %eax             # imm = 0x270F
	ja	.LBB7_6
# BB#4:                                 # %if.end
	testl	%eax, %eax
	jne	.LBB7_5
# BB#8:                                 # %sw.bb
	incl	EdgeProfCounters+184(%rip)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+204(%rip)
	jmp	.LBB7_15
.LBB7_6:                                # %if.end
	addl	$-10000, %eax           # imm = 0xFFFFFFFFFFFFD8F0
	cmpl	$3, %eax
	jbe	.LBB7_7
.LBB7_5:                                # %if.end.sw.epilog_crit_edge
	incl	EdgeProfCounters+180(%rip)
.LBB7_15:                               # %sw.epilog
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.LBB7_7:                                # %if.end
	jmpq	*.LJTI7_0(,%rax,8)
.LBB7_9:                                # %sw.bb1
	incl	EdgeProfCounters+188(%rip)
	vmovsd	IntGlob(%rip), %xmm0
	vucomisd	.LCPI7_0(%rip), %xmm0
	jbe	.LBB7_11
# BB#10:                                # %if.then2
	incl	EdgeProfCounters+208(%rip)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+216(%rip)
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB7_15
.LBB7_12:                               # %sw.bb4
	incl	EdgeProfCounters+192(%rip)
	movq	-16(%rbp), %rax
	movl	$10000, (%rax)          # imm = 0x2710
	incl	EdgeProfCounters+228(%rip)
	jmp	.LBB7_15
.LBB7_13:                               # %sw.bb5
	incl	EdgeProfCounters+196(%rip)
	incl	EdgeProfCounters+232(%rip)
	jmp	.LBB7_15
.LBB7_14:                               # %sw.bb6
	incl	EdgeProfCounters+200(%rip)
	movq	-16(%rbp), %rax
	movl	$10001, (%rax)          # imm = 0x2711
	incl	EdgeProfCounters+236(%rip)
	jmp	.LBB7_15
.LBB7_11:                               # %if.else
	incl	EdgeProfCounters+212(%rip)
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
	incl	EdgeProfCounters+220(%rip)
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB7_15
.Ltmp55:
	.size	Proc6, .Ltmp55-Proc6
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI7_0:
	.quad	.LBB7_9
	.quad	.LBB7_12
	.quad	.LBB7_13
	.quad	.LBB7_14

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
.Ltmp58:
	.cfi_def_cfa_offset 16
.Ltmp59:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp60:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+240(%rip)
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
.Ltmp61:
	.size	Proc7, .Ltmp61-Proc7
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
.Ltmp64:
	.cfi_def_cfa_offset 16
.Ltmp65:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp66:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+244(%rip)
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
	incl	EdgeProfCounters+248(%rip)
	vmovsd	.LCPI9_1(%rip), %xmm0
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	incl	EdgeProfCounters+252(%rip)
	vmovsd	-48(%rbp), %xmm1
	vcvttsd2si	%xmm1, %eax
	movslq	%eax, %rax
	imulq	$408, %rax, %rax        # imm = 0x198
	addq	-24(%rbp), %rax
	vcvttsd2si	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	incl	EdgeProfCounters+260(%rip)
	vaddsd	-56(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, -56(%rbp)
	incl	EdgeProfCounters+264(%rip)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	-48(%rbp), %xmm0, %xmm1
	vucomisd	-56(%rbp), %xmm1
	jae	.LBB9_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+256(%rip)
	vcvttsd2si	-48(%rbp), %eax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movslq	%eax, %rax
	imulq	$408, %rax, %rdx        # imm = 0x198
	addq	-24(%rbp), %rdx
	vmovsd	(%rdx,%rcx,8), %xmm0
	vaddsd	.LCPI9_1(%rip), %xmm0, %xmm0
	movabsq	$4617315517961601024, %rax # imm = 0x4014000000000000
	vmovsd	%xmm0, (%rdx,%rcx,8)
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
.Ltmp67:
	.size	Proc8, .Ltmp67-Proc8
	.cfi_endproc

	.globl	Func1
	.align	16, 0x90
	.type	Func1,@function
Func1:                                  # @Func1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp70:
	.cfi_def_cfa_offset 16
.Ltmp71:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp72:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+268(%rip)
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
	incl	EdgeProfCounters+272(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+280(%rip)
	jmp	.LBB10_3
.LBB10_2:                               # %if.else
	incl	EdgeProfCounters+276(%rip)
	movl	$10000, -4(%rbp)        # imm = 0x2710
	incl	EdgeProfCounters+284(%rip)
.LBB10_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp73:
	.size	Func1, .Ltmp73-Func1
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
.Ltmp76:
	.cfi_def_cfa_offset 16
.Ltmp77:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp78:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	incl	EdgeProfCounters+288(%rip)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, -32(%rbp)
	incl	EdgeProfCounters+292(%rip)
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_4:                               # %while.body.if.end_crit_edge
                                        #   in Loop: Header=BB11_1 Depth=1
	incl	EdgeProfCounters+308(%rip)
	incl	EdgeProfCounters+316(%rip)
.LBB11_1:                               # %entry
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_2 Depth 2
	vmovsd	.LCPI11_0(%rip), %xmm1
	jmp	.LBB11_2
	.align	16, 0x90
.LBB11_5:                               # %if.then
                                        #   in Loop: Header=BB11_2 Depth=2
	incl	EdgeProfCounters+304(%rip)
	movb	$65, -33(%rbp)
	vmovsd	.LCPI11_0(%rip), %xmm1
	vaddsd	-32(%rbp), %xmm1, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	incl	EdgeProfCounters+312(%rip)
	incl	EdgeProfCounters+316(%rip)
.LBB11_2:                               # %while.cond
                                        #   Parent Loop BB11_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vucomisd	-32(%rbp), %xmm1
	jb	.LBB11_6
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB11_2 Depth=2
	incl	EdgeProfCounters+296(%rip)
	vcvttsd2si	-32(%rbp), %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movsbl	(%rcx,%rax), %edi
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx,%rax), %esi
	callq	Func1
	testl	%eax, %eax
	je	.LBB11_5
	jmp	.LBB11_4
.LBB11_6:                               # %while.end
	incl	EdgeProfCounters+300(%rip)
	movsbl	-33(%rbp), %eax
	cmpl	$86, %eax
	jle	.LBB11_7
# BB#8:                                 # %land.lhs.true
	incl	EdgeProfCounters+320(%rip)
	movsbl	-33(%rbp), %eax
	cmpl	$91, %eax
	jge	.LBB11_9
# BB#10:                                # %if.then14
	incl	EdgeProfCounters+328(%rip)
	movabsq	$4619567317775286272, %rax # imm = 0x401C000000000000
	movq	%rax, -32(%rbp)
	incl	EdgeProfCounters+336(%rip)
	jmp	.LBB11_11
.LBB11_7:                               # %while.end.if.end15_crit_edge
	incl	EdgeProfCounters+324(%rip)
	jmp	.LBB11_11
.LBB11_9:                               # %land.lhs.true.if.end15_crit_edge
	incl	EdgeProfCounters+332(%rip)
.LBB11_11:                              # %if.end15
	movsbl	-33(%rbp), %eax
	cmpl	$88, %eax
	jne	.LBB11_13
# BB#12:                                # %if.then19
	incl	EdgeProfCounters+340(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+348(%rip)
	jmp	.LBB11_16
.LBB11_13:                              # %if.else
	incl	EdgeProfCounters+344(%rip)
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rdi
	callq	strcmp
	testl	%eax, %eax
	jle	.LBB11_15
# BB#14:                                # %if.then23
	incl	EdgeProfCounters+352(%rip)
	vmovsd	-32(%rbp), %xmm0
	vaddsd	.LCPI11_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+360(%rip)
	jmp	.LBB11_16
.LBB11_15:                              # %if.else25
	incl	EdgeProfCounters+356(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+364(%rip)
.LBB11_16:                              # %return
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp79:
	.size	Func2, .Ltmp79-Func2
	.cfi_endproc

	.globl	Func3
	.align	16, 0x90
	.type	Func3,@function
Func3:                                  # @Func3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp82:
	.cfi_def_cfa_offset 16
.Ltmp83:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp84:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+368(%rip)
	movl	%edi, -8(%rbp)
	movl	%edi, -12(%rbp)
	cmpl	$10001, %edi            # imm = 0x2711
	jne	.LBB12_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+372(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+380(%rip)
	jmp	.LBB12_3
.LBB12_2:                               # %if.end
	incl	EdgeProfCounters+376(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+384(%rip)
.LBB12_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp85:
	.size	Func3, .Ltmp85-Func3
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
	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,388,16

	.section	".note.GNU-stack","",@progbits
