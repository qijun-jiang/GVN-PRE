	.file	"Oscar.bc"
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
	vmovss	%xmm0, -4(%rbp)
	movl	$1065353216, -16(%rbp)  # imm = 0x3F800000
	movl	$1, -12(%rbp)
	vmovss	-4(%rbp), %xmm0
	vmovss	%xmm0, -20(%rbp)
	movl	$2, -8(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_7:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	-8(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10, -8(%rbp)
	jg	.LBB2_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	vmovss	-20(%rbp), %xmm0
	vmulss	-4(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -20(%rbp)
	testb	$1, -8(%rbp)
	jne	.LBB2_7
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	testb	$3, -8(%rbp)
	jne	.LBB2_5
# BB#4:                                 # %if.then5
                                        #   in Loop: Header=BB2_1 Depth=1
	vcvtsi2ssl	-12(%rbp), %xmm0, %xmm0
	vmovss	-20(%rbp), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vaddss	-16(%rbp), %xmm0, %xmm0
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_5:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	vcvtsi2ssl	-12(%rbp), %xmm0, %xmm0
	vmovss	-20(%rbp), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	-16(%rbp), %xmm1
	vsubss	%xmm0, %xmm1, %xmm0
.LBB2_6:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	vmovss	%xmm0, -16(%rbp)
	jmp	.LBB2_7
.LBB2_8:                                # %for.end
	vmovss	-16(%rbp), %xmm0
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
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	%esi, -8(%rbp)
	jge	.LBB3_2
# BB#1:                                 # %if.then
	movl	-8(%rbp), %eax
	jmp	.LBB3_3
.LBB3_2:                                # %if.else
	movl	-12(%rbp), %eax
.LBB3_3:                                # %if.else
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
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
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	-12(%rbp), %eax
	movl	%eax, -24(%rbp)
	.align	16, 0x90
.LBB4_1:                                # %do.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	vmovss	4(%rcx,%rax,8), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	(%rcx,%rax,8), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	movl	-20(%rbp), %eax
	addl	%eax, -24(%rbp)
	movslq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	vmovss	4(%rcx,%rax,8), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	(%rcx,%rax,8), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	-24(%rbp), %eax
	addl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	cmpl	-16(%rbp), %eax
	jle	.LBB4_1
# BB#2:                                 # %do.end
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp29:
	.size	Printcomplex, .Ltmp29-Printcomplex
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
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	imull	$4855, (%rax), %ecx     # imm = 0x12F7
	addl	$1731, %ecx             # imm = 0x6C3
	andl	$8191, %ecx             # imm = 0x1FFF
	movl	%ecx, (%rax)
	movq	-8(%rbp), %rax
	vcvtsi2ssl	(%rax), %xmm0, %xmm0
	vdivss	.LCPI5_0(%rip), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovss	%xmm0, (%rax)
	popq	%rbp
	ret
.Ltmp35:
	.size	Uniform11, .Ltmp35-Uniform11
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI6_0:
	.long	1065353216              # float 1
	.text
	.globl	Exptab
	.align	16, 0x90
	.type	Exptab,@function
Exptab:                                 # @Exptab
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
	subq	$160, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1078530011, -20(%rbp)  # imm = 0x40490FDB
	movl	$1082130432, -24(%rbp)  # imm = 0x40800000
	movl	$1, -132(%rbp)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	vmovss	-20(%rbp), %xmm0
	vdivss	-24(%rbp), %xmm0, %xmm0
	callq	Cos
	vaddss	%xmm0, %xmm0, %xmm0
	vmovss	.LCPI6_0(%rip), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	movslq	-132(%rbp), %rax
	vmovss	%xmm0, -128(%rbp,%rax,4)
	vmovss	-24(%rbp), %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	incl	-132(%rbp)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$25, -132(%rbp)
	jle	.LBB6_2
# BB#3:                                 # %for.end
	movl	-4(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%ecx
	movl	%ecx, -148(%rbp)
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, -144(%rbp)
	movl	$1, -136(%rbp)
	movq	-16(%rbp), %rax
	movl	$1065353216, 8(%rax)    # imm = 0x3F800000
	movq	-16(%rbp), %rax
	movl	$0, 12(%rax)
	movl	-144(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movl	$0, (%rcx,%rax,8)
	movl	-144(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movl	$1065353216, 4(%rcx,%rax,8) # imm = 0x3F800000
	movl	-148(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movl	$-1082130432, (%rcx,%rax,8) # imm = 0xFFFFFFFFBF800000
	movl	-148(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movl	$0, 4(%rcx,%rax,8)
	.align	16, 0x90
.LBB6_4:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
	movl	-144(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, -132(%rbp)
	movl	%eax, -140(%rbp)
	.align	16, 0x90
.LBB6_5:                                # %do.cond
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-132(%rbp), %edx
	movl	-140(%rbp), %eax
	leal	1(%rax,%rdx), %ecx
	movslq	%ecx, %rsi
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rsi,8), %xmm0
	movl	%eax, %esi
	subl	%edx, %esi
	incl	%esi
	movslq	%esi, %rdx
	vaddss	(%rcx,%rdx,8), %xmm0, %xmm0
	movslq	-136(%rbp), %rdx
	vmulss	-128(%rbp,%rdx,4), %xmm0, %xmm0
	incl	%eax
	movslq	%eax, %rax
	vmovss	%xmm0, (%rcx,%rax,8)
	movl	-132(%rbp), %edx
	movl	-140(%rbp), %eax
	leal	1(%rax,%rdx), %ecx
	movslq	%ecx, %rsi
	movq	-16(%rbp), %rcx
	vmovss	4(%rcx,%rsi,8), %xmm0
	movl	%eax, %esi
	subl	%edx, %esi
	incl	%esi
	movslq	%esi, %rdx
	vaddss	4(%rcx,%rdx,8), %xmm0, %xmm0
	movslq	-136(%rbp), %rdx
	vmulss	-128(%rbp,%rdx,4), %xmm0, %xmm0
	incl	%eax
	movslq	%eax, %rax
	vmovss	%xmm0, 4(%rcx,%rax,8)
	movl	-140(%rbp), %eax
	addl	-144(%rbp), %eax
	movl	%eax, -140(%rbp)
	cmpl	-148(%rbp), %eax
	jle	.LBB6_5
# BB#6:                                 # %do.cond63
                                        #   in Loop: Header=BB6_4 Depth=1
	movl	-136(%rbp), %edi
	incl	%edi
	movl	$25, %esi
	callq	Min0
	movl	%eax, -136(%rbp)
	movl	-132(%rbp), %eax
	movl	%eax, -144(%rbp)
	cmpl	$1, %eax
	jg	.LBB6_4
# BB#7:                                 # %do.end65
	addq	$160, %rsp
	popq	%rbp
	ret
.Ltmp41:
	.size	Exptab, .Ltmp41-Exptab
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
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	vmovss	%xmm0, -36(%rbp)
	movl	-4(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, -56(%rbp)
	movl	$1, -52(%rbp)
	.align	16, 0x90
.LBB7_1:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
                                        #     Child Loop BB7_5 Depth 2
	movl	$0, -48(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	$1, -40(%rbp)
	.align	16, 0x90
.LBB7_2:                                # %do.cond
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,8), %xmm0
	movl	-56(%rbp), %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	vaddss	(%rcx,%rdx,8), %xmm0, %xmm0
	addl	-48(%rbp), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovss	%xmm0, (%rcx,%rax,8)
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	4(%rcx,%rax,8), %xmm0
	movl	-56(%rbp), %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	vaddss	4(%rcx,%rdx,8), %xmm0, %xmm0
	addl	-48(%rbp), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovss	%xmm0, 4(%rcx,%rax,8)
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	4(%rcx,%rax,8), %xmm0
	movl	-56(%rbp), %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	vsubss	4(%rcx,%rdx,8), %xmm0, %xmm0
	movl	-48(%rbp), %esi
	incl	%esi
	movslq	%esi, %rsi
	movq	-32(%rbp), %rdi
	vmulss	4(%rdi,%rsi,8), %xmm0, %xmm0
	vmovss	(%rcx,%rax,8), %xmm1
	vsubss	(%rcx,%rdx,8), %xmm1, %xmm1
	vmulss	(%rdi,%rsi,8), %xmm1, %xmm1
	vsubss	%xmm0, %xmm1, %xmm0
	movl	-44(%rbp), %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rax
	movq	-24(%rbp), %rcx
	vmovss	%xmm0, (%rcx,%rax,8)
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,8), %xmm0
	movl	-56(%rbp), %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	vsubss	(%rcx,%rdx,8), %xmm0, %xmm0
	movl	-48(%rbp), %esi
	incl	%esi
	movslq	%esi, %rsi
	movq	-32(%rbp), %rdi
	vmulss	4(%rdi,%rsi,8), %xmm0, %xmm0
	vmovss	4(%rcx,%rax,8), %xmm1
	vsubss	4(%rcx,%rdx,8), %xmm1, %xmm1
	vmulss	(%rdi,%rsi,8), %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	movl	-44(%rbp), %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rax
	movq	-24(%rbp), %rcx
	vmovss	%xmm0, 4(%rcx,%rax,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movl	%eax, -40(%rbp)
	cmpl	-44(%rbp), %eax
	jle	.LBB7_2
# BB#3:                                 # %do.cond84
                                        #   in Loop: Header=BB7_2 Depth=2
	movl	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
	addl	-52(%rbp), %eax
	movl	%eax, -44(%rbp)
	cmpl	-56(%rbp), %eax
	jle	.LBB7_2
# BB#4:                                 # %do.end86
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	$1, -60(%rbp)
	.align	16, 0x90
.LBB7_5:                                # %do.cond93
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movslq	-60(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movl	-60(%rbp), %eax
	incl	%eax
	movl	%eax, -60(%rbp)
	cmpl	-4(%rbp), %eax
	jle	.LBB7_5
# BB#6:                                 # %do.cond97
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%rbp)
	cmpl	-56(%rbp), %eax
	jle	.LBB7_1
# BB#7:                                 # %do.end99
	movl	$1, -40(%rbp)
	vmovss	.LCPI7_0(%rip), %xmm0
	jmp	.LBB7_8
	.align	16, 0x90
.LBB7_9:                                # %for.inc
                                        #   in Loop: Header=BB7_8 Depth=1
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	-36(%rbp), %xmm1
	vmulss	(%rcx,%rax,8), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%rax,8)
	vmovss	-36(%rbp), %xmm1
	vxorps	%xmm0, %xmm1, %xmm1
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmulss	4(%rcx,%rax,8), %xmm1, %xmm1
	vmovss	%xmm1, 4(%rcx,%rax,8)
	incl	-40(%rbp)
.LBB7_8:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.LBB7_9
# BB#10:                                # %for.end
	popq	%rbp
	ret
.Ltmp47:
	.size	Fft, .Ltmp47-Fft
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
.Ltmp51:
	.cfi_def_cfa_offset 16
.Ltmp52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp53:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Ltmp54:
	.cfi_offset %rbx, -24
	movl	$256, %edi              # imm = 0x100
	movl	$e, %esi
	callq	Exptab
	movq	$5767, seed(%rip)       # imm = 0x1687
	movl	$1, -12(%rbp)
	leaq	-16(%rbp), %rbx
	jmp	.LBB8_1
	.align	16, 0x90
.LBB8_2:                                # %for.inc
                                        #   in Loop: Header=BB8_1 Depth=1
	movl	seed(%rip), %eax
	movl	%eax, -16(%rbp)
	movq	%rbx, %rdi
	movl	$zr, %esi
	callq	Uniform11
	movslq	-16(%rbp), %rax
	movq	%rax, seed(%rip)
	movq	%rbx, %rdi
	movl	$zi, %esi
	callq	Uniform11
	movslq	-16(%rbp), %rax
	movq	%rax, seed(%rip)
	vmovss	.LCPI8_2(%rip), %xmm2
	vmulss	zr(%rip), %xmm2, %xmm0
	vmovss	.LCPI8_1(%rip), %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	movslq	-12(%rbp), %rax
	vmovss	%xmm0, z(,%rax,8)
	vmulss	zi(%rip), %xmm2, %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	movslq	-12(%rbp), %rax
	vmovss	%xmm0, z+4(,%rax,8)
	incl	-12(%rbp)
.LBB8_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, -12(%rbp)         # imm = 0x100
	jle	.LBB8_2
# BB#3:                                 # %for.end
	movl	$1, -12(%rbp)
	jmp	.LBB8_4
	.align	16, 0x90
.LBB8_5:                                # %for.inc11
                                        #   in Loop: Header=BB8_4 Depth=1
	movl	$256, %edi              # imm = 0x100
	movl	$z, %esi
	movl	$w, %edx
	movl	$e, %ecx
	vmovss	.LCPI8_0(%rip), %xmm0
	callq	Fft
	incl	-12(%rbp)
.LBB8_4:                                # %for.cond7
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -12(%rbp)
	jle	.LBB8_5
# BB#6:                                 # %for.end13
	movl	$z, %edi
	movl	$1, %esi
	movl	$256, %edx              # imm = 0x100
	movl	$17, %ecx
	callq	Printcomplex
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp55:
	.size	Oscar, .Ltmp55-Oscar
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	callq	Oscar
	incl	-8(%rbp)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$9, -8(%rbp)
	jle	.LBB9_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp61:
	.size	main, .Ltmp61-main
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
