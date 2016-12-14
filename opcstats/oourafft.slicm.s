	.file	"oourafft.slicm.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4652218415073722368     # double 1024
.LCPI0_1:
	.quad	4616189618054758400     # double 4
.LCPI0_2:
	.quad	4890909195324358656     # double 9.223372036854775E+18
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
# BB#0:                                 # %entry.split.split
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
	subq	$40, %rsp
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
	callq	get_time
	callq	get_time
	vmovsd	.LCPI0_0(%rip), %xmm0
	callq	sqrt
	vmulsd	.LCPI0_1(%rip), %xmm0, %xmm0
	movabsq	$-9223372036854775808, %rcx # imm = 0x8000000000000000
	vmovsd	.LCPI0_2(%rip), %xmm1
	vsubsd	%xmm1, %xmm0, %xmm2
	vcvttsd2si	%xmm2, %rax
	xorq	%rcx, %rax
	vcvttsd2si	%xmm0, %rsi
	vucomisd	%xmm1, %xmm0
	cmovaeq	%rax, %rsi
	movl	$16, %edi
	callq	memalign
	movq	%rax, %r15
	movl	$16, %edi
	movl	$20480, %esi            # imm = 0x5000
	callq	memalign
	movq	%rax, %r14
	movl	$512, %edi              # imm = 0x200
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	makewt
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, %r13
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movl	$16, %edi
	movl	$16384, %esi            # imm = 0x4000
	callq	memalign
	movq	%rax, %r12
	xorl	%edi, %edi
	movl	$2047, %esi             # imm = 0x7FF
	movq	%r13, %rdx
	callq	putdata
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	movq	%r13, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	cdft
	movl	$-1, %ebx
	movl	$2048, %edi             # imm = 0x800
	movl	$-1, %esi
	movq	%r13, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	cdft
	vmovsd	.LCPI0_3(%rip), %xmm0
	xorl	%edi, %edi
	movl	$2047, %esi             # imm = 0x7FF
	movq	%r13, %rdx
	callq	errorcheck
	vandpd	.LCPI0_4(%rip), %xmm0, %xmm1
	vucomisd	.LCPI0_5(%rip), %xmm1
	ja	.LBB0_18
# BB#1:                                 # %if.end
	movq	%r13, %rdi
	xorl	%esi, %esi
	movl	$16384, %edx            # imm = 0x4000
	callq	memset
	xorl	%edi, %edi
	movl	$1023, %esi             # imm = 0x3FF
	movq	%r13, %rdx
	callq	putdata
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	movq	%r13, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	cdft
	leaq	8(%r13), %rax
	movq	%r13, -72(%rbp)         # 8-byte Spill
	vmovsd	.LCPI0_7(%rip), %xmm0
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_3:                                # %for.body
                                        #   in Loop: Header=BB0_2 Depth=1
	vmovsd	(%rax), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rax)
	leaq	16(%rax), %rax
.LBB0_2:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$1023, %ebx             # imm = 0x3FF
	jle	.LBB0_3
# BB#4:                                 # %for.end
	xorl	%r13d, %r13d
	movq	%r12, %rbx
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$16384, %edx            # imm = 0x4000
	callq	memset
	xorl	%edi, %edi
	movl	$1023, %esi             # imm = 0x3FF
	movq	%rbx, %rdx
	callq	putdata
	movq	-72(%rbp), %rax         # 8-byte Reload
	leaq	8(%rax), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	8(%rax), %rbx
	callq	get_time
	movq	-48(%rbp), %r12         # 8-byte Reload
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_9:                                # %for.inc60
                                        #   in Loop: Header=BB0_5 Depth=1
	movl	$2048, %edi             # imm = 0x800
	movl	$-1, %esi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	cdft
	incl	%r13d
.LBB0_5:                                # %for.cond22
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	cmpl	$149999, %r13d          # imm = 0x249EF
	jg	.LBB0_10
# BB#6:                                 # %for.body25
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%r12, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movl	$16384, %edx            # imm = 0x4000
	callq	memcpy
	movl	$2048, %edi             # imm = 0x800
	movl	$1, %esi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	cdft
	movl	$-1, %eax
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movq	%rbx, %rdx
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_8:                                # %for.body29.split.split.split
                                        #   in Loop: Header=BB0_7 Depth=2
	vmovsd	-8(%rcx), %xmm0
	vmovsd	(%rcx), %xmm1
	leaq	16(%rcx), %rcx
	vmovsd	-8(%rdx), %xmm2
	vmovsd	(%rdx), %xmm3
	vmulsd	%xmm1, %xmm3, %xmm4
	vmulsd	%xmm0, %xmm2, %xmm5
	vsubsd	%xmm4, %xmm5, %xmm4
	vmovsd	%xmm4, -8(%rdx)
	vmulsd	%xmm0, %xmm3, %xmm0
	vmulsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, (%rdx)
	leaq	16(%rdx), %rdx
.LBB0_7:                                # %for.cond26
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%eax
	cmpl	$1023, %eax             # imm = 0x3FF
	jg	.LBB0_9
	jmp	.LBB0_8
.LBB0_10:                               # %for.end62.split.split
	callq	get_time
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	8(%rax), %r12
	movl	$-1, %ebx
	vmovsd	.LCPI0_4(%rip), %xmm3
	movq	-72(%rbp), %rdi         # 8-byte Reload
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_16:                               # %cond.end93
                                        #   in Loop: Header=BB0_11 Depth=1
	addq	$16, %r12
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	movq	%r13, %rdi
	vmovsd	.LCPI0_4(%rip), %xmm3
.LBB0_11:                               # %for.cond67
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$1023, %ebx             # imm = 0x3FF
	jg	.LBB0_17
# BB#12:                                # %for.body70
                                        #   in Loop: Header=BB0_11 Depth=1
	vmovsd	-8(%r12), %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	.LCPI0_6(%rip), %xmm0
	vxorpd	%xmm0, %xmm0, %xmm0
	jbe	.LBB0_14
# BB#13:                                # %cond.true
                                        #   in Loop: Header=BB0_11 Depth=1
	vmovsd	-8(%r12), %xmm0
.LBB0_14:                               # %cond.end
                                        #   in Loop: Header=BB0_11 Depth=1
	movq	%rdi, %r13
	vmovsd	(%r12), %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vucomisd	.LCPI0_6(%rip), %xmm2
	jbe	.LBB0_16
# BB#15:                                # %cond.true87
                                        #   in Loop: Header=BB0_11 Depth=1
	vmovsd	(%r12), %xmm1
	jmp	.LBB0_16
.LBB0_17:                               # %for.end98
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	free
	movq	-56(%rbp), %rdi         # 8-byte Reload
	callq	free
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB0_18:                               # %if.then
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	callq	abort
.Ltmp11:
	.size	main, .Ltmp11-main
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
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
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
.Ltmp17:
	.size	get_time, .Ltmp17-get_time
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4607182418800017408     # double 1
.LCPI2_1:
	.quad	4611686018427387904     # double 2
	.text
	.globl	makewt
	.align	16, 0x90
	.type	makewt,@function
makewt:                                 # @makewt
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp24:
	.cfi_offset %rbx, -56
.Ltmp25:
	.cfi_offset %r12, -48
.Ltmp26:
	.cfi_offset %r13, -40
.Ltmp27:
	.cfi_offset %r14, -32
.Ltmp28:
	.cfi_offset %r15, -24
	movq	%rdx, %r13
	movq	%rsi, -72(%rbp)         # 8-byte Spill
	movl	%edi, %r15d
	cmpl	$3, %r15d
	jl	.LBB2_6
# BB#1:                                 # %if.then
	movl	%r15d, %r12d
	sarl	%r12d
	vcvtsi2sdl	%r12d, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)        # 8-byte Spill
	vmovsd	.LCPI2_0(%rip), %xmm0
	callq	atan
	vmovsd	-48(%rbp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)        # 8-byte Spill
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, (%r13)
	movq	$0, 8(%r13)
	vmulsd	%xmm1, %xmm0, %xmm0
	callq	cos
	leal	1(%r12), %eax
	movslq	%eax, %rax
	movslq	%r12d, %rcx
	cmpl	$3, %ecx
	vmovsd	%xmm0, (%r13,%rcx,8)
	vmovsd	%xmm0, (%r13,%rax,8)
	jl	.LBB2_6
# BB#2:                                 # %if.then11
	leal	-1(%r15), %ebx
	vmovsd	.LCPI2_1(%rip), %xmm0
	movl	$2, %r14d
	vmovsd	%xmm0, -48(%rbp)        # 8-byte Spill
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=1
	vcvtsi2sdl	%r14d, %xmm0, %xmm0
	vmovsd	-56(%rbp), %xmm1        # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm0
	callq	cos
	vmovsd	%xmm0, -64(%rbp)        # 8-byte Spill
	vmovsd	-56(%rbp), %xmm0        # 8-byte Reload
	vmulsd	-48(%rbp), %xmm0, %xmm0 # 8-byte Folded Reload
	callq	sin
	vmovsd	-64(%rbp), %xmm1        # 8-byte Reload
	vmovsd	%xmm1, (%r13,%r14,8)
	vmovsd	-48(%rbp), %xmm2        # 8-byte Reload
	vaddsd	.LCPI2_1(%rip), %xmm2, %xmm2
	vmovsd	%xmm2, -48(%rbp)        # 8-byte Spill
	movslq	%ebx, %rax
	addl	$-2, %ebx
	leal	-1(%rax), %ecx
	vmovsd	%xmm0, 8(%r13,%r14,8)
	addq	$2, %r14
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%r13,%rcx,8)
	vmovsd	%xmm1, (%r13,%rax,8)
.LBB2_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r12d, %r14d
	jl	.LBB2_4
# BB#5:                                 # %for.end
	movl	%r15d, %edi
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movq	%r13, %rdx
	callq	bitrv2
