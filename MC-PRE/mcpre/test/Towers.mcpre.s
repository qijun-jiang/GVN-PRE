	.file	"test/Towers.mcpre.bc"
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
	movq	%rdi, %rax
	movl	$.L.str, %edi
	movq	%rax, %rsi
	xorb	%al, %al
	callq	printf
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
	movslq	%edi, %rax
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
	cmpl	$0, freelist(%rip)
	jle	.LBB4_2
# BB#1:                                 # %if.then
	movslq	freelist(%rip), %rax
	movl	cellspace+4(,%rax,8), %ecx
	movl	%ecx, freelist(%rip)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	movl	$.L.str1, %edi
	callq	Error
	xorl	%eax, %eax
.LBB4_3:                                # %if.end
                                        # kill: EAX<def> EAX<kill> RAX<kill>
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
.Ltmp33:
	.cfi_def_cfa_offset 16
.Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp35:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp36:
	.cfi_offset %rbx, -32
.Ltmp37:
	.cfi_offset %r14, -24
	movl	%edi, %r14d
	movslq	%esi, %rbx
	xorl	%eax, %eax
	cmpl	$0, stack(,%rbx,4)
	jle	.LBB5_3
# BB#1:                                 # %if.then
	movslq	stack(,%rbx,4), %rcx
	cmpl	%r14d, cellspace(,%rcx,8)
	jg	.LBB5_3
# BB#2:                                 # %if.then6
	movl	$.L.str2, %edi
	callq	Error
	movl	$1, %eax
.LBB5_3:                                # %if.end7
	testl	%eax, %eax
	jne	.LBB5_5
# BB#4:                                 # %if.then8
	callq	Getelement
	movl	stack(,%rbx,4), %ecx
	movslq	%eax, %rax
	movl	%ecx, cellspace+4(,%rax,8)
	movl	%eax, stack(,%rbx,4)
	movl	%r14d, cellspace(,%rax,8)
.LBB5_5:                                # %if.end18
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp38:
	.size	Push, .Ltmp38-Push
	.cfi_endproc

	.globl	Init
	.align	16, 0x90
	.type	Init,@function
Init:                                   # @Init
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
	pushq	%r14
	pushq	%rbx
.Ltmp45:
	.cfi_offset %rbx, -32
.Ltmp46:
	.cfi_offset %r14, -24
	movl	%esi, %ebx
	movl	%edi, %r14d
	callq	Makenull
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	%ebx, %edi
	movl	%r14d, %esi
	callq	Push
	decl	%ebx
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	jg	.LBB6_2
# BB#3:                                 # %for.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp47:
	.size	Init, .Ltmp47-Init
	.cfi_endproc

	.globl	Pop
	.align	16, 0x90
	.type	Pop,@function
Pop:                                    # @Pop
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
	movslq	%edi, %rcx
	cmpl	$0, stack(,%rcx,4)
	jle	.LBB7_2
# BB#1:                                 # %if.then
	movslq	stack(,%rcx,4), %rsi
	movl	cellspace(,%rsi,8), %eax
	movl	cellspace+4(,%rsi,8), %edx
	movl	freelist(%rip), %edi
	movl	%edi, cellspace+4(,%rsi,8)
	movl	stack(,%rcx,4), %esi
	movl	%esi, freelist(%rip)
	movl	%edx, stack(,%rcx,4)
	popq	%rbp
	ret
.LBB7_2:                                # %if.else
	movl	$.L.str3, %edi
	callq	Error
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp53:
	.size	Pop, .Ltmp53-Pop
	.cfi_endproc

	.globl	Move
	.align	16, 0x90
	.type	Move,@function
Move:                                   # @Move
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
	movl	%esi, %ebx
	callq	Pop
	movl	%eax, %edi
	movl	%ebx, %esi
	callq	Push
	incl	movesdone(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp61:
	.size	Move, .Ltmp61-Move
	.cfi_endproc

	.globl	tower
	.align	16, 0x90
	.type	tower,@function
tower:                                  # @tower
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp65:
	.cfi_def_cfa_offset 16
.Ltmp66:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp67:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp68:
	.cfi_offset %rbx, -48
.Ltmp69:
	.cfi_offset %r12, -40
.Ltmp70:
	.cfi_offset %r14, -32
.Ltmp71:
	.cfi_offset %r15, -24
	movl	%edx, %r12d
	movl	%esi, %r14d
	movl	%edi, %r15d
	cmpl	$1, %r12d
	jne	.LBB9_2
# BB#1:                                 # %if.then
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Move
	jmp	.LBB9_3
.LBB9_2:                                # %if.else
	movl	$6, %ebx
	subl	%r15d, %ebx
	subl	%r14d, %ebx
	decl	%r12d
	movl	%r15d, %edi
	movl	%ebx, %esi
	movl	%r12d, %edx
	callq	tower
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Move
	movl	%ebx, %edi
	movl	%r14d, %esi
	movl	%r12d, %edx
	callq	tower
.LBB9_3:                                # %if.end
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp72:
	.size	tower, .Ltmp72-tower
	.cfi_endproc

	.globl	Towers
	.align	16, 0x90
	.type	Towers,@function
Towers:                                 # @Towers
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp75:
	.cfi_def_cfa_offset 16
.Ltmp76:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp77:
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_2:                               # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	leal	-1(%rcx), %edx
	movl	%edx, cellspace+12(,%rax,8)
	movq	%rcx, %rax
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	leaq	1(%rax), %rcx
	cmpl	$18, %ecx
	jle	.LBB10_2
# BB#3:                                 # %for.end
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
	je	.LBB10_5
# BB#4:                                 # %if.then
	movl	$.L.str4, %edi
	xorb	%al, %al
	callq	printf
.LBB10_5:                               # %if.end
	movl	movesdone(%rip), %esi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	popq	%rbp
	ret
.Ltmp78:
	.size	Towers, .Ltmp78-Towers
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp82:
	.cfi_def_cfa_offset 16
.Ltmp83:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp84:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp85:
	.cfi_offset %rbx, -24
	movl	$-1, %ebx
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_2:                               # %for.body
                                        #   in Loop: Header=BB11_1 Depth=1
	callq	Towers
.LBB11_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$99, %ebx
	jle	.LBB11_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp86:
	.size	main, .Ltmp86-main
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

	.section	".note.GNU-stack","",@progbits
