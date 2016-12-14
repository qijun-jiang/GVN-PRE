	.file	"Bubblesort.profile.ls.bc"
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

	.globl	bInitarr
	.align	16, 0x90
	.type	bInitarr,@function
bInitarr:                               # @bInitarr
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
	cmpl	$500, -12(%rbp)         # imm = 0x1F4
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
	.size	bInitarr, .Ltmp19-bInitarr
	.cfi_endproc

	.globl	Bubble
	.align	16, 0x90
	.type	Bubble,@function
Bubble:                                 # @Bubble
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
	movl	%edi, -4(%rbp)
	callq	bInitarr
	movl	$500, top(%rip)         # imm = 0x1F4
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_8:                                # %while.end
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+84(%rip)
	decl	top(%rip)
	incl	EdgeProfCounters+104(%rip)
.LBB3_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	cmpl	$2, top(%rip)
	jl	.LBB3_9
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+68(%rip)
	movl	$1, -8(%rbp)
	incl	EdgeProfCounters+76(%rip)
	jmp	.LBB3_3
	.align	16, 0x90
.LBB3_7:                                # %if.end
                                        #   in Loop: Header=BB3_3 Depth=2
	incl	-8(%rbp)
	incl	EdgeProfCounters+100(%rip)
.LBB3_3:                                # %while.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	top(%rip), %eax
	jge	.LBB3_8
# BB#4:                                 # %while.body3
                                        #   in Loop: Header=BB3_3 Depth=2
	incl	EdgeProfCounters+80(%rip)
	movslq	-8(%rbp), %rax
	movl	sortlist(,%rax,4), %ecx
	incl	%eax
	movslq	%eax, %rax
	cmpl	sortlist(,%rax,4), %ecx
	jle	.LBB3_5
# BB#6:                                 # %if.then
                                        #   in Loop: Header=BB3_3 Depth=2
	incl	EdgeProfCounters+88(%rip)
	movslq	-8(%rbp), %rax
	movl	sortlist(,%rax,4), %eax
	movl	%eax, -12(%rbp)
	movslq	-8(%rbp), %rax
	leal	1(%rax), %ecx
	movslq	%ecx, %rcx
	movl	sortlist(,%rcx,4), %ecx
	movl	%ecx, sortlist(,%rax,4)
	movl	-8(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, sortlist(,%rax,4)
	incl	EdgeProfCounters+96(%rip)
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_5:                                # %while.body3.if.end_crit_edge
                                        #   in Loop: Header=BB3_3 Depth=2
	incl	EdgeProfCounters+92(%rip)
	jmp	.LBB3_7
.LBB3_9:                                # %while.end18
	incl	EdgeProfCounters+72(%rip)
	movl	sortlist+4(%rip), %eax
	cmpl	littlest(%rip), %eax
	je	.LBB3_11
# BB#10:                                # %while.end18.if.then21_crit_edge
	incl	EdgeProfCounters+108(%rip)
	jmp	.LBB3_14
.LBB3_11:                               # %lor.lhs.false
	incl	EdgeProfCounters+112(%rip)
	movl	sortlist+2000(%rip), %eax
	cmpl	biggest(%rip), %eax
	je	.LBB3_12
# BB#13:                                # %lor.lhs.false.if.then21_crit_edge
	incl	EdgeProfCounters+116(%rip)
.LBB3_14:                               # %if.then21
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+124(%rip)
	jmp	.LBB3_15
.LBB3_12:                               # %lor.lhs.false.if.end22_crit_edge
	incl	EdgeProfCounters+120(%rip)
.LBB3_15:                               # %if.end22
	movl	-4(%rbp), %eax
	incl	%eax
	movslq	%eax, %rax
	movl	sortlist(,%rax,4), %esi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp25:
	.size	Bubble, .Ltmp25-Bubble
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$38, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+128(%rip)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+132(%rip)
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	EdgeProfCounters+136(%rip)
	movl	-8(%rbp), %edi
	callq	Bubble
	incl	EdgeProfCounters+144(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+148(%rip)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB4_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+140(%rip)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp31:
	.size	main, .Ltmp31-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	biggest,@object         # @biggest
	.comm	biggest,4,4
	.type	littlest,@object        # @littlest
	.comm	littlest,4,4
	.type	sortlist,@object        # @sortlist
	.comm	sortlist,20004,16
	.type	top,@object             # @top
	.comm	top,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Error3 in Bubble.\n"
	.size	.L.str, 19

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%d\n"
	.size	.L.str1, 4

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
	.type	tree,@object            # @tree
	.comm	tree,8,8
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
	.comm	EdgeProfCounters,152,16

	.section	".note.GNU-stack","",@progbits