.LBB2_6:                                # %if.end32
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp29:
	.size	makewt, .Ltmp29-makewt
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
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	movslq	%edi, %r8
	xorl	%ecx, %ecx
	vmovsd	.LCPI3_0(%rip), %xmm0
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	imull	$7141, %ecx, %edi       # imm = 0x1BE5
	leal	54773(%rdi), %eax
	movslq	%eax, %rcx
	imulq	$-2123092475, %rcx, %rax # imm = 0xFFFFFFFF81742E05
	shrq	$32, %rax
	leal	54773(%rax,%rdi), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$17, %edi
	addl	%eax, %edi
	imull	$259200, %edi, %eax     # imm = 0x3F480
	subl	%eax, %ecx
	vcvtsi2sdl	%ecx, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%r8,8)
	incq	%r8
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %r8d
	jle	.LBB3_2
# BB#3:                                 # %for.end
	popq	%rbp
	ret
.Ltmp35:
	.size	putdata, .Ltmp35-putdata
	.cfi_endproc

	.globl	cdft
	.align	16, 0x90
	.type	cdft,@function
cdft:                                   # @cdft
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp39:
	.cfi_def_cfa_offset 16
.Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp41:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
.Ltmp42:
	.cfi_offset %rbx, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %rax
	movq	%rdx, %r15
	movl	%edi, %ebx
	cmpl	$5, %ebx
	jl	.LBB4_4
# BB#1:                                 # %if.then
	movl	%ebx, %edi
	testl	%esi, %esi
	js	.LBB4_3
# BB#2:                                 # %if.then2
	movq	%rax, %rsi
	movq	%r15, %rdx
	callq	bitrv2
	jmp	.LBB4_5
.LBB4_4:                                # %if.else3
	cmpl	$4, %ebx
	jne	.LBB4_6
.LBB4_5:                                # %if.then5
	movl	%ebx, %edi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	cftfsub
	jmp	.LBB4_6
.LBB4_3:                                # %if.else
	movq	%rax, %rsi
	movq	%r15, %rdx
	callq	bitrv2conj
	movl	%ebx, %edi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	cftbsub
.LBB4_6:                                # %if.end7
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp45:
	.size	cdft, .Ltmp45-cdft
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
.Ltmp48:
	.cfi_def_cfa_offset 16
.Ltmp49:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp50:
	.cfi_def_cfa_register %rbp
	movslq	%edi, %r8
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vmovsd	.LCPI5_0(%rip), %xmm2
	vmovsd	.LCPI5_1(%rip), %xmm3
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_4:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	incq	%r8
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %r8d
	jg	.LBB5_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	imull	$7141, %ecx, %edi       # imm = 0x1BE5
	leal	54773(%rdi), %eax
	movslq	%eax, %rcx
	imulq	$-2123092475, %rcx, %rax # imm = 0xFFFFFFFF81742E05
	shrq	$32, %rax
	vmulsd	(%rdx,%r8,8), %xmm0, %xmm4
	leal	54773(%rax,%rdi), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$17, %edi
	addl	%eax, %edi
	imull	$259200, %edi, %eax     # imm = 0x3F480
	subl	%eax, %ecx
	vcvtsi2sdl	%ecx, %xmm0, %xmm5
	vmulsd	%xmm2, %xmm5, %xmm5
	vsubsd	%xmm4, %xmm5, %xmm4
	vandpd	%xmm3, %xmm4, %xmm4
	vucomisd	%xmm4, %xmm1
	ja	.LBB5_4
# BB#3:                                 # %cond.false
                                        #   in Loop: Header=BB5_1 Depth=1
	vmovapd	%xmm4, %xmm1
	jmp	.LBB5_4
.LBB5_5:                                # %for.end
	vmovapd	%xmm1, %xmm0
	popq	%rbp
	ret
.Ltmp51:
	.size	errorcheck, .Ltmp51-errorcheck
	.cfi_endproc

	.align	16, 0x90
	.type	bitrv2,@function
bitrv2:                                 # @bitrv2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp55:
	.cfi_def_cfa_offset 16
.Ltmp56:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp57:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp58:
	.cfi_offset %rbx, -56
.Ltmp59:
	.cfi_offset %r12, -48
.Ltmp60:
	.cfi_offset %r13, -40
.Ltmp61:
	.cfi_offset %r14, -32
.Ltmp62:
	.cfi_offset %r15, -24
	movl	$0, (%rsi)
	movl	$1, %r9d
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_5:                                # %for.end
                                        #   in Loop: Header=BB6_1 Depth=1
	addl	%r9d, %r9d
.LBB6_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
	leal	(,%r9,8), %eax
	cmpl	%edi, %eax
	jge	.LBB6_6
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB6_1 Depth=1
	sarl	%edi
	xorl	%eax, %eax
	jmp	.LBB6_3
	.align	16, 0x90
.LBB6_4:                                # %for.inc
                                        #   in Loop: Header=BB6_3 Depth=2
	movl	(%rsi,%rax,4), %ecx
	addl	%edi, %ecx
	leal	(%r9,%rax), %ebx
	movslq	%ebx, %rbx
	movl	%ecx, (%rsi,%rbx,4)
	incq	%rax
.LBB6_3:                                # %for.cond
                                        #   Parent Loop BB6_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%r9d, %eax
	jge	.LBB6_5
	jmp	.LBB6_4
.LBB6_6:                                # %while.end
	leal	(%r9,%r9), %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	cmpl	%edi, %eax
	jne	.LBB6_12
# BB#7:                                 # %if.then
	movq	%rsi, -72(%rbp)         # 8-byte Spill
	leal	(,%r9,4), %eax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	imull	$6, %r9d, %eax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	xorl	%r10d, %r10d
	movq	-48(%rbp), %r13         # 8-byte Reload
	jmp	.LBB6_8
	.align	16, 0x90
.LBB6_11:                               # %for.inc139
                                        #   in Loop: Header=BB6_8 Depth=1
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leal	(%rdi,%r10,2), %eax
	movslq	%r10d, %rcx
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movl	(%rsi,%rcx,4), %esi
	leal	(%rax,%rsi), %ecx
	movslq	%ecx, %rcx
	leal	1(%rsi,%rax), %eax
	movslq	%eax, %rax
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	(%rdx,%rcx,8), %xmm1
	leal	1(%rdi,%rcx), %esi
	movslq	%esi, %rsi
	vmovsd	(%rdx,%rsi,8), %xmm2
	leal	(%rcx,%rdi), %edi
	movslq	%edi, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm3
	vmovsd	%xmm3, (%rdx,%rcx,8)
	incl	%r10d
	vmovsd	%xmm2, (%rdx,%rax,8)
	vmovsd	%xmm1, (%rdx,%rdi,8)
	vmovsd	%xmm0, (%rdx,%rsi,8)
	movl	-100(%rbp), %r9d        # 4-byte Reload
.LBB6_8:                                # %for.cond9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_9 Depth 2
	movl	%r10d, -76(%rbp)        # 4-byte Spill
	movl	%r9d, -100(%rbp)        # 4-byte Spill
	movq	$0, -56(%rbp)           # 8-byte Folded Spill
	cmpl	%r9d, %r10d
	movl	$0, %r9d
	jge	.LBB6_18
	jmp	.LBB6_9
	.align	16, 0x90
.LBB6_10:                               # %for.inc110
                                        #   in Loop: Header=BB6_9 Depth=2
	movslq	%r10d, %rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movl	(%rcx,%rax,4), %r14d
	movq	-56(%rbp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r14), %rsi
	movl	(%rcx,%rdi,2), %eax
	leal	1(%rax,%r10,2), %ecx
	movslq	%esi, %rsi
	leal	1(%rsi), %ebx
	movslq	%ebx, %r8
	vmovsd	(%rdx,%r8,8), %xmm0
	vmovsd	(%rdx,%rsi,8), %xmm1
	movslq	%ecx, %r12
	vmovsd	(%rdx,%r12,8), %xmm2
	movq	-96(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rdi), %rcx
	leal	(%rax,%r10,2), %eax
	movslq	%eax, %rax
	vmovsd	(%rdx,%rax,8), %xmm3
	vmovsd	%xmm3, (%rdx,%rsi,8)
	addq	%r14, %rcx
	leaq	(%r13,%rdi), %rsi
	movq	-88(%rbp), %rbx         # 8-byte Reload
	leaq	(%rbx,%rdi), %rbx
	addq	$2, %rdi
	movq	%rdi, -56(%rbp)         # 8-byte Spill
	incl	%r9d
	movl	%r9d, -60(%rbp)         # 4-byte Spill
	vmovsd	%xmm2, (%rdx,%r8,8)
	addq	%r14, %rsi
	leal	1(%rax,%r13,2), %r8d
	leal	(%rax,%r13,2), %r11d
	vmovsd	%xmm1, (%rdx,%rax,8)
	movslq	%esi, %r9
	incl	%esi
	movslq	%esi, %r10
	movslq	%r11d, %rax
	addq	%r14, %rbx
	movl	%eax, %r11d
	subl	%r13d, %r11d
	movslq	%r8d, %r8
	movslq	%ebx, %r14
	incl	%ebx
	vmovsd	%xmm0, (%rdx,%r12,8)
	vmovsd	(%rdx,%r10,8), %xmm0
	vmovsd	(%rdx,%r9,8), %xmm1
	vmovsd	(%rdx,%r8,8), %xmm2
	vmovsd	(%rdx,%rax,8), %xmm3
	movslq	%ebx, %r15
	leal	1(%r11), %esi
	movslq	%esi, %r12
	vmovsd	%xmm3, (%rdx,%r9,8)
	leal	1(%r11,%r13,2), %edi
	leal	(%r11,%r13,2), %esi
	vmovsd	%xmm2, (%rdx,%r10,8)
	movl	-76(%rbp), %r10d        # 4-byte Reload
	movslq	%ecx, %r9
	incl	%ecx
	movslq	%ecx, %rcx
	movslq	%r11d, %rbx
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	vmovsd	%xmm1, (%rdx,%rax,8)
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%rdx,%r15,8), %xmm0
	vmovsd	(%rdx,%r14,8), %xmm1
	vmovsd	(%rdx,%r12,8), %xmm2
	vmovsd	(%rdx,%rbx,8), %xmm3
	vmovsd	%xmm3, (%rdx,%r14,8)
	vmovsd	%xmm2, (%rdx,%r15,8)
	vmovsd	%xmm1, (%rdx,%rbx,8)
	vmovsd	%xmm0, (%rdx,%r12,8)
	vmovsd	(%rdx,%rcx,8), %xmm0
	vmovsd	(%rdx,%r9,8), %xmm1
	vmovsd	(%rdx,%rdi,8), %xmm2
	vmovsd	(%rdx,%rsi,8), %xmm3
	vmovsd	%xmm3, (%rdx,%r9,8)
	movl	-60(%rbp), %r9d         # 4-byte Reload
	vmovsd	%xmm2, (%rdx,%rcx,8)
	vmovsd	%xmm1, (%rdx,%rsi,8)
	vmovsd	%xmm0, (%rdx,%rdi,8)
