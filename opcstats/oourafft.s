	.file	"oourafft.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4652218415073722368     # double 1024
.LCPI0_1:
	.quad	4890909195324358656     # double 9.223372036854775E+18
.LCPI0_2:
	.quad	4616189618054758400     # double 4
.LCPI0_3:
	.quad	4562146422526312448     # double 9.765625E-4
.LCPI0_5:
	.quad	4457293557087583675     # double 1.0E-10
.LCPI0_6:
	.quad	4472406533629990549     # double 1.0E-9
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_4:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI0_7:
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
	subq	$144, %rsp
	movl	$0, -4(%rbp)
	movq	$0, -88(%rbp)
	callq	get_time
	vmovsd	%xmm0, -64(%rbp)
	callq	get_time
	vmovaps	%xmm0, %xmm1
	vmovsd	.LCPI0_0(%rip), %xmm0
	vmovsd	%xmm1, -72(%rbp)
	vsubsd	-64(%rbp), %xmm1, %xmm1
	vmovsd	%xmm1, -80(%rbp)
	callq	sqrt
	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
	vmovsd	.LCPI0_1(%rip), %xmm1
	vmulsd	.LCPI0_2(%rip), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm2
	vcvttsd2si	%xmm2, %rcx
	xorq	%rax, %rcx
	vcvttsd2si	%xmm0, %rsi
	vucomisd	%xmm1, %xmm0
	cmovaeq	%rcx, %rsi
	movl	$16, %edi
	callq	memalign
	movq	%rax, -24(%rbp)
	movl	$16, %edi
	movl	$20480, %esi            # imm = 0x5000
	callq	memalign
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rsi
	movl	$512, %edi              # imm = 0x200
	movq	%rax, %rdx
	callq	makewt
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, -32(%rbp)
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, -40(%rbp)
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rdx
	xorl	%edi, %edi
	movl	$2047, %esi             # imm = 0x7FF
	callq	putdata
	movq	-56(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	callq	cdft
	movq	-56(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	$2048, %edi             # imm = 0x800
	movl	$-1, %esi
	callq	cdft
	vmovsd	.LCPI0_3(%rip), %xmm0
	movq	-32(%rbp), %rdx
	xorl	%edi, %edi
	movl	$2047, %esi             # imm = 0x7FF
	callq	errorcheck
	vmovsd	%xmm0, -96(%rbp)
	vandpd	.LCPI0_4(%rip), %xmm0, %xmm0
	vucomisd	.LCPI0_5(%rip), %xmm0
	ja	.LBB0_18
# BB#1:                                 # %if.end
	movq	-32(%rbp), %rdi
	xorl	%esi, %esi
	movl	$16384, %edx            # imm = 0x4000
	callq	memset
	movq	-32(%rbp), %rdx
	xorl	%edi, %edi
	movl	$1023, %esi             # imm = 0x3FF
	callq	putdata
	movq	-56(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	callq	cdft
	movl	$0, -12(%rbp)
	vmovsd	.LCPI0_7(%rip), %xmm0
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_3:                                # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-12(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-32(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	incl	-12(%rbp)
.LBB0_2:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$1023, -12(%rbp)        # imm = 0x3FF
	jle	.LBB0_3
# BB#4:                                 # %for.end
	movq	-48(%rbp), %rdi
	xorl	%esi, %esi
	movl	$16384, %edx            # imm = 0x4000
	callq	memset
	movq	-48(%rbp), %rdx
	xorl	%edi, %edi
	movl	$1023, %esi             # imm = 0x3FF
	callq	putdata
	callq	get_time
	vmovsd	%xmm0, -64(%rbp)
	movl	$0, -8(%rbp)
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_9:                                # %for.inc60
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	-56(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movl	$2048, %edi             # imm = 0x800
	movl	$-1, %esi
	callq	cdft
	incl	-8(%rbp)
.LBB0_5:                                # %for.cond22
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	cmpl	$149999, -8(%rbp)       # imm = 0x249EF
	jg	.LBB0_10
# BB#6:                                 # %for.body25
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdi
	movl	$16384, %edx            # imm = 0x4000
	callq	memcpy
	movq	-56(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	callq	cdft
	movl	$0, -100(%rbp)
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_8:                                # %for.inc57
                                        #   in Loop: Header=BB0_7 Depth=2
	movl	-100(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -112(%rbp)
	movl	-100(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rax
	movq	-32(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movl	-100(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movl	-100(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-32(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -136(%rbp)
	vmulsd	-128(%rbp), %xmm0, %xmm0
	vmovsd	-112(%rbp), %xmm1
	vmulsd	-120(%rbp), %xmm1, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	movl	-100(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-128(%rbp), %xmm0
	vmulsd	-120(%rbp), %xmm0, %xmm0
	vmovsd	-112(%rbp), %xmm1
	vmulsd	-136(%rbp), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	movl	-100(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	incl	-100(%rbp)
.LBB0_7:                                # %for.cond26
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1023, -100(%rbp)       # imm = 0x3FF
	jg	.LBB0_9
	jmp	.LBB0_8
.LBB0_10:                               # %for.end62
	callq	get_time
	vmovsd	%xmm0, -72(%rbp)
	vsubsd	-64(%rbp), %xmm0, %xmm0
	vsubsd	-80(%rbp), %xmm0, %xmm0
	vaddsd	-88(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movl	$0, -12(%rbp)
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_16:                               # %for.inc96
                                        #   in Loop: Header=BB0_11 Depth=1
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	incl	-12(%rbp)
.LBB0_11:                               # %for.end62
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	.LCPI0_4(%rip), %xmm3
	cmpl	$1023, -12(%rbp)        # imm = 0x3FF
	jg	.LBB0_17
# BB#12:                                # %for.body70
                                        #   in Loop: Header=BB0_11 Depth=1
	movl	-12(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	.LCPI0_6(%rip), %xmm0
	vxorpd	%xmm0, %xmm0, %xmm0
	jbe	.LBB0_14
# BB#13:                                # %cond.true
                                        #   in Loop: Header=BB0_11 Depth=1
	movl	-12(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
.LBB0_14:                               # %cond.end
                                        #   in Loop: Header=BB0_11 Depth=1
	movl	-12(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vucomisd	.LCPI0_6(%rip), %xmm2
	jbe	.LBB0_16
# BB#15:                                # %cond.true87
                                        #   in Loop: Header=BB0_11 Depth=1
	movl	-12(%rbp), %eax
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rax
	movq	-40(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	jmp	.LBB0_16
.LBB0_17:                               # %for.end98
	movq	-32(%rbp), %rdi
	callq	free
	movq	-56(%rbp), %rdi
	callq	free
	movq	-24(%rbp), %rdi
	callq	free
	movq	-40(%rbp), %rdi
	callq	free
	movq	-48(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$144, %rsp
	popq	%rbp
	ret
.LBB0_18:                               # %if.then
	vmovsd	-96(%rbp), %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	callq	abort
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4517329193108106637     # double 1.0E-6
	.text
	.globl	get_time
	.align	16, 0x90
	.type	get_time,@function
get_time:                               # @get_time
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
	leaq	-16(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	vcvtsi2sdq	-16(%rbp), %xmm0, %xmm0
	vcvtsi2sdq	-8(%rbp), %xmm0, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	get_time, .Ltmp11-get_time
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	makewt
	.align	16, 0x90
	.type	makewt,@function
makewt:                                 # @makewt
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
	subq	$64, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpl	$3, -4(%rbp)
	jl	.LBB2_6
# BB#1:                                 # %if.then
	movl	-4(%rbp), %eax
	sarl	%eax
	movl	%eax, -32(%rbp)
	vmovsd	.LCPI2_0(%rip), %xmm0
	callq	atan
	vcvtsi2sdl	-32(%rbp), %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	vmovsd	%xmm0, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
	vcvtsi2sdl	-32(%rbp), %xmm0, %xmm0
	vmulsd	-40(%rbp), %xmm0, %xmm0
	callq	cos
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	incl	%eax
	movslq	%eax, %rax
	vmovsd	%xmm0, (%rcx,%rax,8)
	cmpl	$3, -32(%rbp)
	jl	.LBB2_6
# BB#2:                                 # %if.then11
	movl	$2, -28(%rbp)
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=1
	vcvtsi2sdl	-28(%rbp), %xmm0, %xmm0
	vmulsd	-40(%rbp), %xmm0, %xmm0
	callq	cos
	vmovsd	%xmm0, -48(%rbp)
	vcvtsi2sdl	-28(%rbp), %xmm0, %xmm0
	vmulsd	-40(%rbp), %xmm0, %xmm0
	callq	sin
	vmovsd	%xmm0, -56(%rbp)
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	-48(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-56(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-4(%rbp), %eax
	subl	-28(%rbp), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-56(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-4(%rbp), %eax
	subl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-48(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB2_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.LBB2_4
# BB#5:                                 # %for.end
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	bitrv2
.LBB2_6:                                # %if.end32
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp17:
	.size	makewt, .Ltmp17-makewt
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4526168777503116145     # double 3.858024691358025E-6
	.text
	.globl	putdata
	.align	16, 0x90
	.type	putdata,@function
putdata:                                # @putdata
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movl	$0, -24(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
	vmovsd	.LCPI3_0(%rip), %xmm0
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	imull	$7141, -24(%rbp), %ecx  # imm = 0x1BE5
	leal	54773(%rcx), %eax
	movslq	%eax, %rax
	imulq	$-2123092475, %rax, %rdx # imm = 0xFFFFFFFF81742E05
	shrq	$32, %rdx
	leal	54773(%rdx,%rcx), %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	sarl	$17, %ecx
	addl	%edx, %ecx
	imull	$259200, %ecx, %ecx     # imm = 0x3F480
	subl	%ecx, %eax
	movl	%eax, -24(%rbp)
	vcvtsi2sdl	%eax, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	incl	-20(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.LBB3_2
# BB#3:                                 # %for.end
	popq	%rbp
	ret
.Ltmp23:
	.size	putdata, .Ltmp23-putdata
	.cfi_endproc

	.globl	cdft
	.align	16, 0x90
	.type	cdft,@function
cdft:                                   # @cdft
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	cmpl	$5, -4(%rbp)
	jl	.LBB4_4
# BB#1:                                 # %if.then
	cmpl	$0, -8(%rbp)
	js	.LBB4_3
# BB#2:                                 # %if.then2
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	bitrv2
	jmp	.LBB4_5
.LBB4_4:                                # %if.else3
	cmpl	$4, -4(%rbp)
	jne	.LBB4_6
.LBB4_5:                                # %if.then5
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	cftfsub
	jmp	.LBB4_6
.LBB4_3:                                # %if.else
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	bitrv2conj
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	cftbsub
.LBB4_6:                                # %if.end7
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp29:
	.size	cdft, .Ltmp29-cdft
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI5_0:
	.quad	4526168777503116145     # double 3.858024691358025E-6
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_1:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.text
	.globl	errorcheck
	.align	16, 0x90
	.type	errorcheck,@function
errorcheck:                             # @errorcheck
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	vmovsd	%xmm0, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -28(%rbp)
	vmovsd	.LCPI5_0(%rip), %xmm0
	vmovsd	.LCPI5_1(%rip), %xmm1
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_5:                                # %cond.end
                                        #   in Loop: Header=BB5_1 Depth=1
	vmovsd	%xmm2, -40(%rbp)
	incl	-28(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB5_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	imull	$7141, -32(%rbp), %ecx  # imm = 0x1BE5
	leal	54773(%rcx), %eax
	movslq	%eax, %rax
	imulq	$-2123092475, %rax, %rdx # imm = 0xFFFFFFFF81742E05
	shrq	$32, %rdx
	leal	54773(%rdx,%rcx), %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	sarl	$17, %ecx
	addl	%edx, %ecx
	imull	$259200, %ecx, %ecx     # imm = 0x3F480
	subl	%ecx, %eax
	movl	%eax, -32(%rbp)
	vcvtsi2sdl	%eax, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	movslq	-28(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm3
	vmulsd	-16(%rbp), %xmm3, %xmm3
	vsubsd	%xmm3, %xmm2, %xmm2
	vmovsd	%xmm2, -48(%rbp)
	vandpd	%xmm1, %xmm2, %xmm2
	vmovsd	-40(%rbp), %xmm3
	vucomisd	%xmm2, %xmm3
	jbe	.LBB5_4
# BB#3:                                 # %cond.true
                                        #   in Loop: Header=BB5_1 Depth=1
	vmovsd	-40(%rbp), %xmm2
	jmp	.LBB5_5
	.align	16, 0x90
.LBB5_4:                                # %cond.false
                                        #   in Loop: Header=BB5_1 Depth=1
	vmovsd	-48(%rbp), %xmm2
	vandpd	%xmm1, %xmm2, %xmm2
	jmp	.LBB5_5
.LBB5_6:                                # %for.end
	vmovsd	-40(%rbp), %xmm0
	popq	%rbp
	ret
.Ltmp35:
	.size	errorcheck, .Ltmp35-errorcheck
	.cfi_endproc

	.align	16, 0x90
	.type	bitrv2,@function
bitrv2:                                 # @bitrv2
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
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movl	-4(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	$1, -48(%rbp)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_5:                                # %for.end
                                        #   in Loop: Header=BB6_1 Depth=1
	shll	-48(%rbp)
.LBB6_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
	movl	-48(%rbp), %eax
	shll	$3, %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB6_6
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB6_1 Depth=1
	sarl	-44(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB6_3
	.align	16, 0x90
.LBB6_4:                                # %for.inc
                                        #   in Loop: Header=BB6_3 Depth=2
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	addl	-44(%rbp), %edx
	addl	-48(%rbp), %eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	incl	-28(%rbp)
.LBB6_3:                                # %for.cond
                                        #   Parent Loop BB6_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB6_5
	jmp	.LBB6_4
.LBB6_6:                                # %while.end
	movl	-48(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%rbp)
	movl	-48(%rbp), %eax
	shll	$3, %eax
	cmpl	-44(%rbp), %eax
	jne	.LBB6_13
# BB#7:                                 # %if.then
	movl	$0, -36(%rbp)
	jmp	.LBB6_8
	.align	16, 0x90
.LBB6_12:                               # %for.inc139
                                        #   in Loop: Header=BB6_8 Depth=1
	movslq	-36(%rbp), %rcx
	leal	(%rcx,%rcx), %eax
	addl	-52(%rbp), %eax
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	addl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	incl	-36(%rbp)
.LBB6_8:                                # %for.cond9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB6_19
# BB#9:                                 # %for.body11
                                        #   in Loop: Header=BB6_8 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB6_10
	.align	16, 0x90
.LBB6_11:                               # %for.inc110
                                        #   in Loop: Header=BB6_10 Depth=2
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	subl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	incl	-28(%rbp)
.LBB6_10:                               # %for.cond12
                                        #   Parent Loop BB6_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB6_12
	jmp	.LBB6_11
.LBB6_13:                               # %if.else
	movl	$1, -36(%rbp)
	jmp	.LBB6_14
	.align	16, 0x90
.LBB6_18:                               # %for.inc201
                                        #   in Loop: Header=BB6_14 Depth=1
	incl	-36(%rbp)
.LBB6_14:                               # %for.cond142
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_16 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB6_19
# BB#15:                                # %for.body144
                                        #   in Loop: Header=BB6_14 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB6_16
	.align	16, 0x90
.LBB6_17:                               # %for.inc198
                                        #   in Loop: Header=BB6_16 Depth=2
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	incl	-28(%rbp)
.LBB6_16:                               # %for.cond145
                                        #   Parent Loop BB6_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB6_18
	jmp	.LBB6_17
.LBB6_19:                               # %if.end
	popq	%rbp
	ret
.Ltmp41:
	.size	bitrv2, .Ltmp41-bitrv2
	.cfi_endproc

	.align	16, 0x90
	.type	cftfsub,@function
cftfsub:                                # @cftfsub
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
	subq	$112, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$2, -44(%rbp)
	cmpl	$9, -4(%rbp)
	jl	.LBB7_4
# BB#1:                                 # %if.then
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	cft1st
	movl	$8, -44(%rbp)
	jmp	.LBB7_2
	.align	16, 0x90
.LBB7_3:                                # %while.body
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movl	-44(%rbp), %esi
	movl	-4(%rbp), %edi
	callq	cftmdl
	shll	$2, -44(%rbp)
.LBB7_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	shll	$2, %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB7_3
.LBB7_4:                                # %if.end
	movl	-44(%rbp), %eax
	shll	$2, %eax
	cmpl	-4(%rbp), %eax
	jne	.LBB7_8
# BB#5:                                 # %if.then5
	movl	$0, -28(%rbp)
	jmp	.LBB7_6
	.align	16, 0x90
.LBB7_7:                                # %for.inc
                                        #   in Loop: Header=BB7_6 Depth=1
	movl	-28(%rbp), %eax
	addl	-44(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-44(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-44(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	vmovsd	-56(%rbp), %xmm0
	vaddsd	-88(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-64(%rbp), %xmm0
	vaddsd	-96(%rbp), %xmm0, %xmm0
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-56(%rbp), %xmm0
	vsubsd	-88(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-64(%rbp), %xmm0
	vsubsd	-96(%rbp), %xmm0, %xmm0
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm0
	vsubsd	-112(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm0
	vaddsd	-104(%rbp), %xmm0, %xmm0
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm0
	vaddsd	-112(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm0
	vsubsd	-104(%rbp), %xmm0, %xmm0
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB7_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB7_11
	jmp	.LBB7_7
.LBB7_8:                                # %if.else
	movl	$0, -28(%rbp)
	jmp	.LBB7_9
	.align	16, 0x90
.LBB7_10:                               # %for.inc116
                                        #   in Loop: Header=BB7_9 Depth=1
	movl	-28(%rbp), %eax
	addl	-44(%rbp), %eax
	movl	%eax, -32(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	movslq	-32(%rbp), %rdx
	vaddsd	(%rcx,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	movl	-32(%rbp), %edx
	incl	%edx
	movslq	%edx, %rdx
	vaddsd	(%rcx,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-56(%rbp), %xmm0
	vmovsd	%xmm0, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB7_9:                                # %for.cond83
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.LBB7_10
.LBB7_11:                               # %if.end119
	addq	$112, %rsp
	popq	%rbp
	ret
.Ltmp47:
	.size	cftfsub, .Ltmp47-cftfsub
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI8_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	bitrv2conj,@function
bitrv2conj:                             # @bitrv2conj
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
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movl	-4(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	$1, -48(%rbp)
	jmp	.LBB8_1
	.align	16, 0x90
.LBB8_5:                                # %for.end
                                        #   in Loop: Header=BB8_1 Depth=1
	shll	-48(%rbp)
.LBB8_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	movl	-48(%rbp), %eax
	shll	$3, %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB8_6
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB8_1 Depth=1
	sarl	-44(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB8_3
	.align	16, 0x90
.LBB8_4:                                # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	addl	-44(%rbp), %edx
	addl	-48(%rbp), %eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	incl	-28(%rbp)
.LBB8_3:                                # %for.cond
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB8_5
	jmp	.LBB8_4
.LBB8_6:                                # %while.end
	movl	-48(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%rbp)
	movl	-48(%rbp), %eax
	shll	$3, %eax
	cmpl	-44(%rbp), %eax
	jne	.LBB8_13
# BB#7:                                 # %if.then
	movl	$0, -36(%rbp)
	vmovsd	.LCPI8_0(%rip), %xmm0
	jmp	.LBB8_8
	.align	16, 0x90
.LBB8_12:                               # %for.inc164
                                        #   in Loop: Header=BB8_8 Depth=1
	movslq	-36(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %ecx
	leal	(%rcx,%rax,2), %edx
	movl	%edx, -40(%rbp)
	leal	1(%rcx,%rax,2), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-40(%rbp), %eax
	addl	-52(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	movl	-40(%rbp), %ecx
	leal	(%rcx,%rax), %edx
	movl	%edx, -40(%rbp)
	leal	1(%rcx,%rax), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	incl	-36(%rbp)
.LBB8_8:                                # %for.cond9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_10 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB8_19
# BB#9:                                 # %for.body11
                                        #   in Loop: Header=BB8_8 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB8_10
	.align	16, 0x90
.LBB8_11:                               # %for.inc118
                                        #   in Loop: Header=BB8_10 Depth=2
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	subl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	incl	-28(%rbp)
.LBB8_10:                               # %for.cond12
                                        #   Parent Loop BB8_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB8_12
	jmp	.LBB8_11
.LBB8_13:                               # %if.else
	movq	-24(%rbp), %rax
	vmovsd	8(%rax), %xmm1
	vmovsd	.LCPI8_0(%rip), %xmm0
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 8(%rax)
	movl	-52(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	$1, -36(%rbp)
	jmp	.LBB8_14
	.align	16, 0x90
.LBB8_18:                               # %for.inc260
                                        #   in Loop: Header=BB8_14 Depth=1
	movslq	-36(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %ecx
	leal	(%rcx,%rax,2), %edx
	movl	%edx, -40(%rbp)
	leal	1(%rcx,%rax,2), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	movl	-40(%rbp), %ecx
	leal	1(%rcx,%rax), %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	incl	-36(%rbp)
.LBB8_14:                               # %for.cond177
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_16 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jge	.LBB8_19
# BB#15:                                # %for.body179
                                        #   in Loop: Header=BB8_14 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB8_16
	.align	16, 0x90
.LBB8_17:                               # %for.inc237
                                        #   in Loop: Header=BB8_16 Depth=2
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rdx
	addl	(%rdx,%rcx,4), %eax
	movl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-52(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, -40(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movq	-24(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-80(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-88(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	-72(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	incl	-28(%rbp)
.LBB8_16:                               # %for.cond180
                                        #   Parent Loop BB8_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB8_18
	jmp	.LBB8_17
.LBB8_19:                               # %if.end
	popq	%rbp
	ret
.Ltmp53:
	.size	bitrv2conj, .Ltmp53-bitrv2conj
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	cftbsub,@function
cftbsub:                                # @cftbsub
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
	subq	$112, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$2, -44(%rbp)
	cmpl	$9, -4(%rbp)
	jl	.LBB9_4
# BB#1:                                 # %if.then
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %edi
	callq	cft1st
	movl	$8, -44(%rbp)
	jmp	.LBB9_2
	.align	16, 0x90
.LBB9_3:                                # %while.body
                                        #   in Loop: Header=BB9_2 Depth=1
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movl	-44(%rbp), %esi
	movl	-4(%rbp), %edi
	callq	cftmdl
	shll	$2, -44(%rbp)
.LBB9_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	shll	$2, %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB9_3
.LBB9_4:                                # %if.end
	movl	-44(%rbp), %eax
	shll	$2, %eax
	cmpl	-4(%rbp), %eax
	jne	.LBB9_8
# BB#5:                                 # %if.then5
	movl	$0, -28(%rbp)
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_6
	.align	16, 0x90
.LBB9_7:                                # %for.inc
                                        #   in Loop: Header=BB9_6 Depth=1
	movl	-28(%rbp), %eax
	addl	-44(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-44(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-44(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -56(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -72(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movl	-28(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -80(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -88(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -96(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -104(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -112(%rbp)
	vmovsd	-56(%rbp), %xmm1
	vaddsd	-88(%rbp), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	vmovsd	-64(%rbp), %xmm1
	vsubsd	-96(%rbp), %xmm1, %xmm1
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm1, (%rcx,%rax,8)
	vmovsd	-56(%rbp), %xmm1
	vsubsd	-88(%rbp), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	vmovsd	-64(%rbp), %xmm1
	vaddsd	-96(%rbp), %xmm1, %xmm1
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm1, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm1
	vsubsd	-112(%rbp), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm1
	vsubsd	-104(%rbp), %xmm1, %xmm1
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm1, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm1
	vaddsd	-112(%rbp), %xmm1, %xmm1
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm1, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm1
	vaddsd	-104(%rbp), %xmm1, %xmm1
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm1, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB9_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB9_11
	jmp	.LBB9_7
.LBB9_8:                                # %if.else
	movl	$0, -28(%rbp)
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_9
	.align	16, 0x90
.LBB9_10:                               # %for.inc123
                                        #   in Loop: Header=BB9_9 Depth=1
	movl	-28(%rbp), %eax
	addl	-44(%rbp), %eax
	movl	%eax, -32(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -56(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm1
	movl	-28(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm1, %xmm1
	vmovsd	%xmm1, -64(%rbp)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	movslq	-32(%rbp), %rdx
	vaddsd	(%rcx,%rdx,8), %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	movl	-32(%rbp), %edx
	incl	%edx
	movslq	%edx, %rdx
	vsubsd	(%rcx,%rdx,8), %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	-56(%rbp), %xmm1
	vmovsd	%xmm1, (%rax,%rcx,8)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	-64(%rbp), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB9_9:                                # %for.cond85
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.LBB9_10
.LBB9_11:                               # %if.end126
	addq	$112, %rsp
	popq	%rbp
	ret
.Ltmp59:
	.size	cftbsub, .Ltmp59-cftbsub
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI10_0:
	.quad	-4611686018427387904    # double -2
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI10_1:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	cft1st,@function
cft1st:                                 # @cft1st
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
	subq	$24, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vaddsd	16(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	8(%rax), %xmm0
	vaddsd	24(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	16(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	8(%rax), %xmm0
	vsubsd	24(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vaddsd	48(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	40(%rax), %xmm0
	vaddsd	56(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -136(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vsubsd	48(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	40(%rax), %xmm0
	vsubsd	56(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -152(%rbp)
	vmovsd	-96(%rbp), %xmm0
	vaddsd	-128(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	vmovsd	-104(%rbp), %xmm0
	vaddsd	-136(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 8(%rax)
	vmovsd	-96(%rbp), %xmm0
	vsubsd	-128(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 32(%rax)
	vmovsd	-104(%rbp), %xmm0
	vsubsd	-136(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 40(%rax)
	vmovsd	-112(%rbp), %xmm0
	vsubsd	-152(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 16(%rax)
	vmovsd	-120(%rbp), %xmm0
	vaddsd	-144(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 24(%rax)
	vmovsd	-112(%rbp), %xmm0
	vaddsd	-152(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 48(%rax)
	vmovsd	-120(%rbp), %xmm0
	vsubsd	-144(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 56(%rax)
	movq	-24(%rbp), %rax
	vmovsd	16(%rax), %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vaddsd	80(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	72(%rax), %xmm0
	vaddsd	88(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vsubsd	80(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	72(%rax), %xmm0
	vsubsd	88(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vaddsd	112(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	104(%rax), %xmm0
	vaddsd	120(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -136(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vsubsd	112(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	104(%rax), %xmm0
	vsubsd	120(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, -152(%rbp)
	vmovsd	-96(%rbp), %xmm0
	vaddsd	-128(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 64(%rax)
	vmovsd	-104(%rbp), %xmm0
	vaddsd	-136(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 72(%rax)
	vmovsd	-136(%rbp), %xmm0
	vsubsd	-104(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 96(%rax)
	vmovsd	-96(%rbp), %xmm0
	vsubsd	-128(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 104(%rax)
	vmovsd	-112(%rbp), %xmm0
	vsubsd	-152(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	vmovsd	-120(%rbp), %xmm0
	vaddsd	-144(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	vmovsd	-96(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 80(%rax)
	vmovsd	-96(%rbp), %xmm0
	vaddsd	-104(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 88(%rax)
	vmovsd	-152(%rbp), %xmm0
	vaddsd	-112(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	vmovsd	-144(%rbp), %xmm0
	vsubsd	-120(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	vsubsd	-96(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 112(%rax)
	vmovsd	-104(%rbp), %xmm0
	vaddsd	-96(%rbp), %xmm0, %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	vmovsd	%xmm0, 120(%rax)
	movl	$0, -32(%rbp)
	movl	$16, -28(%rbp)
	vmovsd	.LCPI10_0(%rip), %xmm0
	vmovsd	.LCPI10_1(%rip), %xmm1
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_2:                               # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	movl	-32(%rbp), %eax
	leal	2(%rax), %ecx
	movl	%ecx, -32(%rbp)
	leal	4(%rax,%rax), %eax
	movl	%eax, -36(%rbp)
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -64(%rbp)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -72(%rbp)
	movslq	-36(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -48(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -56(%rbp)
	vmulsd	-72(%rbp), %xmm0, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vaddsd	-48(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -80(%rbp)
	vmovsd	-72(%rbp), %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	-48(%rbp), %xmm2, %xmm2
	vsubsd	-56(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -88(%rbp)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	addl	$2, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	movl	-28(%rbp), %eax
	leal	1(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$3, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	addl	$2, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -112(%rbp)
	movl	-28(%rbp), %eax
	leal	1(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$3, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	movl	-28(%rbp), %eax
	leal	4(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$6, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	movl	-28(%rbp), %eax
	leal	5(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$7, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -136(%rbp)
	movl	-28(%rbp), %eax
	leal	4(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$6, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -144(%rbp)
	movl	-28(%rbp), %eax
	leal	5(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$7, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -152(%rbp)
	vmovsd	-96(%rbp), %xmm2
	vaddsd	-128(%rbp), %xmm2, %xmm2
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-104(%rbp), %xmm2
	vaddsd	-136(%rbp), %xmm2, %xmm2
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-96(%rbp), %xmm2
	vsubsd	-128(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-104(%rbp), %xmm2
	vsubsd	-136(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-72(%rbp), %xmm2, %xmm2
	vmovsd	-64(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$4, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm2
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-64(%rbp), %xmm3
	vmulsd	-104(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$5, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-112(%rbp), %xmm2
	vsubsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vaddsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-56(%rbp), %xmm2, %xmm2
	vmovsd	-48(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-56(%rbp), %xmm2
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-48(%rbp), %xmm3
	vmulsd	-104(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-112(%rbp), %xmm2
	vaddsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vsubsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-88(%rbp), %xmm2, %xmm2
	vmovsd	-80(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$6, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-88(%rbp), %xmm2
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-80(%rbp), %xmm3
	vmulsd	-104(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$7, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	movl	-36(%rbp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -48(%rbp)
	movl	-36(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -56(%rbp)
	vmovsd	-64(%rbp), %xmm3
	vaddsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vmovsd	-48(%rbp), %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	vmovsd	%xmm2, -80(%rbp)
	vmovsd	-64(%rbp), %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	-48(%rbp), %xmm2, %xmm2
	vsubsd	-56(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -88(%rbp)
	movl	-28(%rbp), %eax
	leal	8(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$10, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	movl	-28(%rbp), %eax
	leal	9(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$11, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	movl	-28(%rbp), %eax
	leal	8(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$10, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -112(%rbp)
	movl	-28(%rbp), %eax
	leal	9(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$11, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	movl	-28(%rbp), %eax
	leal	12(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$14, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	movl	-28(%rbp), %eax
	leal	13(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$15, %eax
	movslq	%eax, %rax
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -136(%rbp)
	movl	-28(%rbp), %eax
	leal	12(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$14, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -144(%rbp)
	movl	-28(%rbp), %eax
	leal	13(%rax), %ecx
	movslq	%ecx, %rdx
	movq	-16(%rbp), %rcx
	vmovsd	(%rcx,%rdx,8), %xmm2
	addl	$15, %eax
	movslq	%eax, %rax
	vsubsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, -152(%rbp)
	vmovsd	-96(%rbp), %xmm2
	vaddsd	-128(%rbp), %xmm2, %xmm2
	movl	-28(%rbp), %eax
	addl	$8, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-104(%rbp), %xmm2
	vaddsd	-136(%rbp), %xmm2, %xmm2
	movl	-28(%rbp), %eax
	addl	$9, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-96(%rbp), %xmm2
	vsubsd	-128(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-104(%rbp), %xmm2
	vsubsd	-136(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-64(%rbp), %xmm2, %xmm2
	vmovsd	-72(%rbp), %xmm3
	vxorpd	%xmm1, %xmm3, %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$12, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-72(%rbp), %xmm2
	vmulsd	-104(%rbp), %xmm2, %xmm2
	vmovsd	-64(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$13, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-112(%rbp), %xmm2
	vsubsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vaddsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-56(%rbp), %xmm2, %xmm2
	vmovsd	-48(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$10, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-56(%rbp), %xmm2
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-48(%rbp), %xmm3
	vmulsd	-104(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$11, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-112(%rbp), %xmm2
	vaddsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -96(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vsubsd	-144(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmulsd	-88(%rbp), %xmm2, %xmm2
	vmovsd	-80(%rbp), %xmm3
	vmulsd	-96(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$14, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-88(%rbp), %xmm2
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-80(%rbp), %xmm3
	vmulsd	-104(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-28(%rbp), %eax
	addl	$15, %eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	addl	$16, -28(%rbp)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB10_2
# BB#3:                                 # %for.end
	addq	$24, %rsp
	popq	%rbp
	ret
.Ltmp65:
	.size	cft1st, .Ltmp65-cft1st
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI11_0:
	.quad	-4611686018427387904    # double -2
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI11_1:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	cftmdl,@function
cftmdl:                                 # @cftmdl
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
	subq	$48, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movl	-8(%rbp), %eax
	shll	$2, %eax
	movl	%eax, -56(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_2:                               # %for.inc
                                        #   in Loop: Header=BB11_1 Depth=1
	movl	-28(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -136(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -152(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -160(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -168(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -176(%rbp)
	vmovsd	-120(%rbp), %xmm0
	vaddsd	-152(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm0
	vaddsd	-160(%rbp), %xmm0, %xmm0
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-120(%rbp), %xmm0
	vsubsd	-152(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm0
	vsubsd	-160(%rbp), %xmm0, %xmm0
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm0
	vsubsd	-176(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-144(%rbp), %xmm0
	vaddsd	-168(%rbp), %xmm0, %xmm0
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm0
	vaddsd	-176(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-144(%rbp), %xmm0
	vsubsd	-168(%rbp), %xmm0, %xmm0
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB11_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB11_2
# BB#3:                                 # %for.end
	movq	-24(%rbp), %rax
	vmovsd	16(%rax), %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB11_4
	.align	16, 0x90
.LBB11_5:                               # %for.inc168
                                        #   in Loop: Header=BB11_4 Depth=1
	movl	-28(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -136(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -152(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -160(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -168(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -176(%rbp)
	vmovsd	-120(%rbp), %xmm0
	vaddsd	-152(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm0
	vaddsd	-160(%rbp), %xmm0, %xmm0
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-160(%rbp), %xmm0
	vsubsd	-128(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-120(%rbp), %xmm0
	vsubsd	-152(%rbp), %xmm0, %xmm0
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm0
	vsubsd	-176(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	vmovsd	-144(%rbp), %xmm0
	vaddsd	-168(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	vmovsd	-120(%rbp), %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vmulsd	-72(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-120(%rbp), %xmm0
	vaddsd	-128(%rbp), %xmm0, %xmm0
	vmulsd	-72(%rbp), %xmm0, %xmm0
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	vmovsd	-176(%rbp), %xmm0
	vaddsd	-136(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	vmovsd	-168(%rbp), %xmm0
	vsubsd	-144(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	vsubsd	-120(%rbp), %xmm0, %xmm0
	vmulsd	-72(%rbp), %xmm0, %xmm0
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm0
	vaddsd	-120(%rbp), %xmm0, %xmm0
	vmulsd	-72(%rbp), %xmm0, %xmm0
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB11_4:                               # %for.cond78
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	addl	-56(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jl	.LBB11_5
# BB#6:                                 # %for.end170
	movl	$0, -48(%rbp)
	movl	-56(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -60(%rbp)
	movl	%eax, -44(%rbp)
	vmovsd	.LCPI11_0(%rip), %xmm0
	vmovsd	.LCPI11_1(%rip), %xmm1
	jmp	.LBB11_7
	.align	16, 0x90
.LBB11_14:                              # %for.inc417
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	-60(%rbp), %eax
	addl	%eax, -44(%rbp)
.LBB11_7:                               # %for.cond172
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_9 Depth 2
                                        #     Child Loop BB11_12 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB11_15
# BB#8:                                 # %for.body174
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	-48(%rbp), %eax
	leal	2(%rax), %ecx
	movl	%ecx, -48(%rbp)
	leal	4(%rax,%rax), %eax
	movl	%eax, -52(%rbp)
	movslq	-48(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -88(%rbp)
	movl	-48(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -96(%rbp)
	movslq	-52(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -72(%rbp)
	movl	-52(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -80(%rbp)
	vmulsd	-96(%rbp), %xmm0, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vaddsd	-72(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmovsd	-96(%rbp), %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	-72(%rbp), %xmm2, %xmm2
	vsubsd	-80(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -112(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB11_9
	.align	16, 0x90
.LBB11_10:                              # %for.inc294
                                        #   in Loop: Header=BB11_9 Depth=2
	movl	-28(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -136(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -144(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -152(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -160(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -168(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -176(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vaddsd	-152(%rbp), %xmm2, %xmm2
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm2
	vaddsd	-160(%rbp), %xmm2, %xmm2
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-120(%rbp), %xmm2
	vsubsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-128(%rbp), %xmm2
	vsubsd	-160(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-96(%rbp), %xmm2, %xmm2
	vmovsd	-88(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-96(%rbp), %xmm2
	vmulsd	-120(%rbp), %xmm2, %xmm2
	vmovsd	-88(%rbp), %xmm3
	vmulsd	-128(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm2
	vsubsd	-176(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-144(%rbp), %xmm2
	vaddsd	-168(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-80(%rbp), %xmm2, %xmm2
	vmovsd	-72(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm2
	vmulsd	-120(%rbp), %xmm2, %xmm2
	vmovsd	-72(%rbp), %xmm3
	vmulsd	-128(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm2
	vaddsd	-176(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-144(%rbp), %xmm2
	vsubsd	-168(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-112(%rbp), %xmm2, %xmm2
	vmovsd	-104(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-112(%rbp), %xmm2
	vmulsd	-120(%rbp), %xmm2, %xmm2
	vmovsd	-104(%rbp), %xmm3
	vmulsd	-128(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB11_9:                               # %for.cond193
                                        #   Parent Loop BB11_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	addl	-44(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jl	.LBB11_10
# BB#11:                                # %for.end296
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	-52(%rbp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -72(%rbp)
	movl	-52(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -80(%rbp)
	vmulsd	-88(%rbp), %xmm0, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vaddsd	-72(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -104(%rbp)
	vmovsd	-88(%rbp), %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	-72(%rbp), %xmm2, %xmm2
	vsubsd	-80(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -112(%rbp)
	movl	-44(%rbp), %eax
	addl	-56(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB11_12
	.align	16, 0x90
.LBB11_13:                              # %for.inc414
                                        #   in Loop: Header=BB11_12 Depth=2
	movl	-28(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -36(%rbp)
	addl	-8(%rbp), %eax
	movl	%eax, -40(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-32(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	movslq	-28(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-32(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -136(%rbp)
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-32(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -144(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-40(%rbp), %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -152(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vaddsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -160(%rbp)
	movslq	-36(%rbp), %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movslq	-40(%rbp), %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -168(%rbp)
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	-40(%rbp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	vsubsd	(%rax,%rcx,8), %xmm2, %xmm2
	vmovsd	%xmm2, -176(%rbp)
	vmovsd	-120(%rbp), %xmm2
	vaddsd	-152(%rbp), %xmm2, %xmm2
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-128(%rbp), %xmm2
	vaddsd	-160(%rbp), %xmm2, %xmm2
	movl	-28(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-120(%rbp), %xmm2
	vsubsd	-152(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-128(%rbp), %xmm2
	vsubsd	-160(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-88(%rbp), %xmm2, %xmm2
	vmovsd	-96(%rbp), %xmm3
	vxorpd	%xmm1, %xmm3, %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-96(%rbp), %xmm2
	vmulsd	-128(%rbp), %xmm2, %xmm2
	vmovsd	-88(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movl	-36(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm2
	vsubsd	-176(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-144(%rbp), %xmm2
	vaddsd	-168(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-80(%rbp), %xmm2, %xmm2
	vmovsd	-72(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-80(%rbp), %xmm2
	vmulsd	-120(%rbp), %xmm2, %xmm2
	vmovsd	-72(%rbp), %xmm3
	vmulsd	-128(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	vmovsd	-136(%rbp), %xmm2
	vaddsd	-176(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -120(%rbp)
	vmovsd	-144(%rbp), %xmm2
	vsubsd	-168(%rbp), %xmm2, %xmm2
	vmovsd	%xmm2, -128(%rbp)
	vmulsd	-112(%rbp), %xmm2, %xmm2
	vmovsd	-104(%rbp), %xmm3
	vmulsd	-120(%rbp), %xmm3, %xmm3
	vsubsd	%xmm2, %xmm3, %xmm2
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	vmovsd	%xmm2, (%rax,%rcx,8)
	vmovsd	-112(%rbp), %xmm2
	vmulsd	-120(%rbp), %xmm2, %xmm2
	vmovsd	-104(%rbp), %xmm3
	vmulsd	-128(%rbp), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	-40(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	vmovsd	%xmm2, (%rcx,%rax,8)
	addl	$2, -28(%rbp)
.LBB11_12:                              # %for.cond310
                                        #   Parent Loop BB11_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	addl	-56(%rbp), %eax
	addl	-8(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jge	.LBB11_14
	jmp	.LBB11_13
.LBB11_15:                              # %for.end419
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp71:
	.size	cftmdl, .Ltmp71-cftmdl
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "FFT sanity check failed! Difference is: %le\n"
	.size	.L.str, 45

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%e %e\n"
	.size	.L.str1, 7


	.section	".note.GNU-stack","",@progbits
