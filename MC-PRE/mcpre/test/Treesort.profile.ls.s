	.file	"test/Treesort.profile.ls.bc"
	.text
	.globl	Initrand
	.align	16, 0x90
	.type	Initrand,@function
Initrand:                               # @Initrand
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
	incl	EdgeProfCounters(%rip)
	movq	$74755, seed(%rip)      # imm = 0x12403
	popq	%rbp
	ret
.Ltmp5:
	.size	Initrand, .Ltmp5-Initrand
	.cfi_endproc

	.globl	Rand
	.align	16, 0x90
	.type	Rand,@function
Rand:                                   # @Rand
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
	incl	EdgeProfCounters+4(%rip)
	imull	$1309, seed(%rip), %eax # imm = 0x51D
	addl	$13849, %eax            # imm = 0x3619
	movzwl	%ax, %eax
	movq	%rax, seed(%rip)
	movl	seed(%rip), %eax
	popq	%rbp
	ret
.Ltmp11:
	.size	Rand, .Ltmp11-Rand
	.cfi_endproc

	.globl	tInitarr
	.align	16, 0x90
	.type	tInitarr,@function
tInitarr:                               # @tInitarr
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp17:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Ltmp18:
	.cfi_offset %rbx, -24
	incl	EdgeProfCounters+8(%rip)
	callq	Initrand
	movl	$0, biggest(%rip)
	movl	$0, littlest(%rip)
	movl	$1, -12(%rbp)
	incl	EdgeProfCounters+12(%rip)
	movabsq	$3022314549036572937, %rbx # imm = 0x29F16B11C6D1E109
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_8:                                # %if.end16
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+52(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+56(%rip)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5000, -12(%rbp)        # imm = 0x1388
	jg	.LBB2_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+16(%rip)
	callq	Rand
	movslq	%eax, %rcx
	movq	%rcx, %rax
	imulq	%rbx
	movq	%rdx, %rax
	shrq	$63, %rax
	movq	%rcx, -24(%rbp)
	shrq	$14, %rdx
	addl	%eax, %edx
	imull	$100000, %edx, %eax     # imm = 0x186A0
	negl	%eax
	leal	-50000(%rcx,%rax), %eax
	movslq	-12(%rbp), %rcx
	movl	%eax, sortlist(,%rcx,4)
	movslq	-12(%rbp), %rax
	movl	sortlist(,%rax,4), %eax
	cmpl	biggest(%rip), %eax
	jle	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	movslq	-12(%rbp), %rax
	movl	sortlist(,%rax,4), %eax
	movl	%eax, biggest(%rip)
	incl	EdgeProfCounters+32(%rip)
	jmp	.LBB2_8
	.align	16, 0x90
.LBB2_4:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+28(%rip)
	movslq	-12(%rbp), %rax
	movl	sortlist(,%rax,4), %eax
	cmpl	littlest(%rip), %eax
	jge	.LBB2_5
# BB#6:                                 # %if.then13
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+36(%rip)
	movslq	-12(%rbp), %rax
	movl	sortlist(,%rax,4), %eax
	movl	%eax, littlest(%rip)
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_5:                                # %if.else.if.end_crit_edge
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+40(%rip)
.LBB2_7:                                # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+48(%rip)
	jmp	.LBB2_8
.LBB2_9:                                # %for.end
	incl	EdgeProfCounters+20(%rip)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp19:
	.size	tInitarr, .Ltmp19-tInitarr
	.cfi_endproc

	.globl	CreateNode
	.align	16, 0x90
	.type	CreateNode,@function
CreateNode:                             # @CreateNode
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
	subq	$16, %rsp
	incl	EdgeProfCounters+60(%rip)
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$24, %edi
	callq	malloc
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, 16(%rax)
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp25:
	.size	CreateNode, .Ltmp25-CreateNode
	.cfi_endproc

	.globl	Insert
	.align	16, 0x90
	.type	Insert,@function
Insert:                                 # @Insert
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp30:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+64(%rip)
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %eax
	cmpl	16(%rsi), %eax
	jle	.LBB4_4
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+68(%rip)
	movq	-16(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB4_2
# BB#3:                                 # %if.else
	incl	EdgeProfCounters+80(%rip)
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	movl	-4(%rbp), %edi
	callq	Insert
	incl	EdgeProfCounters+88(%rip)
	incl	EdgeProfCounters+92(%rip)
	jmp	.LBB4_11
.LBB4_4:                                # %if.else5
	incl	EdgeProfCounters+72(%rip)
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %ecx
	cmpl	16(%rax), %ecx
	jge	.LBB4_5
# BB#6:                                 # %if.then8
	incl	EdgeProfCounters+96(%rip)
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB4_7
# BB#8:                                 # %if.else12
	incl	EdgeProfCounters+108(%rip)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rsi
	movl	-4(%rbp), %edi
	callq	Insert
	incl	EdgeProfCounters+116(%rip)
	jmp	.LBB4_9
.LBB4_5:                                # %if.else5.if.end15_crit_edge
	incl	EdgeProfCounters+100(%rip)
	jmp	.LBB4_10
.LBB4_2:                                # %if.then2
	incl	EdgeProfCounters+76(%rip)
	movl	-4(%rbp), %esi
	movq	-16(%rbp), %rdi
	callq	CreateNode
	incl	EdgeProfCounters+84(%rip)
	incl	EdgeProfCounters+92(%rip)
	jmp	.LBB4_11
.LBB4_7:                                # %if.then10
	incl	EdgeProfCounters+104(%rip)
	movl	-4(%rbp), %esi
	movq	-16(%rbp), %rdi
	addq	$8, %rdi
	callq	CreateNode
	incl	EdgeProfCounters+112(%rip)
.LBB4_9:                                # %if.end14
	incl	EdgeProfCounters+120(%rip)
.LBB4_10:                               # %if.end15
	incl	EdgeProfCounters+124(%rip)
.LBB4_11:                               # %if.end16
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp31:
	.size	Insert, .Ltmp31-Insert
	.cfi_endproc

	.globl	Checktree
	.align	16, 0x90
	.type	Checktree,@function
Checktree:                              # @Checktree
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
	subq	$16, %rsp
	incl	EdgeProfCounters+128(%rip)
	movq	%rdi, -8(%rbp)
	movl	$1, -12(%rbp)
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB5_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+132(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movl	16(%rcx), %ecx
	cmpl	16(%rax), %ecx
	jg	.LBB5_4
# BB#3:                                 # %if.then4
	incl	EdgeProfCounters+140(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+148(%rip)
	jmp	.LBB5_8
.LBB5_1:                                # %entry.if.end7_crit_edge
	incl	EdgeProfCounters+136(%rip)
	jmp	.LBB5_9
.LBB5_4:                                # %if.else
	incl	EdgeProfCounters+144(%rip)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	callq	Checktree
	testl	%eax, %eax
	je	.LBB5_5
# BB#6:                                 # %land.rhs
	incl	EdgeProfCounters+152(%rip)
	cmpl	$0, -12(%rbp)
	setne	%al
	incl	EdgeProfCounters+160(%rip)
	jmp	.LBB5_7
.LBB5_5:                                # %if.else.land.end_crit_edge
	incl	EdgeProfCounters+156(%rip)
	xorb	%al, %al
.LBB5_7:                                # %land.end
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	incl	EdgeProfCounters+164(%rip)
.LBB5_8:                                # %if.end
	incl	EdgeProfCounters+168(%rip)
.LBB5_9:                                # %if.end7
	movq	-8(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB5_10
# BB#11:                                # %if.then9
	incl	EdgeProfCounters+172(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rcx
	movl	16(%rcx), %ecx
	cmpl	16(%rax), %ecx
	jl	.LBB5_13
# BB#12:                                # %if.then14
	incl	EdgeProfCounters+180(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB5_17
.LBB5_10:                               # %if.end7.if.end24_crit_edge
	incl	EdgeProfCounters+176(%rip)
	jmp	.LBB5_18
.LBB5_13:                               # %if.else15
	incl	EdgeProfCounters+184(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdi
	callq	Checktree
	testl	%eax, %eax
	je	.LBB5_14
# BB#15:                                # %land.rhs19
	incl	EdgeProfCounters+192(%rip)
	cmpl	$0, -12(%rbp)
	setne	%al
	incl	EdgeProfCounters+200(%rip)
	jmp	.LBB5_16
.LBB5_14:                               # %if.else15.land.end21_crit_edge
	incl	EdgeProfCounters+196(%rip)
	xorb	%al, %al
.LBB5_16:                               # %land.end21
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	incl	EdgeProfCounters+204(%rip)
.LBB5_17:                               # %if.end23
	incl	EdgeProfCounters+208(%rip)
.LBB5_18:                               # %if.end24
	movl	-12(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp37:
	.size	Checktree, .Ltmp37-Checktree
	.cfi_endproc

	.globl	Trees
	.align	16, 0x90
	.type	Trees,@function
Trees:                                  # @Trees
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp40:
	.cfi_def_cfa_offset 16
.Ltmp41:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp42:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	incl	EdgeProfCounters+212(%rip)
	movl	%edi, -4(%rbp)
	callq	tInitarr
	movl	$24, %edi
	callq	malloc
	movq	%rax, tree(%rip)
	movq	$0, (%rax)
	movq	tree(%rip), %rax
	movq	$0, 8(%rax)
	movq	tree(%rip), %rax
	movl	sortlist+4(%rip), %ecx
	movl	%ecx, 16(%rax)
	movl	$2, -8(%rbp)
	incl	EdgeProfCounters+216(%rip)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	incl	EdgeProfCounters+220(%rip)
	movslq	-8(%rbp), %rax
	movl	sortlist(,%rax,4), %edi
	movq	tree(%rip), %rsi
	callq	Insert
	incl	EdgeProfCounters+228(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+232(%rip)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5000, -8(%rbp)         # imm = 0x1388
	jle	.LBB6_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+224(%rip)
	movl	-4(%rbp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movl	sortlist(,%rax,4), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movq	tree(%rip), %rdi
	callq	Checktree
	testl	%eax, %eax
	je	.LBB6_5
# BB#4:                                 # %for.end.if.end_crit_edge
	incl	EdgeProfCounters+236(%rip)
	jmp	.LBB6_6
.LBB6_5:                                # %if.then
	incl	EdgeProfCounters+240(%rip)
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+244(%rip)
.LBB6_6:                                # %if.end
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp43:
	.size	Trees, .Ltmp43-Trees
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp46:
	.cfi_def_cfa_offset 16
.Ltmp47:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp48:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$68, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+248(%rip)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+252(%rip)
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+256(%rip)
	movl	-8(%rbp), %edi
	callq	Trees
	incl	EdgeProfCounters+264(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+268(%rip)
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB7_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+260(%rip)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp49:
	.size	main, .Ltmp49-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	biggest,@object         # @biggest
	.comm	biggest,4,4
	.type	littlest,@object        # @littlest
	.comm	littlest,4,4
	.type	sortlist,@object        # @sortlist
	.comm	sortlist,20004,16
	.type	tree,@object            # @tree
	.comm	tree,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d\n"
	.size	.L.str, 4

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 " Error in Tree.\n"
	.size	.L.str1, 17

	.type	value,@object           # @value
	.comm	value,4,4
	.type	fixed,@object           # @fixed
	.comm	fixed,4,4
	.type	floated,@object         # @floated
	.comm	floated,4,4
	.type	permarray,@object       # @permarray
	.comm	permarray,44,16
	.type	pctr,@object            # @pctr
	.comm	pctr,4,4
	.type	stack,@object           # @stack
	.comm	stack,16,16
	.type	cellspace,@object       # @cellspace
	.comm	cellspace,152,16
	.type	freelist,@object        # @freelist
	.comm	freelist,4,4
	.type	movesdone,@object       # @movesdone
	.comm	movesdone,4,4
	.type	ima,@object             # @ima
	.comm	ima,6724,16
	.type	imb,@object             # @imb
	.comm	imb,6724,16
	.type	imr,@object             # @imr
	.comm	imr,6724,16
	.type	rma,@object             # @rma
	.comm	rma,6724,16
	.type	rmb,@object             # @rmb
	.comm	rmb,6724,16
	.type	rmr,@object             # @rmr
	.comm	rmr,6724,16
	.type	piececount,@object      # @piececount
	.comm	piececount,16,16
	.type	class,@object           # @class
	.comm	class,52,16
	.type	piecemax,@object        # @piecemax
	.comm	piecemax,52,16
	.type	puzzl,@object           # @puzzl
	.comm	puzzl,2048,16
	.type	p,@object               # @p
	.comm	p,26624,16
	.type	n,@object               # @n
	.comm	n,4,4
	.type	kount,@object           # @kount
	.comm	kount,4,4
	.type	top,@object             # @top
	.comm	top,4,4
	.type	z,@object               # @z
	.comm	z,2056,16
	.type	w,@object               # @w
	.comm	w,2056,16
	.type	e,@object               # @e
	.comm	e,1040,16
	.type	zr,@object              # @zr
	.comm	zr,4,4
	.type	zi,@object              # @zi
	.comm	zi,4,4
	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,272,16

	.section	".note.GNU-stack","",@progbits
