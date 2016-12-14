	.file	"dry.profile.ls.bc"
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
	subq	$16, %rsp
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$97, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -4(%rbp)
	callq	Proc0
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.globl	Proc0
	.align	16, 0x90
	.type	Proc0,@function
Proc0:                                  # @Proc0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
	incl	EdgeProfCounters+4(%rip)
	callq	clock
	movq	%rax, -144(%rbp)
	movl	$0, -132(%rbp)
	incl	EdgeProfCounters+8(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+12(%rip)
	incl	EdgeProfCounters+20(%rip)
	incl	-132(%rbp)
	incl	EdgeProfCounters+24(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99999999, -132(%rbp)   # imm = 0x5F5E0FF
	jbe	.LBB1_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+16(%rip)
	callq	clock
	subq	-144(%rbp), %rax
	movq	%rax, -160(%rbp)
	movl	$56, %edi
	callq	malloc
	movq	%rax, PtrGlbNext(%rip)
	movl	$56, %edi
	callq	malloc
	movq	%rax, PtrGlb(%rip)
	movq	PtrGlbNext(%rip), %rcx
	movq	%rcx, (%rax)
	movq	PtrGlb(%rip), %rax
	movl	$0, 8(%rax)
	movq	PtrGlb(%rip), %rax
	movl	$10001, 12(%rax)        # imm = 0x2711
	movq	PtrGlb(%rip), %rax
	movl	$40, 16(%rax)
	movq	PtrGlb(%rip), %rdi
	addq	$20, %rdi
	movl	$.L.str, %esi
	callq	strcpy
	leaq	-96(%rbp), %rdi
	movq	%rdi, %r13
	movl	$.L.str1, %esi
	callq	strcpy
	movl	$10, Array2Glob+1660(%rip)
	callq	clock
	movq	%rax, -144(%rbp)
	movl	$0, -132(%rbp)
	incl	EdgeProfCounters+28(%rip)
	leaq	-128(%rbp), %r15
	leaq	-56(%rbp), %r12
	leaq	-64(%rbp), %rbx
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_14:                               # %for.inc42
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+64(%rip)
	movl	-52(%rbp), %eax
	imull	-48(%rbp), %eax
	movl	%eax, -56(%rbp)
	cltd
	idivl	-48(%rbp)
	movl	%eax, -52(%rbp)
	movl	-56(%rbp), %ecx
	subl	%eax, %ecx
	imull	$7, %ecx, %eax
	subl	-48(%rbp), %eax
	movl	%eax, -52(%rbp)
	leaq	-48(%rbp), %rdi
	callq	Proc2
	incl	EdgeProfCounters+88(%rip)
	incl	-132(%rbp)
	incl	EdgeProfCounters+92(%rip)
.LBB1_4:                                # %for.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #     Child Loop BB1_9 Depth 2
	cmpl	$99999999, -132(%rbp)   # imm = 0x5F5E0FF
	ja	.LBB1_15
# BB#5:                                 # %for.body10
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+32(%rip)
	callq	Proc5
	callq	Proc4
	movl	$2, -48(%rbp)
	movl	$3, -52(%rbp)
	movq	%r15, %rdi
	movl	$.L.str2, %esi
	callq	strcpy
	movl	$10000, -64(%rbp)       # imm = 0x2710
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	Func2
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, BoolGlob(%rip)
	incl	EdgeProfCounters+40(%rip)
	jmp	.LBB1_6
	.align	16, 0x90
.LBB1_7:                                # %while.body
                                        #   in Loop: Header=BB1_6 Depth=2
	incl	EdgeProfCounters+44(%rip)
	imull	$5, -48(%rbp), %eax
	subl	-52(%rbp), %eax
	movl	%eax, -56(%rbp)
	movl	-52(%rbp), %esi
	movl	-48(%rbp), %edi
	movq	%r12, %rdx
	callq	Proc7
	incl	-48(%rbp)
	incl	EdgeProfCounters+52(%rip)
.LBB1_6:                                # %while.cond
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-48(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.LBB1_7
# BB#8:                                 # %while.end
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+48(%rip)
	movl	-56(%rbp), %ecx
	movl	-48(%rbp), %edx
	movl	$Array1Glob, %edi
	movl	$Array2Glob, %esi
	callq	Proc8
	movq	PtrGlb(%rip), %rdi
	callq	Proc1
	movb	$65, -58(%rbp)
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB1_9
	.align	16, 0x90
.LBB1_13:                               # %for.inc34
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+80(%rip)
	incb	-58(%rbp)
	incl	EdgeProfCounters+84(%rip)
.LBB1_9:                                # %for.cond24
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	Char2Glob(%rip), %eax
	movsbl	-58(%rbp), %ecx
	cmpl	%eax, %ecx
	jg	.LBB1_14
# BB#10:                                # %for.body28
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+60(%rip)
	movl	-64(%rbp), %r14d
	movsbl	-58(%rbp), %edi
	movl	$67, %esi
	callq	Func1
	cmpl	%eax, %r14d
	jne	.LBB1_11
# BB#12:                                # %if.then
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+68(%rip)
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	Proc6
	incl	EdgeProfCounters+76(%rip)
	jmp	.LBB1_13
	.align	16, 0x90
.LBB1_11:                               # %for.body28.if.end_crit_edge
                                        #   in Loop: Header=BB1_9 Depth=2
	incl	EdgeProfCounters+72(%rip)
	jmp	.LBB1_13
.LBB1_15:                               # %for.end44
	incl	EdgeProfCounters+36(%rip)
	movl	-44(%rbp), %eax
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp17:
	.size	Proc0, .Ltmp17-Proc0
	.cfi_endproc

	.globl	Proc1
	.align	16, 0x90
	.type	Proc1,@function
Proc1:                                  # @Proc1
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
	incl	EdgeProfCounters+96(%rip)
	movq	%rdi, -16(%rbp)
	movl	$5, 16(%rdi)
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movl	16(%rax), %eax
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rax)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp23:
	.size	Proc1, .Ltmp23-Proc1
	.cfi_endproc

	.globl	Proc2
	.align	16, 0x90
	.type	Proc2,@function
Proc2:                                  # @Proc2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+100(%rip)
	movq	%rdi, -16(%rbp)
	movl	(%rdi), %eax
	addl	$10, %eax
	movl	%eax, -20(%rbp)
	incl	EdgeProfCounters+104(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_6:                                # %if.end5
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+124(%rip)
	incl	EdgeProfCounters+132(%rip)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	Char1Glob(%rip), %eax
	cmpl	$65, %eax
	jne	.LBB3_2
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+108(%rip)
	movl	-20(%rbp), %eax
	decl	%eax
	movl	%eax, -20(%rbp)
	subl	IntGlob(%rip), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	$0, -24(%rbp)
	incl	EdgeProfCounters+116(%rip)
	jmp	.LBB3_4
	.align	16, 0x90
.LBB3_2:                                # %for.cond.if.end_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+112(%rip)
.LBB3_4:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, -24(%rbp)
	jne	.LBB3_6
# BB#5:                                 # %if.then4
	incl	EdgeProfCounters+120(%rip)
	incl	EdgeProfCounters+128(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp29:
	.size	Proc2, .Ltmp29-Proc2
	.cfi_endproc

	.globl	Proc3
	.align	16, 0x90
	.type	Proc3,@function
Proc3:                                  # @Proc3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+136(%rip)
	movq	%rdi, -16(%rbp)
	cmpq	$0, PtrGlb(%rip)
	je	.LBB4_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+140(%rip)
	movq	PtrGlb(%rip), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	incl	EdgeProfCounters+148(%rip)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	incl	EdgeProfCounters+144(%rip)
	movl	$100, IntGlob(%rip)
	incl	EdgeProfCounters+152(%rip)
.LBB4_3:                                # %if.end
	movl	IntGlob(%rip), %esi
	movq	PtrGlb(%rip), %rdx
	addq	$16, %rdx
	movl	$10, %edi
	callq	Proc7
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp35:
	.size	Proc3, .Ltmp35-Proc3
	.cfi_endproc

	.globl	Proc4
	.align	16, 0x90
	.type	Proc4,@function
Proc4:                                  # @Proc4
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp38:
	.cfi_def_cfa_offset 16
.Ltmp39:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp40:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+156(%rip)
	movsbl	Char1Glob(%rip), %eax
	cmpl	$65, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	orl	BoolGlob(%rip), %eax
	movl	%eax, -8(%rbp)
	movb	$66, Char2Glob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp41:
	.size	Proc4, .Ltmp41-Proc4
	.cfi_endproc

	.globl	Proc5
	.align	16, 0x90
	.type	Proc5,@function
Proc5:                                  # @Proc5
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+160(%rip)
	movb	$65, Char1Glob(%rip)
	movl	$0, BoolGlob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp47:
	.size	Proc5, .Ltmp47-Proc5
	.cfi_endproc

	.globl	Proc6
	.align	16, 0x90
	.type	Proc6,@function
Proc6:                                  # @Proc6
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
.Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp52:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+164(%rip)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, (%rsi)
	movl	-8(%rbp), %edi
	callq	Func3
	testl	%eax, %eax
	je	.LBB7_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+168(%rip)
	jmp	.LBB7_3
.LBB7_2:                                # %if.then
	incl	EdgeProfCounters+172(%rip)
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
	incl	EdgeProfCounters+176(%rip)
.LBB7_3:                                # %if.end
	movl	-8(%rbp), %eax
	cmpl	$9999, %eax             # imm = 0x270F
	ja	.LBB7_6
# BB#4:                                 # %if.end
	testl	%eax, %eax
	jne	.LBB7_5
# BB#8:                                 # %sw.bb
	incl	EdgeProfCounters+184(%rip)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+204(%rip)
	jmp	.LBB7_15
.LBB7_6:                                # %if.end
	addl	$-10000, %eax           # imm = 0xFFFFFFFFFFFFD8F0
	cmpl	$3, %eax
	jbe	.LBB7_7
.LBB7_5:                                # %if.end.sw.epilog_crit_edge
	incl	EdgeProfCounters+180(%rip)
.LBB7_15:                               # %sw.epilog
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.LBB7_7:                                # %if.end
	jmpq	*.LJTI7_0(,%rax,8)
.LBB7_9:                                # %sw.bb1
	incl	EdgeProfCounters+188(%rip)
	cmpl	$101, IntGlob(%rip)
	jl	.LBB7_11
# BB#10:                                # %if.then2
	incl	EdgeProfCounters+208(%rip)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+216(%rip)
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB7_15
.LBB7_12:                               # %sw.bb4
	incl	EdgeProfCounters+192(%rip)
	movq	-16(%rbp), %rax
	movl	$10000, (%rax)          # imm = 0x2710
	incl	EdgeProfCounters+228(%rip)
	jmp	.LBB7_15
.LBB7_13:                               # %sw.bb5
	incl	EdgeProfCounters+196(%rip)
	incl	EdgeProfCounters+232(%rip)
	jmp	.LBB7_15
.LBB7_14:                               # %sw.bb6
	incl	EdgeProfCounters+200(%rip)
	movq	-16(%rbp), %rax
	movl	$10001, (%rax)          # imm = 0x2711
	incl	EdgeProfCounters+236(%rip)
	jmp	.LBB7_15
.LBB7_11:                               # %if.else
	incl	EdgeProfCounters+212(%rip)
	movq	-16(%rbp), %rax
	movl	$10002, (%rax)          # imm = 0x2712
	incl	EdgeProfCounters+220(%rip)
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB7_15
.Ltmp53:
	.size	Proc6, .Ltmp53-Proc6
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI7_0:
	.quad	.LBB7_9
	.quad	.LBB7_12
	.quad	.LBB7_13
	.quad	.LBB7_14

	.text
	.globl	Proc7
	.align	16, 0x90
	.type	Proc7,@function
Proc7:                                  # @Proc7
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp58:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+240(%rip)
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movl	-8(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -28(%rbp)
	addl	-12(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp59:
	.size	Proc7, .Ltmp59-Proc7
	.cfi_endproc

	.globl	Proc8
	.align	16, 0x90
	.type	Proc8,@function
Proc8:                                  # @Proc8
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
.Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp64:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+244(%rip)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	-28(%rbp), %eax
	addl	$5, %eax
	movl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	incl	%eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	movl	-36(%rbp), %eax
	leal	30(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-16(%rbp), %rdx
	movl	%eax, (%rdx,%rcx,4)
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
	incl	EdgeProfCounters+248(%rip)
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	incl	EdgeProfCounters+252(%rip)
	movslq	-36(%rbp), %rax
	imulq	$204, %rax, %rcx
	addq	-24(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	incl	EdgeProfCounters+260(%rip)
	incl	-40(%rbp)
	incl	EdgeProfCounters+264(%rip)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	incl	%eax
	cmpl	%eax, -40(%rbp)
	jle	.LBB9_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+256(%rip)
	movslq	-36(%rbp), %rax
	imulq	$204, %rax, %rcx
	addq	-24(%rbp), %rcx
	decl	%eax
	movslq	%eax, %rax
	incl	(%rcx,%rax,4)
	movslq	-36(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %ecx
	leal	20(%rax), %edx
	movslq	%edx, %rdx
	imulq	$204, %rdx, %rdx
	addq	-24(%rbp), %rdx
	movl	%ecx, (%rdx,%rax,4)
	movl	$5, IntGlob(%rip)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp65:
	.size	Proc8, .Ltmp65-Proc8
	.cfi_endproc

	.globl	Func1
	.align	16, 0x90
	.type	Func1,@function
Func1:                                  # @Func1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp68:
	.cfi_def_cfa_offset 16
.Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp70:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+268(%rip)
	movb	%dil, -5(%rbp)
	movb	%sil, -6(%rbp)
	movb	-5(%rbp), %al
	movb	%al, -7(%rbp)
	movb	%al, -8(%rbp)
	movsbl	-6(%rbp), %eax
	movsbl	-8(%rbp), %ecx
	cmpl	%eax, %ecx
	je	.LBB10_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+272(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+280(%rip)
	jmp	.LBB10_3
.LBB10_2:                               # %if.else
	incl	EdgeProfCounters+276(%rip)
	movl	$10000, -4(%rbp)        # imm = 0x2710
	incl	EdgeProfCounters+284(%rip)
.LBB10_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp71:
	.size	Func1, .Ltmp71-Func1
	.cfi_endproc

	.globl	Func2
	.align	16, 0x90
	.type	Func2,@function
Func2:                                  # @Func2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp74:
	.cfi_def_cfa_offset 16
.Ltmp75:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp76:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	incl	EdgeProfCounters+288(%rip)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$1, -28(%rbp)
	incl	EdgeProfCounters+292(%rip)
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_3:                               # %while.body.if.end_crit_edge
                                        #   in Loop: Header=BB11_1 Depth=1
	incl	EdgeProfCounters+308(%rip)
	incl	EdgeProfCounters+316(%rip)
.LBB11_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$1, -28(%rbp)
	jg	.LBB11_5
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB11_1 Depth=1
	incl	EdgeProfCounters+296(%rip)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	movsbl	(%rcx,%rax), %edi
	incl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx,%rax), %esi
	callq	Func1
	testl	%eax, %eax
	jne	.LBB11_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB11_1 Depth=1
	incl	EdgeProfCounters+304(%rip)
	movb	$65, -29(%rbp)
	incl	-28(%rbp)
	incl	EdgeProfCounters+312(%rip)
	incl	EdgeProfCounters+316(%rip)
	jmp	.LBB11_1
.LBB11_5:                               # %while.end
	incl	EdgeProfCounters+300(%rip)
	movsbl	-29(%rbp), %eax
	cmpl	$86, %eax
	jle	.LBB11_6
# BB#7:                                 # %land.lhs.true
	incl	EdgeProfCounters+320(%rip)
	movsbl	-29(%rbp), %eax
	cmpl	$91, %eax
	jge	.LBB11_8
# BB#9:                                 # %if.then12
	incl	EdgeProfCounters+328(%rip)
	movl	$7, -28(%rbp)
	incl	EdgeProfCounters+336(%rip)
	jmp	.LBB11_10
.LBB11_6:                               # %while.end.if.end13_crit_edge
	incl	EdgeProfCounters+324(%rip)
	jmp	.LBB11_10
.LBB11_8:                               # %land.lhs.true.if.end13_crit_edge
	incl	EdgeProfCounters+332(%rip)
.LBB11_10:                              # %if.end13
	movsbl	-29(%rbp), %eax
	cmpl	$88, %eax
	jne	.LBB11_12
# BB#11:                                # %if.then17
	incl	EdgeProfCounters+340(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+348(%rip)
	jmp	.LBB11_15
.LBB11_12:                              # %if.else
	incl	EdgeProfCounters+344(%rip)
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rdi
	callq	strcmp
	testl	%eax, %eax
	jle	.LBB11_14
# BB#13:                                # %if.then21
	incl	EdgeProfCounters+352(%rip)
	addl	$7, -28(%rbp)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+360(%rip)
	jmp	.LBB11_15
.LBB11_14:                              # %if.else23
	incl	EdgeProfCounters+356(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+364(%rip)
.LBB11_15:                              # %return
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp77:
	.size	Func2, .Ltmp77-Func2
	.cfi_endproc

	.globl	Func3
	.align	16, 0x90
	.type	Func3,@function
Func3:                                  # @Func3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp80:
	.cfi_def_cfa_offset 16
.Ltmp81:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp82:
	.cfi_def_cfa_register %rbp
	incl	EdgeProfCounters+368(%rip)
	movl	%edi, -8(%rbp)
	movl	%edi, -12(%rbp)
	cmpl	$10001, %edi            # imm = 0x2711
	jne	.LBB12_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+372(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+380(%rip)
	jmp	.LBB12_3
.LBB12_2:                               # %if.end
	incl	EdgeProfCounters+376(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+384(%rip)
.LBB12_3:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp83:
	.size	Func3, .Ltmp83-Func3
	.cfi_endproc

	.type	Version,@object         # @Version
	.data
	.globl	Version
Version:
	.asciz	 "1.1"
	.size	Version, 4

	.type	PtrGlbNext,@object      # @PtrGlbNext
	.comm	PtrGlbNext,8,8
	.type	PtrGlb,@object          # @PtrGlb
	.comm	PtrGlb,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "DHRYSTONE PROGRAM, SOME STRING"
	.size	.L.str, 31

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "DHRYSTONE PROGRAM, 1'ST STRING"
	.size	.L.str1, 31

	.type	Array2Glob,@object      # @Array2Glob
	.comm	Array2Glob,10404,16
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "DHRYSTONE PROGRAM, 2'ND STRING"
	.size	.L.str2, 31

	.type	BoolGlob,@object        # @BoolGlob
	.comm	BoolGlob,4,4
	.type	Array1Glob,@object      # @Array1Glob
	.comm	Array1Glob,204,16
	.type	Char2Glob,@object       # @Char2Glob
	.comm	Char2Glob,1,1
	.type	Char1Glob,@object       # @Char1Glob
	.comm	Char1Glob,1,1
	.type	IntGlob,@object         # @IntGlob
	.comm	IntGlob,4,4
	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,388,16

	.section	".note.GNU-stack","",@progbits
