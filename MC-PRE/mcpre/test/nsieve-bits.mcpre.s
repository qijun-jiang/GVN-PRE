	.file	"test/nsieve-bits.mcpre.bc"
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
.Ltmp6:
	.cfi_offset %rbx, -40
.Ltmp7:
	.cfi_offset %r14, -32
.Ltmp8:
	.cfi_offset %r15, -24
	movl	$5120004, %edi          # imm = 0x4E2004
	callq	malloc
	movq	%rax, %rbx
	movl	$1, %eax
	testq	%rbx, %rbx
	je	.LBB0_14
# BB#1:
	xorl	%r14d, %r14d
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_12:                               # %for.inc43
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	$.L.str, %edi
	movl	%r15d, %esi
	xorb	%al, %al
	callq	printf
	incl	%r14d
.LBB0_2:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_7 Depth 3
	cmpl	$2, %r14d
	ja	.LBB0_13
# BB#3:                                 # %for.body
                                        #   in Loop: Header=BB0_2 Depth=1
	movb	%r14b, %cl
	movl	$40960000, %r15d        # imm = 0x2710000
	shrl	%cl, %r15d
	movl	%r15d, %edx
	shrl	$3, %edx
	addq	$4, %rdx
	movq	%rbx, %rdi
	movl	$255, %esi
	callq	memset
	xorl	%edx, %edx
	movl	$2, %eax
	movl	$4, %r8d
	jmp	.LBB0_4
	.align	16, 0x90
.LBB0_11:                               # %for.inc39
                                        #   in Loop: Header=BB0_4 Depth=2
	addl	$2, %r8d
	incl	%eax
.LBB0_4:                                # %for.cond5
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	cmpl	%r15d, %eax
	ja	.LBB0_12
# BB#5:                                 # %for.body8
                                        #   in Loop: Header=BB0_4 Depth=2
	movl	%eax, %ecx
	shrl	$3, %ecx
	andq	$536870908, %rcx        # imm = 0x1FFFFFFC
	movl	(%rbx,%rcx), %ecx
	btl	%eax, %ecx
	jae	.LBB0_11
# BB#6:                                 # %if.then13.split
                                        #   in Loop: Header=BB0_4 Depth=2
	incl	%edx
	movl	%r8d, %ecx
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_10:                               # %for.inc.split.split
                                        #   in Loop: Header=BB0_7 Depth=3
	addl	%eax, %ecx
.LBB0_7:                                # %for.cond15
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	%r15d, %ecx
	ja	.LBB0_11
# BB#8:                                 # %for.body18
                                        #   in Loop: Header=BB0_7 Depth=3
	movl	%ecx, %edi
	shrl	$3, %edi
	movq	%rdi, %rsi
	andq	$536870908, %rsi        # imm = 0x1FFFFFFC
	movl	(%rbx,%rsi), %esi
	btl	%ecx, %esi
	jae	.LBB0_10
# BB#9:                                 # %if.then28
                                        #   in Loop: Header=BB0_7 Depth=3
	movl	$1, %esi
	shll	%cl, %esi
	andq	$536870908, %rdi        # imm = 0x1FFFFFFC
	xorl	%esi, (%rbx,%rdi)
	jmp	.LBB0_10
.LBB0_13:                               # %for.end45
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
.LBB0_14:                               # %return
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp9:
	.size	main, .Ltmp9-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Primes up to %8d %8d\n"
	.size	.L.str, 22


	.section	".note.GNU-stack","",@progbits
