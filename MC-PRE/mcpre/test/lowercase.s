	.file	"test/lowercase.bc"
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
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rdi
	callq	doTest
	incq	-24(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$31, -24(%rbp)
	jbe	.LBB0_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.align	16, 0x90
	.type	doTest,@function
doTest:                                 # @doTest
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
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rdi, -16(%rbp)
	addq	$15, %rdi
	andq	$-16, %rdi
	movq	%rdi, -24(%rbp)
	addq	%rdi, %rdi
	callq	malloc
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovaps	staticData+16(%rip), %xmm0
	vmovups	%xmm0, 16(%rcx,%rax,2)
	vmovaps	staticData(%rip), %xmm0
	vmovups	%xmm0, (%rcx,%rax,2)
	addq	$16, -40(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.LBB1_2
# BB#3:                                 # %for.end
	movq	-24(%rbp), %rdi
	addq	%rdi, %rdi
	callq	malloc
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rsi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movq	-48(%rbp), %rdi
	movq	-24(%rbp), %rdx
	addq	%rdx, %rdx
	xorl	%esi, %esi
	callq	memset
	movq	$0, -40(%rbp)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_5:                                # %for.body9
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rdi
	callq	lower_StringImpl
	incq	-40(%rbp)
.LBB1_4:                                # %for.cond7
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$9999999, -40(%rbp)     # imm = 0x98967F
	jbe	.LBB1_5
# BB#6:                                 # %for.end12
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	doTest, .Ltmp11-doTest
	.cfi_endproc

	.align	16, 0x90
	.type	lower_StringImpl,@function
lower_StringImpl:                       # @lower_StringImpl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movw	$0, -34(%rbp)
	movq	$0, -48(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -50(%rbp)
	movzwl	-50(%rbp), %ecx
	movzwl	-34(%rbp), %eax
	orl	%ecx, %eax
	movw	%ax, -34(%rbp)
	movzwl	-50(%rbp), %edi
	callq	toASCIILower
	movq	-32(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	incq	-48(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.LBB2_2
# BB#3:                                 # %for.end
	movzwl	-34(%rbp), %eax
	testw	$-128, %ax
	je	.LBB2_4
# BB#5:                                 # %if.end
	movq	$0, -8(%rbp)
	jmp	.LBB2_6
.LBB2_4:                                # %if.then
	movq	$1, -8(%rbp)
.LBB2_6:                                # %return
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp17:
	.size	lower_StringImpl, .Ltmp17-lower_StringImpl
	.cfi_endproc

	.align	16, 0x90
	.type	toASCIILower,@function
toASCIILower:                           # @toASCIILower
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	movw	%di, -2(%rbp)
	xorb	%cl, %cl
	movzwl	-2(%rbp), %eax
	cmpl	$65, %eax
	jl	.LBB3_2
# BB#1:                                 # %land.rhs
	movzwl	-2(%rbp), %ecx
	cmpl	$91, %ecx
	setl	%cl
.LBB3_2:                                # %land.end
	movzbl	%cl, %ecx
	shll	$5, %ecx
	orl	%ecx, %eax
	popq	%rbp
	ret
.Ltmp23:
	.size	toASCIILower, .Ltmp23-toASCIILower
	.cfi_endproc

	.type	staticData,@object      # @staticData
	.data
	.align	16
staticData:
	.short	72                      # 0x48
	.short	69                      # 0x45
	.short	76                      # 0x4c
	.short	76                      # 0x4c
	.short	79                      # 0x4f
	.short	32                      # 0x20
	.short	87                      # 0x57
	.short	79                      # 0x4f
	.short	82                      # 0x52
	.short	76                      # 0x4c
	.short	68                      # 0x44
	.short	33                      # 0x21
	.short	72                      # 0x48
	.short	69                      # 0x45
	.short	76                      # 0x4c
	.short	76                      # 0x4c
	.size	staticData, 32

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "iterations (%ld characters)\n"
	.size	.L.str, 29


	.section	".note.GNU-stack","",@progbits
