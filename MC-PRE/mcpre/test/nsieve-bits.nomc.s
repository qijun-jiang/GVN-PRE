	.file	"test/nsieve-bits.nomc.bc"
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
	je	.LBB0_12
# BB#1:
	xorl	%r14d, %r14d
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	movb	%r14b, %cl
	movl	$40960000, %r15d        # imm = 0x2710000
	shrl	%cl, %r15d
	movl	%r15d, %edx
	shrl	$3, %edx
	addq	$4, %rdx
	movq	%rbx, %rdi
	movl	$255, %esi
	callq	memset
	movl	$2, %eax
	xorl	%edx, %edx
	cmpl	$2, %r15d
	jb	.LBB0_10
	.align	16, 0x90
.LBB0_3:                                # %for.body8
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	movl	%eax, %ecx
	shrl	$3, %ecx
	andq	$536870908, %rcx        # imm = 0x1FFFFFFC
	movl	(%rbx,%rcx), %ecx
	btl	%eax, %ecx
	jae	.LBB0_9
# BB#4:                                 # %if.then13
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	%edx
	leal	(%rax,%rax), %ecx
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_8:                                # %for.inc
                                        #   in Loop: Header=BB0_5 Depth=3
	addl	%eax, %ecx
.LBB0_5:                                # %if.then13
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	%r15d, %ecx
	ja	.LBB0_9
# BB#6:                                 # %for.body18
                                        #   in Loop: Header=BB0_5 Depth=3
	movl	%ecx, %esi
	shrl	$3, %esi
	movq	%rsi, %rdi
	andq	$536870908, %rdi        # imm = 0x1FFFFFFC
	movl	(%rbx,%rdi), %edi
	btl	%ecx, %edi
	jae	.LBB0_8
# BB#7:                                 # %if.then28
                                        #   in Loop: Header=BB0_5 Depth=3
	movl	$1, %edi
	shll	%cl, %edi
	andq	$536870908, %rsi        # imm = 0x1FFFFFFC
	xorl	%edi, (%rbx,%rsi)
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_9:                                # %for.inc39
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	%eax
	cmpl	%r15d, %eax
	jbe	.LBB0_3
.LBB0_10:                               # %for.end41
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	$.L.str, %edi
	movl	%r15d, %esi
	xorb	%al, %al
	callq	printf
	incl	%r14d
	cmpl	$3, %r14d
	jb	.LBB0_2
# BB#11:                                # %for.end45
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
.LBB0_12:                               # %return
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