.LBB6_9:                                # %for.cond12
                                        #   Parent Loop BB6_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%r10d, %r9d
	jge	.LBB6_11
	jmp	.LBB6_10
.LBB6_12:                               # %if.else
	movq	%rsi, %r11
	movl	$1, %r8d
	jmp	.LBB6_13
	.align	16, 0x90
.LBB6_17:                               # %for.inc201
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	%r8d
	movl	%r14d, %r9d
.LBB6_13:                               # %for.cond142
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_15 Depth 2
	cmpl	%r9d, %r8d
	movl	%r9d, %r14d
	jge	.LBB6_18
# BB#14:                                #   in Loop: Header=BB6_13 Depth=1
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	jmp	.LBB6_15
	.align	16, 0x90
.LBB6_16:                               # %for.inc198
                                        #   in Loop: Header=BB6_15 Depth=2
	movslq	%r8d, %rax
	movl	(%r11,%rax,4), %ebx
	leal	(%r10,%rbx), %eax
	movslq	%eax, %rax
	leal	1(%r10,%rbx), %ecx
	movslq	%ecx, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm0
	vmovsd	(%rdx,%rax,8), %xmm1
	movl	(%r11,%r9,4), %ecx
	leal	1(%rcx,%r8,2), %esi
	movslq	%esi, %rsi
	vmovsd	(%rdx,%rsi,8), %xmm2
	leal	(%rcx,%r8,2), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rdx,%rcx,8), %xmm3
	vmovsd	%xmm3, (%rdx,%rax,8)
	vmovsd	%xmm2, (%rdx,%rdi,8)
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leal	(%rdi,%r10), %eax
	leal	1(%rbx,%rax), %r15d
	incq	%r9
	vmovsd	%xmm1, (%rdx,%rcx,8)
	addl	%ebx, %eax
	movslq	%r15d, %rbx
	leal	(%rcx,%rdi), %r15d
	leal	1(%rdi,%rcx), %ecx
	addl	$2, %r10d
	vmovsd	%xmm0, (%rdx,%rsi,8)
	vmovsd	(%rdx,%rbx,8), %xmm0
	movslq	%eax, %rsi
	vmovsd	(%rdx,%rsi,8), %xmm1
	movslq	%ecx, %rax
	vmovsd	(%rdx,%rax,8), %xmm2
	movslq	%r15d, %rcx
	vmovsd	(%rdx,%rcx,8), %xmm3
	vmovsd	%xmm3, (%rdx,%rsi,8)
	vmovsd	%xmm2, (%rdx,%rbx,8)
	vmovsd	%xmm1, (%rdx,%rcx,8)
	vmovsd	%xmm0, (%rdx,%rax,8)
.LBB6_15:                               # %for.cond145
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%r8d, %r9d
	jge	.LBB6_17
	jmp	.LBB6_16
.LBB6_18:                               # %if.end
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp63:
	.size	bitrv2, .Ltmp63-bitrv2
	.cfi_endproc

	.align	16, 0x90
	.type	cftfsub,@function
cftfsub:                                # @cftfsub
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp67:
	.cfi_def_cfa_offset 16
.Ltmp68:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp69:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp70:
	.cfi_offset %rbx, -56
.Ltmp71:
	.cfi_offset %r12, -48
.Ltmp72:
	.cfi_offset %r13, -40
.Ltmp73:
	.cfi_offset %r14, -32
.Ltmp74:
	.cfi_offset %r15, -24
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movl	%edi, %r14d
	movl	$2, %esi
	cmpl	$9, %r14d
	jl	.LBB7_4
# BB#1:                                 # %if.then
	movl	%r14d, %edi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	cft1st
	movl	$8, %esi
	jmp	.LBB7_2
	.align	16, 0x90
.LBB7_3:                                # %while.body
                                        #   in Loop: Header=BB7_2 Depth=1
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	cftmdl
	movl	%r12d, %esi
.LBB7_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	leal	(,%rsi,4), %r12d
	cmpl	%r14d, %r12d
	jl	.LBB7_3
.LBB7_4:                                # %if.end
	leal	(,%rsi,4), %eax
	movl	%esi, %r8d
	cmpl	%r14d, %eax
	jne	.LBB7_8
# BB#5:                                 # %if.then5
	leal	(%rsi,%rsi,2), %r9d
	leal	(%rsi,%rsi), %r10d
	xorl	%edi, %edi
	jmp	.LBB7_6
	.align	16, 0x90
.LBB7_7:                                # %for.inc
                                        #   in Loop: Header=BB7_6 Depth=1
	leaq	(%r9,%rdi), %rax
	movslq	%eax, %r14
	vmovsd	(%rbx,%r14,8), %xmm10
	leaq	(%r10,%rdi), %rax
	movslq	%eax, %r15
	vmovsd	(%rbx,%r15,8), %xmm1
	vaddsd	%xmm10, %xmm1, %xmm8
	vmovsd	(%rbx,%rdi,8), %xmm4
	leaq	(%r8,%rdi), %rax
	movslq	%eax, %rdx
	vmovsd	(%rbx,%rdx,8), %xmm5
	vaddsd	%xmm5, %xmm4, %xmm9
	leal	1(%rdx), %eax
	movslq	%eax, %r11
	leal	1(%rdi), %eax
	movslq	%eax, %rax
	vaddsd	%xmm8, %xmm9, %xmm0
	vmovsd	(%rbx,%rax,8), %xmm6
	vmovsd	(%rbx,%r11,8), %xmm7
	leal	1(%r15), %ecx
	movslq	%ecx, %r13
	leal	1(%r14), %ecx
	movslq	%ecx, %r12
	vmovsd	(%rbx,%r12,8), %xmm2
	vmovsd	(%rbx,%r13,8), %xmm3
	vmovsd	%xmm0, (%rbx,%rdi,8)
	vsubsd	%xmm5, %xmm4, %xmm0
	vsubsd	%xmm2, %xmm3, %xmm4
	vsubsd	%xmm10, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm3, %xmm5
	vaddsd	%xmm7, %xmm6, %xmm2
	vaddsd	%xmm5, %xmm2, %xmm3
	vsubsd	%xmm7, %xmm6, %xmm6
	vmovsd	%xmm3, (%rbx,%rax,8)
	vsubsd	%xmm1, %xmm6, %xmm7
	vaddsd	%xmm4, %xmm0, %xmm3
	vaddsd	%xmm1, %xmm6, %xmm6
	vsubsd	%xmm4, %xmm0, %xmm0
	vsubsd	%xmm5, %xmm2, %xmm1
	vsubsd	%xmm8, %xmm9, %xmm2
	addq	$2, %rdi
	vmovsd	%xmm2, (%rbx,%r15,8)
	vmovsd	%xmm1, (%rbx,%r13,8)
	vmovsd	%xmm0, (%rbx,%rdx,8)
	vmovsd	%xmm6, (%rbx,%r11,8)
	vmovsd	%xmm3, (%rbx,%r14,8)
	vmovsd	%xmm7, (%rbx,%r12,8)
.LBB7_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %edi
	jge	.LBB7_11
	jmp	.LBB7_7
.LBB7_8:                                # %if.else.split
	xorl	%ecx, %ecx
	jmp	.LBB7_9
	.align	16, 0x90
.LBB7_10:                               # %for.inc116.split
                                        #   in Loop: Header=BB7_9 Depth=1
	leaq	(%r8,%rcx), %rax
	leal	1(%rcx), %edx
	movslq	%edx, %rdx
	vmovsd	(%rbx,%rdx,8), %xmm0
	leal	1(%rsi,%rcx), %edi
	movslq	%edi, %rdi
	vsubsd	(%rbx,%rdi,8), %xmm0, %xmm0
	vmovsd	(%rbx,%rcx,8), %xmm1
	movslq	%eax, %rax
	vmovsd	(%rbx,%rax,8), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm3
	vmovsd	%xmm3, (%rbx,%rcx,8)
	vsubsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%rbx,%rdx,8), %xmm2
	addq	$2, %rcx
	vaddsd	(%rbx,%rdi,8), %xmm2, %xmm2
	vmovsd	%xmm2, (%rbx,%rdx,8)
	vmovsd	%xmm1, (%rbx,%rax,8)
	vmovsd	%xmm0, (%rbx,%rdi,8)
.LBB7_9:                                # %for.cond83
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %ecx
	jl	.LBB7_10
.LBB7_11:                               # %if.end119
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp75:
	.size	cftfsub, .Ltmp75-cftfsub
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
.Ltmp79:
	.cfi_def_cfa_offset 16
.Ltmp80:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp81:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp82:
	.cfi_offset %rbx, -56
.Ltmp83:
	.cfi_offset %r12, -48
.Ltmp84:
	.cfi_offset %r13, -40
.Ltmp85:
	.cfi_offset %r14, -32
