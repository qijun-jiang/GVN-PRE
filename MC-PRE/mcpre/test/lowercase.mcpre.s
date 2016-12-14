	.file	"test/lowercase.mcpre.bc"
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
	xorl	%ebx, %ebx
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rbx, %rdi
	callq	doTest
	incq	%rbx
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$31, %rbx
	jbe	.LBB0_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc

	.align	16, 0x90
	.type	doTest,@function
doTest:                                 # @doTest
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp11:
	.cfi_def_cfa_offset 16
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp13:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp14:
	.cfi_offset %rbx, -56
.Ltmp15:
	.cfi_offset %r12, -48
.Ltmp16:
	.cfi_offset %r13, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
	movq	%rdi, %r12
	leaq	15(%r12), %rbx
	andq	$-16, %rbx
	leaq	(%rbx,%rbx), %r15
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, %r14
	xorl	%eax, %eax
	movq	%r14, %rcx
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	vmovaps	staticData+16(%rip), %xmm0
	vmovups	%xmm0, 16(%rcx)
	vmovaps	staticData(%rip), %xmm0
	vmovups	%xmm0, (%rcx)
	addq	$32, %rcx
	addq	$16, %rax
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	jb	.LBB1_2
# BB#3:                                 # %for.end
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, %r13
	movl	$.L.str, %edi
	movq	%r12, %rsi
	movq	%r12, %rdx
	xorb	%al, %al
	callq	printf
	movq	%r13, %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset
	movq	$-1, %rbx
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_5:                                # %for.body9
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	callq	lower_StringImpl
.LBB1_4:                                # %for.cond7
                                        # =>This Inner Loop Header: Depth=1
	incq	%rbx
	cmpq	$9999999, %rbx          # imm = 0x98967F
	jbe	.LBB1_5
# BB#6:                                 # %for.end12
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp19:
	.size	doTest, .Ltmp19-doTest
	.cfi_endproc

	.align	16, 0x90
	.type	lower_StringImpl,@function
lower_StringImpl:                       # @lower_StringImpl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp23:
	.cfi_def_cfa_offset 16
.Ltmp24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp25:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp26:
	.cfi_offset %rbx, -56
.Ltmp27:
	.cfi_offset %r12, -48
.Ltmp28:
	.cfi_offset %r13, -40
.Ltmp29:
	.cfi_offset %r14, -32
.Ltmp30:
	.cfi_offset %r15, -24
	movq	%rdx, -48(%rbp)         # 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r12
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movzwl	(%r12,%r14,2), %ebx
	movl	%ebx, %edi
	callq	toASCIILower
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movw	%ax, (%rcx,%r14,2)
	orl	%ebx, %r13d
	incq	%r14
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r15, %r14
	jb	.LBB2_2
# BB#3:                                 # %for.end
	movl	$1, %eax
	testw	$-128, %r13w
	je	.LBB2_5
# BB#4:                                 # %if.end
	xorl	%eax, %eax
.LBB2_5:                                # %return
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp31:
	.size	lower_StringImpl, .Ltmp31-lower_StringImpl
	.cfi_endproc

	.align	16, 0x90
	.type	toASCIILower,@function
toASCIILower:                           # @toASCIILower
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	xorb	%al, %al
	cmpl	$65, %edi
	jl	.LBB3_2
# BB#1:                                 # %land.rhs
	movzwl	%di, %eax
	cmpl	$91, %eax
	setl	%al
.LBB3_2:                                # %land.end
	movzbl	%al, %eax
	shll	$5, %eax
	orl	%eax, %edi
	movl	%edi, %eax
	popq	%rbp
	ret
.Ltmp37:
	.size	toASCIILower, .Ltmp37-toASCIILower
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
