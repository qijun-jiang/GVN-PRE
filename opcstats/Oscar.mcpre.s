	.file	"Oscar.mcpre.bc"
	.text
	.globl	Initrand
	.align	16, 0x90
	.type	Initrand,@function
Initrand:                               # @Initrand
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
	movq	$74755, seed(%rip)      # imm = 0x12403
	popq	%rbp
	ret
.Ltmp5:
	.size	Initrand, .Ltmp5-Initrand
	.cfi_endproc

	.globl	Rand
	.align	16, 0x90
	.type	Rand,@function
Rand:                                   # @Rand
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
	imull	$1309, seed(%rip), %eax # imm = 0x51D
	addl	$13849, %eax            # imm = 0x3619
	movzwl	%ax, %eax
	movq	%rax, seed(%rip)
	movl	seed(%rip), %eax
	popq	%rbp
	ret
.Ltmp11:
	.size	Rand, .Ltmp11-Rand
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_0:
	.long	1065353216              # float 1
	.text
	.globl	Cos
	.align	16, 0x90
	.type	Cos,@function
Cos:                                    # @Cos
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
	vmovaps	%xmm0, %xmm1
	vmovss	.LCPI2_0(%rip), %xmm0
	movl	$1, %eax
	movl	$2, %ecx
	vmovaps	%xmm1, %xmm2
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_6:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	%ecx
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10, %ecx
	jg	.LBB2_7
# BB#2:                                 # %for.body.split.split
                                        #   in Loop: Header=BB2_1 Depth=1
	vmulss	%xmm1, %xmm2, %xmm2
	imull	%ecx, %eax
	testb	$1, %cl
	jne	.LBB2_6
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	vcvtsi2ssl	%eax, %xmm0, %xmm3
	vdivss	%xmm3, %xmm2, %xmm3
	testb	$3, %cl
	jne	.LBB2_5
# BB#4:                                 # %if.then5
                                        #   in Loop: Header=BB2_1 Depth=1
	vaddss	%xmm3, %xmm0, %xmm0
	incl	%ecx
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_5:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	vsubss	%xmm3, %xmm0, %xmm0
	jmp	.LBB2_6
.LBB2_7:                                # %for.end
	popq	%rbp
	ret
.Ltmp17:
	.size	Cos, .Ltmp17-Cos
	.cfi_endproc

	.globl	Min0
	.align	16, 0x90
	.type	Min0,@function
Min0:                                   # @Min0
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
	cmpl	%esi, %edi
	jl	.LBB3_2
# BB#1:                                 # %if.else
	movl	%esi, %edi
.LBB3_2:                                # %return
	movl	%edi, %eax
	popq	%rbp
	ret
.Ltmp23:
	.size	Min0, .Ltmp23-Min0
	.cfi_endproc

	.globl	Printcomplex
	.align	16, 0x90
	.type	Printcomplex,@function
Printcomplex:                           # @Printcomplex
	.cfi_startproc
# BB#0:                                 # %entry.split
	pushq	%rbp
.Ltmp27:
	.cfi_def_cfa_offset 16
.Ltmp28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp29:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp30:
	.cfi_offset %rbx, -56
.Ltmp31:
	.cfi_offset %r12, -48
.Ltmp32:
	.cfi_offset %r13, -40
.Ltmp33:
	.cfi_offset %r14, -32
.Ltmp34:
	.cfi_offset %r15, -24
	movl	%ecx, %r15d
	movl	%edx, %r14d
	movl	%esi, %ebx
	movq	%rdi, %r12
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leal	(%r15,%r15), %r13d
	.align	16, 0x90
.LBB4_1:                                # %do.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	%ebx, %rbx
	vmovss	4(%r12,%rbx,8), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	(%r12,%rbx,8), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	leal	(%r15,%rbx), %eax
	movslq	%eax, %rax
	vmovss	4(%r12,%rax,8), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	(%r12,%rax,8), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	addl	%r13d, %ebx
	cmpl	%r14d, %ebx
	jle	.LBB4_1
# BB#2:                                 # %do.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp35:
	.size	Printcomplex, .Ltmp35-Printcomplex
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI5_0:
	.long	1174405120              # float 8192
	.text
	.globl	Uniform11
	.align	16, 0x90
	.type	Uniform11,@function