.Ltmp86:
	.cfi_offset %r15, -24
	movl	$0, (%rsi)
	movl	$1, %r9d
	jmp	.LBB8_1
	.align	16, 0x90
.LBB8_5:                                # %for.end
                                        #   in Loop: Header=BB8_1 Depth=1
	addl	%r9d, %r9d
.LBB8_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	leal	(,%r9,8), %eax
	cmpl	%edi, %eax
	jge	.LBB8_6
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB8_1 Depth=1
	sarl	%edi
	xorl	%eax, %eax
	jmp	.LBB8_3
	.align	16, 0x90
.LBB8_4:                                # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	movl	(%rsi,%rax,4), %ecx
	addl	%edi, %ecx
	leal	(%r9,%rax), %ebx
	movslq	%ebx, %rbx
	movl	%ecx, (%rsi,%rbx,4)
	incq	%rax
.LBB8_3:                                # %for.cond
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%r9d, %eax
	jge	.LBB8_5
	jmp	.LBB8_4
.LBB8_6:                                # %while.end
	movq	%rsi, -64(%rbp)         # 8-byte Spill
	leal	(%r9,%r9), %r12d
	cmpl	%edi, %eax
	jne	.LBB8_12
# BB#7:                                 # %if.then
	movq	%r12, -72(%rbp)         # 8-byte Spill
	leal	(,%r9,4), %eax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	imull	$6, %r9d, %eax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	xorl	%r11d, %r11d
	vmovsd	.LCPI8_0(%rip), %xmm0
	jmp	.LBB8_8
	.align	16, 0x90
.LBB8_11:                               # %for.inc164
                                        #   in Loop: Header=BB8_8 Depth=1
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movl	(%rcx,%rax,4), %eax
	leal	1(%rax,%r11,2), %ecx
	leal	(%rax,%r11,2), %esi
	movslq	%ecx, %rax
	vmovsd	(%rdx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	movq	-72(%rbp), %rcx         # 8-byte Reload
	leal	(%rsi,%rcx), %edi
	leal	1(%rcx,%rdi), %eax
	movslq	%eax, %r8
	movslq	%edi, %rax
	leal	1(%rcx,%rsi), %esi
	movslq	%esi, %rsi
	incl	%r11d
	vmovsd	(%rdx,%rsi,8), %xmm1
	vmovsd	(%rdx,%rax,8), %xmm2
	vmovsd	(%rdx,%r8,8), %xmm3
	leal	(%rax,%rcx), %edi
	movslq	%edi, %rbx
	vmovsd	(%rdx,%rbx,8), %xmm4
	leal	1(%rcx,%rbx), %edi
	movslq	%edi, %rdi
	vmovsd	%xmm4, (%rdx,%rax,8)
	vxorpd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%rsi,8)
	vmovsd	%xmm2, (%rdx,%rbx,8)
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%r8,8)
	vmovsd	(%rdx,%rdi,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rdi,8)
	movl	-100(%rbp), %r9d        # 4-byte Reload
.LBB8_8:                                # %for.cond9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_9 Depth 2
	movl	%r11d, -76(%rbp)        # 4-byte Spill
	movl	%r9d, -100(%rbp)        # 4-byte Spill
	xorl	%r10d, %r10d
	cmpl	%r9d, %r11d
	movl	$0, %r14d
	jge	.LBB8_18
	jmp	.LBB8_9
	.align	16, 0x90
.LBB8_10:                               # %for.inc118
                                        #   in Loop: Header=BB8_9 Depth=2
	movq	-64(%rbp), %rbx         # 8-byte Reload
	movl	(%rbx,%rax,4), %edi
	leaq	(%r10,%rdi), %rcx
	leal	1(%rcx), %eax
	movslq	%eax, %r9
	movslq	%ecx, %rsi
	vmovsd	(%rdx,%rsi,8), %xmm1
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r10), %r12
	vmovsd	(%rdx,%r9,8), %xmm2
	movl	(%rbx,%r10,2), %ebx
	leal	1(%rbx,%r11,2), %eax
	movslq	%eax, %r13
	vmovsd	(%rdx,%r13,8), %xmm3
	leal	(%rbx,%r11,2), %eax
	movslq	%eax, %r8
	vmovsd	(%rdx,%r8,8), %xmm4
	vmovsd	%xmm4, (%rdx,%rsi,8)
	addq	%rdi, %r12
	movq	-88(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r10), %rbx
	addq	%rdi, %rbx
	movq	-72(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%r10), %r11
	vxorpd	%xmm0, %xmm3, %xmm3
	addq	$2, %r10
	incl	%r14d
	movl	%r14d, -44(%rbp)        # 4-byte Spill
	vmovsd	%xmm3, (%rdx,%r9,8)
	addq	%rdi, %r11
	leal	1(%r11), %eax
	leal	1(%r8,%rcx,2), %esi
	movslq	%eax, %r9
	movslq	%esi, %r14
	leal	1(%rbx), %eax
	movslq	%eax, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	vmovsd	%xmm1, (%rdx,%r8,8)
	vxorpd	%xmm0, %xmm2, %xmm1
	leal	(%r8,%rcx,2), %eax
	vmovsd	%xmm1, (%rdx,%r13,8)
	movslq	%r11d, %rsi
	movslq	%eax, %r11
	subl	%ecx, %eax
	movslq	%ebx, %r8
	leal	1(%rax,%rcx,2), %r13d
	leal	(%rax,%rcx,2), %r15d
	vmovsd	(%rdx,%r9,8), %xmm1
	vmovsd	(%rdx,%rsi,8), %xmm2
	vmovsd	(%rdx,%r14,8), %xmm3
	vmovsd	(%rdx,%r11,8), %xmm4
	vmovsd	%xmm4, (%rdx,%rsi,8)
	movslq	%eax, %rdi
	incl	%eax
	movslq	%eax, %rsi
	vxorpd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%r9,8)
	movslq	%r12d, %r9
	incl	%r12d
	movslq	%r12d, %rbx
	movslq	%r15d, %rax
	movslq	%r13d, %r15
	vmovsd	%xmm2, (%rdx,%r11,8)
	movl	-76(%rbp), %r11d        # 4-byte Reload
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%r14,8)
	movl	-44(%rbp), %r14d        # 4-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	vmovsd	(%rdx,%rcx,8), %xmm1
	vmovsd	(%rdx,%r8,8), %xmm2
	vmovsd	(%rdx,%rsi,8), %xmm3
	vmovsd	(%rdx,%rdi,8), %xmm4
	vmovsd	%xmm4, (%rdx,%r8,8)
	vxorpd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%rcx,8)
	vmovsd	%xmm2, (%rdx,%rdi,8)
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rsi,8)
	vmovsd	(%rdx,%rbx,8), %xmm1
	vmovsd	(%rdx,%r9,8), %xmm2
	vmovsd	(%rdx,%r15,8), %xmm3
	vmovsd	(%rdx,%rax,8), %xmm4
	vmovsd	%xmm4, (%rdx,%r9,8)
	vxorpd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%rbx,8)
	vmovsd	%xmm2, (%rdx,%rax,8)
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%r15,8)
.LBB8_9:                                # %for.cond12
                                        #   Parent Loop BB8_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%r11d, %rax
	cmpl	%r11d, %r14d
	jge	.LBB8_11
	jmp	.LBB8_10
.LBB8_12:                               # %if.else
	vmovsd	8(%rdx), %xmm1
	vmovsd	.LCPI8_0(%rip), %xmm0
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 8(%rdx)
	leal	1(%r12), %eax
	movslq	%eax, %rax
	vmovsd	(%rdx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	movl	$1, %r8d
	jmp	.LBB8_13
	.align	16, 0x90
.LBB8_17:                               # %for.inc260
                                        #   in Loop: Header=BB8_13 Depth=1
	movl	(%r14,%rax,4), %eax
	leal	1(%rax,%r8,2), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rdx,%rcx,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rcx,8)
	leal	(%rax,%r8,2), %eax
	leal	1(%r12,%rax), %eax
	movslq	%eax, %rax
	incl	%r8d
	vmovsd	(%rdx,%rax,8), %xmm1
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	movl	%r15d, %r9d
.LBB8_13:                               # %for.cond177
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_15 Depth 2
	cmpl	%r9d, %r8d
	movl	%r9d, %r15d
	jge	.LBB8_18
# BB#14:                                #   in Loop: Header=BB8_13 Depth=1
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	movq	-64(%rbp), %r14         # 8-byte Reload
	jmp	.LBB8_15
	.align	16, 0x90
.LBB8_16:                               # %for.inc237
                                        #   in Loop: Header=BB8_15 Depth=2
	movl	(%r14,%rax,4), %esi
	leal	(%r10,%rsi), %eax
	movslq	%eax, %rax
	leal	1(%r10,%rsi), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rdx,%rcx,8), %xmm1
	vmovsd	(%rdx,%rax,8), %xmm2
	movl	(%r14,%r9,4), %edi
	leal	1(%rdi,%r8,2), %ebx
	movslq	%ebx, %r11
	vmovsd	(%rdx,%r11,8), %xmm3
	leal	(%rdi,%r8,2), %edi
	movslq	%edi, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm4
	vmovsd	%xmm4, (%rdx,%rax,8)
	vxorpd	%xmm0, %xmm3, %xmm3
	leal	(%r12,%r10), %eax
	incq	%r9
	leal	1(%rsi,%rax), %ebx
	vmovsd	%xmm3, (%rdx,%rcx,8)
	vmovsd	%xmm2, (%rdx,%rdi,8)
	addl	%esi, %eax
	movslq	%ebx, %rsi
	leal	(%rdi,%r12), %ecx
	leal	1(%r12,%rdi), %edi
	vxorpd	%xmm0, %xmm1, %xmm1
	addl	$2, %r10d
	vmovsd	%xmm1, (%rdx,%r11,8)
	vmovsd	(%rdx,%rsi,8), %xmm1
	movslq	%eax, %rbx
	vmovsd	(%rdx,%rbx,8), %xmm2
	movslq	%edi, %rax
	vmovsd	(%rdx,%rax,8), %xmm3
	movslq	%ecx, %rcx
	vmovsd	(%rdx,%rcx,8), %xmm4
	vmovsd	%xmm4, (%rdx,%rbx,8)
	vxorpd	%xmm0, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%rsi,8)
	vmovsd	%xmm2, (%rdx,%rcx,8)
	vxorpd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
