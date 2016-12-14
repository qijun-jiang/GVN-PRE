	.file	"test1.profile.ls.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4696837146684686336     # double 1.0E+6
.LCPI0_1:
	.quad	4652007308841189376     # double 1000
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
	subq	$64, %rsp
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$29, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -4(%rbp)
	callq	clock
	movq	%rax, -16(%rbp)
	movabsq	$4234234234234234, %rax # imm = 0xF0B037B6D657A
	movabsq	$23423234342342, %rcx   # imm = 0x154DA58FFDC6
	movq	%rcx, -32(%rbp)
	movq	%rax, -40(%rbp)
	movl	$0, -52(%rbp)
	incl	EdgeProfCounters+4(%rip)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_18:                               # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	incl	EdgeProfCounters+108(%rip)
	incl	-52(%rbp)
	incl	EdgeProfCounters+112(%rip)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$29999, -52(%rbp)       # imm = 0x752F
	jg	.LBB0_19
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movl	$0, -56(%rbp)
	incl	EdgeProfCounters+16(%rip)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_17:                               # %if.end28
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+100(%rip)
	incl	-56(%rbp)
	incl	EdgeProfCounters+104(%rip)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$11, -56(%rbp)
	jg	.LBB0_18
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+20(%rip)
	movslq	-56(%rbp), %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_8
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+28(%rip)
	movl	-56(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_7
# BB#6:                                 # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+36(%rip)
	decq	-32(%rbp)
	incl	EdgeProfCounters+44(%rip)
	incl	EdgeProfCounters+52(%rip)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_8:                                # %if.else7
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+32(%rip)
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_7:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+40(%rip)
	incq	-32(%rbp)
	incl	EdgeProfCounters+48(%rip)
	incl	EdgeProfCounters+52(%rip)
.LBB0_9:                                # %if.end9
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	-56(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_13
# BB#10:                                # %if.then12
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+60(%rip)
	movl	-56(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movl	%eax, -60(%rbp)
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_11
# BB#12:                                # %if.then15
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+68(%rip)
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	incl	EdgeProfCounters+76(%rip)
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB0_17
	.align	16, 0x90
.LBB0_13:                               # %if.else18
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+64(%rip)
	movl	-56(%rbp), %eax
	leal	-1(%rax), %ecx
	shrl	$31, %ecx
	leal	-1(%rax,%rcx), %eax
	sarl	%eax
	movslq	%eax, %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movl	%eax, -64(%rbp)
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	je	.LBB0_14
# BB#15:                                # %if.then24
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+84(%rip)
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	incl	EdgeProfCounters+92(%rip)
	jmp	.LBB0_16
	.align	16, 0x90
.LBB0_11:                               # %if.then12.if.end17_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+72(%rip)
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB0_17
	.align	16, 0x90
.LBB0_14:                               # %if.else18.if.end26_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+88(%rip)
.LBB0_16:                               # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	$0, -48(%rbp)
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	incl	EdgeProfCounters+96(%rip)
	jmp	.LBB0_17
.LBB0_19:                               # %for.end31
	incl	EdgeProfCounters+12(%rip)
	callq	clock
	subq	-16(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	.LCPI0_0(%rip), %xmm0, %xmm0
	vmulsd	.LCPI0_1(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%f\n"
	.size	.L.str, 4

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,116,16

	.section	".note.GNU-stack","",@progbits
