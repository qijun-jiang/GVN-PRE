	.file	"test/Towers.profile.ls.bc"
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

	.globl	Error
	.align	16, 0x90
	.type	Error,@function
Error:                                  # @Error
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rax
	incl	EdgeProfCounters+8(%rip)
	movq	%rax, -8(%rbp)
	movl	$.L.str, %edi
	movq	%rax, %rsi
	xorb	%al, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp17:
	.size	Error, .Ltmp17-Error
	.cfi_endproc

	.globl	Makenull
	.align	16, 0x90
	.type	Makenull,@function
Makenull:                               # @Makenull
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
	incl	EdgeProfCounters+12(%rip)
	movl	%edi, -4(%rbp)
	movslq	-4(%rbp), %rax
	movl	$0, stack(,%rax,4)
	popq	%rbp
	ret
.Ltmp23:
	.size	Makenull, .Ltmp23-Makenull
	.cfi_endproc

	.globl	Getelement
	.align	16, 0x90
	.type	Getelement,@function
Getelement:                             # @Getelement
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
	subq	$16, %rsp
	incl	EdgeProfCounters+16(%rip)
	movl	$0, -4(%rbp)
	cmpl	$0, freelist(%rip)
	jle	.LBB4_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+20(%rip)
	movl	freelist(%rip), %eax
	movl	%eax, -4(%rbp)
	movslq	freelist(%rip), %rax
	movl	cellspace+4(,%rax,8), %eax
	movl	%eax, freelist(%rip)
	incl	EdgeProfCounters+28(%rip)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	incl	EdgeProfCounters+24(%rip)
	movl	$.L.str1, %edi
	callq	Error
	incl	EdgeProfCounters+32(%rip)
.LBB4_3:                                # %if.end
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp29:
	.size	Getelement, .Ltmp29-Getelement
	.cfi_endproc

	.globl	Push
	.align	16, 0x90
	.type	Push,@function
Push:                                   # @Push
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
	incl	EdgeProfCounters+36(%rip)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -12(%rbp)
	movslq	-8(%rbp), %rax
	cmpl	$0, stack(,%rax,4)
	jle	.LBB5_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+40(%rip)
	movslq	-8(%rbp), %rax
	movslq	stack(,%rax,4), %rax
	movl	cellspace(,%rax,8), %eax
	cmpl	-4(%rbp), %eax
	jg	.LBB5_3
# BB#4:                                 # %if.then6
	incl	EdgeProfCounters+48(%rip)
	movl	$1, -12(%rbp)
	movl	$.L.str2, %edi
	callq	Error
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB5_5
.LBB5_1:                                # %entry.if.end7_crit_edge
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB5_6
.LBB5_3:                                # %if.then.if.end_crit_edge
	incl	EdgeProfCounters+52(%rip)
.LBB5_5:                                # %if.end
	incl	EdgeProfCounters+60(%rip)
.LBB5_6:                                # %if.end7
	cmpl	$0, -12(%rbp)
	je	.LBB5_8
# BB#7:                                 # %if.end7.if.end18_crit_edge
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB5_9
.LBB5_8:                                # %if.then8
	incl	EdgeProfCounters+68(%rip)
	callq	Getelement
	movl	%eax, -16(%rbp)
	movslq	-8(%rbp), %rax
	movl	stack(,%rax,4), %eax
	movslq	-16(%rbp), %rcx
	movl	%eax, cellspace+4(,%rcx,8)
	movslq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	movl	%ecx, stack(,%rax,4)
	movslq	-16(%rbp), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, cellspace(,%rax,8)
	incl	EdgeProfCounters+72(%rip)
.LBB5_9:                                # %if.end18
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp35:
	.size	Push, .Ltmp35-Push
	.cfi_endproc

	.globl	Init
	.align	16, 0x90
	.type	Init,@function
