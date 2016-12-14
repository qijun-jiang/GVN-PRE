	.file	"test/Bubblesort.nomc.bc"
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
	.align	16, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
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
	jle	.LBB2_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	%eax, biggest(%rip)
	jmp	.LBB2_5
	.align	16, 0x90
.LBB2_3:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpl	littlest(%rip), %eax
	jge	.LBB2_5
# BB#4:                                 # %if.then13
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	sortlist(,%rbx,4), %eax
	movl	%eax, littlest(%rip)
.LBB2_5:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rbx
	cmpl	$501, %ebx              # imm = 0x1F5
	jl	.LBB2_1
# BB#6:                                 # %for.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp20:
	.size	bInitarr, .Ltmp20-bInitarr
	.cfi_endproc

	.globl	Bubble
	.align	16, 0x90
	.type	Bubble,@function
Bubble:                                 # @Bubble
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp27:
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	callq	bInitarr
	movl	$500, top(%rip)         # imm = 0x1F4
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB3_6
	.align	16, 0x90
.LBB3_1:                                # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movl	$1, %eax
	cmpl	$2, top(%rip)
	jl	.LBB3_5
	.align	16, 0x90
.LBB3_2:                                # %while.body3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	sortlist(,%rax,4), %ecx
	cmpl	sortlist+4(,%rax,4), %ecx
	jle	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
	movl	sortlist(,%rax,4), %ecx
	movl	sortlist+4(,%rax,4), %edx
	movl	%edx, sortlist(,%rax,4)
	movl	%ecx, sortlist+4(,%rax,4)
.LBB3_4:                                # %if.end
                                        #   in Loop: Header=BB3_2 Depth=2
	incq	%rax
	cmpl	top(%rip), %eax
	jl	.LBB3_2
.LBB3_5:                                # %while.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	top(%rip), %eax
	decl	%eax
	movl	%eax, top(%rip)
	cmpl	$1, %eax
	jg	.LBB3_1
.LBB3_6:                                # %while.end18
	movl	sortlist+4(%rip), %eax
	cmpl	littlest(%rip), %eax
	jne	.LBB3_8
# BB#7:                                 # %lor.lhs.false
	movl	sortlist+2000(%rip), %eax
	cmpl	biggest(%rip), %eax
	je	.LBB3_9
.LBB3_8:                                # %if.then21
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
.LBB3_9:                                # %if.end22
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
.Ltmp28:
	.size	Bubble, .Ltmp28-Bubble
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%rbx
	pushq	%rax
.Ltmp35:
	.cfi_offset %rbx, -24
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB4_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	Bubble
	incl	%ebx
	cmpl	$100, %ebx
	jl	.LBB4_1
# BB#2:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp36:
	.size	main, .Ltmp36-main
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

	.section	".note.GNU-stack","",@progbits
