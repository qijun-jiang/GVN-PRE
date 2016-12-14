	.file	"test/lowercase.profile.ls.bc"
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
	subq	$24, %rsp
.Ltmp6:
	.cfi_offset %rbx, -24
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$31, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -12(%rbp)
	movl	%eax, -16(%rbp)
	movq	%rbx, -24(%rbp)
	movq	$0, -32(%rbp)
	incl	EdgeProfCounters+4(%rip)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movq	-32(%rbp), %rdi
	callq	doTest
	incl	EdgeProfCounters+16(%rip)
	incq	-32(%rbp)
	incl	EdgeProfCounters+20(%rip)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$31, -32(%rbp)
	jbe	.LBB0_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+12(%rip)
	xorl	%eax, %eax
	addq	$24, %rsp
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
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	incl	EdgeProfCounters+24(%rip)
	movq	%rdi, -8(%rbp)
	movq	%rdi, -16(%rbp)
	addq	$15, %rdi
	andq	$-16, %rdi
	movq	%rdi, -24(%rbp)
	addq	%rdi, %rdi
	callq	malloc
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
	incl	EdgeProfCounters+28(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+32(%rip)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovaps	staticData+16(%rip), %xmm0
	vmovups	%xmm0, 16(%rcx,%rax,2)
	vmovaps	staticData(%rip), %xmm0
	vmovups	%xmm0, (%rcx,%rax,2)
	incl	EdgeProfCounters+40(%rip)
	addq	$16, -40(%rbp)
	incl	EdgeProfCounters+44(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.LBB1_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+36(%rip)
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
	incl	EdgeProfCounters+48(%rip)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_5:                                # %for.body9
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+52(%rip)
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rdi
	callq	lower_StringImpl
	incl	EdgeProfCounters+60(%rip)
	incq	-40(%rbp)
	incl	EdgeProfCounters+64(%rip)
.LBB1_4:                                # %for.cond7
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$9999999, -40(%rbp)     # imm = 0x98967F
	jbe	.LBB1_5
# BB#6:                                 # %for.end12
	incl	EdgeProfCounters+56(%rip)
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp13:
	.size	doTest, .Ltmp13-doTest
	.cfi_endproc

	.align	16, 0x90
	.type	lower_StringImpl,@function
lower_StringImpl:                       # @lower_StringImpl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	incl	EdgeProfCounters+68(%rip)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movw	$0, -34(%rbp)
	movq	$0, -48(%rbp)
	incl	EdgeProfCounters+72(%rip)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+76(%rip)
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
	incl	EdgeProfCounters+84(%rip)
	incq	-48(%rbp)
	incl	EdgeProfCounters+88(%rip)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.LBB2_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+80(%rip)
	movzwl	-34(%rbp), %eax
	testw	$-128, %ax
	je	.LBB2_4
# BB#5:                                 # %if.end
	incl	EdgeProfCounters+92(%rip)
	movq	$0, -8(%rbp)
	incl	EdgeProfCounters+104(%rip)
	jmp	.LBB2_6
.LBB2_4:                                # %if.then
	incl	EdgeProfCounters+96(%rip)
	movq	$1, -8(%rbp)
	incl	EdgeProfCounters+100(%rip)
.LBB2_6:                                # %return
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp19:
	.size	lower_StringImpl, .Ltmp19-lower_StringImpl
	.cfi_endproc

	.align	16, 0x90
	.type	toASCIILower,@function
toASCIILower:                           # @toASCIILower
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
	incl	EdgeProfCounters+108(%rip)
	movw	%di, -2(%rbp)
	movzwl	-2(%rbp), %eax
	cmpl	$64, %eax
	jle	.LBB3_1
# BB#2:                                 # %land.rhs
	incl	EdgeProfCounters+112(%rip)
	movzwl	-2(%rbp), %ecx
	incl	EdgeProfCounters+120(%rip)
	cmpl	$91, %ecx
	setl	%cl
	jmp	.LBB3_3
.LBB3_1:                                # %entry.land.end_crit_edge
	incl	EdgeProfCounters+116(%rip)
	xorb	%cl, %cl
.LBB3_3:                                # %land.end
	movzbl	%cl, %ecx
	shll	$5, %ecx
	orl	%ecx, %eax
	popq	%rbp
	ret
.Ltmp25:
	.size	toASCIILower, .Ltmp25-toASCIILower
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

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,124,16

	.section	".note.GNU-stack","",@progbits