Uniform11:                              # @Uniform11
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
	imull	$4855, (%rdi), %eax     # imm = 0x12F7
	addl	$1731, %eax             # imm = 0x6C3
	andl	$8191, %eax             # imm = 0x1FFF
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vdivss	.LCPI5_0(%rip), %xmm0, %xmm0
	movl	%eax, (%rdi)
	vmovss	%xmm0, (%rsi)
	popq	%rbp
	ret
.Ltmp41:
	.size	Uniform11, .Ltmp41-Uniform11
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI6_0:
	.long	1082130432              # float 4
.LCPI6_1:
	.long	1078530011              # float 3.1415927
.LCPI6_2:
	.long	1065353216              # float 1
	.text
	.globl	Exptab
	.align	16, 0x90
	.type	Exptab,@function
Exptab:                                 # @Exptab
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp45:
	.cfi_def_cfa_offset 16
.Ltmp46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp47:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$128, %rsp
.Ltmp48:
	.cfi_offset %rbx, -48
.Ltmp49:
	.cfi_offset %r12, -40
.Ltmp50:
	.cfi_offset %r14, -32
.Ltmp51:
	.cfi_offset %r15, -24
	movq	%rsi, %r12
	movl	%edi, %r14d
	vmovss	.LCPI6_0(%rip), %xmm1
	movl	$1, %r15d
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	vmovss	.LCPI6_1(%rip), %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm1, -148(%rbp)       # 4-byte Spill
	callq	Cos
	vmovss	-148(%rbp), %xmm1       # 4-byte Reload
	vaddss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm0, %xmm0, %xmm0
	vmovss	.LCPI6_2(%rip), %xmm2
	vdivss	%xmm0, %xmm2, %xmm0
	vmovss	%xmm0, -144(%rbp,%r15,4)
	incq	%r15
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$25, %r15d
	jle	.LBB6_2
# BB#3:                                 # %for.end
	movl	$1065353216, 8(%r12)    # imm = 0x3F800000
	movl	%r14d, %r15d
	shrl	$31, %r15d
	addl	%r14d, %r15d
	movl	%r15d, %r8d
	shrl	$31, %r8d
	sarl	%r15d
	addl	%r15d, %r8d
	movl	$0, 12(%r12)
	sarl	%r8d
	leal	1(%r8), %eax
	movslq	%eax, %rcx
	leal	1(%r15), %eax
	movslq	%eax, %rdx
	movl	$1, %eax
	movl	$0, (%r12,%rcx,8)
	movl	$1065353216, 4(%r12,%rcx,8) # imm = 0x3F800000
	movl	$-1082130432, (%r12,%rdx,8) # imm = 0xFFFFFFFFBF800000
	movl	$0, 4(%r12,%rdx,8)
	.align	16, 0x90
.LBB6_4:                                # %do.body.split.split.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
	movl	%r8d, %r14d
	shrl	$31, %r14d
	addl	%r8d, %r14d
	movl	%r14d, %r9d
	andl	$-2, %r9d
	sarl	%r14d
	movl	$1, %esi
	.align	16, 0x90
.LBB6_5:                                # %do.cond
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r9,%rsi), %ecx
	movslq	%ecx, %rdi
	vmovss	(%r12,%rdi,8), %xmm0
	movslq	%esi, %rcx
	vaddss	(%r12,%rcx,8), %xmm0, %xmm0
	movslq	%eax, %rdx
	vmulss	-144(%rbp,%rdx,4), %xmm0, %xmm0
	leal	(%r14,%rcx), %esi
	movslq	%esi, %rbx
	vmovss	%xmm0, (%r12,%rbx,8)
	leal	(%rcx,%r8), %esi
	leal	-1(%r14,%rsi), %r10d
	vmovss	4(%r12,%rdi,8), %xmm0
	vaddss	4(%r12,%rcx,8), %xmm0, %xmm0
	vmulss	-144(%rbp,%rdx,4), %xmm0, %xmm0
	cmpl	%r15d, %r10d
	vmovss	%xmm0, 4(%r12,%rbx,8)
	jle	.LBB6_5
# BB#6:                                 # %do.cond63
                                        #   in Loop: Header=BB6_4 Depth=1
	incl	%eax
	movl	%eax, %edi
	movl	$25, %esi
	callq	Min0
	cmpl	$1, %r14d
	movl	%r14d, %r8d
	jg	.LBB6_4
# BB#7:                                 # %do.end65
	addq	$128, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp52:
	.size	Exptab, .Ltmp52-Exptab
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.text
	.globl	Fft
	.align	16, 0x90
	.type	Fft,@function
