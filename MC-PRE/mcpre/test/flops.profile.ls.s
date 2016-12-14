	.file	"test/flops.profile.ls.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4158027847206421152     # double 1.0E-30
.LCPI0_1:
	.quad	4624070917402656768     # double 14
.LCPI0_2:
	.quad	-4595585649759538381    # double -25.2
.LCPI0_4:
	.quad	4629489310704336896     # double 31.25
.LCPI0_5:
	.quad	4619567317775286272     # double 7
.LCPI0_6:
	.quad	4625478292286210048     # double 17
.LCPI0_7:
	.quad	-4620693217682128896    # double -0.5
.LCPI0_8:
	.quad	4624633867356078080     # double 15
.LCPI0_9:
	.quad	4628855992006737920     # double 29
.LCPI0_10:
	.quad	-4618953502541334033    # double -0.6931471805599453
.LCPI0_11:
	.quad	-4625196817309499392    # double -0.25
.LCPI0_12:
	.quad	4636901401919853220     # double 102.3321513995275
.LCPI0_13:
	.quad	4622945017495814144     # double 12
.LCPI0_14:
	.quad	4625759767262920704     # double 18
.LCPI0_15:
	.quad	4647507227651027763     # double 500.2
.LCPI0_16:
	.quad	4629137466983448576     # double 30
.LCPI0_17:
	.quad	-4624446217371604309    # double -0.2916666666666667
.LCPI0_18:
	.quad	4632515166703976448     # double 52
.LCPI0_19:
	.quad	4639552041121742848     # double 152
.LCPI0_20:
	.quad	4639340934889209856     # double 146
