	.file	"test/n-body.mcpre.bc"
	.text
	.globl	advance
	.align	16, 0x90
	.type	advance,@function
advance:                                # @advance
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp6:
	.cfi_offset %rbx, -56
.Ltmp7:
	.cfi_offset %r12, -48
.Ltmp8:
	.cfi_offset %r13, -40
.Ltmp9:
	.cfi_offset %r14, -32
.Ltmp10:
	.cfi_offset %r15, -24
	vmovsd	%xmm0, -80(%rbp)        # 8-byte Spill
	movq	%rsi, %r13
	movl	%edi, -68(%rbp)         # 4-byte Spill
	leaq	104(%r13), %rcx
	xorl	%edx, %edx
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_5:                                # %for.inc43
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-88(%rbp), %rcx         # 8-byte Reload
	addq	$56, %rcx
	movl	-92(%rbp), %edx         # 4-byte Reload
	incl	%edx
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	-68(%rbp), %edx         # 4-byte Folded Reload
	jge	.LBB0_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	%edx, %rax
	imulq	$56, %rax, %rbx
	addq	%r13, %rbx
	movl	%edx, -92(%rbp)         # 4-byte Spill
	movl	%edx, %r12d
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	movq	%rcx, %r15
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_4:                                # %for.body3.split.split.split.split.split
                                        #   in Loop: Header=BB0_3 Depth=2
	leaq	56(%r15), %r14
	vmovsd	(%rbx), %xmm0
	vmovsd	8(%rbx), %xmm1
	vsubsd	-40(%r15), %xmm1, %xmm1
	vmovsd	%xmm1, -48(%rbp)        # 8-byte Spill
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	-48(%r15), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)        # 8-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rbx), %xmm1
	vsubsd	-32(%r15), %xmm1, %xmm1
	vmovsd	%xmm1, -56(%rbp)        # 8-byte Spill
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	callq	sqrt
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	-80(%rbp), %xmm1        # 8-byte Reload
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	-64(%rbp), %xmm5        # 8-byte Reload
	vmulsd	(%r15), %xmm5, %xmm1
	vmovsd	24(%rbx), %xmm2
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 24(%rbx)
	vmovsd	-48(%rbp), %xmm3        # 8-byte Reload
	vmulsd	(%r15), %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	32(%rbx), %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 32(%rbx)
	vmovsd	-56(%rbp), %xmm4        # 8-byte Reload
	vmulsd	(%r15), %xmm4, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	40(%rbx), %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 40(%rbx)
	vmulsd	48(%rbx), %xmm5, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	-24(%r15), %xmm1, %xmm1
	vmovsd	%xmm1, -24(%r15)
	vmulsd	48(%rbx), %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	-16(%r15), %xmm1, %xmm1
	vmovsd	%xmm1, -16(%r15)
	vmulsd	48(%rbx), %xmm4, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vaddsd	-8(%r15), %xmm0, %xmm0
	vmovsd	%xmm0, -8(%r15)
	movq	%r14, %r15
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%r12d
	cmpl	-68(%rbp), %r12d        # 4-byte Folded Reload
	jge	.LBB0_5
	jmp	.LBB0_4
