	.file	"test/Quicksort.profile.ls.bc"
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

	.globl	Initarr
	.align	16, 0x90
	.type	Initarr,@function
Initarr:                                # @Initarr
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
	.size	Initarr, .Ltmp19-Initarr
	.cfi_endproc

	.globl	Quicksort
	.align	16, 0x90
	.type	Quicksort,@function
Quicksort:                              # @Quicksort
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
	subq	$32, %rsp
	incl	EdgeProfCounters+60(%rip)
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rax
	movq	-8(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -28(%rbp)
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_11:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+116(%rip)
.LBB3_1:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #     Child Loop BB3_5 Depth 2
	incl	EdgeProfCounters+68(%rip)
	jmp	.LBB3_2
	.align	16, 0x90
.LBB3_3:                                # %while.body
                                        #   in Loop: Header=BB3_2 Depth=2
	incl	EdgeProfCounters+72(%rip)
	incl	-20(%rbp)
	incl	EdgeProfCounters+80(%rip)
.LBB3_2:                                # %while.cond
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-20(%rbp), %rax
	movq	-8(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB3_3
# BB#4:                                 # %while.end
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+76(%rip)
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB3_5
	.align	16, 0x90
.LBB3_6:                                # %while.body8
                                        #   in Loop: Header=BB3_5 Depth=2
	incl	EdgeProfCounters+88(%rip)
	decl	-24(%rbp)
	incl	EdgeProfCounters+96(%rip)
.LBB3_5:                                # %while.cond4
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jl	.LBB3_6
# BB#7:                                 # %while.end9
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+92(%rip)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB3_8
# BB#9:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+100(%rip)
	movslq	-20(%rbp), %rax
	movq	-8(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -32(%rbp)
	movslq	-24(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	-20(%rbp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	-20(%rbp)
	decl	-24(%rbp)
	incl	EdgeProfCounters+108(%rip)
	jmp	.LBB3_10
	.align	16, 0x90
.LBB3_8:                                # %while.end9.if.end_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+104(%rip)
.LBB3_10:                               # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+112(%rip)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.LBB3_11
# BB#12:                                # %do.end
	incl	EdgeProfCounters+120(%rip)
	movl	-12(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB3_13
# BB#14:                                # %if.then23
	incl	EdgeProfCounters+124(%rip)
	movl	-24(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	callq	Quicksort
	incl	EdgeProfCounters+132(%rip)
	jmp	.LBB3_15
.LBB3_13:                               # %do.end.if.end24_crit_edge
	incl	EdgeProfCounters+128(%rip)
.LBB3_15:                               # %if.end24
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_16
# BB#17:                                # %if.then26
	incl	EdgeProfCounters+136(%rip)
	movl	-16(%rbp), %edx
	movl	-20(%rbp), %esi
	movq	-8(%rbp), %rdi
	callq	Quicksort
	incl	EdgeProfCounters+144(%rip)
	jmp	.LBB3_18
.LBB3_16:                               # %if.end24.if.end27_crit_edge
	incl	EdgeProfCounters+140(%rip)
.LBB3_18:                               # %if.end27
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp25:
	.size	Quicksort, .Ltmp25-Quicksort
	.cfi_endproc

	.globl	Quick
	.align	16, 0x90
	.type	Quick,@function
Quick:                                  # @Quick
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
	incl	EdgeProfCounters+148(%rip)
	movl	%edi, -4(%rbp)
	callq	Initarr
	movl	$sortlist, %edi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	Quicksort
	movl	sortlist+4(%rip), %eax
	cmpl	littlest(%rip), %eax
	je	.LBB4_2
# BB#1:                                 # %entry.if.then_crit_edge
	incl	EdgeProfCounters+152(%rip)
	jmp	.LBB4_5
.LBB4_2:                                # %lor.lhs.false
	incl	EdgeProfCounters+156(%rip)
	movl	sortlist+20000(%rip), %eax
	cmpl	biggest(%rip), %eax
	je	.LBB4_3
# BB#4:                                 # %lor.lhs.false.if.then_crit_edge
	incl	EdgeProfCounters+160(%rip)
.LBB4_5:                                # %if.then
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+168(%rip)
	jmp	.LBB4_6
.LBB4_3:                                # %lor.lhs.false.if.end_crit_edge
	incl	EdgeProfCounters+164(%rip)
.LBB4_6:                                # %if.end
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
.Ltmp31:
	.size	Quick, .Ltmp31-Quick
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$49, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+172(%rip)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+176(%rip)
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+180(%rip)
	movl	-8(%rbp), %edi
	callq	Quick
	incl	EdgeProfCounters+188(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+192(%rip)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB5_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+184(%rip)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp37:
	.size	main, .Ltmp37-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	biggest,@object         # @biggest
	.comm	biggest,4,4
	.type	littlest,@object        # @littlest
	.comm	littlest,4,4
	.type	sortlist,@object        # @sortlist
	.comm	sortlist,20004,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 " Error in Quick.\n"
	.size	.L.str, 18

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
	.comm	EdgeProfCounters,196,16

	.section	".note.GNU-stack","",@progbits