.LBB8_15:                               # %for.cond180
                                        #   Parent Loop BB8_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%r8d, %rax
	cmpl	%r8d, %r9d
	jge	.LBB8_17
	jmp	.LBB8_16
.LBB8_18:                               # %if.end
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp87:
	.size	bitrv2conj, .Ltmp87-bitrv2conj
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
.Ltmp91:
	.cfi_def_cfa_offset 16
.Ltmp92:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp93:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp94:
	.cfi_offset %rbx, -56
.Ltmp95:
	.cfi_offset %r12, -48
.Ltmp96:
	.cfi_offset %r13, -40
.Ltmp97:
	.cfi_offset %r14, -32
.Ltmp98:
	.cfi_offset %r15, -24
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movl	%edi, %r14d
	movl	$2, %esi
	cmpl	$9, %r14d
	jl	.LBB9_4
# BB#1:                                 # %if.then
	movl	%r14d, %edi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	cft1st
	movl	$8, %esi
	jmp	.LBB9_2
	.align	16, 0x90
.LBB9_3:                                # %while.body
                                        #   in Loop: Header=BB9_2 Depth=1
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	cftmdl
	movl	%r12d, %esi
.LBB9_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	leal	(,%rsi,4), %r12d
	cmpl	%r14d, %r12d
	jl	.LBB9_3
.LBB9_4:                                # %if.end
	leal	(,%rsi,4), %eax
	movl	%esi, %r8d
	cmpl	%r14d, %eax
	jne	.LBB9_8
# BB#5:                                 # %if.then5
	leal	(%rsi,%rsi,2), %r9d
	leal	(%rsi,%rsi), %r10d
	xorl	%edi, %edi
	vmovsd	.LCPI9_0(%rip), %xmm8
	jmp	.LBB9_6
	.align	16, 0x90
.LBB9_7:                                # %for.inc
                                        #   in Loop: Header=BB9_6 Depth=1
	leaq	(%r9,%rdi), %rax
	movslq	%eax, %r14
	vmovsd	(%rbx,%r14,8), %xmm11
	leaq	(%r10,%rdi), %rax
	movslq	%eax, %r15
	vmovsd	(%rbx,%r15,8), %xmm4
	vaddsd	%xmm11, %xmm4, %xmm9
	vmovsd	(%rbx,%rdi,8), %xmm5
	leaq	(%r8,%rdi), %rax
	movslq	%eax, %rdx
	vmovsd	(%rbx,%rdx,8), %xmm6
	vaddsd	%xmm6, %xmm5, %xmm10
	leal	1(%rdx), %eax
	movslq	%eax, %r11
	leal	1(%rdi), %eax
	movslq	%eax, %rax
	vaddsd	%xmm9, %xmm10, %xmm1
	vmovsd	(%rbx,%r11,8), %xmm7
	vmovsd	(%rbx,%rax,8), %xmm0
	leal	1(%r15), %ecx
	movslq	%ecx, %r13
	leal	1(%r14), %ecx
	movslq	%ecx, %r12
	vmovsd	(%rbx,%r12,8), %xmm2
	vmovsd	(%rbx,%r13,8), %xmm3
	vmovsd	%xmm1, (%rbx,%rdi,8)
	vsubsd	%xmm6, %xmm5, %xmm5
	vsubsd	%xmm2, %xmm3, %xmm1
	vsubsd	%xmm11, %xmm4, %xmm6
	vaddsd	%xmm2, %xmm3, %xmm4
	vxorpd	%xmm8, %xmm0, %xmm2
	vsubsd	%xmm7, %xmm2, %xmm2
	vsubsd	%xmm4, %xmm2, %xmm3
	vsubsd	%xmm0, %xmm7, %xmm7
	vmovsd	%xmm3, (%rbx,%rax,8)
	vaddsd	%xmm6, %xmm7, %xmm0
	vaddsd	%xmm1, %xmm5, %xmm3
	vsubsd	%xmm6, %xmm7, %xmm6
	vsubsd	%xmm1, %xmm5, %xmm1
	vaddsd	%xmm4, %xmm2, %xmm2
	vsubsd	%xmm9, %xmm10, %xmm4
	addq	$2, %rdi
	vmovsd	%xmm4, (%rbx,%r15,8)
	vmovsd	%xmm2, (%rbx,%r13,8)
	vmovsd	%xmm1, (%rbx,%rdx,8)
	vmovsd	%xmm6, (%rbx,%r11,8)
	vmovsd	%xmm3, (%rbx,%r14,8)
	vmovsd	%xmm0, (%rbx,%r12,8)
.LBB9_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %edi
	jge	.LBB9_11
	jmp	.LBB9_7
.LBB9_8:                                # %if.else.split
	xorl	%ecx, %ecx
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_9
	.align	16, 0x90
.LBB9_10:                               # %for.inc123.split
                                        #   in Loop: Header=BB9_9 Depth=1
	leaq	(%r8,%rcx), %rax
	vmovsd	(%rbx,%rcx,8), %xmm1
	movslq	%eax, %rdx
	vmovsd	(%rbx,%rdx,8), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm4
	leal	1(%rsi,%rcx), %eax
	movslq	%eax, %rdi
	vmovsd	(%rbx,%rdi,8), %xmm3
	leal	1(%rcx), %eax
	movslq	%eax, %rax
	vsubsd	(%rbx,%rax,8), %xmm3, %xmm3
	vmovsd	%xmm4, (%rbx,%rcx,8)
	vsubsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%rbx,%rax,8), %xmm2
	addq	$2, %rcx
	vxorpd	%xmm0, %xmm2, %xmm2
	vsubsd	(%rbx,%rdi,8), %xmm2, %xmm2
	vmovsd	%xmm2, (%rbx,%rax,8)
	vmovsd	%xmm1, (%rbx,%rdx,8)
	vmovsd	%xmm3, (%rbx,%rdi,8)
.LBB9_9:                                # %for.cond85
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %ecx
	jl	.LBB9_10
.LBB9_11:                               # %if.end126
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp99:
	.size	cftbsub, .Ltmp99-cftbsub
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI10_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	cft1st,@function
cft1st:                                 # @cft1st
	.cfi_startproc
# BB#0:                                 # %entry.split.split.split.split.split.split.split.split
	pushq	%rbp
.Ltmp103:
	.cfi_def_cfa_offset 16
.Ltmp104:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp105:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp106:
	.cfi_offset %rbx, -56
.Ltmp107:
	.cfi_offset %r12, -48
.Ltmp108:
	.cfi_offset %r13, -40
.Ltmp109:
	.cfi_offset %r14, -32
