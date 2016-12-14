	.file	"test/n-body.profile.ls.bc"
	.text
	.globl	advance
	.align	16, 0x90
	.type	advance,@function
advance:                                # @advance
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
	incl	EdgeProfCounters(%rip)
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	vmovsd	%xmm0, -24(%rbp)
	movl	$0, -28(%rbp)
	incl	EdgeProfCounters+4(%rip)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_5:                                # %for.inc43
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	incl	EdgeProfCounters+36(%rip)
	incl	-28(%rbp)
	incl	EdgeProfCounters+40(%rip)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-28(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB0_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movslq	-28(%rbp), %rax
	imulq	$56, %rax, %rax
	addq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movl	%eax, -32(%rbp)
	incl	EdgeProfCounters+16(%rip)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_4:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+20(%rip)
	movslq	-32(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, -48(%rbp)
	movq	-40(%rbp), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	movq	-40(%rbp), %rax
	vmovsd	8(%rax), %xmm0
	movq	-48(%rbp), %rax
	vsubsd	8(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movq	-40(%rbp), %rax
	vmovsd	16(%rax), %xmm0
	movq	-48(%rbp), %rax
	vsubsd	16(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vmovsd	-64(%rbp), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vmovsd	-56(%rbp), %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	callq	sqrt
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	-24(%rbp), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-48(%rbp), %rax
	vmovsd	-56(%rbp), %xmm1
	vmulsd	48(%rax), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	movq	-40(%rbp), %rax
	vmovsd	24(%rax), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 24(%rax)
	movq	-48(%rbp), %rax
	vmovsd	-64(%rbp), %xmm0
	vmulsd	48(%rax), %xmm0, %xmm0
	vmulsd	-88(%rbp), %xmm0, %xmm0
	movq	-40(%rbp), %rax
	vmovsd	32(%rax), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 32(%rax)
	movq	-48(%rbp), %rax
	vmovsd	-72(%rbp), %xmm0
	vmulsd	48(%rax), %xmm0, %xmm0
	vmulsd	-88(%rbp), %xmm0, %xmm0
	movq	-40(%rbp), %rax
	vmovsd	40(%rax), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 40(%rax)
	movq	-40(%rbp), %rax
	vmovsd	-56(%rbp), %xmm0
	vmulsd	48(%rax), %xmm0, %xmm0
	vmulsd	-88(%rbp), %xmm0, %xmm0
	movq	-48(%rbp), %rax
	vaddsd	24(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rax)
	movq	-40(%rbp), %rax
	vmovsd	-64(%rbp), %xmm0
	vmulsd	48(%rax), %xmm0, %xmm0
	vmulsd	-88(%rbp), %xmm0, %xmm0
	movq	-48(%rbp), %rax
	vaddsd	32(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rax)
	movq	-40(%rbp), %rax
	vmovsd	-72(%rbp), %xmm0
	vmulsd	48(%rax), %xmm0, %xmm0
	vmulsd	-88(%rbp), %xmm0, %xmm0
	movq	-48(%rbp), %rax
	vaddsd	40(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%rax)
	incl	EdgeProfCounters+28(%rip)
	incl	-32(%rbp)
	incl	EdgeProfCounters+32(%rip)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-32(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB0_5
	jmp	.LBB0_4
.LBB0_6:                                # %for.end45
	incl	EdgeProfCounters+12(%rip)
	movl	$0, -28(%rbp)
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_8:                                # %for.inc64
                                        #   in Loop: Header=BB0_7 Depth=1
	incl	EdgeProfCounters+48(%rip)
	movslq	-28(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, -96(%rbp)
	vmovsd	-24(%rbp), %xmm0
	vmulsd	24(%rcx,%rax), %xmm0, %xmm0
	vaddsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax)
	movq	-96(%rbp), %rax
	vmovsd	-24(%rbp), %xmm0
	vmulsd	32(%rax), %xmm0, %xmm0
	vaddsd	8(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	movq	-96(%rbp), %rax
	vmovsd	-24(%rbp), %xmm0
	vmulsd	40(%rax), %xmm0, %xmm0
	vaddsd	16(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rax)
	incl	EdgeProfCounters+56(%rip)
	incl	-28(%rbp)
	incl	EdgeProfCounters+60(%rip)
.LBB0_7:                                # %for.cond46
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB0_8
# BB#9:                                 # %for.end66
	incl	EdgeProfCounters+52(%rip)
	addq	$96, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	advance, .Ltmp5-advance
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4602678819172646912     # double 0.5
	.text
	.globl	energy
	.align	16, 0x90
	.type	energy,@function
energy:                                 # @energy
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
	subq	$80, %rsp
	incl	EdgeProfCounters+64(%rip)
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	incl	EdgeProfCounters+68(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_5:                                # %for.inc30
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+88(%rip)
	incl	EdgeProfCounters+100(%rip)
	incl	-28(%rbp)
	incl	EdgeProfCounters+104(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	-28(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB1_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+72(%rip)
	movslq	-28(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, -40(%rbp)
	vmovsd	24(%rcx,%rax), %xmm0
	vmovsd	32(%rcx,%rax), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	40(%rcx,%rax), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1
	vmulsd	48(%rcx,%rax), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movl	%eax, -32(%rbp)
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	EdgeProfCounters+84(%rip)
	movslq	-32(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, -48(%rbp)
	movq	-40(%rbp), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	movq	-40(%rbp), %rax
	vmovsd	8(%rax), %xmm0
	movq	-48(%rbp), %rax
	vsubsd	8(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movq	-40(%rbp), %rax
	vmovsd	16(%rax), %xmm0
	movq	-48(%rbp), %rax
	vsubsd	16(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vmovsd	-64(%rbp), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vmovsd	-56(%rbp), %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	callq	sqrt
	vmovsd	%xmm0, -80(%rbp)
	movq	-40(%rbp), %rax
	vmovsd	48(%rax), %xmm1
	movq	-48(%rbp), %rax
	vmulsd	48(%rax), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	-24(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	incl	EdgeProfCounters+92(%rip)
	incl	-32(%rbp)
	incl	EdgeProfCounters+96(%rip)
.LBB1_3:                                # %for.cond11
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-32(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB1_5
	jmp	.LBB1_4
.LBB1_6:                                # %for.end32
	incl	EdgeProfCounters+76(%rip)
	vmovsd	-24(%rbp), %xmm0
	addq	$80, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	energy, .Ltmp11-energy
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_1:
	.quad	4630752910647379422     # double 39.47841760435743
	.text
	.globl	offset_momentum
	.align	16, 0x90
	.type	offset_momentum,@function
offset_momentum:                        # @offset_momentum
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+108(%rip)
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -44(%rbp)
	incl	EdgeProfCounters+112(%rip)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+116(%rip)
	movslq	-44(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	24(%rcx,%rax), %xmm0
	vmulsd	48(%rcx,%rax), %xmm0, %xmm0
	vaddsd	-24(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	movslq	-44(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	32(%rcx,%rax), %xmm0
	vmulsd	48(%rcx,%rax), %xmm0, %xmm0
	vaddsd	-32(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	movslq	-44(%rbp), %rax
	imulq	$56, %rax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	40(%rcx,%rax), %xmm0
	vmulsd	48(%rcx,%rax), %xmm0, %xmm0
	vaddsd	-40(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	incl	EdgeProfCounters+124(%rip)
	incl	-44(%rbp)
	incl	EdgeProfCounters+128(%rip)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB2_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+120(%rip)
	vmovsd	.LCPI2_0(%rip), %xmm0
	vmovsd	-24(%rbp), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm2
	vmovsd	.LCPI2_1(%rip), %xmm1
	vdivsd	%xmm1, %xmm2, %xmm2
	movq	-16(%rbp), %rax
	vmovsd	%xmm2, 24(%rax)
	vmovsd	-32(%rbp), %xmm2
	vxorpd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	movq	-16(%rbp), %rax
	vmovsd	%xmm2, 32(%rax)
	vmovsd	-40(%rbp), %xmm2
	vxorpd	%xmm0, %xmm2, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 40(%rax)
	popq	%rbp
	ret
.Ltmp17:
	.size	offset_momentum, .Ltmp17-offset_momentum
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4576918229304087675     # double 0.01
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp21:
	.cfi_def_cfa_offset 16
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp23:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Ltmp24:
	.cfi_offset %rbx, -24
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$39, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+132(%rip)
	movl	$0, -12(%rbp)
	movl	%eax, -16(%rbp)
	movq	%rbx, -24(%rbp)
	movl	$5000000, -28(%rbp)     # imm = 0x4C4B40
	movl	$5, %edi
	movl	$bodies, %esi
	callq	offset_momentum
	movl	$5, %edi
	movl	$bodies, %esi
	callq	energy
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	movl	$1, -32(%rbp)
	incl	EdgeProfCounters+136(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+140(%rip)
	movl	$5, %edi
	movl	$bodies, %esi
	vmovsd	.LCPI3_0(%rip), %xmm0
	callq	advance
	incl	EdgeProfCounters+148(%rip)
	incl	-32(%rbp)
	incl	EdgeProfCounters+152(%rip)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.LBB3_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+144(%rip)
	movl	$5, %edi
	movl	$bodies, %esi
	callq	energy
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp25:
	.size	main, .Ltmp25-main
	.cfi_endproc

	.type	bodies,@object          # @bodies
	.data
	.globl	bodies
	.align	16
bodies:
	.quad	0                       # double 0
	.quad	0                       # double 0
	.quad	0                       # double 0
	.quad	0                       # double 0
	.quad	0                       # double 0
	.quad	0                       # double 0
	.quad	4630752910647379422     # double 39.47841760435743
	.quad	4617136985637443884     # double 4.841431442464721
	.quad	-4615467600764216452    # double -1.160320044027428
	.quad	-4631240860977730576    # double -0.1036220444711231
	.quad	4603636522180398268     # double 0.606326392995832
	.quad	4613514450253485211     # double 2.81198684491626
	.quad	-4640446117579192555    # double -0.02521836165988763
	.quad	4585593052079010776     # double 0.03769367487038949
	.quad	4620886515960171111     # double 8.34336671824458
	.quad	4616330128746480048     # double 4.124798564124305
	.quad	-4622431185293064580    # double -0.4035234171143214
	.quad	-4616141094713322430    # double -1.010774346178792
	.quad	4610900871547424531     # double 1.825662371230412
	.quad	4576004977915405236     # double 0.008415761376584154
	.quad	4577659745833829943     # double 0.01128632613196877
	.quad	4623448502799161807     # double 12.89436956213913
	.quad	-4598675596822288770    # double -15.11115140169863
	.quad	-4626158513131520608    # double -0.2233075788926557
	.quad	4607555276345777135     # double 1.082791006441535
	.quad	4605999890795117509     # double 0.8687130181696082
	.quad	-4645973824767902084    # double -0.01083263740136364
	.quad	4565592097032511155     # double 0.001723724057059711
	.quad	4624847617829197610     # double 15.37969711485092
	.quad	-4595383180696444384    # double -25.91931460998796
	.quad	4595626498235032896     # double 0.1792587729503712
	.quad	4606994084859067466     # double 0.979090732243898
	.quad	4603531791922690979     # double 0.5946989986476762
	.quad	-4638202354754755082    # double -0.0347559555040781
	.quad	4566835785178257836     # double 0.00203368686992463
	.size	bodies, 280

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%.9f\n"
	.size	.L.str, 6

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,156,16

	.section	".note.GNU-stack","",@progbits
