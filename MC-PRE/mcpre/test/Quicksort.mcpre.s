	.file	"test/Quicksort.mcpre.bc"
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
	pushq	%r14
	pushq	%rbx
.Ltmp18:
	.cfi_offset %rbx, -32
.Ltmp19:
	.cfi_offset %r14, -24
	callq	Initrand
	movl	$0, biggest(%rip)
	movl	$0, littlest(%rip)
	movl	$1, %ebx
	movabsq	$3022314549036572937, %r14 # imm = 0x29F16B11C6D1E109
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_6:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rbx
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5000, %ebx             # imm = 0x1388
	jg	.LBB2_7
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	callq	Rand
	movslq	%eax, %rcx
	movq	%rcx, %rax
	imulq	%r14
	movq	%rdx, %rax
	shrq	$63, %rax
	shrq	$14, %rdx
	addl	%eax, %edx
	imull	$100000, %edx, %eax     # imm = 0x186A0
	negl	%eax
	leal	-50000(%rcx,%rax), %eax
	movl	%eax, sortlist(,%rbx,4)
	cmpl	biggest(%rip), %eax
	jle	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	sortlist(,%rbx,4), %eax
	movl	%eax, biggest(%rip)
	incq	%rbx
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_4:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	sortlist(,%rbx,4), %eax
	cmpl	littlest(%rip), %eax
	jge	.LBB2_6
# BB#5:                                 # %if.then13
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	sortlist(,%rbx,4), %eax
	movl	%eax, littlest(%rip)
	jmp	.LBB2_6
.LBB2_7:                                # %for.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp20:
	.size	Initarr, .Ltmp20-Initarr
	.cfi_endproc

	.globl	Quicksort
	.align	16, 0x90
	.type	Quicksort,@function
Quicksort:                              # @Quicksort
	.cfi_startproc
# BB#0:                                 # %entry.split.split
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
.Ltmp27:
	.cfi_offset %rbx, -40
.Ltmp28:
	.cfi_offset %r14, -32
.Ltmp29:
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movq	%rdi, %r15
	leal	(%rsi,%r14), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rax
	movl	(%r15,%rax,4), %eax
	movl	%esi, %ebx
	.align	16, 0x90
.LBB3_1:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #     Child Loop BB3_4 Depth 2
	movslq	%ebx, %rbx
	jmp	.LBB3_2
	.align	16, 0x90
.LBB3_3:                                # %while.body
                                        #   in Loop: Header=BB3_2 Depth=2
	incq	%rbx
.LBB3_2:                                # %while.cond
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%eax, (%r15,%rbx,4)
	jge	.LBB3_4
	jmp	.LBB3_3
	.align	16, 0x90
.LBB3_5:                                # %while.body8
                                        #   in Loop: Header=BB3_4 Depth=2
	decl	%edx
.LBB3_4:                                # %while.cond4
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%edx, %rcx
	cmpl	(%r15,%rcx,4), %eax
	jl	.LBB3_5
# BB#6:                                 # %while.end9
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	%edx, %ebx
	jg	.LBB3_8
# BB#7:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15,%rbx,4), %r8d
	movl	(%r15,%rcx,4), %edi
	movl	%edi, (%r15,%rbx,4)
	movl	%r8d, (%r15,%rcx,4)
	decl	%edx
	incl	%ebx
.LBB3_8:                                # %do.cond
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	%edx, %ebx
	jle	.LBB3_1
# BB#9:                                 # %do.end
	cmpl	%edx, %esi
	jge	.LBB3_11
# BB#10:                                # %if.then23
	movq	%r15, %rdi
	callq	Quicksort
.LBB3_11:                               # %if.end24
	cmpl	%r14d, %ebx
	jge	.LBB3_13
# BB#12:                                # %if.then26
	movq	%r15, %rdi
	movl	%ebx, %esi
	movl	%r14d, %edx
	callq	Quicksort
.LBB3_13:                               # %if.end27
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp30:
	.size	Quicksort, .Ltmp30-Quicksort
	.cfi_endproc

	.globl	Quick
	.align	16, 0x90
	.type	Quick,@function
Quick:                                  # @Quick
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
	pushq	%rbx
	pushq	%rax
.Ltmp37:
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	callq	Initarr
	movl	$sortlist, %edi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	Quicksort
	movl	sortlist+4(%rip), %eax
	cmpl	littlest(%rip), %eax
	jne	.LBB4_2
# BB#1:                                 # %lor.lhs.false
	movl	sortlist+20000(%rip), %eax
	cmpl	biggest(%rip), %eax
	je	.LBB4_3
.LBB4_2:                                # %if.then
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
.LBB4_3:                                # %if.end
	incl	%ebx
	movslq	%ebx, %rax
	movl	sortlist(,%rax,4), %esi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp38:
	.size	Quick, .Ltmp38-Quick
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp42:
	.cfi_def_cfa_offset 16
.Ltmp43:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp44:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp45:
	.cfi_offset %rbx, -24
	xorl	%ebx, %ebx
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%ebx, %edi
	callq	Quick
	incl	%ebx
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, %ebx
	jle	.LBB5_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp46:
	.size	main, .Ltmp46-main
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

	.section	".note.GNU-stack","",@progbits
