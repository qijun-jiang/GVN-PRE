	.file	"test1.bc"
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
	movl	$0, -4(%rbp)
	callq	clock
	movq	%rax, -16(%rbp)
	movabsq	$23423234342342, %rax   # imm = 0x154DA58FFDC6
	movq	%rax, -32(%rbp)
	movabsq	$4234234234234234, %rax # imm = 0xF0B037B6D657A
	movq	%rax, -40(%rbp)
	movl	$0, -52(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_16:                               # %for.inc29
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	-52(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$29999, -52(%rbp)       # imm = 0x752F
	jg	.LBB0_17
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -56(%rbp)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_15:                               # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	-56(%rbp)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$11, -56(%rbp)
	jg	.LBB0_16
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
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
	movl	-56(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_7
# BB#6:                                 # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=2
	decq	-32(%rbp)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_8:                                # %if.else7
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_7:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=2
	incq	-32(%rbp)
.LBB0_9:                                # %if.end9
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	-56(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_11
# BB#10:                                # %if.then12
                                        #   in Loop: Header=BB0_3 Depth=2
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
	je	.LBB0_14
	jmp	.LBB0_15
	.align	16, 0x90
.LBB0_11:                               # %if.else18
                                        #   in Loop: Header=BB0_3 Depth=2
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
	je	.LBB0_13
# BB#12:                                # %if.then24
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
.LBB0_13:                               # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	$0, -48(%rbp)
.LBB0_14:                               # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.LBB0_15
.LBB0_17:                               # %for.end31
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


	.section	".note.GNU-stack","",@progbits
