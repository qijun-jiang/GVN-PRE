	.file	"max-flow.slicm.bc"
	.text
	.globl	min
	.align	16, 0x90
	.type	min,@function
min:                                    # @min
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
	cmpl	%esi, %edi
	jl	.LBB0_2
# BB#1:                                 # %cond.false
	movl	%esi, %edi
.LBB0_2:                                # %cond.end
	movl	%edi, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	min, .Ltmp5-min
	.cfi_endproc

	.globl	enqueue
	.align	16, 0x90
	.type	enqueue,@function
enqueue:                                # @enqueue
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
	movslq	tail(%rip), %rax
	movl	%edi, q(,%rax,4)
	incl	tail(%rip)
	movslq	%edi, %rax
	movl	$1, color(,%rax,4)
	popq	%rbp
	ret
.Ltmp11:
	.size	enqueue, .Ltmp11-enqueue
	.cfi_endproc

	.globl	dequeue
	.align	16, 0x90
	.type	dequeue,@function
dequeue:                                # @dequeue
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
	movslq	head(%rip), %rcx
	movslq	q(,%rcx,4), %rax
	incl	%ecx
	movl	%ecx, head(%rip)
	movl	$2, color(,%rax,4)
                                        # kill: EAX<def> EAX<kill> RAX<kill>
	popq	%rbp
	ret
.Ltmp17:
	.size	dequeue, .Ltmp17-dequeue
	.cfi_endproc

	.globl	bfs
	.align	16, 0x90
	.type	bfs,@function
bfs:                                    # @bfs
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp21:
	.cfi_def_cfa_offset 16
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp23:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp24:
	.cfi_offset %rbx, -48
.Ltmp25:
	.cfi_offset %r12, -40
.Ltmp26:
	.cfi_offset %r14, -32
.Ltmp27:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %ebx
	xorl	%eax, %eax
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, color(,%rax,4)
	incq	%rax
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	n(%rip), %eax
	jl	.LBB3_2
# BB#3:                                 # %for.end
	movl	$0, tail(%rip)
	movl	$0, head(%rip)
	movl	%ebx, %edi
	callq	enqueue
	movslq	%ebx, %rax
	movl	$-1, pred(,%rax,4)
	jmp	.LBB3_4
	.align	16, 0x90
.LBB3_5:                                # %while.body
                                        #   in Loop: Header=BB3_4 Depth=1
	callq	dequeue
	movslq	%eax, %r15
	imulq	$4000, %r15, %r12       # imm = 0xFA0
	xorl	%ebx, %ebx
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_10:                               # %for.inc21
                                        #   in Loop: Header=BB3_6 Depth=2
	incq	%rbx
.LBB3_6:                                # %for.cond4
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	n(%rip), %ebx
	jge	.LBB3_4
# BB#7:                                 # %for.body6
                                        #   in Loop: Header=BB3_6 Depth=2
	cmpl	$0, color(,%rbx,4)
	jne	.LBB3_10
# BB#8:                                 # %land.lhs.true
                                        #   in Loop: Header=BB3_6 Depth=2
	movl	capacity(%r12,%rbx,4), %eax
	subl	flow(%r12,%rbx,4), %eax
	testl	%eax, %eax
	jle	.LBB3_10
# BB#9:                                 # %if.then
                                        #   in Loop: Header=BB3_6 Depth=2
	movl	%ebx, %edi
	callq	enqueue
	movl	%r15d, pred(,%rbx,4)
	jmp	.LBB3_10
	.align	16, 0x90
.LBB3_4:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	movl	head(%rip), %eax
	cmpl	tail(%rip), %eax
	jne	.LBB3_5
# BB#11:                                # %while.end
	movslq	%r14d, %rax
	cmpl	$2, color(,%rax,4)
	sete	%al
	movzbl	%al, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp28:
	.size	bfs, .Ltmp28-bfs
	.cfi_endproc

	.globl	max_flow
	.align	16, 0x90
	.type	max_flow,@function
max_flow:                               # @max_flow
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp35:
	.cfi_offset %rbx, -48
.Ltmp36:
	.cfi_offset %r12, -40
.Ltmp37:
	.cfi_offset %r14, -32
.Ltmp38:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %r15d
	xorl	%r12d, %r12d
	movl	$flow, %eax
	xorl	%ecx, %ecx
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_4:                                # %for.inc6
                                        #   in Loop: Header=BB4_1 Depth=1
	addq	$4000, %rax             # imm = 0xFA0
	incl	%ecx
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
	cmpl	n(%rip), %ecx
	movq	%rax, %rdx
	movl	$0, %esi
	jge	.LBB4_5
	jmp	.LBB4_2
	.align	16, 0x90
.LBB4_3:                                # %for.inc
                                        #   in Loop: Header=BB4_2 Depth=2
	movl	$0, (%rdx)
	addq	$4, %rdx
	incl	%esi
.LBB4_2:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	n(%rip), %esi
	jge	.LBB4_4
	jmp	.LBB4_3
	.align	16, 0x90
.LBB4_6:                                # %while.body
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	n(%rip), %ecx
	decl	%ecx
	movl	$1000000000, %eax       # imm = 0x3B9ACA00
	jmp	.LBB4_7
	.align	16, 0x90
.LBB4_8:                                # %for.inc28
                                        #   in Loop: Header=BB4_7 Depth=2
	movslq	pred(,%rbx,4), %rcx
	imulq	$4000, %rcx, %rcx       # imm = 0xFA0
	movl	capacity(%rcx,%rbx,4), %esi
	subl	flow(%rcx,%rbx,4), %esi
	movl	%eax, %edi
	callq	min
	movl	pred(,%rbx,4), %ecx
