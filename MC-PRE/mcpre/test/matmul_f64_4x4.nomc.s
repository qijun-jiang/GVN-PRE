	.file	"test/matmul_f64_4x4.nomc.bc"
	.text
	.globl	wrap_mul4
	.align	16, 0x90
	.type	wrap_mul4,@function
wrap_mul4:                              # @wrap_mul4
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
	callq	mul4
	popq	%rbp
	ret
.Ltmp5:
	.size	wrap_mul4, .Ltmp5-wrap_mul4
	.cfi_endproc

	.align	16, 0x90
	.type	mul4,@function
mul4:                                   # @mul4
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
	vmovsd	(%rsi), %xmm0
	vmovsd	8(%rsi), %xmm1
	vmulsd	32(%rdx), %xmm1, %xmm1
	vmulsd	(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsi), %xmm1
	vmulsd	64(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rsi), %xmm1
	vmulsd	96(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	xorl	%eax, %eax
	vmovsd	(%rsi), %xmm0
	vmovsd	8(%rsi), %xmm1
	vmulsd	40(%rdx), %xmm1, %xmm1
	vmulsd	8(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsi), %xmm1
	vmulsd	72(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rsi), %xmm1
	vmulsd	104(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	vmovsd	(%rsi), %xmm0
	vmovsd	8(%rsi), %xmm1
	vmulsd	48(%rdx), %xmm1, %xmm1
	vmulsd	16(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsi), %xmm1
	vmulsd	80(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rsi), %xmm1
	vmulsd	112(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	vmovsd	(%rsi), %xmm0
	vmovsd	8(%rsi), %xmm1
	vmulsd	56(%rdx), %xmm1, %xmm1
	vmulsd	24(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsi), %xmm1
	vmulsd	88(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rsi), %xmm1
	vmulsd	120(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	vmovsd	32(%rsi), %xmm0
	vmovsd	40(%rsi), %xmm1
	vmulsd	32(%rdx), %xmm1, %xmm1
	vmulsd	(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rsi), %xmm1
	vmulsd	64(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rsi), %xmm1
	vmulsd	96(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	vmovsd	32(%rsi), %xmm0
	vmovsd	40(%rsi), %xmm1
	vmulsd	40(%rdx), %xmm1, %xmm1
	vmulsd	8(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rsi), %xmm1
	vmulsd	72(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rsi), %xmm1
	vmulsd	104(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	vmovsd	32(%rsi), %xmm0
	vmovsd	40(%rsi), %xmm1
	vmulsd	48(%rdx), %xmm1, %xmm1
	vmulsd	16(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rsi), %xmm1
	vmulsd	80(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rsi), %xmm1
	vmulsd	112(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -80(%rbp)
	vmovsd	32(%rsi), %xmm0
	vmovsd	40(%rsi), %xmm1
	vmulsd	56(%rdx), %xmm1, %xmm1
	vmulsd	24(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rsi), %xmm1
	vmulsd	88(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rsi), %xmm1
	vmulsd	120(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vmovsd	64(%rsi), %xmm0
	vmovsd	72(%rsi), %xmm1
	vmulsd	32(%rdx), %xmm1, %xmm1
	vmulsd	(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rsi), %xmm1
	vmulsd	64(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rsi), %xmm1
	vmulsd	96(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	vmovsd	64(%rsi), %xmm0
	vmovsd	72(%rsi), %xmm1
	vmulsd	40(%rdx), %xmm1, %xmm1
	vmulsd	8(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rsi), %xmm1
	vmulsd	72(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rsi), %xmm1
	vmulsd	104(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	vmovsd	64(%rsi), %xmm0
	vmovsd	72(%rsi), %xmm1
	vmulsd	48(%rdx), %xmm1, %xmm1
	vmulsd	16(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rsi), %xmm1
	vmulsd	80(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rsi), %xmm1
	vmulsd	112(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	vmovsd	64(%rsi), %xmm0
	vmovsd	72(%rsi), %xmm1
	vmulsd	56(%rdx), %xmm1, %xmm1
	vmulsd	24(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rsi), %xmm1
	vmulsd	88(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rsi), %xmm1
	vmulsd	120(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	vmovsd	96(%rsi), %xmm0
	vmovsd	104(%rsi), %xmm1
	vmulsd	32(%rdx), %xmm1, %xmm1
	vmulsd	(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rsi), %xmm1
	vmulsd	64(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rsi), %xmm1
	vmulsd	96(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)
	vmovsd	96(%rsi), %xmm0
	vmovsd	104(%rsi), %xmm1
	vmulsd	40(%rdx), %xmm1, %xmm1
	vmulsd	8(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rsi), %xmm1
	vmulsd	72(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rsi), %xmm1
	vmulsd	104(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	vmovsd	96(%rsi), %xmm0
	vmovsd	104(%rsi), %xmm1
	vmulsd	48(%rdx), %xmm1, %xmm1
	vmulsd	16(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rsi), %xmm1
	vmulsd	80(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rsi), %xmm1
	vmulsd	112(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)
	vmovsd	96(%rsi), %xmm0
	vmovsd	104(%rsi), %xmm1
	vmulsd	56(%rdx), %xmm1, %xmm1
	vmulsd	24(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rsi), %xmm1
	vmulsd	88(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rsi), %xmm1
	vmulsd	120(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -8(%rbp)
	.align	16, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	-128(%rbp,%rax,8), %xmm0
	vmovsd	%xmm0, (%rdi,%rax,8)
	incq	%rax
	cmpl	$16, %eax
	jb	.LBB1_1
# BB#2:                                 # %for.end
	popq	%rbp
	ret
.Ltmp11:
	.size	mul4, .Ltmp11-mul4
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%r12
	pushq	%rbx
	subq	$128, %rsp
.Ltmp18:
	.cfi_offset %rbx, -48
.Ltmp19:
	.cfi_offset %r12, -40
.Ltmp20:
	.cfi_offset %r14, -32
.Ltmp21:
	.cfi_offset %r15, -24
	movl	$50000000, %ebx         # imm = 0x2FAF080
	leaq	-160(%rbp), %r14
	.align	16, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	$main.A, %esi
	movl	$main.B, %edx
	callq	wrap_mul4
	decl	%ebx
	jne	.LBB2_1
# BB#2:
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB2_3:                                # %for.body4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	movl	$4, %r12d
	movq	%r14, %rbx
	.align	16, 0x90
.LBB2_4:                                # %for.body7
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	(%rbx), %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	addq	$8, %rbx
	decl	%r12d
	jne	.LBB2_4
# BB#5:                                 # %for.end13
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	$.L.str1, %edi
	callq	puts
	addq	$32, %r14
	incl	%r15d
	cmpl	$4, %r15d
	jne	.LBB2_3
# BB#6:                                 # %for.end17
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp22:
	.size	main, .Ltmp22-main
	.cfi_endproc

	.type	main.A,@object          # @main.A
	.section	.rodata,"a",@progbits
	.align	16
main.A:
	.quad	4616752568008179712     # double 4.500000e+00
	.quad	4608533498688228557     # double 1.300000e+00
	.quad	4618441417868443648     # double 6.000000e+00
	.quad	4616302208045442662     # double 4.100000e+00
	.quad	4612811918334230528     # double 2.500000e+00
	.quad	4619792497756654797     # double 7.200000e+00
	.quad	4620355447710076109     # double 7.700000e+00
	.quad	4610334938539176755     # double 1.700000e+00
	.quad	4619229547803233485     # double 6.700000e+00
	.quad	4608533498688228557     # double 1.300000e+00
	.quad	4621481347616918733     # double 9.400000e+00
	.quad	4608533498688228557     # double 1.300000e+00
	.quad	4607632778762754458     # double 1.100000e+00
	.quad	4612136378390124954     # double 2.200000e+00
	.quad	4613937818241073152     # double 3.000000e+00
	.quad	4611911198408756429     # double 2.100000e+00
	.size	main.A, 128

	.type	main.B,@object          # @main.B
	.align	16
main.B:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4620580627691444634     # double 7.900000e+00
	.quad	4617428107952285286     # double 5.100000e+00
	.quad	4614838538166547251     # double 3.400000e+00
	.quad	4619116957812549222     # double 6.600000e+00
	.quad	4613487458278336102     # double 2.800000e+00
	.quad	4617765877924338074     # double 5.400000e+00
	.quad	4621368757626234470     # double 9.200000e+00
	.quad	4617315517961601024     # double 5.000000e+00
	.quad	4616302208045442662     # double 4.100000e+00
	.quad	4616302208045442662     # double 4.100000e+00
	.quad	4621762822593629389     # double 9.900000e+00
	.quad	4620918397663497421     # double 8.400000e+00
	.quad	4615514078110652826     # double 3.700000e+00
	.quad	4621537642612260864     # double 9.500000e+00
	.quad	4618891777831180698     # double 6.400000e+00
	.size	main.B, 128

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%8.2f"
	.size	.L.str, 6

	.type	.L.str1,@object         # @.str1
.L.str1:
	.zero	1
	.size	.L.str1, 1


	.section	".note.GNU-stack","",@progbits