Fft:                                    # @Fft
	.cfi_startproc
# BB#0:                                 # %entry.split
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp58:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp59:
	.cfi_offset %rbx, -56
.Ltmp60:
	.cfi_offset %r12, -48
.Ltmp61:
	.cfi_offset %r13, -40
.Ltmp62:
	.cfi_offset %r14, -32
.Ltmp63:
	.cfi_offset %r15, -24
	movl	%edi, -120(%rbp)        # 4-byte Spill
	movl	%edi, %r14d
	shrl	$31, %r14d
	addl	%edi, %r14d
	sarl	%r14d
	movq	%r14, -112(%rbp)        # 8-byte Spill
	leaq	8(%rsi), %rax
	movq	%rax, -128(%rbp)        # 8-byte Spill
	leaq	8(%rdx), %rax
	movq	%rax, -136(%rbp)        # 8-byte Spill
	movl	$1, %edi
	movl	$2, %eax
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_14:                               # %do.cond97.do.body_crit_edge
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, %edi
	leal	(%rax,%rax), %eax
.LBB7_1:                                # %do.body.split.split.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
                                        #       Child Loop BB7_3 Depth 3
                                        #     Child Loop BB7_7 Depth 2
	movl	%edi, -100(%rbp)        # 4-byte Spill
	movl	%eax, -116(%rbp)        # 4-byte Spill
	leal	1(%rdi), %r8d
	leal	1(%rdi,%rdi), %eax
	movl	%eax, -76(%rbp)         # 4-byte Spill
	movl	$0, -48(%rbp)           # 4-byte Folded Spill
	movq	%r14, %r9
	leal	1(%r9), %r14d
	movl	$1, %ebx
	movl	$1, %r11d
	movl	%edi, %r12d
	movl	$1, %r10d
	movl	%r8d, %r13d
	jmp	.LBB7_2
	.align	16, 0x90
.LBB7_13:                               # %do.cond84.do.body1_crit_edge.split.split
                                        #   in Loop: Header=BB7_2 Depth=2
	movq	-96(%rbp), %rbx         # 8-byte Reload
	leaq	1(%rbx,%r9), %rbx
	movq	%rbx, -48(%rbp)         # 8-byte Spill
	leal	(%r11,%r8), %r10d
	movl	-84(%rbp), %r15d        # 4-byte Reload
	addl	%eax, %r15d
	addl	%eax, %r8d
	addl	%r9d, %r10d
	movl	-76(%rbp), %ebx         # 4-byte Reload
	leal	(%r11,%rbx), %r13d
	addl	%eax, %ebx
	movl	%ebx, -76(%rbp)         # 4-byte Spill
	addl	%r14d, %r11d
	movq	%r14, %rax
	leal	1(%r9,%r11), %r14d
	addl	%r9d, %r13d
	movq	%rax, %r9
	movl	%r15d, %ebx
	movq	-48(%rbp), %rax         # 8-byte Reload
	movl	%eax, %r11d
	movl	%edi, -48(%rbp)         # 4-byte Spill
.LBB7_2:                                # %do.body1
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_3 Depth 3
	movl	%ebx, -84(%rbp)         # 4-byte Spill
	movl	%r8d, -80(%rbp)         # 4-byte Spill
	movslq	%r11d, %rax
	leaq	(%rsi,%rax,8), %r15
	leal	(%r11,%rbx), %edi
	movq	%rdi, -56(%rbp)         # 8-byte Spill
	movl	%eax, %eax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	leaq	(%r9,%rax), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	leal	(%r11,%r8), %eax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	xorl	%r9d, %r9d
	jmp	.LBB7_3
	.align	16, 0x90
.LBB7_4:                                # %do.cond.do.body2_crit_edge.split.split
                                        #   in Loop: Header=BB7_3 Depth=3
	movl	%edi, %r12d
	movq	-64(%rbp), %rax         # 8-byte Reload
	leal	1(%rax,%r9), %r14d
	movq	-56(%rbp), %rax         # 8-byte Reload
	leal	(%rax,%r9), %r10d
	movl	%r9d, %r13d
	movq	-72(%rbp), %rax         # 8-byte Reload
	addl	%eax, %r13d
	movq	%r8, %r9