Init:                                   # @Init
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
	subq	$16, %rsp
	incl	EdgeProfCounters+76(%rip)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edi
	callq	Makenull
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	incl	EdgeProfCounters+84(%rip)
	movl	-4(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Push
	incl	EdgeProfCounters+92(%rip)
	decl	-12(%rbp)
	incl	EdgeProfCounters+96(%rip)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	jg	.LBB6_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+88(%rip)
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp41:
	.size	Init, .Ltmp41-Init
	.cfi_endproc

	.globl	Pop
	.align	16, 0x90
	.type	Pop,@function
Pop:                                    # @Pop
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
	subq	$16, %rsp
	incl	EdgeProfCounters+100(%rip)
	movl	%edi, -8(%rbp)
	movslq	-8(%rbp), %rax
	cmpl	$0, stack(,%rax,4)
	jle	.LBB7_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+104(%rip)
	movslq	-8(%rbp), %rax
	movslq	stack(,%rax,4), %rax
	movl	cellspace(,%rax,8), %eax
	movl	%eax, -16(%rbp)
	movslq	-8(%rbp), %rax
	movslq	stack(,%rax,4), %rax
	movl	cellspace+4(,%rax,8), %eax
	movl	%eax, -12(%rbp)
	movslq	-8(%rbp), %rax
	movslq	stack(,%rax,4), %rax
	movl	freelist(%rip), %ecx
	movl	%ecx, cellspace+4(,%rax,8)
	movslq	-8(%rbp), %rax
	movl	stack(,%rax,4), %eax
	movl	%eax, freelist(%rip)
	movslq	-8(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, stack(,%rax,4)
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
	incl	EdgeProfCounters+112(%rip)
	jmp	.LBB7_3
.LBB7_2:                                # %if.end
	incl	EdgeProfCounters+108(%rip)
	movl	$.L.str3, %edi
	callq	Error
	incl	EdgeProfCounters+116(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+120(%rip)
.LBB7_3:                                # %return
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp47:
	.size	Pop, .Ltmp47-Pop
	.cfi_endproc

	.globl	Move
	.align	16, 0x90
	.type	Move,@function
Move:                                   # @Move
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
	incl	EdgeProfCounters+124(%rip)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edi
	callq	Pop
	movl	-8(%rbp), %esi
	movl	%eax, %edi
	callq	Push
	incl	movesdone(%rip)
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp53:
	.size	Move, .Ltmp53-Move
	.cfi_endproc

	.globl	tower
	.align	16, 0x90
	.type	tower,@function
tower:                                  # @tower
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
	subq	$16, %rsp
	incl	EdgeProfCounters+128(%rip)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	cmpl	$1, %edx
	jne	.LBB9_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+132(%rip)
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edi
	callq	Move
	incl	EdgeProfCounters+140(%rip)
	jmp	.LBB9_3
.LBB9_2:                                # %if.else
	incl	EdgeProfCounters+136(%rip)
	movl	$6, %esi
	subl	-4(%rbp), %esi
	subl	-8(%rbp), %esi
	movl	%esi, -16(%rbp)
	movl	-4(%rbp), %edi
	movl	-12(%rbp), %edx
	decl	%edx
	callq	tower
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edi
	callq	Move
	movl	-8(%rbp), %esi
	movl	-16(%rbp), %edi
	movl	-12(%rbp), %edx
	decl	%edx
	callq	tower
	incl	EdgeProfCounters+144(%rip)
.LBB9_3:                                # %if.end
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp59:
	.size	tower, .Ltmp59-tower
	.cfi_endproc

	.globl	Towers
	.align	16, 0x90
	.type	Towers,@function
Towers:                                 # @Towers
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
	subq	$16, %rsp
	incl	EdgeProfCounters+148(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+152(%rip)
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_2:                               # %for.body
                                        #   in Loop: Header=BB10_1 Depth=1
	incl	EdgeProfCounters+156(%rip)
	movslq	-4(%rbp), %rax
	leal	-1(%rax), %ecx
	movl	%ecx, cellspace+4(,%rax,8)
	incl	EdgeProfCounters+164(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+168(%rip)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$18, -4(%rbp)
	jle	.LBB10_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+160(%rip)
	movl	$18, freelist(%rip)
	movl	$1, %edi
	movl	$14, %esi
	callq	Init
	movl	$2, %edi
	callq	Makenull
	movl	$3, %edi
	callq	Makenull
	movl	$0, movesdone(%rip)
	movl	$1, %edi
	movl	$2, %esi
	movl	$14, %edx
	callq	tower
	cmpl	$16383, movesdone(%rip) # imm = 0x3FFF
	je	.LBB10_4
# BB#5:                                 # %if.then
	incl	EdgeProfCounters+172(%rip)
	movl	$.L.str4, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+180(%rip)
	jmp	.LBB10_6
.LBB10_4:                               # %for.end.if.end_crit_edge
	incl	EdgeProfCounters+176(%rip)
.LBB10_6:                               # %if.end
	movl	movesdone(%rip), %esi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp65:
	.size	Towers, .Ltmp65-Towers
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$16, %rsp
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$52, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+184(%rip)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_2:                               # %for.body
                                        #   in Loop: Header=BB11_1 Depth=1
	incl	EdgeProfCounters+192(%rip)
	callq	Towers
	incl	EdgeProfCounters+200(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+204(%rip)
.LBB11_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB11_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+196(%rip)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp71:
	.size	main, .Ltmp71-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 " Error in Towers: %s\n"
	.size	.L.str, 22

	.type	stack,@object           # @stack
	.comm	stack,16,16
	.type	freelist,@object        # @freelist
	.comm	freelist,4,4
	.type	cellspace,@object       # @cellspace
	.comm	cellspace,152,16
	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "out of space   "
	.size	.L.str1, 16

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "disc size error"
	.size	.L.str2, 16

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "nothing to pop "
	.size	.L.str3, 16

	.type	movesdone,@object       # @movesdone
	.comm	movesdone,4,4
	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 " Error in Towers.\n"
	.size	.L.str4, 19

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "%d\n"
	.size	.L.str5, 4

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
	.type	sortlist,@object        # @sortlist
	.comm	sortlist,20004,16
	.type	biggest,@object         # @biggest
	.comm	biggest,4,4
	.type	littlest,@object        # @littlest
	.comm	littlest,4,4
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
	.comm	EdgeProfCounters,208,16

	.section	".note.GNU-stack","",@progbits
