	.file	"test/matmul_f64_4x4.bc"
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	callq	mul4
	addq	$32, %rsp
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	vmulsd	32(%rdx), %xmm1, %xmm1
	vmulsd	(%rdx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rax), %xmm1
	vmulsd	64(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rax), %xmm1
	vmulsd	96(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -160(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	40(%rcx), %xmm1, %xmm1
	vmulsd	8(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rax), %xmm1
	vmulsd	72(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rax), %xmm1
	vmulsd	104(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -152(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	48(%rcx), %xmm1, %xmm1
	vmulsd	16(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rax), %xmm1
	vmulsd	80(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rax), %xmm1
	vmulsd	112(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	56(%rcx), %xmm1, %xmm1
	vmulsd	24(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rax), %xmm1
	vmulsd	88(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	24(%rax), %xmm1
	vmulsd	120(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -136(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vmovsd	40(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	32(%rcx), %xmm1, %xmm1
	vmulsd	(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rax), %xmm1
	vmulsd	64(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rax), %xmm1
	vmulsd	96(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vmovsd	40(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	40(%rcx), %xmm1, %xmm1
	vmulsd	8(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rax), %xmm1
	vmulsd	72(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rax), %xmm1
	vmulsd	104(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vmovsd	40(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	48(%rcx), %xmm1, %xmm1
	vmulsd	16(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rax), %xmm1
	vmulsd	80(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rax), %xmm1
	vmulsd	112(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	32(%rax), %xmm0
	vmovsd	40(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	56(%rcx), %xmm1, %xmm1
	vmulsd	24(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	48(%rax), %xmm1
	vmulsd	88(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	56(%rax), %xmm1
	vmulsd	120(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vmovsd	72(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	32(%rcx), %xmm1, %xmm1
	vmulsd	(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rax), %xmm1
	vmulsd	64(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rax), %xmm1
	vmulsd	96(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vmovsd	72(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	40(%rcx), %xmm1, %xmm1
	vmulsd	8(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rax), %xmm1
	vmulsd	72(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rax), %xmm1
	vmulsd	104(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vmovsd	72(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	48(%rcx), %xmm1, %xmm1
	vmulsd	16(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rax), %xmm1
	vmulsd	80(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rax), %xmm1
	vmulsd	112(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -80(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	64(%rax), %xmm0
	vmovsd	72(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	56(%rcx), %xmm1, %xmm1
	vmulsd	24(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	80(%rax), %xmm1
	vmulsd	88(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	88(%rax), %xmm1
	vmulsd	120(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vmovsd	104(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	32(%rcx), %xmm1, %xmm1
	vmulsd	(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rax), %xmm1
	vmulsd	64(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rax), %xmm1
	vmulsd	96(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vmovsd	104(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	40(%rcx), %xmm1, %xmm1
	vmulsd	8(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rax), %xmm1
	vmulsd	72(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rax), %xmm1
	vmulsd	104(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vmovsd	104(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	48(%rcx), %xmm1, %xmm1
	vmulsd	16(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rax), %xmm1
	vmulsd	80(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rax), %xmm1
	vmulsd	112(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
	movq	-16(%rbp), %rax
	vmovsd	96(%rax), %xmm0
	vmovsd	104(%rax), %xmm1
	movq	-24(%rbp), %rcx
	vmulsd	56(%rcx), %xmm1, %xmm1
	vmulsd	24(%rcx), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	112(%rax), %xmm1
	vmulsd	88(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	120(%rax), %xmm1
	vmulsd	120(%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax
	vmovsd	-160(%rbp,%rax,8), %xmm0
	movq	-8(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	incl	-28(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$15, -28(%rbp)
	jbe	.LBB1_2
# BB#3:                                 # %for.end
	addq	$32, %rsp
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
	pushq	%rbx
	subq	$152, %rsp
.Ltmp18:
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	movl	$50000000, -16(%rbp)    # imm = 0x2FAF080
	movl	$0, -148(%rbp)
	leaq	-144(%rbp), %rbx
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	%rbx, %rdi
	movl	$main.A, %esi
	movl	$main.B, %edx
	callq	wrap_mul4
	incl	-148(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$50000000, -148(%rbp)   # imm = 0x2FAF080
	jne	.LBB2_2
# BB#3:                                 # %for.end
	movl	$0, -148(%rbp)
	jmp	.LBB2_4
	.align	16, 0x90
.LBB2_8:                                # %for.inc15
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	$.L.str1, %edi
	callq	puts
	incl	-148(%rbp)
.LBB2_4:                                # %for.cond2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
	cmpl	$4, -148(%rbp)
	je	.LBB2_9
# BB#5:                                 # %for.body4
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	$0, -152(%rbp)
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_7:                                # %for.inc11
                                        #   in Loop: Header=BB2_6 Depth=2
	movl	-148(%rbp), %eax
	shlq	$5, %rax
	leaq	-144(%rbp,%rax), %rax
	movl	-152(%rbp), %ecx
	vmovsd	(%rax,%rcx,8), %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	incl	-152(%rbp)
.LBB2_6:                                # %for.cond5
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$4, -152(%rbp)
	je	.LBB2_8
	jmp	.LBB2_7
.LBB2_9:                                # %for.end17
	xorl	%eax, %eax
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp19:
	.size	main, .Ltmp19-main
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
