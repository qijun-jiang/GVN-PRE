	.file	"test/nsieve-bits.profile.ls.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
.Ltmp6:
	.cfi_offset %rbx, -24
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$26, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -12(%rbp)
	movl	%eax, -16(%rbp)
	movq	%rbx, -24(%rbp)
	movl	$40960000, -32(%rbp)    # imm = 0x2710000
	movl	$5120004, %edi          # imm = 0x4E2004
	callq	malloc
	movq	%rax, -40(%rbp)
	testq	%rax, %rax
	je	.LBB0_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+4(%rip)
	movl	$0, -28(%rbp)
	incl	EdgeProfCounters+16(%rip)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_16:                               # %for.end41
                                        #   in Loop: Header=BB0_3 Depth=1
	incl	EdgeProfCounters+36(%rip)
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+92(%rip)
	incl	-28(%rbp)
	incl	EdgeProfCounters+96(%rip)
.LBB0_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	cmpl	$2, -28(%rbp)
	ja	.LBB0_17
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
	incl	EdgeProfCounters+20(%rip)
	movl	$0, -52(%rbp)
	movb	-28(%rbp), %cl
	movl	-32(%rbp), %edx
	shrl	%cl, %edx
	movl	%edx, -56(%rbp)
	shrl	$3, %edx
	addq	$4, %rdx
	movq	-40(%rbp), %rdi
	movl	$255, %esi
	callq	memset
	movl	$2, -44(%rbp)
	incl	EdgeProfCounters+28(%rip)
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_15:                               # %if.end38
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	EdgeProfCounters+84(%rip)
	incl	-44(%rbp)
	incl	EdgeProfCounters+88(%rip)
.LBB0_5:                                # %for.cond5
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	movl	-44(%rbp), %eax
	cmpl	-56(%rbp), %eax
	ja	.LBB0_16
# BB#6:                                 # %for.body8
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	EdgeProfCounters+32(%rip)
	movl	-44(%rbp), %eax
	movq	%rax, %rcx
	shrq	$5, %rcx
	movq	-40(%rbp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB0_7
# BB#8:                                 # %if.then13
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	EdgeProfCounters+40(%rip)
	incl	-52(%rbp)
	movl	-44(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -48(%rbp)
	incl	EdgeProfCounters+48(%rip)
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_13:                               # %if.end36
                                        #   in Loop: Header=BB0_9 Depth=3
	incl	EdgeProfCounters+72(%rip)
	movl	-44(%rbp), %eax
	addl	%eax, -48(%rbp)
	incl	EdgeProfCounters+76(%rip)
.LBB0_9:                                # %for.cond15
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-48(%rbp), %eax
	cmpl	-56(%rbp), %eax
	ja	.LBB0_14
# BB#10:                                # %for.body18
                                        #   in Loop: Header=BB0_9 Depth=3
	incl	EdgeProfCounters+52(%rip)
	movl	-48(%rbp), %eax
	movq	%rax, %rcx
	shrq	$5, %rcx
	movq	-40(%rbp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB0_11
# BB#12:                                # %if.then28
                                        #   in Loop: Header=BB0_9 Depth=3
	incl	EdgeProfCounters+60(%rip)
	movl	-48(%rbp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	shrq	$5, %rcx
	movq	-40(%rbp), %rdx
	xorl	%eax, (%rdx,%rcx,4)
	incl	EdgeProfCounters+68(%rip)
	jmp	.LBB0_13
	.align	16, 0x90
.LBB0_11:                               # %for.body18.if.end36_crit_edge
                                        #   in Loop: Header=BB0_9 Depth=3
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB0_13
	.align	16, 0x90
.LBB0_7:                                # %for.body8.if.end38_crit_edge
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB0_15
	.align	16, 0x90
.LBB0_14:                               # %for.end
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	EdgeProfCounters+56(%rip)
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB0_15
.LBB0_17:                               # %for.end45
	incl	EdgeProfCounters+24(%rip)
	movq	-40(%rbp), %rdi
	callq	free
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+100(%rip)
	jmp	.LBB0_18
.LBB0_1:                                # %if.then
	incl	EdgeProfCounters+8(%rip)
	movl	$1, -12(%rbp)
	incl	EdgeProfCounters+12(%rip)
.LBB0_18:                               # %return
	movl	-12(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Primes up to %8d %8d\n"
	.size	.L.str, 22

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,104,16

	.section	".note.GNU-stack","",@progbits
