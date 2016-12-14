	.file	"test/pi.mcpre.bc"
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
	vmovss	(%rdi), %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, (%rdi)
	popq	%rbp
	ret
.Ltmp5:
	.size	myadd, .Ltmp5-myadd
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI1_0:
	.long	1169532928              # float 5813
.LCPI1_3:
	.long	1151557632              # float 1307
.LCPI1_4:
	.long	1168832512              # float 5471
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_1:
	.quad	4616189618054758400     # double 4
.LCPI1_2:
	.quad	4720637518976909312     # double 4.0E+7
.LCPI1_5:
	.quad	4679847974048628736     # double 74383
.LCPI1_6:
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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$1907, %ebx             # imm = 0x773
	movl	$0, -44(%rbp)
	movl	$1, %r14d
	vmovss	.LCPI1_0(%rip), %xmm0
	leaq	-44(%rbp), %r12
	leaq	-48(%rbp), %r13
                                        # implicit-def: XMM1
	vmovss	%xmm1, -60(%rbp)        # 4-byte Spill
                                        # implicit-def: XMM1
	vmovss	%xmm1, -56(%rbp)        # 4-byte Spill
	movl	$1, %r15d
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r15
	vmovss	-52(%rbp), %xmm0        # 4-byte Reload
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$40000000, %r15         # imm = 0x2625A00
	jg	.LBB1_5
# BB#2:                                 # %for.body.split.split.split.split.split.split
                                        #   in Loop: Header=BB1_1 Depth=1
	imulq	$27611, %rbx, %rbx      # imm = 0x6BDB
	movq	%rbx, %rax
	movabsq	$8126358305087380011, %rcx # imm = 0x70C69FD2BC475A2B
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	imulq	$74383, %rdx, %rax      # imm = 0x1228F
	vmulss	.LCPI1_3(%rip), %xmm0, %xmm0
	subq	%rax, %rbx
	vmovss	.LCPI1_4(%rip), %xmm3
	vdivss	%xmm3, %xmm0, %xmm2
	vcvtsi2ssq	%rbx, %xmm0, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vdivsd	.LCPI1_5(%rip), %xmm1, %xmm1
	vcvttss2si	%xmm2, %rax
	vcvtsi2ssq	%rax, %xmm0, %xmm2
	vmulss	%xmm3, %xmm2, %xmm2
	vsubss	%xmm2, %xmm0, %xmm0
	vmovss	%xmm0, -52(%rbp)        # 4-byte Spill
	vdivss	%xmm3, %xmm0, %xmm2
	vmovss	%xmm2, -56(%rbp)        # 4-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm0
	vmovss	%xmm0, -60(%rbp)        # 4-byte Spill
	vmulss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm2, %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -48(%rbp)
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	myadd
	vmovss	-48(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI1_6(%rip), %xmm1
	vucomisd	%xmm0, %xmm1
	jb	.LBB1_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r14
	jmp	.LBB1_4
.LBB1_5:                                # %for.end
	vmovss	-60(%rbp), %xmm0        # 4-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-56(%rbp), %xmm1        # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	movl	$.L.str1, %edi
	movl	%r14d, %esi
	movl	%r15d, %edx
	movb	$2, %al
	callq	printf
	vcvtsi2ssq	%r14, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	.LCPI1_1(%rip), %xmm0, %xmm0
	vdivsd	.LCPI1_2(%rip), %xmm0, %xmm0
	vmovss	-44(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str2, %edi
	movl	$40000000, %esi         # imm = 0x2625A00
	movb	$2, %al
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp17:
	.size	main, .Ltmp17-main
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


	.section	".note.GNU-stack","",@progbits