.LBB7_3:                                # %do.cond
                                        #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	(%r15,%r9,8), %xmm1
	movslq	%r14d, %rbx
	vaddss	(%rsi,%rbx,8), %xmm1, %xmm1
	movslq	%r10d, %rax
	vmovss	%xmm1, (%rdx,%rax,8)
	vmovss	4(%r15,%r9,8), %xmm1
	vaddss	4(%rsi,%rbx,8), %xmm1, %xmm1
	vmovss	%xmm1, 4(%rdx,%rax,8)
	movl	-48(%rbp), %eax         # 4-byte Reload
	leal	1(%rax), %eax
	leaq	1(%r9), %r8
	leal	(%r11,%r8), %r10d
	movslq	%eax, %rax
	movslq	%r13d, %r14
	vmovss	4(%r15,%r9,8), %xmm1
	vsubss	4(%rsi,%rbx,8), %xmm1, %xmm1
	vmulss	4(%rcx,%rax,8), %xmm1, %xmm1
	vmovss	(%r15,%r9,8), %xmm2
	vsubss	(%rsi,%rbx,8), %xmm2, %xmm2
	vmulss	(%rcx,%rax,8), %xmm2, %xmm2
	vsubss	%xmm1, %xmm2, %xmm1
	cmpl	%r12d, %r10d
	movl	%r12d, %edi
	vmovss	%xmm1, (%rdx,%r14,8)
	vmovss	(%r15,%r9,8), %xmm1
	vsubss	(%rsi,%rbx,8), %xmm1, %xmm1
	vmulss	4(%rcx,%rax,8), %xmm1, %xmm1
	vmovss	4(%r15,%r9,8), %xmm2
	vsubss	4(%rsi,%rbx,8), %xmm2, %xmm2
	vmulss	(%rcx,%rax,8), %xmm2, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmovss	%xmm1, 4(%rdx,%r14,8)
	jle	.LBB7_4
# BB#5:                                 # %do.cond84
                                        #   in Loop: Header=BB7_2 Depth=2
	movl	-100(%rbp), %eax        # 4-byte Reload
	leal	(%rdi,%rax), %r12d
	movl	$1, %ebx
	movq	-112(%rbp), %r14        # 8-byte Reload
	cmpl	%r14d, %r12d
	movl	-80(%rbp), %r8d         # 4-byte Reload
	jle	.LBB7_13
# BB#6:                                 #   in Loop: Header=BB7_1 Depth=1
	movq	-128(%rbp), %r8         # 8-byte Reload
	movq	-136(%rbp), %rdi        # 8-byte Reload
	movl	-120(%rbp), %r9d        # 4-byte Reload
	.align	16, 0x90
.LBB7_7:                                # %do.cond93
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdi), %rax
	movq	%rax, (%r8)
	addq	$8, %r8
	addq	$8, %rdi
	incl	%ebx
	cmpl	%r9d, %ebx
	jle	.LBB7_7
# BB#8:                                 # %do.cond97
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	-116(%rbp), %eax        # 4-byte Reload
	cmpl	%r14d, %eax
	jle	.LBB7_14
# BB#9:
	movl	$1, %eax
	vxorps	.LCPI7_0(%rip), %xmm0, %xmm1
	jmp	.LBB7_10
	.align	16, 0x90
.LBB7_11:                               # %for.inc
                                        #   in Loop: Header=BB7_10 Depth=1
	vmulss	(%rsi,%rax,8), %xmm0, %xmm2
	vmovss	%xmm2, (%rsi,%rax,8)
	vmulss	4(%rsi,%rax,8), %xmm1, %xmm2
	vmovss	%xmm2, 4(%rsi,%rax,8)
	incq	%rax
.LBB7_10:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r9d, %eax
	jle	.LBB7_11
# BB#12:                                # %for.end
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp64:
	.size	Fft, .Ltmp64-Fft
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI8_0:
	.long	1031798784              # float 0.0625
.LCPI8_1:
	.long	1092616192              # float 10
.LCPI8_2:
	.long	1101004800              # float 20
	.text
	.globl	Oscar
	.align	16, 0x90
	.type	Oscar,@function
Oscar:                                  # @Oscar
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Ltmp71:
	.cfi_offset %rbx, -32
.Ltmp72:
	.cfi_offset %r14, -24
	movl	$256, %edi              # imm = 0x100
	movl	$e, %esi
	callq	Exptab
	movq	$5767, seed(%rip)       # imm = 0x1687
	movl	$1, %ebx
	leaq	-20(%rbp), %r14
	jmp	.LBB8_1
	.align	16, 0x90
