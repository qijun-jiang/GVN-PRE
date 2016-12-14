	.file	"test/nsieve-bits.bc"
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
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$40960000, -24(%rbp)    # imm = 0x2710000
	movl	$5120004, %edi          # imm = 0x4E2004
	callq	malloc
	movq	%rax, -32(%rbp)
	testq	%rax, %rax
	je	.LBB0_1
# BB#2:                                 # %if.end
	movl	$0, -20(%rbp)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_13:                               # %for.inc43
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-44(%rbp), %edx
	movl	-48(%rbp), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	-20(%rbp)
.LBB0_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_8 Depth 3
	cmpl	$2, -20(%rbp)
	ja	.LBB0_14
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	$0, -44(%rbp)
	movb	-20(%rbp), %cl
	movl	-24(%rbp), %edx
	shrl	%cl, %edx
	movl	%edx, -48(%rbp)
	shrl	$3, %edx
	addq	$4, %rdx
	movq	-32(%rbp), %rdi
	movl	$255, %esi
	callq	memset
	movl	$2, -36(%rbp)
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_12:                               # %for.inc39
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	-36(%rbp)
.LBB0_5:                                # %for.cond5
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
	movl	-36(%rbp), %eax
	cmpl	-48(%rbp), %eax
	ja	.LBB0_13
# BB#6:                                 # %for.body8
                                        #   in Loop: Header=BB0_5 Depth=2
	movl	-36(%rbp), %eax
	movq	%rax, %rcx
	shrq	$5, %rcx
	movq	-32(%rbp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB0_12
# BB#7:                                 # %if.then13
                                        #   in Loop: Header=BB0_5 Depth=2
	incl	-44(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_11:                               # %for.inc
                                        #   in Loop: Header=BB0_8 Depth=3
	movl	-36(%rbp), %eax
	addl	%eax, -40(%rbp)
.LBB0_8:                                # %for.cond15
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-40(%rbp), %eax
	cmpl	-48(%rbp), %eax
	ja	.LBB0_12
# BB#9:                                 # %for.body18
                                        #   in Loop: Header=BB0_8 Depth=3
	movl	-40(%rbp), %eax
	movq	%rax, %rcx
	shrq	$5, %rcx
	movq	-32(%rbp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB0_11
# BB#10:                                # %if.then28
                                        #   in Loop: Header=BB0_8 Depth=3
	movl	-40(%rbp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	shrq	$5, %rcx
	movq	-32(%rbp), %rdx
	xorl	%eax, (%rdx,%rcx,4)
	jmp	.LBB0_11
.LBB0_14:                               # %for.end45
	movq	-32(%rbp), %rdi
	callq	free
	movl	$0, -4(%rbp)
	jmp	.LBB0_15
.LBB0_1:                                # %if.then
	movl	$1, -4(%rbp)
.LBB0_15:                               # %return
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Primes up to %8d %8d\n"
	.size	.L.str, 22


	.section	".note.GNU-stack","",@progbits