.Ltmp110:
	.cfi_offset %r15, -24
	movl	%edi, -68(%rbp)         # 4-byte Spill
	vmovsd	48(%rsi), %xmm8
	vmovsd	32(%rsi), %xmm9
	vaddsd	%xmm8, %xmm9, %xmm5
	vmovsd	16(%rsi), %xmm10
	vmovsd	(%rsi), %xmm12
	vmovsd	8(%rsi), %xmm11
	vaddsd	%xmm10, %xmm12, %xmm1
	vaddsd	%xmm5, %xmm1, %xmm0
	vmovsd	24(%rsi), %xmm7
	vmovsd	56(%rsi), %xmm2
	vmovsd	40(%rsi), %xmm3
	vmovsd	%xmm0, (%rsi)
	vaddsd	%xmm2, %xmm3, %xmm6
	vaddsd	%xmm7, %xmm11, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm4
	vmovsd	%xmm4, 8(%rsi)
	vsubsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, 32(%rsi)
	vsubsd	%xmm2, %xmm3, %xmm2
	vsubsd	%xmm10, %xmm12, %xmm4
	vsubsd	%xmm8, %xmm9, %xmm5
	vsubsd	%xmm7, %xmm11, %xmm7
	vsubsd	%xmm5, %xmm7, %xmm1
	vaddsd	%xmm2, %xmm4, %xmm3
	vaddsd	%xmm5, %xmm7, %xmm5
	vsubsd	%xmm2, %xmm4, %xmm2
	vsubsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%rsi)
	vmovsd	%xmm2, 16(%rsi)
	vmovsd	%xmm5, 24(%rsi)
	vmovsd	%xmm3, 48(%rsi)
	vmovsd	%xmm1, 56(%rsi)
	vmovsd	112(%rsi), %xmm9
	vmovsd	96(%rsi), %xmm11
	vaddsd	%xmm9, %xmm11, %xmm13
	vmovsd	80(%rsi), %xmm8
	vmovsd	64(%rsi), %xmm10
	vmovsd	72(%rsi), %xmm12
	vaddsd	%xmm8, %xmm10, %xmm3
	vaddsd	%xmm13, %xmm3, %xmm4
	vmovsd	16(%rdx), %xmm0
	vmovsd	88(%rsi), %xmm1
	vmovsd	120(%rsi), %xmm7
	vmovsd	104(%rsi), %xmm2
	vmovsd	%xmm4, 64(%rsi)
	vaddsd	%xmm7, %xmm2, %xmm4
	vaddsd	%xmm1, %xmm12, %xmm5
	vaddsd	%xmm4, %xmm5, %xmm6
	vmovsd	%xmm6, 72(%rsi)
	vsubsd	%xmm5, %xmm4, %xmm4
	vmovsd	%xmm4, 96(%rsi)
	vsubsd	%xmm13, %xmm3, %xmm3
	movl	$3, %edi
	xorl	%ecx, %ecx
	movl	$7, %r15d
	vmovsd	%xmm3, 104(%rsi)
	vsubsd	%xmm9, %xmm11, %xmm3
	vsubsd	%xmm1, %xmm12, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm5
	vsubsd	%xmm7, %xmm2, %xmm2
	vsubsd	%xmm8, %xmm10, %xmm4
	vsubsd	%xmm2, %xmm4, %xmm6
	vsubsd	%xmm5, %xmm6, %xmm7
	vmulsd	%xmm7, %xmm0, %xmm7
	vmovsd	%xmm7, 80(%rsi)
	vaddsd	%xmm5, %xmm6, %xmm5
	vmulsd	%xmm5, %xmm0, %xmm5
	vmovsd	%xmm5, 88(%rsi)
	vaddsd	%xmm2, %xmm4, %xmm2
	vsubsd	%xmm1, %xmm3, %xmm1
	vsubsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm0, %xmm3
	vmovsd	%xmm3, 112(%rsi)
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 120(%rsi)
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_2:                               # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	leal	22(%rcx), %eax
	leal	20(%rcx), %ebx
	movslq	%ebx, %r14
	movslq	%eax, %r10
	leal	18(%rcx), %eax
	movslq	%eax, %r9
	vmovsd	128(%rsi,%rcx,8), %xmm0
	vmovsd	%xmm0, -64(%rbp)        # 8-byte Spill
	vmovsd	(%rsi,%r9,8), %xmm1
	vmovsd	%xmm1, -56(%rbp)        # 8-byte Spill
	vmovsd	(%rsi,%r10,8), %xmm12
	vmovsd	(%rsi,%r14,8), %xmm13
	leal	-3(%r15), %ebx
	leal	-2(%r15), %eax
	movslq	%eax, %rax
	movslq	%ebx, %rbx
	vaddsd	%xmm12, %xmm13, %xmm15
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	(%rdx,%rbx,8), %xmm8
	leal	21(%rcx), %ebx
	vmovsd	(%rdx,%rax,8), %xmm9
	movslq	%edi, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm11
	movslq	%ebx, %r13
	leal	23(%rcx), %ebx
	movslq	%ebx, %r11
	leal	17(%rcx), %ebx
	movslq	%ebx, %rbx
	leal	19(%rcx), %eax
	movslq	%eax, %r12
	vaddsd	%xmm15, %xmm5, %xmm1
	vmovsd	16(%rdx,%rcx), %xmm4
	vmovsd	%xmm4, -48(%rbp)        # 8-byte Spill
	vmovsd	(%rsi,%r12,8), %xmm14
	vmovsd	(%rsi,%rbx,8), %xmm7
	vmovsd	(%rsi,%r11,8), %xmm0
	vmovsd	(%rsi,%r13,8), %xmm2
	vmovsd	%xmm1, 128(%rsi,%rcx,8)
	vaddsd	%xmm0, %xmm2, %xmm3
	vaddsd	%xmm14, %xmm7, %xmm10
	vaddsd	%xmm3, %xmm10, %xmm1
	vmovsd	%xmm1, (%rsi,%rbx,8)
	vsubsd	%xmm15, %xmm5, %xmm1
	vsubsd	%xmm3, %xmm10, %xmm5
	vmulsd	%xmm5, %xmm11, %xmm3
	vmovaps	%xmm4, %xmm6
	vmulsd	%xmm1, %xmm6, %xmm4
	vsubsd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm3, (%rsi,%r14,8)
	vmulsd	%xmm1, %xmm11, %xmm1
	vmulsd	%xmm5, %xmm6, %xmm3
	vaddsd	%xmm1, %xmm3, %xmm1
	vmovsd	%xmm1, (%rsi,%r13,8)
	vsubsd	%xmm0, %xmm2, %xmm1
	vsubsd	%xmm12, %xmm13, %xmm2
	vsubsd	%xmm14, %xmm7, %xmm5
	vaddsd	%xmm2, %xmm5, %xmm6
	vmovsd	-64(%rbp), %xmm0        # 8-byte Reload
	vsubsd	-56(%rbp), %xmm0, %xmm0 # 8-byte Folded Reload
	vmulsd	%xmm6, %xmm9, %xmm7
	vsubsd	%xmm1, %xmm0, %xmm3
	vmulsd	%xmm3, %xmm8, %xmm4
	vsubsd	%xmm7, %xmm4, %xmm4
	vmovsd	%xmm4, (%rsi,%r9,8)
	vmulsd	%xmm3, %xmm9, %xmm3
	vmulsd	%xmm6, %xmm8, %xmm4
	vaddsd	%xmm3, %xmm4, %xmm7
	vaddsd	%xmm11, %xmm11, %xmm6
	vsubsd	%xmm2, %xmm5, %xmm5
	vmulsd	%xmm8, %xmm6, %xmm2
	vsubsd	%xmm9, %xmm2, %xmm2
	leal	-1(%r15), %eax
	movslq	%eax, %rbx
	leal	29(%rcx), %eax
	movslq	%eax, %r14
	vmovsd	%xmm7, (%rsi,%r12,8)
	vmulsd	%xmm5, %xmm2, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm9, %xmm6, %xmm1
	vsubsd	%xmm1, %xmm8, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm4
	vsubsd	%xmm3, %xmm4, %xmm3
	leal	31(%rcx), %eax
	movslq	%eax, %r9
	vmovsd	%xmm3, (%rsi,%r10,8)
	vmulsd	%xmm0, %xmm2, %xmm0
	vmulsd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	leal	25(%rcx), %eax
	movslq	%eax, %r13
	vmovsd	%xmm0, (%rsi,%r11,8)
	leal	27(%rcx), %eax
	movslq	%eax, %r10
	vmovsd	(%rdx,%rbx,8), %xmm10
	leal	24(%rcx), %eax
	movslq	%eax, %rax
	movslq	%r15d, %r15
	vmovsd	(%rdx,%r15,8), %xmm12
	leal	26(%rcx), %ebx
	movslq	%ebx, %r12
	leal	28(%rcx), %ebx
	movslq	%ebx, %r8
	leal	30(%rcx), %ebx
	movslq	%ebx, %r11
	vmovsd	(%rsi,%r11,8), %xmm13
	vmovsd	(%rsi,%r8,8), %xmm9
	vaddsd	%xmm13, %xmm9, %xmm5
	vmovsd	(%rsi,%r12,8), %xmm15
	vmovsd	(%rsi,%rax,8), %xmm8
	vaddsd	%xmm15, %xmm8, %xmm6
	vaddsd	%xmm5, %xmm6, %xmm1
	vmovsd	(%rsi,%r10,8), %xmm14
	vmovsd	(%rsi,%r13,8), %xmm0
	vmovsd	(%rsi,%r9,8), %xmm2
	vmovsd	(%rsi,%r14,8), %xmm4
	vmovsd	%xmm1, (%rsi,%rax,8)
	vaddsd	%xmm2, %xmm4, %xmm1
	vaddsd	%xmm14, %xmm0, %xmm7
	vaddsd	%xmm1, %xmm7, %xmm3
	vmovsd	%xmm3, (%rsi,%r13,8)
	vsubsd	%xmm1, %xmm7, %xmm1
	vsubsd	%xmm5, %xmm6, %xmm5
	vxorpd	.LCPI10_0(%rip), %xmm11, %xmm3
	vmulsd	%xmm5, %xmm3, %xmm6
	vmovsd	-48(%rbp), %xmm7        # 8-byte Reload
	vmulsd	%xmm1, %xmm7, %xmm3
	vsubsd	%xmm3, %xmm6, %xmm6
	vmulsd	%xmm1, %xmm11, %xmm1
	vmovsd	%xmm6, (%rsi,%r8,8)
	vmulsd	%xmm5, %xmm7, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm6
	vsubsd	%xmm2, %xmm4, %xmm11
	vsubsd	%xmm13, %xmm9, %xmm2
	vsubsd	%xmm14, %xmm0, %xmm5
	vaddsd	%xmm2, %xmm5, %xmm0
	vsubsd	%xmm15, %xmm8, %xmm1
	vmulsd	%xmm0, %xmm12, %xmm4
	vmovsd	%xmm6, (%rsi,%r14,8)
	vsubsd	%xmm11, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm10, %xmm6
	vsubsd	%xmm4, %xmm6, %xmm6
	addl	$4, %r15d
	addq	$16, %rcx
	addl	$2, %edi
	vaddsd	%xmm7, %xmm7, %xmm4
	vmovsd	%xmm6, (%rsi,%r12,8)
	vmulsd	%xmm3, %xmm12, %xmm3
	vmulsd	%xmm0, %xmm10, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r10,8)
	vsubsd	%xmm2, %xmm5, %xmm0
	vmulsd	%xmm10, %xmm4, %xmm2
	vsubsd	%xmm12, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm3
	vaddsd	%xmm11, %xmm1, %xmm1
	vmulsd	%xmm12, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm10, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm5
	vsubsd	%xmm3, %xmm5, %xmm3
	vmovsd	%xmm3, (%rsi,%r11,8)
	vmulsd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm0, %xmm4, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%r9,8)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	leal	16(%rcx), %eax
	cmpl	-68(%rbp), %eax         # 4-byte Folded Reload
	jl	.LBB10_2
# BB#3:                                 # %for.end
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp111:
	.size	cft1st, .Ltmp111-cft1st
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI11_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.align	16, 0x90
	.type	cftmdl,@function
cftmdl:                                 # @cftmdl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp115:
	.cfi_def_cfa_offset 16
.Ltmp116:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp117:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp118:
	.cfi_offset %rbx, -56
.Ltmp119:
	.cfi_offset %r12, -48
.Ltmp120:
	.cfi_offset %r13, -40
.Ltmp121:
	.cfi_offset %r14, -32