.LBB0_6:                                # %for.end45
	addq	$40, %r13
	movl	$-1, %eax
	vmovsd	-80(%rbp), %xmm1        # 8-byte Reload
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_8:                                # %for.body48
                                        #   in Loop: Header=BB0_7 Depth=1
	vmulsd	-16(%r13), %xmm1, %xmm0
	vaddsd	-40(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, -40(%r13)
	vmulsd	-8(%r13), %xmm1, %xmm0
	vaddsd	-32(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%r13)
	vmulsd	(%r13), %xmm1, %xmm0
	vaddsd	-24(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%r13)
	leaq	56(%r13), %r13
.LBB0_7:                                # %for.cond46
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	cmpl	-68(%rbp), %eax         # 4-byte Folded Reload
	jl	.LBB0_8
# BB#9:                                 # %for.end66
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp11:
	.size	advance, .Ltmp11-advance
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
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp17:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp18:
	.cfi_offset %rbx, -56
.Ltmp19:
	.cfi_offset %r12, -48
.Ltmp20:
	.cfi_offset %r13, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
	movq	%rsi, -64(%rbp)         # 8-byte Spill
	movl	%edi, %r13d
	leaq	56(%rsi), %rcx
	xorl	%r15d, %r15d
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)        # 8-byte Spill
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_5:                                # %for.inc30
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-56(%rbp), %rcx         # 8-byte Reload
	addq	$56, %rcx
	incl	%r15d
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	cmpl	%r13d, %r15d
	jge	.LBB1_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	%r15d, %rax
	imulq	$56, %rax, %rbx
	movq	-64(%rbp), %rax         # 8-byte Reload
	vmovsd	24(%rax,%rbx), %xmm0
	vmovsd	32(%rax,%rbx), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	40(%rax,%rbx), %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1
	vmulsd	48(%rax,%rbx), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	-48(%rbp), %xmm1        # 8-byte Reload
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -48(%rbp)        # 8-byte Spill
	addq	%rax, %rbx
	movl	%r15d, %r12d
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %r14
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_4:                                # %for.body13.split.split.split
                                        #   in Loop: Header=BB1_3 Depth=2
	vmovsd	(%rbx), %xmm0
	vmovsd	8(%rbx), %xmm1
	vsubsd	8(%r14), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rbx), %xmm1
	vsubsd	16(%r14), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	callq	sqrt
	vmovsd	48(%rbx), %xmm1
	vmulsd	48(%r14), %xmm1, %xmm1
	leaq	56(%r14), %r14
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	-48(%rbp), %xmm1        # 8-byte Reload
	vsubsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -48(%rbp)        # 8-byte Spill
.LBB1_3:                                # %for.cond11
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%r12d
	cmpl	%r13d, %r12d
	jge	.LBB1_5
	jmp	.LBB1_4
.LBB1_6:                                # %for.end32
	vmovsd	-48(%rbp), %xmm0        # 8-byte Reload
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp23:
	.size	energy, .Ltmp23-energy
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
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	leaq	48(%rsi), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$-1, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	vmovsd	(%rax), %xmm3
	vmulsd	-8(%rax), %xmm3, %xmm4
	vaddsd	%xmm4, %xmm2, %xmm2
	vmulsd	-16(%rax), %xmm3, %xmm4
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	-24(%rax), %xmm3, %xmm3
	leaq	56(%rax), %rax
	vaddsd	%xmm3, %xmm1, %xmm1
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ecx
	cmpl	%edi, %ecx
	jl	.LBB2_2
# BB#3:                                 # %for.end
	vmovsd	.LCPI2_0(%rip), %xmm3
	vxorpd	%xmm3, %xmm2, %xmm2
	vmovsd	.LCPI2_1(%rip), %xmm4
	vdivsd	%xmm4, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm4, %xmm0, %xmm0
	vxorpd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm4, %xmm1, %xmm1
	vmovsd	%xmm1, 24(%rsi)
	vmovsd	%xmm0, 32(%rsi)
	vmovsd	%xmm2, 40(%rsi)
	popq	%rbp
	ret
.Ltmp29:
	.size	offset_momentum, .Ltmp29-offset_momentum
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
.Ltmp33:
	.cfi_def_cfa_offset 16
.Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp35:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp36:
	.cfi_offset %rbx, -24
	movl	$5, %edi
	movl	$bodies, %esi
	callq	offset_momentum
	movl	$5, %edi
	movl	$bodies, %esi
	callq	energy
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%ebx, %ebx
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	vmovsd	.LCPI3_0(%rip), %xmm0
	callq	advance
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	movl	$5, %edi
	movl	$bodies, %esi
	cmpl	$5000000, %ebx          # imm = 0x4C4B40
	jle	.LBB3_2
# BB#3:                                 # %for.end
	callq	energy
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp37:
	.size	main, .Ltmp37-main
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


	.section	".note.GNU-stack","",@progbits
