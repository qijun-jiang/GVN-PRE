	.file	"max-flow.bc"
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	%esi, -4(%rbp)
	jge	.LBB0_2
# BB#1:                                 # %cond.true
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.LBB0_2:                                # %cond.false
	movl	-8(%rbp), %eax
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
	movl	%edi, -4(%rbp)
	movslq	tail(%rip), %rax
	movl	%edi, q(,%rax,4)
	incl	tail(%rip)
	movslq	-4(%rbp), %rax
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
	movslq	head(%rip), %rax
	movl	q(,%rax,4), %eax
	movl	%eax, -4(%rbp)
	incl	head(%rip)
	movslq	-4(%rbp), %rax
	movl	$2, color(,%rax,4)
	movl	-4(%rbp), %eax
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
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	-12(%rbp), %rax
	movl	$0, color(,%rax,4)
	incl	-12(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	n(%rip), %eax
	jl	.LBB3_2
# BB#3:                                 # %for.end
	movl	$0, tail(%rip)
	movl	$0, head(%rip)
	movl	-4(%rbp), %edi
	callq	enqueue
	movslq	-4(%rbp), %rax
	movl	$-1, pred(,%rax,4)
	jmp	.LBB3_4
	.align	16, 0x90
.LBB3_5:                                # %while.body
                                        #   in Loop: Header=BB3_4 Depth=1
	callq	dequeue
	movl	%eax, -12(%rbp)
	movl	$0, -16(%rbp)
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_10:                               # %for.inc21
                                        #   in Loop: Header=BB3_6 Depth=2
	incl	-16(%rbp)
.LBB3_6:                                # %for.cond4
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	cmpl	n(%rip), %eax
	jge	.LBB3_4
# BB#7:                                 # %for.body6
                                        #   in Loop: Header=BB3_6 Depth=2
	movslq	-16(%rbp), %rax
	cmpl	$0, color(,%rax,4)
	jne	.LBB3_10
# BB#8:                                 # %land.lhs.true
                                        #   in Loop: Header=BB3_6 Depth=2
	movslq	-12(%rbp), %rax
	imulq	$4000, %rax, %rax       # imm = 0xFA0
	movslq	-16(%rbp), %rcx
	movl	capacity(%rax,%rcx,4), %edx
	subl	flow(%rax,%rcx,4), %edx
	testl	%edx, %edx
	jle	.LBB3_10
# BB#9:                                 # %if.then
                                        #   in Loop: Header=BB3_6 Depth=2
	movl	-16(%rbp), %edi
	callq	enqueue
	movslq	-16(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, pred(,%rax,4)
	jmp	.LBB3_10
	.align	16, 0x90
.LBB3_4:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	movl	head(%rip), %eax
	cmpl	tail(%rip), %eax
	jne	.LBB3_5
# BB#11:                                # %while.end
	movslq	-8(%rbp), %rax
	cmpl	$2, color(,%rax,4)
	sete	%al
	movzbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp23:
	.size	bfs, .Ltmp23-bfs
	.cfi_endproc

	.globl	max_flow
	.align	16, 0x90
	.type	max_flow,@function
max_flow:                               # @max_flow
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
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_5:                                # %for.inc6
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	-12(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	movl	-12(%rbp), %eax
	cmpl	n(%rip), %eax
	jge	.LBB4_7
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	$0, -16(%rbp)
	jmp	.LBB4_3
	.align	16, 0x90
.LBB4_4:                                # %for.inc
                                        #   in Loop: Header=BB4_3 Depth=2
	movslq	-12(%rbp), %rax
	imulq	$4000, %rax, %rax       # imm = 0xFA0
	movslq	-16(%rbp), %rcx
	movl	$0, flow(%rax,%rcx,4)
	incl	-16(%rbp)
.LBB4_3:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	cmpl	n(%rip), %eax
	jge	.LBB4_5
	jmp	.LBB4_4
	.align	16, 0x90
.LBB4_6:                                # %for.end54
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	-28(%rbp), %eax
	addl	%eax, -24(%rbp)
.LBB4_7:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_9 Depth 2
                                        #     Child Loop BB4_12 Depth 2
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edi
	callq	bfs
	testl	%eax, %eax
	je	.LBB4_14
# BB#8:                                 # %while.body
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	$1000000000, -28(%rbp)  # imm = 0x3B9ACA00
	movl	n(%rip), %eax
	decl	%eax
	jmp	.LBB4_9
	.align	16, 0x90
.LBB4_10:                               # %for.inc28
                                        #   in Loop: Header=BB4_9 Depth=2
	movslq	-20(%rbp), %rax
	movslq	pred(,%rax,4), %rcx
	imulq	$4000, %rcx, %rcx       # imm = 0xFA0
	movl	capacity(%rcx,%rax,4), %esi
	subl	flow(%rcx,%rax,4), %esi
	movl	-28(%rbp), %edi
	callq	min
	movl	%eax, -28(%rbp)
	movslq	-20(%rbp), %rax
	movl	pred(,%rax,4), %eax
.LBB4_9:                                # %while.body
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%eax, -20(%rbp)
	movslq	-20(%rbp), %rax
	cmpl	$0, pred(,%rax,4)
	jns	.LBB4_10
# BB#11:                                # %for.end31
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	n(%rip), %eax
	decl	%eax
	jmp	.LBB4_12
	.align	16, 0x90
.LBB4_13:                               # %for.inc51
                                        #   in Loop: Header=BB4_12 Depth=2
	movslq	-20(%rbp), %rax
	movslq	pred(,%rax,4), %rcx
	imulq	$4000, %rcx, %rcx       # imm = 0xFA0
	movl	-28(%rbp), %edx
	addl	%edx, flow(%rcx,%rax,4)
	movslq	-20(%rbp), %rcx
	movslq	pred(,%rcx,4), %rax
	imulq	$4000, %rcx, %rcx       # imm = 0xFA0
	movl	-28(%rbp), %edx
	subl	%edx, flow(%rcx,%rax,4)
	movslq	-20(%rbp), %rax
	movl	pred(,%rax,4), %eax
.LBB4_12:                               # %for.end31
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%eax, -20(%rbp)
	movslq	-20(%rbp), %rax
	cmpl	$0, pred(,%rax,4)
	js	.LBB4_6
	jmp	.LBB4_13
.LBB4_14:                               # %while.end
	movl	-24(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp29:
	.size	max_flow, .Ltmp29-max_flow
	.cfi_endproc

	.globl	read_input_file
	.align	16, 0x90
	.type	read_input_file,@function
read_input_file:                        # @read_input_file
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Ltmp36:
	.cfi_offset %rbx, -40
.Ltmp37:
	.cfi_offset %r14, -32
.Ltmp38:
	.cfi_offset %r15, -24
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	callq	fopen
	movq	%rax, -56(%rbp)
	movq	%rax, %rdi
	movl	$.L.str2, %esi
	movl	$n, %edx
	movl	$e, %ecx
	xorb	%al, %al
	callq	__isoc99_fscanf
	movl	$0, -40(%rbp)
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_5:                                # %for.inc7
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	-40(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_3 Depth 2
	movl	-40(%rbp), %eax
	cmpl	n(%rip), %eax
	jge	.LBB5_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	$0, -44(%rbp)
	jmp	.LBB5_3
	.align	16, 0x90
.LBB5_4:                                # %for.inc
                                        #   in Loop: Header=BB5_3 Depth=2
	movslq	-40(%rbp), %rax
	imulq	$4000, %rax, %rax       # imm = 0xFA0
	movslq	-44(%rbp), %rcx
	movl	$0, capacity(%rax,%rcx,4)
	incl	-44(%rbp)
.LBB5_3:                                # %for.cond2
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	cmpl	n(%rip), %eax
	jge	.LBB5_5
	jmp	.LBB5_4
.LBB5_6:                                # %for.end9
	movl	$0, -40(%rbp)
	leaq	-28(%rbp), %r14
	leaq	-32(%rbp), %r15
	leaq	-36(%rbp), %rbx
	jmp	.LBB5_7
	.align	16, 0x90
.LBB5_8:                                # %for.inc18
                                        #   in Loop: Header=BB5_7 Depth=1
	movq	-56(%rbp), %rdi
	movl	$.L.str3, %esi
	movq	%r14, %rdx
	movq	%r15, %rcx
	movq	%rbx, %r8
	xorb	%al, %al
	callq	__isoc99_fscanf
	movslq	-28(%rbp), %rax
	imulq	$4000, %rax, %rax       # imm = 0xFA0
	movslq	-32(%rbp), %rcx
	movl	-36(%rbp), %edx
	movl	%edx, capacity(%rax,%rcx,4)
	incl	-40(%rbp)
.LBB5_7:                                # %for.cond10
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	e(%rip), %eax
	jl	.LBB5_8
# BB#9:                                 # %for.end20
	movq	-56(%rbp), %rdi
	callq	fclose
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp39:
	.size	read_input_file, .Ltmp39-read_input_file
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
	subq	$16, %rsp
	movl	$0, -4(%rbp)
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
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp45:
	.size	main, .Ltmp45-main
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