.Ltmp122:
	.cfi_offset %r15, -24
	movq	%rcx, -112(%rbp)        # 8-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	movl	%edi, -132(%rbp)        # 4-byte Spill
	movl	%esi, %r10d
	leal	(,%r10,4), %r13d
	leal	(%r10,%r10,2), %r8d
	movl	%r10d, %r9d
	addl	%r10d, %r9d
	xorl	%edi, %edi
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_2:                               # %for.inc
                                        #   in Loop: Header=BB11_1 Depth=1
	leaq	(%r8,%rdi), %rax
	movslq	%eax, %r14
	vmovsd	(%rdx,%r14,8), %xmm10
	leaq	(%r9,%rdi), %rax
	movslq	%eax, %r15
	vmovsd	(%rdx,%r15,8), %xmm1
	vaddsd	%xmm10, %xmm1, %xmm8
	vmovsd	(%rdx,%rdi,8), %xmm4
	leaq	(%r10,%rdi), %rax
	movslq	%eax, %rbx
	vmovsd	(%rdx,%rbx,8), %xmm5
	vaddsd	%xmm5, %xmm4, %xmm9
	leal	1(%rbx), %eax
	movslq	%eax, %r11
	leal	1(%rdi), %eax
	movslq	%eax, %rcx
	vaddsd	%xmm8, %xmm9, %xmm0
	vmovsd	(%rdx,%rcx,8), %xmm6
	vmovsd	(%rdx,%r11,8), %xmm7
	leal	1(%r15), %eax
	movslq	%eax, %r12
	leal	1(%r14), %eax
	movslq	%eax, %rax
	vmovsd	(%rdx,%rax,8), %xmm2
	vmovsd	(%rdx,%r12,8), %xmm3
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vsubsd	%xmm5, %xmm4, %xmm0
	vsubsd	%xmm2, %xmm3, %xmm4
	vsubsd	%xmm10, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm3, %xmm5
	vaddsd	%xmm7, %xmm6, %xmm2
	vaddsd	%xmm5, %xmm2, %xmm3
	vsubsd	%xmm7, %xmm6, %xmm6
	vmovsd	%xmm3, (%rdx,%rcx,8)
	vsubsd	%xmm1, %xmm6, %xmm7
	vaddsd	%xmm4, %xmm0, %xmm3
	vaddsd	%xmm1, %xmm6, %xmm6
	vsubsd	%xmm4, %xmm0, %xmm0
	vsubsd	%xmm5, %xmm2, %xmm1
	vsubsd	%xmm8, %xmm9, %xmm2
	addq	$2, %rdi
	vmovsd	%xmm2, (%rdx,%r15,8)
	vmovsd	%xmm1, (%rdx,%r12,8)
	vmovsd	%xmm0, (%rdx,%rbx,8)
	vmovsd	%xmm6, (%rdx,%r11,8)
	vmovsd	%xmm3, (%rdx,%r14,8)
	vmovsd	%xmm7, (%rdx,%rax,8)
.LBB11_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%esi, %edi
	jl	.LBB11_2
# BB#3:                                 # %for.end.split
	imull	$7, %esi, %eax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	%r13, %rdi
	movslq	%edi, %rax
	leal	(%rsi,%rdi), %ecx
	movl	%ecx, -56(%rbp)         # 4-byte Spill
	leaq	(%rdx,%rax,8), %r14
	movq	-112(%rbp), %rax        # 8-byte Reload
	vmovsd	16(%rax), %xmm8
	leal	(%rsi,%rsi,4), %eax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	imull	$6, %esi, %r11d
	movl	%esi, %r9d
	xorl	%eax, %eax
	jmp	.LBB11_4
	.align	16, 0x90
.LBB11_5:                               # %for.inc168
                                        #   in Loop: Header=BB11_4 Depth=1
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movslq	%ecx, %r12
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movslq	%ecx, %r8
	vmovsd	(%r14,%rax,8), %xmm9
	vmovsd	(%rdx,%r8,8), %xmm10
	vmovsd	(%rdx,%r12,8), %xmm11
	leaq	(%r11,%rax), %rcx
	movslq	%ecx, %rbx
	vmovsd	(%rdx,%rbx,8), %xmm12
	vaddsd	%xmm11, %xmm12, %xmm13
	vaddsd	%xmm10, %xmm9, %xmm6
	leal	1(%r8), %ecx
	movslq	%ecx, %r15
	leal	1(%rdi,%rax), %ecx
	movslq	%ecx, %rcx
	vaddsd	%xmm13, %xmm6, %xmm3
	vmovsd	(%rdx,%rcx,8), %xmm7
	vmovsd	(%rdx,%r15,8), %xmm0
	leal	1(%rbx), %esi
	movslq	%esi, %rsi
	movq	%rdi, %r10
	leal	1(%r12), %edi
	movslq	%edi, %r13
	movq	%r10, %rdi
	vmovsd	(%rdx,%r13,8), %xmm1
	vmovsd	(%rdx,%rsi,8), %xmm2
	vmovsd	%xmm3, (%r14,%rax,8)
	vaddsd	%xmm1, %xmm2, %xmm3
	vaddsd	%xmm0, %xmm7, %xmm4
	vaddsd	%xmm3, %xmm4, %xmm5
	vmovsd	%xmm5, (%rdx,%rcx,8)
	vsubsd	%xmm4, %xmm3, %xmm3
	vmovsd	%xmm3, (%rdx,%rbx,8)
	addq	$2, %rax
	vsubsd	%xmm13, %xmm6, %xmm3
	vmovsd	%xmm3, (%rdx,%rsi,8)
	vsubsd	%xmm11, %xmm12, %xmm3
	vsubsd	%xmm0, %xmm7, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm5
	vsubsd	%xmm10, %xmm9, %xmm4
	vsubsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm1, %xmm4, %xmm2
	vsubsd	%xmm5, %xmm2, %xmm6
	vmulsd	%xmm6, %xmm8, %xmm6
	vmovsd	%xmm6, (%rdx,%r8,8)
	vaddsd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm8, %xmm2
	vmovsd	%xmm2, (%rdx,%r15,8)
	vaddsd	%xmm1, %xmm4, %xmm1
	vsubsd	%xmm0, %xmm3, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm2, %xmm8, %xmm2
	vmovsd	%xmm2, (%rdx,%r12,8)
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm8, %xmm0
	vmovsd	%xmm0, (%rdx,%r13,8)
.LBB11_4:                               # %for.cond78
                                        # =>This Inner Loop Header: Depth=1
	leal	(%rdi,%rax), %ecx
	cmpl	-56(%rbp), %ecx         # 4-byte Folded Reload
	jl	.LBB11_5
# BB#6:                                 # %for.end170
	movl	%r9d, -52(%rbp)         # 4-byte Spill
	imull	$15, %r9d, %eax
	movl	%eax, -148(%rbp)        # 4-byte Spill
	imull	$14, %r9d, %eax
	movl	%eax, -152(%rbp)        # 4-byte Spill
	imull	$13, %r9d, %eax
	movl	%eax, -156(%rbp)        # 4-byte Spill
	imull	$12, %r9d, %r14d
	movl	%r14d, -160(%rbp)       # 4-byte Spill
	imull	$11, %r9d, %eax
	movl	%eax, -164(%rbp)        # 4-byte Spill
	movl	$0, -100(%rbp)          # 4-byte Folded Spill
	imull	$10, %r9d, %eax
	movl	%eax, -92(%rbp)         # 4-byte Spill
	leal	(%r9,%r9,8), %eax
	movl	%eax, -96(%rbp)         # 4-byte Spill
	leal	(,%r9,8), %r9d
	movl	%r9d, -168(%rbp)        # 4-byte Spill
	leal	(%rdi,%rdi), %eax
	movl	%eax, -172(%rbp)        # 4-byte Spill
	movq	%rdi, -144(%rbp)        # 8-byte Spill
	movl	%r14d, %ecx
	movl	%eax, %ebx
	xorl	%r10d, %r10d
	jmp	.LBB11_7
	.align	16, 0x90
.LBB11_14:                              # %for.inc417.split
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	-168(%rbp), %r9d        # 4-byte Reload
	movl	-116(%rbp), %ecx        # 4-byte Reload
	addl	%r9d, %ecx
	addl	%r9d, -100(%rbp)        # 4-byte Folded Spill
	movl	-120(%rbp), %ebx        # 4-byte Reload
	movl	-124(%rbp), %r10d       # 4-byte Reload
.LBB11_7:                               # %for.cond172
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_9 Depth 2
                                        #     Child Loop BB11_12 Depth 2
	cmpl	-132(%rbp), %ebx        # 4-byte Folded Reload
	jge	.LBB11_15
# BB#8:                                 # %for.body174.split.split.split373
                                        #   in Loop: Header=BB11_7 Depth=1
	movslq	%ebx, %rax
	leaq	(%rdx,%rax,8), %r8
	movslq	%ecx, %rax
	movl	%ecx, -116(%rbp)        # 4-byte Spill
	leaq	(%rdx,%rax,8), %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	leal	5(%r10,%r10), %eax
	leal	4(%r10,%r10), %ecx
	movl	%ecx, -128(%rbp)        # 4-byte Spill
	movslq	%ecx, %rcx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	vmovsd	(%rdi,%rcx,8), %xmm2
	vmovsd	%xmm2, -64(%rbp)        # 8-byte Spill
	movslq	%eax, %rax
	vmovsd	(%rdi,%rax,8), %xmm12
	leal	3(%r10), %eax
	movslq	%eax, %rax
	vmovsd	(%rdi,%rax,8), %xmm13
	vaddsd	%xmm13, %xmm13, %xmm1
	vmulsd	%xmm12, %xmm1, %xmm0
	vmulsd	%xmm2, %xmm1, %xmm1
	movl	-52(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rbx), %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	vsubsd	%xmm12, %xmm1, %xmm1
	vmovsd	%xmm1, -80(%rbp)        # 8-byte Spill
	vsubsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, -88(%rbp)        # 8-byte Spill
	movq	-144(%rbp), %rax        # 8-byte Reload
	leal	(%rbx,%rax), %eax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	addl	-172(%rbp), %ebx        # 4-byte Folded Reload
	movl	%ebx, -120(%rbp)        # 4-byte Spill
	addl	$2, %r10d
	movl	%r10d, -124(%rbp)       # 4-byte Spill
	movslq	%r10d, %rax
	vmovsd	(%rdi,%rax,8), %xmm14
	movl	-100(%rbp), %esi        # 4-byte Reload
	movl	-164(%rbp), %r14d       # 4-byte Reload
	jmp	.LBB11_9
	.align	16, 0x90