.LBB8_6:                                # %for.inc
                                        #   in Loop: Header=BB8_1 Depth=1
	movl	seed(%rip), %eax
	movl	%eax, -20(%rbp)
	movq	%r14, %rdi
	movl	$zr, %esi
	callq	Uniform11
	movslq	-20(%rbp), %rax
	movq	%rax, seed(%rip)
	movq	%r14, %rdi
	movl	$zi, %esi
	callq	Uniform11
	movslq	-20(%rbp), %rax
	movq	%rax, seed(%rip)
	vmovss	.LCPI8_2(%rip), %xmm2
	vmulss	zr(%rip), %xmm2, %xmm0
	vmovss	.LCPI8_1(%rip), %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, z(,%rbx,8)
	vmulss	zi(%rip), %xmm2, %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, z+4(,%rbx,8)
	leaq	1(%rbx), %rbx
.LBB8_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, %ebx              # imm = 0x100
	jle	.LBB8_6
# BB#2:
	xorl	%ebx, %ebx
	jmp	.LBB8_3
	.align	16, 0x90
.LBB8_4:                                # %for.body10
                                        #   in Loop: Header=BB8_3 Depth=1
	movl	$256, %edi              # imm = 0x100
	movl	$z, %esi
	movl	$w, %edx
	movl	$e, %ecx
	vmovss	.LCPI8_0(%rip), %xmm0
	callq	Fft
.LBB8_3:                                # %for.cond7
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$20, %ebx
	jle	.LBB8_4
# BB#5:                                 # %for.end13
	movl	$z, %edi
	movl	$1, %esi
	movl	$256, %edx              # imm = 0x100
	movl	$17, %ecx
	callq	Printcomplex
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp73:
	.size	Oscar, .Ltmp73-Oscar
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp77:
	.cfi_def_cfa_offset 16
.Ltmp78:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp79:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp80:
	.cfi_offset %rbx, -24
	movl	$-1, %ebx
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	callq	Oscar
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$9, %ebx
	jle	.LBB9_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp81:
	.size	main, .Ltmp81-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "\n"
	.size	.L.str, 2

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "  %15.3f%15.3f"
	.size	.L.str1, 15

	.type	e,@object               # @e
	.comm	e,1040,16
	.type	zr,@object              # @zr
	.comm	zr,4,4
	.type	zi,@object              # @zi
	.comm	zi,4,4
	.type	z,@object               # @z
	.comm	z,2056,16
	.type	w,@object               # @w
	.comm	w,2056,16
	.type	value,@object           # @value
	.comm	value,4,4
	.type	fixed,@object           # @fixed
	.comm	fixed,4,4
	.type	floated,@object         # @floated
	.comm	floated,4,4
	.type	permarray,@object       # @permarray
	.comm	permarray,44,16
	.type	pctr,@object            # @pctr
	.comm	pctr,4,4
	.type	tree,@object            # @tree
	.comm	tree,8,8
	.type	stack,@object           # @stack
	.comm	stack,16,16
	.type	cellspace,@object       # @cellspace
	.comm	cellspace,152,16
	.type	freelist,@object        # @freelist
	.comm	freelist,4,4
	.type	movesdone,@object       # @movesdone
	.comm	movesdone,4,4
	.type	ima,@object             # @ima
	.comm	ima,6724,16
	.type	imb,@object             # @imb
	.comm	imb,6724,16
	.type	imr,@object             # @imr
	.comm	imr,6724,16
	.type	rma,@object             # @rma
	.comm	rma,6724,16
	.type	rmb,@object             # @rmb
	.comm	rmb,6724,16
	.type	rmr,@object             # @rmr
	.comm	rmr,6724,16
	.type	piececount,@object      # @piececount
	.comm	piececount,16,16
	.type	class,@object           # @class
	.comm	class,52,16
	.type	piecemax,@object        # @piecemax
	.comm	piecemax,52,16
	.type	puzzl,@object           # @puzzl
	.comm	puzzl,2048,16
	.type	p,@object               # @p
	.comm	p,26624,16
	.type	n,@object               # @n
	.comm	n,4,4
	.type	kount,@object           # @kount
	.comm	kount,4,4
	.type	sortlist,@object        # @sortlist
	.comm	sortlist,20004,16
	.type	biggest,@object         # @biggest
	.comm	biggest,4,4
	.type	littlest,@object        # @littlest
	.comm	littlest,4,4
	.type	top,@object             # @top
	.comm	top,4,4

	.section	".note.GNU-stack","",@progbits