.LCPI0_21:
	.quad	4636103972657037312     # double 91
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_3:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
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
	subq	$96, %rsp
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$66, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -4(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	movabsq	$4617315517961601024, %r8 # imm = 0x4014000000000000
	movabsq	$4616189618054758400, %r9 # imm = 0x4010000000000000
	movabsq	$4613937818241073152, %rdx # imm = 0x4008000000000000
	movabsq	$4611686018427387904, %rsi # imm = 0x4000000000000000
	movabsq	$4614256656552045848, %rdi # imm = 0x400921FB54442D18
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movabsq	$4634204016564240384, %rcx # imm = 0x4050000000000000
	movq	$15625, -56(%rbp)       # imm = 0x3D09
	movq	%rcx, T+8(%rip)
	movq	%rax, TLimit(%rip)
	movq	$512000000, -64(%rbp)   # imm = 0x1E848000
	movq	%rdi, piref(%rip)
	movq	%rax, one(%rip)
	movq	%rsi, two(%rip)
	movq	%rdx, three(%rip)
	movq	%r9, four(%rip)
	movq	%r8, five(%rip)
	vmovsd	one(%rip), %xmm0
	vmovsd	%xmm0, scale(%rip)
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	$TimeArray, %edi
	callq	dtime
	movl	$TimeArray, %edi
	callq	dtime
	movq	-56(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	$0, sa(%rip)
	incl	EdgeProfCounters+4(%rip)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_7:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+40(%rip)
	incl	EdgeProfCounters+48(%rip)
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	vmovsd	TLimit(%rip), %xmm0
	vucomisd	sa(%rip), %xmm0
	jbe	.LBB0_8
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movq	-88(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, -88(%rbp)
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	vmovsd	one(%rip), %xmm0
	vmovsd	%xmm0, -40(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+16(%rip)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_4:                                # %for.body
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+20(%rip)
	vmovsd	-32(%rbp), %xmm0
	vaddsd	-40(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	D3(%rip), %xmm0, %xmm1
	vaddsd	D2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vmovsd	D1(%rip), %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	E3(%rip), %xmm0, %xmm3
	vaddsd	E2(%rip), %xmm3, %xmm3
	vmulsd	%xmm3, %xmm0, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm0
	vaddsd	-40(%rbp), %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+28(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+32(%rip)
.LBB0_3:                                # %for.cond
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-88(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_4
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	TimeArray+8(%rip), %xmm0
	vmovsd	%xmm0, sa(%rip)
	movq	-88(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jne	.LBB0_7
# BB#6:                                 # %if.then
	incl	EdgeProfCounters+36(%rip)
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB0_9
.LBB0_8:                                # %while.end.loopexit
	incl	EdgeProfCounters+12(%rip)
	incl	EdgeProfCounters+52(%rip)
.LBB0_9:                                # %while.end
	movabsq	$4580238643237355394, %rax # imm = 0x3F9046C764ADFF82
	movq	%rax, scale(%rip)
	movq	%rax, T+8(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB0_10
	.align	16, 0x90
.LBB0_11:                               # %for.body33
                                        #   in Loop: Header=BB0_10 Depth=1
	incl	EdgeProfCounters+60(%rip)
	incl	EdgeProfCounters+68(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+72(%rip)
.LBB0_10:                               # %for.cond29
                                        # =>This Inner Loop Header: Depth=1
	movq	-88(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_11
# BB#12:                                # %for.end36
	incl	EdgeProfCounters+64(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, nulltime(%rip)
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_13
# BB#14:                                # %if.then41
	incl	EdgeProfCounters+76(%rip)
	movq	$0, nulltime(%rip)
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB0_15
.LBB0_13:                               # %for.end36.if.end42_crit_edge
	incl	EdgeProfCounters+80(%rip)
.LBB0_15:                               # %if.end42
	vmovsd	T+8(%rip), %xmm0
	vmulsd	sa(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+16(%rip)
	vmovsd	D1(%rip), %xmm1
	vaddsd	D2(%rip), %xmm1, %xmm0
	vaddsd	D3(%rip), %xmm0, %xmm0
	vaddsd	one(%rip), %xmm1, %xmm1
	vaddsd	E2(%rip), %xmm1, %xmm1
	vmovsd	.LCPI0_0(%rip), %xmm3
	vaddsd	E3(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	D1(%rip), %xmm0
	vmovsd	%xmm0, sb(%rip)
	vmovsd	T+16(%rip), %xmm0
	vdivsd	.LCPI0_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+24(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vmovsd	sa(%rip), %xmm2
	vaddsd	sb(%rip), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sb(%rip)
	vcvttsd2si	%xmm0, %rax
	imulq	$40000, %rax, %rax      # imm = 0x9C40
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	scale(%rip), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	movq	%rax, -88(%rbp)
	vmovsd	sb(%rip), %xmm0
	vaddsd	.LCPI0_2(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+24(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+32(%rip)
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+16(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str4, %edi
	movb	$3, %al
	callq	printf
	vmovsd	.LCPI0_3(%rip), %xmm1
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	vmovsd	five(%rip), %xmm0
	vxorpd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	vmovsd	one(%rip), %xmm0
	vxorpd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+88(%rip)
	jmp	.LBB0_16
	.align	16, 0x90
.LBB0_17:                               # %for.body75
                                        #   in Loop: Header=BB0_16 Depth=1
	incl	EdgeProfCounters+92(%rip)
	vmovsd	-16(%rbp), %xmm0
	vxorpd	.LCPI0_3(%rip), %xmm0, %xmm1
	vmovsd	%xmm1, -16(%rbp)
	vmovsd	sa(%rip), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	incl	EdgeProfCounters+100(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+104(%rip)
.LBB0_16:                               # %for.cond72
                                        # =>This Inner Loop Header: Depth=1
	movq	-72(%rbp), %rax
	cmpq	-80(%rbp), %rax
	jle	.LBB0_17
# BB#18:                                # %for.end80
	incl	EdgeProfCounters+96(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+40(%rip)
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_19
# BB#20:                                # %if.then85
	incl	EdgeProfCounters+108(%rip)
	movq	$0, T+40(%rip)
	incl	EdgeProfCounters+116(%rip)
	jmp	.LBB0_21
.LBB0_19:                               # %for.end80.if.end86_crit_edge
	incl	EdgeProfCounters+112(%rip)
.LBB0_21:                               # %if.end86
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	sa(%rip), %xmm0
	vmovsd	%xmm0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -48(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+120(%rip)
	jmp	.LBB0_22
	.align	16, 0x90
.LBB0_23:                               # %for.body92
                                        #   in Loop: Header=BB0_22 Depth=1
	incl	EdgeProfCounters+124(%rip)
	vmovsd	-16(%rbp), %xmm0
	vxorpd	.LCPI0_3(%rip), %xmm0, %xmm1
	vmovsd	%xmm1, -16(%rbp)
	vmovsd	sa(%rip), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	-24(%rbp), %xmm0
	vaddsd	two(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmovsd	-16(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vaddsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	vmovsd	-16(%rbp), %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	-32(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmovsd	-16(%rbp), %xmm0
	vdivsd	-24(%rbp), %xmm0, %xmm0
	vaddsd	-40(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	incl	EdgeProfCounters+132(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+136(%rip)
.LBB0_22:                               # %for.cond89
                                        # =>This Inner Loop Header: Depth=1
	movq	-72(%rbp), %rax
	cmpq	-80(%rbp), %rax
	jle	.LBB0_23
# BB#24:                                # %for.end104
	incl	EdgeProfCounters+128(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+48(%rip)
	vsubsd	T+40(%rip), %xmm0, %xmm1
	vmovsd	.LCPI0_4(%rip), %xmm0
	movabsq	$4629489310704336896, %rax # imm = 0x403F400000000000
	vdivsd	.LCPI0_5(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, T+56(%rip)
	vmovsd	sa(%rip), %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	sc(%rip), %xmm1, %xmm1
	vcvttsd2si	%xmm1, %rcx
	movq	%rcx, -80(%rbp)
	vmovsd	four(%rip), %xmm1
	vmulsd	-40(%rbp), %xmm1, %xmm1
	vdivsd	five(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, sa(%rip)
	vmovsd	five(%rip), %xmm2
	vdivsd	-32(%rbp), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, sb(%rip)
	movq	%rax, sc(%rip)
	vmovsd	-32(%rbp), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	sb(%rip), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, piprg(%rip)
	vsubsd	piref(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, pierr(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+56(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+64(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmovsd	T+48(%rip), %xmm0
	vsubsd	T+40(%rip), %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm1
	vmulsd	pierr(%rip), %xmm3, %xmm0
	movl	$.L.str5, %edi
	movb	$3, %al
	callq	printf
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	piref(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+140(%rip)
	jmp	.LBB0_25
	.align	16, 0x90
.LBB0_26:                               # %for.body135
                                        #   in Loop: Header=BB0_25 Depth=1
	incl	EdgeProfCounters+144(%rip)
	vmovsd	-32(%rbp), %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vsubsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+152(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+156(%rip)
.LBB0_25:                               # %for.cond131
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_26
# BB#27:                                # %for.end155
	incl	EdgeProfCounters+148(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+72(%rip)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vsubsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+72(%rip), %xmm0
	vdivsd	.LCPI0_6(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+80(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	movq	%rax, sb(%rip)
	vmovsd	sa(%rip), %xmm0
	vaddsd	.LCPI0_7(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+80(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+88(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+72(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str6, %edi
	movb	$3, %al
	callq	printf
	vmovsd	A3(%rip), %xmm0
	vmovsd	.LCPI0_3(%rip), %xmm1
	vxorpd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, A3(%rip)
	vmovsd	A5(%rip), %xmm0
	vxorpd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, A5(%rip)
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	piref(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+160(%rip)
	jmp	.LBB0_28
	.align	16, 0x90
.LBB0_29:                               # %for.body195
                                        #   in Loop: Header=BB0_28 Depth=1
	incl	EdgeProfCounters+164(%rip)
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+172(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+176(%rip)
.LBB0_28:                               # %for.cond191
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_29
# BB#30:                                # %for.end214
	incl	EdgeProfCounters+168(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+96(%rip)
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+96(%rip), %xmm0
	vdivsd	.LCPI0_8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+104(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vmovsd	sa(%rip), %xmm2
	vaddsd	one(%rip), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	A0(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sb(%rip)
	vmovsd	sa(%rip), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+104(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+112(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+96(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str7, %edi
	movb	$3, %al
	callq	printf
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	piref(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+180(%rip)
	jmp	.LBB0_31
	.align	16, 0x90
.LBB0_32:                               # %for.body267
                                        #   in Loop: Header=BB0_31 Depth=1
	incl	EdgeProfCounters+184(%rip)
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmovsd	-40(%rbp), %xmm1
	vmulsd	B6(%rip), %xmm1, %xmm2
	vaddsd	B5(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B4(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B3(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B2(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B1(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	one(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+192(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+196(%rip)
.LBB0_31:                               # %for.cond263
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_32
# BB#33:                                # %for.end300
	incl	EdgeProfCounters+188(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+120(%rip)
	movabsq	$4604418534313441775, %rax # imm = 0x3FE62E42FEFA39EF
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	-40(%rbp), %xmm0
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sb(%rip)
	vmovsd	sa(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+120(%rip), %xmm0
	vdivsd	.LCPI0_9(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+128(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	movq	%rax, sb(%rip)
	vmovsd	sa(%rip), %xmm0
	vaddsd	.LCPI0_10(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+128(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+136(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+120(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str8, %edi
	movb	$3, %al
	callq	printf
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmulsd	four(%rip), %xmm0, %xmm0
	vmovsd	piref(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+200(%rip)
	jmp	.LBB0_34
	.align	16, 0x90
.LBB0_35:                               # %for.body351
                                        #   in Loop: Header=BB0_34 Depth=1
	incl	EdgeProfCounters+204(%rip)
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmovsd	-40(%rbp), %xmm1
	vmulsd	B6(%rip), %xmm1, %xmm2
	vaddsd	B5(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B4(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B3(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B2(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vaddsd	B1(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	one(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+212(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+216(%rip)
.LBB0_34:                               # %for.cond347
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_35
# BB#36:                                # %for.end384
	incl	EdgeProfCounters+208(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+144(%rip)
	movabsq	$4598175219545276416, %rax # imm = 0x3FD0000000000000
	vmovsd	piref(%rip), %xmm0
	vdivsd	four(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	-40(%rbp), %xmm0
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sb(%rip)
	vmulsd	sa(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+144(%rip), %xmm0
	vdivsd	.LCPI0_9(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+152(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	movq	%rax, sb(%rip)
	vmovsd	sa(%rip), %xmm0
	vaddsd	.LCPI0_11(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+152(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+160(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+144(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str9, %edi
	movb	$3, %al
	callq	printf
	vmovsd	.LCPI0_12(%rip), %xmm0
	movabsq	$4636901401919853220, %rax # imm = 0x40599541F7F192A4
	movq	$0, -16(%rbp)
	vmovsd	one(%rip), %xmm1
	vmovsd	%xmm1, -40(%rbp)
	movq	%rax, sa(%rip)
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+220(%rip)
	jmp	.LBB0_37
	.align	16, 0x90
.LBB0_38:                               # %for.body434
                                        #   in Loop: Header=BB0_37 Depth=1
	incl	EdgeProfCounters+224(%rip)
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vmulsd	-32(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm1, -24(%rbp)
	vmovsd	-48(%rbp), %xmm2
	vmulsd	%xmm1, %xmm2, %xmm0
	vmovsd	-40(%rbp), %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm3, %xmm2
	vmovsd	-16(%rbp), %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+232(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+236(%rip)
.LBB0_37:                               # %for.cond430
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_38
# BB#39:                                # %for.end450
	incl	EdgeProfCounters+228(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm1
	vdivsd	.LCPI0_13(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, T+168(%rip)
	vmovsd	%xmm0, T+176(%rip)
	vmovsd	sa(%rip), %xmm0
	vmovsd	%xmm0, -48(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm1, -24(%rbp)
	vmovsd	-48(%rbp), %xmm2
	vmulsd	%xmm1, %xmm2, %xmm0
	vmovsd	-40(%rbp), %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm3, %xmm2
	vxorpd	.LCPI0_3(%rip), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	two(%rip), %xmm1
	vmulsd	-16(%rbp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-32(%rbp), %xmm1
	vmulsd	.LCPI0_14(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vcvttsd2si	%xmm0, %rax
	imulq	$-2000, %rax, %rax      # imm = 0xFFFFFFFFFFFFF830
	movq	%rax, -80(%rbp)
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	scale(%rip), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	movq	%rax, -80(%rbp)
	vmovsd	sa(%rip), %xmm0
	vaddsd	.LCPI0_15(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+176(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+184(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+168(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str10, %edi
	movb	$3, %al
	callq	printf
	vcvtsi2sdq	-80(%rbp), %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	piref(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$TimeArray, %edi
	callq	dtime
	movq	$1, -72(%rbp)
	incl	EdgeProfCounters+240(%rip)
	jmp	.LBB0_40
	.align	16, 0x90
.LBB0_41:                               # %for.body490
                                        #   in Loop: Header=BB0_40 Depth=1
	incl	EdgeProfCounters+244(%rip)
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm1
	vmovsd	%xmm1, -32(%rbp)
	vmovsd	-40(%rbp), %xmm0
	vmulsd	A6(%rip), %xmm0, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	-24(%rbp), %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	incl	EdgeProfCounters+252(%rip)
	incq	-72(%rbp)
	incl	EdgeProfCounters+256(%rip)
.LBB0_40:                               # %for.cond486
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	decq	%rax
	cmpq	%rax, -72(%rbp)
	jle	.LBB0_41
# BB#42:                                # %for.end524
	incl	EdgeProfCounters+248(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+192(%rip)
	movabsq	$4598925819483171499, %rax # imm = 0x3FD2AAAAAAAAAAAB
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmulsd	A6(%rip), %xmm0, %xmm1
	vaddsd	A5(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A4(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A3(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A2(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	A1(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmulsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	-40(%rbp), %xmm0
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sb(%rip)
	vmulsd	sa(%rip), %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+192(%rip), %xmm0
	vdivsd	.LCPI0_16(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+200(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-16(%rbp), %xmm0, %xmm1
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmulsd	-48(%rbp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	movq	%rax, sb(%rip)
	vmovsd	sa(%rip), %xmm0
	vaddsd	.LCPI0_17(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	one(%rip), %xmm0
	vdivsd	T+200(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+208(%rip)
	vmovsd	.LCPI0_0(%rip), %xmm1
	vmovaps	%xmm1, %xmm3
	vmulsd	%xmm3, %xmm0, %xmm2
	vmulsd	T+192(%rip), %xmm3, %xmm1
	vmulsd	sc(%rip), %xmm3, %xmm0
	movl	$.L.str11, %edi
	movb	$3, %al
	callq	printf
	vmovsd	T+48(%rip), %xmm0
	vsubsd	T+40(%rip), %xmm0, %xmm0
	vmulsd	five(%rip), %xmm0, %xmm0
	vaddsd	T+72(%rip), %xmm0, %xmm0
	vdivsd	.LCPI0_18(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+216(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, T+224(%rip)
	vmovsd	T+16(%rip), %xmm0
	vaddsd	T+72(%rip), %xmm0, %xmm0
	vaddsd	T+96(%rip), %xmm0, %xmm0
	vaddsd	T+120(%rip), %xmm0, %xmm0
	vaddsd	T+144(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+232(%rip)
	vmovsd	four(%rip), %xmm1
	vmulsd	T+168(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vdivsd	.LCPI0_19(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+232(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, T+240(%rip)
	vmovsd	T+16(%rip), %xmm0
	vaddsd	T+72(%rip), %xmm0, %xmm0
	vaddsd	T+96(%rip), %xmm0, %xmm0
	vaddsd	T+120(%rip), %xmm0, %xmm0
	vaddsd	T+144(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+248(%rip)
	vaddsd	T+168(%rip), %xmm0, %xmm0
	vaddsd	T+192(%rip), %xmm0, %xmm0
	vdivsd	.LCPI0_20(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+248(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, T+256(%rip)
	vmovsd	T+72(%rip), %xmm0
	vaddsd	T+96(%rip), %xmm0, %xmm0
	vaddsd	T+144(%rip), %xmm0, %xmm0
	vaddsd	T+192(%rip), %xmm0, %xmm0
	vdivsd	.LCPI0_21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+264(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, T+272(%rip)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movq	-80(%rbp), %rsi
	movl	$.L.str12, %edi
	xorb	%al, %al
	callq	printf
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmulsd	nulltime(%rip), %xmm0, %xmm0
	movl	$.L.str13, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmulsd	T+224(%rip), %xmm0, %xmm0
	movl	$.L.str14, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmulsd	T+240(%rip), %xmm0, %xmm0
	movl	$.L.str15, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmulsd	T+256(%rip), %xmm0, %xmm0
	movl	$.L.str16, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmulsd	T+272(%rip), %xmm0, %xmm0
	movl	$.L.str17, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$96, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4517329193108106637     # double 1.0E-6
	.text
	.globl	dtime
	.align	16, 0x90
	.type	dtime,@function
dtime:                                  # @dtime
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+260(%rip)
	movq	%rdi, -8(%rbp)
	vmovsd	16(%rdi), %xmm0
	vmovsd	%xmm0, -16(%rbp)
	movl	$tnow, %edi
	xorl	%esi, %esi
	callq	gettimeofday
	vcvtsi2sdq	tnow(%rip), %xmm0, %xmm0
	vcvtsi2sdq	tnow+8(%rip), %xmm0, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	-8(%rbp), %rax
	vmovsd	%xmm0, 16(%rax)
	movq	-8(%rbp), %rax
	vmovsd	16(%rax), %xmm0
	vsubsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	dtime, .Ltmp11-dtime
	.cfi_endproc

	.type	A0,@object              # @A0
	.data
	.globl	A0
	.align	8
A0:
	.quad	4607182418800017408     # double 1
	.size	A0, 8

	.type	A1,@object              # @A1
	.globl	A1
	.align	8
A1:
	.quad	-4628199217061062907    # double -0.1666666666671334
	.size	A1, 8

	.type	A2,@object              # @A2
	.globl	A2
	.align	8
A2:
	.quad	4575957461386324387     # double 0.00833333333809067
	.size	A2, 8

	.type	A3,@object              # @A3
	.globl	A3
	.align	8
A3:
	.quad	4551452161186318961     # double 1.98412715551283E-4
	.size	A3, 8

	.type	A4,@object              # @A4
	.globl	A4
	.align	8
A4:
	.quad	4523617278161991014     # double 2.7557589750762E-6
	.size	A4, 8

	.type	A5,@object              # @A5
	.globl	A5
	.align	8
A5:
	.quad	4493162352400180262     # double 2.507059876207E-8
	.size	A5, 8

	.type	A6,@object              # @A6
	.globl	A6
	.align	8
A6:
	.quad	4460408574331961766     # double 1.64105986683E-10
	.size	A6, 8

	.type	B0,@object              # @B0
	.globl	B0
	.align	8
B0:
	.quad	4607182418800017408     # double 1
	.size	B0, 8

	.type	B1,@object              # @B1
	.globl	B1
	.align	8
B1:
	.quad	-4620693217682161322    # double -0.4999999999982
	.size	B1, 8

	.type	B2,@object              # @B2
	.globl	B2
	.align	8
B2:
	.quad	4586165620536050212     # double 0.04166666664651
	.size	B2, 8

	.type	B3,@object              # @B3
	.globl	B3
	.align	8
B3:
	.quad	-4659324094869183210    # double -0.001388888805755
	.size	B3, 8

	.type	B4,@object              # @B4
	.globl	B4
	.align	8
B4:
	.quad	4537941314664410551     # double 2.4801428034E-5
	.size	B4, 8

	.type	B5,@object              # @B5
	.globl	B5
	.align	8
B5:
	.quad	-4714569847609107570    # double -2.754213324E-7
	.size	B5, 8

	.type	B6,@object              # @B6
	.globl	B6
	.align	8
B6:
	.quad	4476955928576333866     # double 2.0189405E-9
	.size	B6, 8

	.type	C0,@object              # @C0
	.globl	C0
	.align	8
C0:
	.quad	4607182418800017408     # double 1
	.size	C0, 8

	.type	C1,@object              # @C1
	.globl	C1
	.align	8
C1:
	.quad	4607182418770113506     # double 0.9999999966799999
	.size	C1, 8

	.type	C2,@object              # @C2
	.globl	C2
	.align	8
C2:
	.quad	4602678818303091896     # double 0.49999995173
	.size	C2, 8

	.type	C3,@object              # @C3
	.globl	C3
	.align	8
C3:
	.quad	4595172833331996949     # double 0.16666704243
	.size	C3, 8

	.type	C4,@object              # @C4
	.globl	C4
	.align	8
C4:
	.quad	4586165646998984008     # double 0.04166685027
	.size	C4, 8

	.type	C5,@object              # @C5
	.globl	C5
	.align	8
C5:
	.quad	4575953652716999180     # double 0.008326726350000001
	.size	C5, 8

	.type	C6,@object              # @C6
	.globl	C6
	.align	8
C6:
	.quad	4564137743291747333     # double 0.00140836136
	.size	C6, 8

	.type	C7,@object              # @C7
	.globl	C7
	.align	8
C7:
	.quad	4550536094195072826     # double 1.7358267E-4
	.size	C7, 8

	.type	C8,@object              # @C8
	.globl	C8
	.align	8
C8:
	.quad	4540926964768485839     # double 3.931683E-5
	.size	C8, 8

	.type	D1,@object              # @D1
	.globl	D1
	.align	8
D1:
	.quad	4585925428481590132     # double 0.03999999946405
	.size	D1, 8

	.type	D2,@object              # @D2
	.globl	D2
	.align	8
D2:
	.quad	4561993660426952041     # double 9.6E-4
	.size	D2, 8

	.type	D3,@object              # @D3
	.globl	D3
	.align	8
D3:
	.quad	4518430227020687144     # double 1.233153E-6
	.size	D3, 8

	.type	E2,@object              # @E2
	.globl	E2
	.align	8
E2:
	.quad	4557490060799581545     # double 4.8E-4
	.size	E2, 8

	.type	E3,@object              # @E3
	.globl	E3
	.align	8
E3:
	.quad	4511364161231096202     # double 4.11051E-7
	.size	E3, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "\n"
	.size	.L.str, 2

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\n\n"
	.size	.L.str1, 58

	.type	T,@object               # @T
	.comm	T,288,16
	.type	TLimit,@object          # @TLimit
	.comm	TLimit,8,8
	.type	piref,@object           # @piref
	.comm	piref,8,8
	.type	one,@object             # @one
	.comm	one,8,8
	.type	two,@object             # @two
	.comm	two,8,8
	.type	three,@object           # @three
	.comm	three,8,8
	.type	four,@object            # @four
	.comm	four,8,8
	.type	five,@object            # @five
	.comm	five,8,8
	.type	scale,@object           # @scale
	.comm	scale,8,8
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "   Module     Error        RunTime      MFLOPS\n"
	.size	.L.str2, 48

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "                            (usec)\n"
	.size	.L.str3, 36

	.type	TimeArray,@object       # @TimeArray
	.comm	TimeArray,24,16
	.type	sa,@object              # @sa
	.comm	sa,8,8
	.type	nulltime,@object        # @nulltime
	.comm	nulltime,8,8
	.type	sb,@object              # @sb
	.comm	sb,8,8
	.type	sc,@object              # @sc
	.comm	sc,8,8
	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "     1   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str4, 36

	.type	piprg,@object           # @piprg
	.comm	piprg,8,8
	.type	pierr,@object           # @pierr
	.comm	pierr,8,8
	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "     2   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str5, 36

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "     3   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str6, 36

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "     4   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str7, 36

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "     5   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str8, 36

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	 "     6   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str9, 36

	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	 "     7   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str10, 36

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "     8   %13.4lf  %10.4lf  %10.4lf\n"
	.size	.L.str11, 36

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	 "   Iterations      = %10ld\n"
	.size	.L.str12, 28

	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	 "   NullTime (usec) = %10.4lf\n"
	.size	.L.str13, 30

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	 "   MFLOPS(1)       = %10.4lf\n"
	.size	.L.str14, 30

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	 "   MFLOPS(2)       = %10.4lf\n"
	.size	.L.str15, 30

	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	 "   MFLOPS(3)       = %10.4lf\n"
	.size	.L.str16, 30

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	 "   MFLOPS(4)       = %10.4lf\n\n"
	.size	.L.str17, 31

	.type	tnow,@object            # @tnow
	.comm	tnow,16,8
	.type	sd,@object              # @sd
	.comm	sd,8,8
	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,264,16

	.section	".note.GNU-stack","",@progbits
