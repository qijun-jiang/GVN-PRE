	.file	"test/pi.profile.ls.bc"
	.text
	.globl	myadd
	.align	16, 0x90
	.type	myadd,@function
myadd:                                  # @myadd
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
	incl	EdgeProfCounters(%rip)
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	vmovss	(%rax), %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, (%rax)
	popq	%rbp
	ret
.Ltmp5:
	.size	myadd, .Ltmp5-myadd
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4616189618054758400     # double 4
.LCPI1_1:
	.quad	4679847974048628736     # double 74383
.LCPI1_2:
	.quad	4607182418800017408     # double 1
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%rbx
	subq	$104, %rsp
.Ltmp12:
	.cfi_offset %rbx, -40
.Ltmp13:
	.cfi_offset %r14, -32
.Ltmp14:
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$10, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+4(%rip)
	movl	$0, -28(%rbp)
	movl	%eax, -32(%rbp)
	movq	%rbx, -40(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$0, -44(%rbp)
	movq	$1, -88(%rbp)
	movq	$1907, -96(%rbp)        # imm = 0x773
	movl	$1169532928, -48(%rbp)  # imm = 0x45B5A800
	movl	$1151557632, -52(%rbp)  # imm = 0x44A36000
	movl	$1168832512, -56(%rbp)  # imm = 0x45AAF800
	movq	$40000000, -104(%rbp)   # imm = 0x2625A00
	movq	$1, -112(%rbp)
	incl	EdgeProfCounters+8(%rip)
	movabsq	$8126358305087380011, %r15 # imm = 0x70C69FD2BC475A2B
	leaq	-44(%rbp), %r14
	leaq	-68(%rbp), %rbx
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_5:                                # %if.end
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+32(%rip)
	incq	-112(%rbp)
	incl	EdgeProfCounters+36(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-112(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jg	.LBB1_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+12(%rip)
	imulq	$27611, -96(%rbp), %rcx # imm = 0x6BDB
	movq	%rcx, %rax
	imulq	%r15
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	imulq	$74383, %rdx, %rax      # imm = 0x1228F
	movq	%rcx, -120(%rbp)
	subq	%rax, %rcx
	vcvtsi2ssq	%rcx, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI1_1(%rip), %xmm0, %xmm0
	movq	%rcx, -96(%rbp)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -60(%rbp)
	vmovss	-52(%rbp), %xmm0
	vmulss	-48(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -76(%rbp)
	vmovss	-56(%rbp), %xmm1
	vdivss	%xmm1, %xmm0, %xmm2
	vcvttss2si	%xmm2, %rax
	vcvtsi2ssq	%rax, %xmm0, %xmm2
	vmulss	%xmm2, %xmm1, %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -48(%rbp)
	vdivss	-56(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -64(%rbp)
	vmulss	%xmm0, %xmm0, %xmm0
	vmovss	-60(%rbp), %xmm1
	vmulss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -68(%rbp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	myadd
	vmovss	-68(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI1_2(%rip), %xmm1
	vucomisd	%xmm0, %xmm1
	jb	.LBB1_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+20(%rip)
	incq	-88(%rbp)
	incl	EdgeProfCounters+28(%rip)
	jmp	.LBB1_5
	.align	16, 0x90
.LBB1_3:                                # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	jmp	.LBB1_5
.LBB1_6:                                # %for.end
	incl	EdgeProfCounters+16(%rip)
	vmovss	-64(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	-60(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	-112(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	$.L.str1, %edi
	movb	$2, %al
	callq	printf
	vcvtsi2ssq	-104(%rbp), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcvtsi2ssq	-88(%rbp), %xmm0, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm2, %xmm2
	vdivsd	%xmm0, %xmm2, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -72(%rbp)
	vmovss	-72(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-44(%rbp), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm1
	movl	-104(%rbp), %esi
	movl	$.L.str2, %edi
	movb	$2, %al
	callq	printf
	xorl	%eax, %eax
	addq	$104, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp15:
	.size	main, .Ltmp15-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Starting PI...\n"
	.size	.L.str, 16

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 " x = %9.6f    y = %12.2f  low = %8d j = %7d\n"
	.size	.L.str1, 45

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Pi = %9.6f ztot = %12.2f itot = %8d\n"
	.size	.L.str2, 37

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,40,16

	.section	".note.GNU-stack","",@progbits