.LBB4_7:                                # %for.cond9
                                        #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%ecx, %rbx
	cmpl	$0, pred(,%rbx,4)
	jns	.LBB4_8
# BB#9:                                 # %for.end31.split
                                        #   in Loop: Header=BB4_5 Depth=1
	addl	%eax, %r12d
	movl	n(%rip), %ecx
	decl	%ecx
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_11:                               # %for.inc51
                                        #   in Loop: Header=BB4_10 Depth=2
	movslq	pred(,%rcx,4), %rdx
	imulq	$4000, %rdx, %rdx       # imm = 0xFA0
	addl	%eax, flow(%rdx,%rcx,4)
	movslq	pred(,%rcx,4), %rdx
	imulq	$4000, %rcx, %rsi       # imm = 0xFA0
	subl	%eax, flow(%rsi,%rdx,4)
	movl	pred(,%rcx,4), %ecx
.LBB4_10:                               # %for.cond33
                                        #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%ecx, %rcx
	cmpl	$0, pred(,%rcx,4)
	jns	.LBB4_11
.LBB4_5:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
                                        #     Child Loop BB4_10 Depth 2
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	bfs
	testl	%eax, %eax
	jne	.LBB4_6
# BB#12:                                # %while.end
	movl	%r12d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp39:
	.size	max_flow, .Ltmp39-max_flow
	.cfi_endproc

	.globl	read_input_file
	.align	16, 0x90
	.type	read_input_file,@function
read_input_file:                        # @read_input_file
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp43:
	.cfi_def_cfa_offset 16
.Ltmp44:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp45:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp46:
	.cfi_offset %rbx, -56
.Ltmp47:
	.cfi_offset %r12, -48
.Ltmp48:
	.cfi_offset %r13, -40
.Ltmp49:
	.cfi_offset %r14, -32
.Ltmp50:
	.cfi_offset %r15, -24
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	callq	fopen
	movq	%rax, %r13
	movq	%r13, %rdi
	movl	$.L.str2, %esi
	movl	$n, %edx
	movl	$e, %ecx
	xorb	%al, %al
	callq	__isoc99_fscanf
	xorl	%eax, %eax
	movl	$capacity, %ecx
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_7:                                # %for.inc7
                                        #   in Loop: Header=BB5_1 Depth=1
	addq	$4000, %rcx             # imm = 0xFA0
	incl	%eax
.LBB5_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
	cmpl	n(%rip), %eax
	movq	%rcx, %rdx
	movl	$0, %esi
	jl	.LBB5_5
	jmp	.LBB5_2
	.align	16, 0x90
.LBB5_6:                                # %for.inc
                                        #   in Loop: Header=BB5_5 Depth=2
	movl	$0, (%rdx)
	addq	$4, %rdx
	incl	%esi
.LBB5_5:                                # %for.cond2
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	n(%rip), %esi
	jge	.LBB5_7
	jmp	.LBB5_6
.LBB5_2:
	movl	$-1, %ebx
	leaq	-44(%rbp), %r14
	leaq	-48(%rbp), %r15
	leaq	-52(%rbp), %r12
	jmp	.LBB5_3
	.align	16, 0x90
.LBB5_4:                                # %for.body12
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	%r13, %rdi
	movl	$.L.str3, %esi
	movq	%r14, %rdx
	movq	%r15, %rcx
	movq	%r12, %r8
	xorb	%al, %al
	callq	__isoc99_fscanf
	movslq	-44(%rbp), %rax
	imulq	$4000, %rax, %rax       # imm = 0xFA0
	movslq	-48(%rbp), %rcx
	movl	-52(%rbp), %edx
	movl	%edx, capacity(%rax,%rcx,4)
.LBB5_3:                                # %for.cond10
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	e(%rip), %ebx
	jl	.LBB5_4
# BB#8:                                 # %for.end20
	movq	%r13, %rdi
	callq	fclose
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp51:
	.size	read_input_file, .Ltmp51-read_input_file
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp54:
	.cfi_def_cfa_offset 16
.Ltmp55:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp56:
	.cfi_def_cfa_register %rbp
	callq	read_input_file
	movl	n(%rip), %esi
	decl	%esi
	xorl	%edi, %edi
	callq	max_flow
	movl	$.L.str4, %edi
	movl	%eax, %esi
	xorb	%al, %al
	callq	printf
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp57:
	.size	main, .Ltmp57-main
	.cfi_endproc

	.type	tail,@object            # @tail
	.comm	tail,4,4
	.type	q,@object               # @q
	.comm	q,4008,16
	.type	color,@object           # @color
	.comm	color,4000,16
	.type	head,@object            # @head
	.comm	head,4,4
	.type	n,@object               # @n
	.comm	n,4,4
	.type	pred,@object            # @pred
	.comm	pred,4000,16
	.type	capacity,@object        # @capacity
	.comm	capacity,4000000,16
	.type	flow,@object            # @flow
	.comm	flow,4000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "a.in"
	.size	.L.str, 5

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "r"
	.size	.L.str1, 2

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "%d %d"
	.size	.L.str2, 6

	.type	e,@object               # @e
	.comm	e,4,4
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "%d %d %d"
	.size	.L.str3, 9

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "%d\n"
	.size	.L.str4, 4


	.section	".note.GNU-stack","",@progbits
