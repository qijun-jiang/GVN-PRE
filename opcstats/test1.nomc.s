	.file	"test1.nomc.bc"
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
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp6:
	.cfi_offset %rbx, -32
.Ltmp7:
	.cfi_offset %r14, -24
	callq	clock
	movq	%rax, %r14
	xorl	%eax, %eax
	movabsq	$23423234342342, %rcx   # imm = 0x154DA58FFDC6
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_10:                               # %for.inc29
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	%eax
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$-1, %esi
	cmpl	$29999999, %eax         # imm = 0x1C9C37F
	jg	.LBB0_11
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_8:                                # %if.then12
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%edx, %esi
.LBB0_2:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	1(%rsi), %edx
	cmpl	$11, %edx
	jg	.LBB0_10
# BB#3:                                 # %for.body3
                                        #   in Loop: Header=BB0_2 Depth=2
	movslq	%edx, %rdi
	imulq	$1431655766, %rdi, %rdi # imm = 0x55555556
	movq	%rdi, %rbx
	shrq	$63, %rbx
	shrq	$32, %rdi
	addl	%ebx, %edi
	leal	(%rdi,%rdi,2), %edi
	cmpl	%edi, %edx
	jne	.LBB0_7
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%edx, %edi
	shrl	$31, %edi
	addl	%edx, %edi
	andl	$-2, %edi
	cmpl	%edi, %edx
	je	.LBB0_6
# BB#5:                                 # %if.then6
                                        #   in Loop: Header=BB0_2 Depth=2
	decq	%rcx
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_6:                                # %if.else
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%rcx
.LBB0_7:                                # %if.end9
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%edx, %edi
	shrl	$31, %edi
	addl	%edx, %edi
	andl	$-2, %edi
	cmpl	%edi, %edx
	je	.LBB0_8
# BB#9:                                 # %if.else18
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%esi, %edi
	shrl	$31, %edi
	addl	%esi, %edi
	sarl	%edi
	movslq	%edi, %rsi
	imulq	$1431655766, %rsi, %rdi # imm = 0x55555556
	movq	%rdi, %rbx
	shrq	$63, %rbx
	shrq	$32, %rdi
	addl	%ebx, %edi
	leal	(%rdi,%rdi,2), %edi
	cmpl	%edi, %esi
	movl	%edx, %esi
	jmp	.LBB0_2
.LBB0_11:                               # %for.end31
	callq	clock
	subq	%r14, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	.LCPI0_0(%rip), %xmm0, %xmm0
	vmulsd	.LCPI0_1(%rip), %xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp8:
	.size	main, .Ltmp8-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%f\n"
	.size	.L.str, 4


	.section	".note.GNU-stack","",@progbits
