	.file	"test/lowercase.nomc.bc"
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
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	doTest
	incq	%rbx
	cmpq	$32, %rbx
	jb	.LBB0_1
# BB#2:                                 # %for.end
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
	pushq	%r12
	pushq	%rbx
.Ltmp14:
	.cfi_offset %rbx, -48
.Ltmp15:
	.cfi_offset %r12, -40
.Ltmp16:
	.cfi_offset %r14, -32
.Ltmp17:
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	leaq	15(%r15), %rbx
	movq	%rbx, %rdi
	andq	$-16, %rdi
	addq	%rdi, %rdi
	callq	malloc
	movq	%rax, %r14
	andq	$-16, %rbx
	je	.LBB1_3
# BB#1:
	xorl	%eax, %eax
	movq	%r14, %rcx
	.align	16, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	staticData(%rip), %xmm0
	vmovaps	staticData+16(%rip), %xmm1
	vmovups	%xmm1, 16(%rcx)
	vmovups	%xmm0, (%rcx)
	addq	$32, %rcx
	addq	$16, %rax
	cmpq	%rbx, %rax
	jb	.LBB1_2
.LBB1_3:                                # %for.end
	addq	%rbx, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r12
	movl	$.L.str, %edi
	movq	%r15, %rsi
	movq	%r15, %rdx
	xorb	%al, %al
	callq	printf
	movq	%r12, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_4:                                # %for.body9
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	lower_StringImpl
	incq	%rbx
	cmpq	$10000000, %rbx         # imm = 0x989680
	jb	.LBB1_4
# BB#5:                                 # %for.end12
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp18:
	.size	doTest, .Ltmp18-doTest
	.cfi_endproc

	.align	16, 0x90
	.type	lower_StringImpl,@function
lower_StringImpl:                       # @lower_StringImpl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp22:
	.cfi_def_cfa_offset 16
.Ltmp23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp24:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp25:
	.cfi_offset %rbx, -56
.Ltmp26:
	.cfi_offset %r12, -48
.Ltmp27:
	.cfi_offset %r13, -40
.Ltmp28:
	.cfi_offset %r14, -32
.Ltmp29:
	.cfi_offset %r15, -24
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	je	.LBB2_3
# BB#1:
	xorl	%r14d, %r14d
	movq	%rdx, -48(%rbp)         # 8-byte Spill
	movq	%rsi, %r15
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movzwl	(%rdi,%r14,2), %r13d
	movq	%rdi, %r12
	movl	%r13d, %edi
	callq	toASCIILower
	movq	%r12, %rdi
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movw	%ax, (%rcx,%r14,2)
	orl	%r13d, %ebx
	incq	%r14
	cmpq	%r15, %r14
	jb	.LBB2_2
.LBB2_3:                                # %for.end
	testw	$-128, %bx
	sete	%al
	movzbl	%al, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp30:
	.size	lower_StringImpl, .Ltmp30-lower_StringImpl
	.cfi_endproc

	.align	16, 0x90
	.type	toASCIILower,@function
toASCIILower:                           # @toASCIILower
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
.Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp35:
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
	orl	%edi, %eax
	popq	%rbp
	ret
.Ltmp36:
	.size	toASCIILower, .Ltmp36-toASCIILower
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
