	.file	"test/Treesort.nomc.bc"
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
	cmpl	$5001, %ebx             # imm = 0x1389
	jl	.LBB2_1
# BB#6:                                 # %for.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp20:
	.size	tInitarr, .Ltmp20-tInitarr
	.cfi_endproc

	.globl	CreateNode
	.align	16, 0x90
	.type	CreateNode,@function
CreateNode:                             # @CreateNode
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
	pushq	%r14
	pushq	%rbx
.Ltmp27:
	.cfi_offset %rbx, -32
.Ltmp28:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	$24, %edi
	callq	malloc
	movq	%rax, (%rbx)
	movq	$0, (%rax)
	movq	(%rbx), %rax
	movq	$0, 8(%rax)
	movq	(%rbx), %rax
	movl	%r14d, 16(%rax)
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp29:
	.size	CreateNode, .Ltmp29-CreateNode
	.cfi_endproc

	.globl	Insert
	.align	16, 0x90
	.type	Insert,@function
Insert:                                 # @Insert
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
	movl	%edi, %eax
	cmpl	16(%rsi), %eax
	jle	.LBB4_4
# BB#1:                                 # %if.then
	cmpq	$0, (%rsi)
	je	.LBB4_2
# BB#3:                                 # %if.else
	movq	(%rsi), %rsi
	jmp	.LBB4_8
.LBB4_4:                                # %if.else5
	cmpl	16(%rsi), %eax
	jge	.LBB4_9
# BB#5:                                 # %if.then8
	cmpq	$0, 8(%rsi)
	leaq	8(%rsi), %rdi
	je	.LBB4_6
# BB#7:                                 # %if.else12
	movq	(%rdi), %rsi
.LBB4_8:                                # %if.else12
	movl	%eax, %edi
	callq	Insert
.LBB4_9:                                # %if.end16
	popq	%rbp
	ret
.LBB4_2:                                # %if.then2
	movq	%rsi, %rdi
.LBB4_6:                                # %if.then10
	movl	%eax, %esi
	callq	CreateNode
	popq	%rbp
	ret
.Ltmp35:
	.size	Insert, .Ltmp35-Insert
	.cfi_endproc

	.globl	Checktree
	.align	16, 0x90
	.type	Checktree,@function
Checktree:                              # @Checktree
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp39:
	.cfi_def_cfa_offset 16
.Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp41:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp42:
	.cfi_offset %rbx, -32
.Ltmp43:
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movl	$1, %r14d
	cmpq	$0, (%rbx)
	je	.LBB5_3
# BB#1:                                 # %if.then
	movq	(%rbx), %rax
	movl	16(%rax), %eax
	xorl	%r14d, %r14d
	cmpl	16(%rbx), %eax
	jle	.LBB5_3
# BB#2:                                 # %if.else
	movq	(%rbx), %rdi
	callq	Checktree
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %r14d
.LBB5_3:                                # %if.end7
	cmpq	$0, 8(%rbx)
	je	.LBB5_4
# BB#5:                                 # %if.then9
	movq	8(%rbx), %rax
	movl	16(%rax), %ecx
	xorl	%eax, %eax
	cmpl	16(%rbx), %ecx
	jge	.LBB5_7
# BB#6:                                 # %if.else15
	movq	8(%rbx), %rdi
	callq	Checktree
	testl	%r14d, %r14d
	setne	%cl
	testl	%eax, %eax
	setne	%al
	andb	%cl, %al
	movzbl	%al, %eax
	jmp	.LBB5_7
.LBB5_4:
	movl	%r14d, %eax
.LBB5_7:                                # %if.end24
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp44:
	.size	Checktree, .Ltmp44-Checktree
	.cfi_endproc

	.globl	Trees
	.align	16, 0x90
	.type	Trees,@function
Trees:                                  # @Trees
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp48:
	.cfi_def_cfa_offset 16
.Ltmp49:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp50:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp51:
	.cfi_offset %rbx, -32
.Ltmp52:
	.cfi_offset %r14, -24
	movl	%edi, %r14d
	callq	tInitarr
	movl	$24, %edi
	callq	malloc
	movq	%rax, tree(%rip)
	movq	$0, (%rax)
	movl	$2, %ebx
	movq	tree(%rip), %rax
	movq	$0, 8(%rax)
	movq	tree(%rip), %rax
	movl	sortlist+4(%rip), %ecx
	movl	%ecx, 16(%rax)
	.align	16, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	sortlist(,%rbx,4), %edi
	movq	tree(%rip), %rsi
	callq	Insert
	incq	%rbx
	cmpl	$5001, %ebx             # imm = 0x1389
	jl	.LBB6_1
# BB#2:                                 # %for.end
	addl	$2, %r14d
	movslq	%r14d, %rax
	movl	sortlist(,%rax,4), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movq	tree(%rip), %rdi
	callq	Checktree
	testl	%eax, %eax
	jne	.LBB6_4
# BB#3:                                 # %if.then
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
.LBB6_4:                                # %if.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp53:
	.size	Trees, .Ltmp53-Trees
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp57:
	.cfi_def_cfa_offset 16
.Ltmp58:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp59:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp60:
	.cfi_offset %rbx, -24
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB7_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	Trees
	incl	%ebx
	cmpl	$100, %ebx
	jl	.LBB7_1
# BB#2:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp61:
	.size	main, .Ltmp61-main
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

	.section	".note.GNU-stack","",@progbits
