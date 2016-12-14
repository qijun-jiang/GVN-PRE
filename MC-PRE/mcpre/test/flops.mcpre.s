	.file	"test/flops.mcpre.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4158027847206421152     # double 1.0E-30
.LCPI0_1:
	.quad	4624070917402656768     # double 14
.LCPI0_2:
	.quad	-4595585649759538381    # double -25.2
.LCPI0_4:
	.quad	4619567317775286272     # double 7
.LCPI0_5:
	.quad	-4593882726150438912    # double -31.25
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
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Ltmp6:
	.cfi_offset %rbx, -32
.Ltmp7:
	.cfi_offset %r14, -24
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	movabsq	$4634204016564240384, %rax # imm = 0x4050000000000000
	movq	%rax, T+8(%rip)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, TLimit(%rip)
	movabsq	$4614256656552045848, %rcx # imm = 0x400921FB54442D18
	movq	%rcx, piref(%rip)
	movabsq	$4617315517961601024, %rcx # imm = 0x4014000000000000
	movabsq	$4616189618054758400, %rdx # imm = 0x4010000000000000
	movabsq	$4613937818241073152, %rsi # imm = 0x4008000000000000
	movabsq	$4611686018427387904, %rdi # imm = 0x4000000000000000
	movq	%rax, one(%rip)
	movq	%rdi, two(%rip)
	movq	%rsi, three(%rip)
	movq	%rdx, four(%rip)
	movq	%rcx, five(%rip)
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
	movl	$15625, %ebx            # imm = 0x3D09
	movq	$0, sa(%rip)
                                        # implicit-def: XMM0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
                                        # implicit-def: XMM0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	.align	16, 0x90
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	vmovsd	TLimit(%rip), %xmm0
	vucomisd	sa(%rip), %xmm0
	jbe	.LBB0_6
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	vmovsd	one(%rip), %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	-24(%rbp), %xmm7        # 8-byte Reload
	addq	%rbx, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm7, %xmm5
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_4:                                # %for.body.split.split.split
                                        #   in Loop: Header=BB0_3 Depth=2
	vaddsd	%xmm7, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm1
	vmulsd	D3(%rip), %xmm1, %xmm2
	vaddsd	D2(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm2
	vmulsd	E3(%rip), %xmm1, %xmm4
	vmovsd	D1(%rip), %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	vaddsd	E2(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vmulsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm7, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm6, %xmm6
.LBB0_3:                                # %for.cond
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rax
	leaq	-1(%rbx), %rcx
	cmpq	%rcx, %rax
	jle	.LBB0_4
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	vmovsd	%xmm6, -32(%rbp)        # 8-byte Spill
	vmovsd	%xmm5, -24(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	TimeArray+8(%rip), %xmm0
	vmovsd	%xmm0, sa(%rip)
	cmpq	$512000000, %rbx        # imm = 0x1E848000
	jne	.LBB0_1
.LBB0_6:                                # %while.end
	movabsq	$4580238643237355394, %rax # imm = 0x3F9046C764ADFF82
	movq	%rax, scale(%rip)
	movq	%rax, T+8(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	xorl	%eax, %eax
	decq	%rbx
	.align	16, 0x90
.LBB0_7:                                # %for.cond29
                                        # =>This Inner Loop Header: Depth=1
	incq	%rax
	cmpq	%rbx, %rax
	jle	.LBB0_7
# BB#8:                                 # %for.end36
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, nulltime(%rip)
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_10
# BB#9:                                 # %if.then41
	movq	$0, nulltime(%rip)
.LBB0_10:                               # %if.end42
	vmovsd	T+8(%rip), %xmm0
	vmulsd	sa(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+16(%rip)
	vmovsd	D1(%rip), %xmm0
	vaddsd	one(%rip), %xmm0, %xmm1
	vaddsd	D2(%rip), %xmm0, %xmm0
	vaddsd	D3(%rip), %xmm0, %xmm0
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
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vmovsd	sa(%rip), %xmm2
	vaddsd	sb(%rip), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	one(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	vmovsd	%xmm0, sb(%rip)
	vaddsd	.LCPI0_2(%rip), %xmm0, %xmm0
	vmovsd	scale(%rip), %xmm1
	vmovsd	%xmm1, -24(%rbp)        # 8-byte Spill
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
	vmovsd	one(%rip), %xmm0
	vxorpd	.LCPI0_3(%rip), %xmm0, %xmm0
	vmovsd	five(%rip), %xmm1
	vmovsd	%xmm1, -40(%rbp)        # 8-byte Spill
	vmovsd	%xmm0, sa(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	.LCPI0_3(%rip), %xmm1
	xorl	%eax, %eax
	vcvttsd2si	-32(%rbp), %rcx # 8-byte Folded Reload
	imulq	$40000, %rcx, %rcx      # imm = 0x9C40
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vdivsd	-24(%rbp), %xmm0, %xmm0 # 8-byte Folded Reload
	vmovsd	-40(%rbp), %xmm2        # 8-byte Reload
	vxorpd	%xmm1, %xmm2, %xmm2
	vcvttsd2si	%xmm0, %rbx
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_12:                               # %for.body75
                                        #   in Loop: Header=BB0_11 Depth=1
	vmovsd	sa(%rip), %xmm0
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vxorpd	%xmm1, %xmm2, %xmm2
.LBB0_11:                               # %for.cond72
                                        # =>This Inner Loop Header: Depth=1
	incq	%rax
	cmpq	%rbx, %rax
	jle	.LBB0_12
# BB#13:                                # %for.end80
	vmovsd	%xmm2, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+40(%rip)
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_15
# BB#14:                                # %if.then85
	movq	$0, T+40(%rip)
.LBB0_15:                               # %if.end86.split
	vcvtsi2sdq	%rbx, %xmm0, %xmm0
	vmovsd	%xmm0, sc(%rip)
	vmovsd	sa(%rip), %xmm0
	vmovsd	%xmm0, -40(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	-40(%rbp), %xmm7        # 8-byte Reload
	xorl	%eax, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	.LCPI0_3(%rip), %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vmovsd	-32(%rbp), %xmm2        # 8-byte Reload
	jmp	.LBB0_16
	.align	16, 0x90
.LBB0_17:                               # %for.inc102
                                        #   in Loop: Header=BB0_16 Depth=1
	vmovsd	sa(%rip), %xmm0
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vxorpd	%xmm3, %xmm2, %xmm0
	vaddsd	two(%rip), %xmm7, %xmm7
	vsubsd	%xmm7, %xmm0, %xmm1
	vaddsd	%xmm1, %xmm5, %xmm5
	vdivsd	%xmm7, %xmm2, %xmm1
	vmulsd	%xmm7, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm4, %xmm4
	vmulsd	%xmm4, %xmm4, %xmm2
	vmovsd	%xmm2, -24(%rbp)        # 8-byte Spill
	vsubsd	%xmm1, %xmm6, %xmm6
	vmovapd	%xmm0, %xmm2
.LBB0_16:                               # %for.cond89
                                        # =>This Inner Loop Header: Depth=1
	incq	%rax
	cmpq	%rbx, %rax
	jle	.LBB0_17
# BB#18:                                # %for.end104.split
	movl	$TimeArray, %edi
	vmovsd	%xmm4, -48(%rbp)        # 8-byte Spill
	vmovsd	%xmm5, -32(%rbp)        # 8-byte Spill
	vmovsd	%xmm6, -40(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm1
	vmovsd	%xmm1, T+48(%rip)
	vmovsd	-24(%rbp), %xmm0        # 8-byte Reload
	vmovsd	-48(%rbp), %xmm3        # 8-byte Reload
	vmulsd	%xmm3, %xmm0, %xmm0
	vsubsd	T+40(%rip), %xmm1, %xmm1
	vdivsd	.LCPI0_4(%rip), %xmm1, %xmm1
	vmovsd	.LCPI0_5(%rip), %xmm2
	vdivsd	%xmm0, %xmm2, %xmm0
	movabsq	$4629489310704336896, %rax # imm = 0x403F400000000000
	vmovsd	%xmm1, T+56(%rip)
	vmovsd	-40(%rbp), %xmm1        # 8-byte Reload
	vmulsd	four(%rip), %xmm1, %xmm1
	vdivsd	five(%rip), %xmm1, %xmm1
	vmovsd	-32(%rbp), %xmm2        # 8-byte Reload
	vmulsd	sa(%rip), %xmm2, %xmm2
	vdivsd	sc(%rip), %xmm2, %xmm2
	vmovsd	%xmm2, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm1, sa(%rip)
	vmovsd	five(%rip), %xmm2
	vdivsd	%xmm3, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, sb(%rip)
	movq	%rax, sc(%rip)
	vaddsd	sb(%rip), %xmm0, %xmm0
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
	vcvttsd2si	-24(%rbp), %r14 # 8-byte Folded Reload
	vcvtsi2sdq	%r14, %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	piref(%rip), %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vmovsd	-32(%rbp), %xmm1        # 8-byte Reload
	vdivsd	-24(%rbp), %xmm1, %xmm5 # 8-byte Folded Reload
	leaq	-1(%r14), %rbx
	vxorps	%xmm6, %xmm6, %xmm6
	jmp	.LBB0_19
	.align	16, 0x90
.LBB0_20:                               # %for.body135.split.split.split.split
                                        #   in Loop: Header=BB0_19 Depth=1
	vmovsd	one(%rip), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm3
	vmulsd	A6(%rip), %xmm3, %xmm4
	vsubsd	A5(%rip), %xmm4, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vaddsd	A4(%rip), %xmm4, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vsubsd	A3(%rip), %xmm4, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vaddsd	A2(%rip), %xmm4, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vaddsd	A1(%rip), %xmm4, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm3
	vaddsd	%xmm1, %xmm3, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm6, %xmm6
.LBB0_19:                               # %for.cond131
                                        # =>This Inner Loop Header: Depth=1
	incq	%rax
	cmpq	%rbx, %rax
	jle	.LBB0_20
# BB#21:                                # %for.end155.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm5, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm6, -32(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+72(%rip)
	vmovsd	piref(%rip), %xmm0
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	vdivsd	three(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	A6(%rip), %xmm1, %xmm2
	vsubsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vsubsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	vaddsd	one(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	T+72(%rip), %xmm0
	vdivsd	.LCPI0_6(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+80(%rip)
	vmovsd	two(%rip), %xmm0
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
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
	vcvtsi2sdq	%r14, %xmm0, %xmm0
	vmovsd	A3(%rip), %xmm1
	vmovsd	.LCPI0_3(%rip), %xmm2
	vxorpd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, A3(%rip)
	vmovsd	A5(%rip), %xmm1
	vxorpd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, A5(%rip)
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	piref(%rip), %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	movl	$1, %eax
	vxorps	%xmm3, %xmm3, %xmm3
	vmovsd	-32(%rbp), %xmm0        # 8-byte Reload
	vdivsd	-24(%rbp), %xmm0, %xmm2 # 8-byte Folded Reload
	jmp	.LBB0_22
	.align	16, 0x90
.LBB0_23:                               # %for.inc212
                                        #   in Loop: Header=BB0_22 Depth=1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	B6(%rip), %xmm0, %xmm1
	vaddsd	B5(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	incq	%rax
	vaddsd	B4(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B3(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B2(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	B1(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm0
	vaddsd	one(%rip), %xmm0, %xmm3
.LBB0_22:                               # %for.cond191
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	jle	.LBB0_23
# BB#24:                                # %for.end214.split.split.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm2, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm3, -32(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+96(%rip)
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
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
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vmovsd	sa(%rip), %xmm2
	vaddsd	one(%rip), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, sa(%rip)
	vmovsd	piref(%rip), %xmm0
	vdivsd	three(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	A6(%rip), %xmm1, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	vaddsd	A0(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
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
	vcvtsi2sdq	%r14, %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	piref(%rip), %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	movl	$1, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	vmovsd	-32(%rbp), %xmm0        # 8-byte Reload
	vdivsd	-24(%rbp), %xmm0, %xmm5 # 8-byte Folded Reload
	jmp	.LBB0_25
	.align	16, 0x90
.LBB0_26:                               # %for.inc298
                                        #   in Loop: Header=BB0_25 Depth=1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	B6(%rip), %xmm1, %xmm2
	vaddsd	B5(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm3
	incq	%rax
	vmovsd	one(%rip), %xmm2
	vaddsd	B4(%rip), %xmm3, %xmm3
	vmulsd	%xmm3, %xmm1, %xmm4
	vmulsd	A6(%rip), %xmm1, %xmm3
	vaddsd	A5(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A4(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A3(%rip), %xmm3, %xmm3
	vaddsd	B3(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B2(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B1(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	%xmm2, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A2(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A1(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm6, %xmm6
.LBB0_25:                               # %for.cond263
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	jle	.LBB0_26
# BB#27:                                # %for.end300.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm5, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm6, -32(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+120(%rip)
	vmovsd	piref(%rip), %xmm0
	movabsq	$4604418534313441775, %rax # imm = 0x3FE62E42FEFA39EF
	vdivsd	three(%rip), %xmm0, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm0
	vmulsd	A6(%rip), %xmm0, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	one(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, sa(%rip)
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
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
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
	vcvtsi2sdq	%r14, %xmm0, %xmm0
	vmulsd	four(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	piref(%rip), %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	movl	$1, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	vmovsd	-32(%rbp), %xmm0        # 8-byte Reload
	vdivsd	-24(%rbp), %xmm0, %xmm5 # 8-byte Folded Reload
	jmp	.LBB0_28
	.align	16, 0x90
.LBB0_29:                               # %for.inc382
                                        #   in Loop: Header=BB0_28 Depth=1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	B6(%rip), %xmm1, %xmm2
	vaddsd	B5(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm3
	incq	%rax
	vmovsd	one(%rip), %xmm2
	vaddsd	B4(%rip), %xmm3, %xmm3
	vmulsd	%xmm3, %xmm1, %xmm4
	vmulsd	A6(%rip), %xmm1, %xmm3
	vaddsd	A5(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A4(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A3(%rip), %xmm3, %xmm3
	vaddsd	B3(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B2(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B1(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	%xmm2, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A2(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A1(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm6, %xmm6
.LBB0_28:                               # %for.cond347
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	jle	.LBB0_29
# BB#30:                                # %for.end384.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm5, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm6, -32(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+144(%rip)
	vmovsd	piref(%rip), %xmm0
	movabsq	$4598175219545276416, %rax # imm = 0x3FD0000000000000
	vdivsd	four(%rip), %xmm0, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm0
	vmulsd	A6(%rip), %xmm0, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	one(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, sa(%rip)
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
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
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
	movabsq	$4636901401919853220, %rax # imm = 0x40599541F7F192A4
	vmovsd	one(%rip), %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	movq	%rax, sa(%rip)
	movl	$TimeArray, %edi
	callq	dtime
	vmovsd	-24(%rbp), %xmm3        # 8-byte Reload
	vcvtsi2sdq	%r14, %xmm0, %xmm0
	vmovsd	.LCPI0_12(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm5
	movl	$1, %eax
	vxorps	%xmm4, %xmm4, %xmm4
	jmp	.LBB0_31
	.align	16, 0x90
.LBB0_32:                               # %for.inc448
                                        #   in Loop: Header=BB0_31 Depth=1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm0
	vaddsd	%xmm3, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm3, %xmm1
	incq	%rax
	vsubsd	%xmm1, %xmm4, %xmm1
	vsubsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm4
.LBB0_31:                               # %for.cond430
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	jle	.LBB0_32
# BB#33:                                # %for.end450.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm4, -32(%rbp)        # 8-byte Spill
	vmovsd	%xmm5, -40(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vdivsd	.LCPI0_13(%rip), %xmm0, %xmm2
	vmovsd	%xmm0, T+168(%rip)
	vmovsd	-40(%rbp), %xmm0        # 8-byte Reload
	vmulsd	.LCPI0_14(%rip), %xmm0, %xmm0
	vmovsd	-24(%rbp), %xmm5        # 8-byte Reload
	vxorpd	.LCPI0_3(%rip), %xmm5, %xmm1
	vmovsd	%xmm2, T+176(%rip)
	vmovsd	sa(%rip), %xmm2
	vmulsd	%xmm2, %xmm2, %xmm4
	vmulsd	%xmm4, %xmm2, %xmm3
	vaddsd	%xmm5, %xmm3, %xmm3
	vdivsd	%xmm3, %xmm4, %xmm3
	vaddsd	%xmm5, %xmm4, %xmm4
	vdivsd	%xmm4, %xmm2, %xmm4
	vaddsd	%xmm5, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm5, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm4, %xmm1, %xmm1
	vsubsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, sa(%rip)
	vmovsd	-32(%rbp), %xmm2        # 8-byte Reload
	vmulsd	two(%rip), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	vmovsd	%xmm0, sa(%rip)
	vaddsd	.LCPI0_15(%rip), %xmm0, %xmm0
	vmovsd	scale(%rip), %xmm1
	vmovsd	%xmm1, -24(%rbp)        # 8-byte Spill
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
	vcvttsd2si	-32(%rbp), %rax # 8-byte Folded Reload
	imulq	$-2000, %rax, %rax      # imm = 0xFFFFFFFFFFFFF830
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	-24(%rbp), %xmm0, %xmm0 # 8-byte Folded Reload
	vcvttsd2si	%xmm0, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm0
	vmulsd	three(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        # 8-byte Spill
	vmovsd	piref(%rip), %xmm0
	vmovsd	%xmm0, -32(%rbp)        # 8-byte Spill
	movl	$TimeArray, %edi
	callq	dtime
	movl	$1, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	vmovsd	-32(%rbp), %xmm0        # 8-byte Reload
	vdivsd	-24(%rbp), %xmm0, %xmm5 # 8-byte Folded Reload
	leaq	-1(%rbx), %rcx
	jmp	.LBB0_34
	.align	16, 0x90
.LBB0_35:                               # %for.inc522
                                        #   in Loop: Header=BB0_34 Depth=1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	A6(%rip), %xmm1, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm3
	incq	%rax
	vmovsd	one(%rip), %xmm2
	vaddsd	A4(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vmulsd	B6(%rip), %xmm1, %xmm4
	vaddsd	B5(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B4(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B3(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	A3(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A2(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	A1(%rip), %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm3
	vaddsd	B2(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm4
	vaddsd	B1(%rip), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm6, %xmm6
.LBB0_34:                               # %for.cond486
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rax
	jle	.LBB0_35
# BB#36:                                # %for.end524.split.split
	movl	$TimeArray, %edi
	vmovsd	%xmm5, -24(%rbp)        # 8-byte Spill
	vmovsd	%xmm6, -32(%rbp)        # 8-byte Spill
	callq	dtime
	vmovsd	T+8(%rip), %xmm0
	vmulsd	TimeArray+8(%rip), %xmm0, %xmm0
	vsubsd	nulltime(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, T+192(%rip)
	vmovsd	piref(%rip), %xmm0
	movabsq	$4598925819483171499, %rax # imm = 0x3FD2AAAAAAAAAAAB
	vdivsd	three(%rip), %xmm0, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm0
	vmulsd	A6(%rip), %xmm0, %xmm2
	vaddsd	A5(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A4(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A3(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A2(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	A1(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	one(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, sa(%rip)
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
	vmulsd	-32(%rbp), %xmm0, %xmm1 # 8-byte Folded Reload
	vaddsd	sa(%rip), %xmm1, %xmm1
	vmovsd	-24(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm1
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
	movl	$.L.str12, %edi
	movq	%rbx, %rsi
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
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp8:
	.size	main, .Ltmp8-main
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
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp15:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	vmovsd	16(%rbx), %xmm0
	vmovsd	%xmm0, -16(%rbp)        # 8-byte Spill
	movl	$tnow, %edi
	xorl	%esi, %esi
	callq	gettimeofday
	vcvtsi2sdq	tnow(%rip), %xmm0, %xmm0
	vcvtsi2sdq	tnow+8(%rip), %xmm0, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rbx)
	vsubsd	-16(%rbp), %xmm0, %xmm0 # 8-byte Folded Reload
	vmovsd	%xmm0, 8(%rbx)
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp16:
	.size	dtime, .Ltmp16-dtime
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

	.section	".note.GNU-stack","",@progbits
