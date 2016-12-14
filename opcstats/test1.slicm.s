	.file	"test1.slicm.bc"
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
	pushq	%rbx
	pushq	%rax
.Ltmp6:
	.cfi_offset %rbx, -24
	callq	clock
	movq	%rax, %rbx
	xorl	%eax, %eax
	movabsq	$23423234342342, %rcx   # imm = 0x154DA58FFDC6
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_8:                                # %for.inc29
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	%eax
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$-1, %edx
	cmpl	$29999, %eax            # imm = 0x752F
	jg	.LBB0_9
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_7:                                # %if.end9
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%edx, %esi
	shrl	$31, %esi
	addl	%edx, %esi
	andl	$-2, %esi
	cmpl	%esi, %edx
.LBB0_2:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%edx
	cmpl	$11, %edx
	jg	.LBB0_8
# BB#3:                                 # %for.body3
                                        #   in Loop: Header=BB0_2 Depth=2
	movslq	%edx, %rsi
	imulq	$1431655766, %rsi, %rsi # imm = 0x55555556
	movq	%rsi, %rdi
	shrq	$63, %rdi
	shrq	$32, %rsi
	addl	%edi, %esi
	leal	(%rsi,%rsi,2), %esi
	cmpl	%esi, %edx
	jne	.LBB0_7
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%edx, %esi
	shrl	$31, %esi
	addl	%edx, %esi
	andl	$-2, %esi
	cmpl	%esi, %edx
	je	.LBB0_6
# BB#5:                                 # %if.then6.split
                                        #   in Loop: Header=BB0_2 Depth=2
	decq	%rcx
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_6:                                # %if.else.split
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%rcx
	jmp	.LBB0_7
.LBB0_9:                                # %for.end31
	callq	clock
	subq	%rbx, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vdivsd	.LCPI0_0(%rip), %xmm0, %xmm0
	vmulsd	.LCPI0_1(%rip), %xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%f\n"
	.size	.L.str, 4


	.section	".note.GNU-stack","",@progbits