.LBB11_10:                              # %for.inc294.split
                                        #   in Loop: Header=BB11_9 Depth=2
	movl	-96(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rsi), %r12d
	leal	(%r14,%rsi), %ecx
	leal	1(%rax,%rsi), %ebx
	leal	1(%r9,%rsi), %edi
	movslq	%ecx, %r11
	vmovsd	(%rdx,%r11,8), %xmm5
	movl	-92(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rsi), %ecx
	movslq	%ecx, %r15
	vmovsd	(%rdx,%r15,8), %xmm3
	vaddsd	%xmm5, %xmm3, %xmm1
	movslq	%edi, %r13
	movl	%r9d, %r10d
	movslq	%ebx, %r9
	movslq	%r12d, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm8
	vmovsd	(%r8), %xmm11
	vaddsd	%xmm8, %xmm11, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm15
	vmovsd	(%rdx,%r9,8), %xmm0
	vmovsd	(%rdx,%r13,8), %xmm9
	leal	1(%rax,%rsi), %ecx
	movslq	%ecx, %r12
	leal	1(%r14,%rsi), %ecx
	movslq	%ecx, %rbx
	vmovsd	(%rdx,%rbx,8), %xmm4
	vmovsd	(%rdx,%r12,8), %xmm7
	vmovsd	%xmm15, (%r8)
	vaddsd	%xmm4, %xmm7, %xmm6
	vaddsd	%xmm0, %xmm9, %xmm10
	vsubsd	%xmm6, %xmm10, %xmm15
	vaddsd	%xmm6, %xmm10, %xmm6
	vsubsd	%xmm5, %xmm3, %xmm3
	vsubsd	%xmm0, %xmm9, %xmm0
	vsubsd	%xmm1, %xmm2, %xmm5
	vmovsd	%xmm6, (%rdx,%r13,8)
	vmulsd	%xmm15, %xmm13, %xmm1
	vmulsd	%xmm5, %xmm14, %xmm2
	vsubsd	%xmm1, %xmm2, %xmm9
	vaddsd	%xmm3, %xmm0, %xmm2
	vsubsd	%xmm3, %xmm0, %xmm0
	vsubsd	%xmm4, %xmm7, %xmm4
	vsubsd	%xmm8, %xmm11, %xmm7
	vmulsd	%xmm2, %xmm12, %xmm8
	vmovsd	-64(%rbp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm10
	vsubsd	%xmm4, %xmm7, %xmm1
	vmulsd	%xmm1, %xmm3, %xmm3
	vmulsd	%xmm1, %xmm12, %xmm6
	vaddsd	%xmm4, %xmm7, %xmm7
	vmovsd	-80(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm4
	vmovsd	-88(%rbp), %xmm1        # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm7, %xmm1, %xmm1
	vmulsd	%xmm7, %xmm2, %xmm7
	vmovsd	%xmm9, (%rdx,%r15,8)
	vaddsd	%xmm7, %xmm0, %xmm7
	vsubsd	%xmm4, %xmm1, %xmm4
	addl	$2, %esi
	vaddsd	%xmm6, %xmm10, %xmm0
	vsubsd	%xmm8, %xmm3, %xmm2
	vmulsd	%xmm15, %xmm14, %xmm1
	vmulsd	%xmm5, %xmm13, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm1
	addq	$16, %r8
	vmovsd	%xmm1, (%rdx,%r12,8)
	vmovsd	%xmm2, (%rdx,%rdi,8)
	vmovsd	%xmm0, (%rdx,%r9,8)
	movl	%r10d, %r9d
	vmovsd	%xmm4, (%rdx,%r11,8)
	vmovsd	%xmm7, (%rdx,%rbx,8)
.LBB11_9:                               # %for.cond193
                                        #   Parent Loop BB11_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r9,%rsi), %eax
	cmpl	-72(%rbp), %eax         # 4-byte Folded Reload
	jl	.LBB11_10
# BB#11:                                # %for.end296
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	-128(%rbp), %esi        # 4-byte Reload
	leal	3(%rsi), %eax
	movslq	%eax, %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	%xmm2, -64(%rbp)        # 8-byte Spill
	addl	$2, %esi
	movslq	%esi, %rax
	vmovsd	(%rcx,%rax,8), %xmm3
	vmovsd	%xmm3, -72(%rbp)        # 8-byte Spill
	vaddsd	%xmm14, %xmm14, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm1
	vsubsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, -80(%rbp)        # 8-byte Spill
	vmulsd	%xmm2, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm0
	vmovsd	%xmm0, -88(%rbp)        # 8-byte Spill
	movl	-100(%rbp), %ebx        # 4-byte Reload
	movl	-148(%rbp), %esi        # 4-byte Reload
	movl	-152(%rbp), %r12d       # 4-byte Reload
	movl	-156(%rbp), %r13d       # 4-byte Reload
	movl	-160(%rbp), %r14d       # 4-byte Reload
	jmp	.LBB11_12
	.align	16, 0x90
.LBB11_13:                              # %for.inc414
                                        #   in Loop: Header=BB11_12 Depth=2
	leal	(%rsi,%rbx), %edi
	leal	1(%r13,%rbx), %ecx
	leal	1(%r14,%rbx), %eax
	movslq	%edi, %r8
	vmovsd	(%rdx,%r8,8), %xmm5
	leal	(%r12,%rbx), %edi
	movslq	%edi, %r10
	vmovsd	(%rdx,%r10,8), %xmm3
	vaddsd	%xmm5, %xmm3, %xmm1
	movslq	%eax, %rax
	movslq	%ecx, %r9
	leal	(%r13,%rbx), %ecx
	movslq	%ecx, %r15
	vmovsd	(%rdx,%r15,8), %xmm10
	movq	-48(%rbp), %r11         # 8-byte Reload
	vmovsd	(%r11), %xmm12
	vaddsd	%xmm10, %xmm12, %xmm4
	vaddsd	%xmm1, %xmm4, %xmm0
	vmovsd	(%rdx,%r9,8), %xmm8
	vmovsd	(%rdx,%rax,8), %xmm9
	leal	1(%r12,%rbx), %ecx
	movslq	%ecx, %rcx
	leal	1(%rsi,%rbx), %edi
	movslq	%edi, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm2
	vmovsd	(%rdx,%rcx,8), %xmm7
	vmovsd	%xmm0, (%r11)
	vaddsd	%xmm2, %xmm7, %xmm0
	vaddsd	%xmm8, %xmm9, %xmm6
	vsubsd	%xmm0, %xmm6, %xmm15
	vaddsd	%xmm0, %xmm6, %xmm11
	vsubsd	%xmm5, %xmm3, %xmm0
	vsubsd	%xmm8, %xmm9, %xmm3
	vsubsd	%xmm1, %xmm4, %xmm5
	vmovsd	%xmm11, (%rdx,%rax,8)
	vxorpd	.LCPI11_0(%rip), %xmm13, %xmm1
	vmulsd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm15, %xmm14, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm9
	vaddsd	%xmm0, %xmm3, %xmm1
	vsubsd	%xmm0, %xmm3, %xmm4
	vsubsd	%xmm2, %xmm7, %xmm7
	vsubsd	%xmm10, %xmm12, %xmm0
	vmovsd	-64(%rbp), %xmm6        # 8-byte Reload
	vmulsd	%xmm1, %xmm6, %xmm8
	vmovsd	-72(%rbp), %xmm3        # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm10
	vsubsd	%xmm7, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm3, %xmm3
	vmulsd	%xmm1, %xmm6, %xmm6
	vaddsd	%xmm7, %xmm0, %xmm1
	vmovsd	-80(%rbp), %xmm2        # 8-byte Reload
	vmulsd	%xmm4, %xmm2, %xmm0
	vmovsd	-88(%rbp), %xmm7        # 8-byte Reload
	vmulsd	%xmm4, %xmm7, %xmm4
	vmulsd	%xmm1, %xmm7, %xmm7
	vmulsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm9, (%rdx,%r10,8)
	vaddsd	%xmm1, %xmm4, %xmm1
	vsubsd	%xmm0, %xmm7, %xmm4
	addl	$2, %ebx
	vaddsd	%xmm6, %xmm10, %xmm2
	vsubsd	%xmm8, %xmm3, %xmm0
	vmulsd	%xmm15, %xmm13, %xmm3
	vmulsd	%xmm5, %xmm14, %xmm5
	vsubsd	%xmm3, %xmm5, %xmm3
	addq	$16, %r11
	movq	%r11, -48(%rbp)         # 8-byte Spill
	vmovsd	%xmm3, (%rdx,%rcx,8)
	vmovsd	%xmm0, (%rdx,%r15,8)
	vmovsd	%xmm2, (%rdx,%r9,8)
	vmovsd	%xmm4, (%rdx,%r8,8)
	vmovsd	%xmm1, (%rdx,%rdi,8)
.LBB11_12:                              # %for.cond310
                                        #   Parent Loop BB11_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-52(%rbp), %eax         # 4-byte Reload
	movl	-56(%rbp), %ecx         # 4-byte Reload
	leal	(%rax,%rcx), %eax
	leal	(%r14,%rbx), %ecx
	cmpl	%eax, %ecx
	jge	.LBB11_14
	jmp	.LBB11_13
.LBB11_15:                              # %for.end419
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp123:
	.size	cftmdl, .Ltmp123-cftmdl
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
