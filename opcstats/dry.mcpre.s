	.file	"dry.mcpre.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	callq	Proc0
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.globl	Proc0
	.align	16, 0x90
	.type	Proc0,@function
Proc0:                                  # @Proc0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
	callq	clock
	movl	$-1, %eax
	.align	16, 0x90
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	cmpl	$100000000, %eax        # imm = 0x5F5E100
	jb	.LBB1_1
# BB#2:                                 # %for.end
	callq	clock
	movl	$56, %edi
	callq	malloc
	movq	%rax, PtrGlbNext(%rip)
	movl	$56, %edi
	callq	malloc
	movq	%rax, PtrGlb(%rip)
	movq	PtrGlbNext(%rip), %rcx
	movq	%rcx, (%rax)
	movq	PtrGlb(%rip), %rax
	movl	$0, 8(%rax)
	movq	PtrGlb(%rip), %rax
	movl	$10001, 12(%rax)        # imm = 0x2711
	movq	PtrGlb(%rip), %rax
	movl	$40, 16(%rax)
	movq	PtrGlb(%rip), %rdi
	addq	$20, %rdi
	movl	$.L.str, %esi
	callq	strcpy
	leaq	-96(%rbp), %rdi
	movl	$.L.str1, %esi
	callq	strcpy
	movl	$10, Array2Glob+1660(%rip)
	callq	clock
	xorl	%eax, %eax
	leaq	-48(%rbp), %r12
	leaq	-52(%rbp), %r15
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_12:                               # %for.inc42
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	%r14d, -48(%rbp)
	leaq	-44(%rbp), %rdi
	callq	Proc2
	movl	-132(%rbp), %eax        # 4-byte Reload
	incl	%eax
.LBB1_3:                                # %for.cond8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #     Child Loop BB1_8 Depth 2
	cmpl	$99999999, %eax         # imm = 0x5F5E0FF
	ja	.LBB1_13
# BB#4:                                 # %for.body10
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	%eax, -132(%rbp)        # 4-byte Spill
	callq	Proc5
	callq	Proc4
	movl	$2, -44(%rbp)
	leaq	-128(%rbp), %rbx
	movq	%rbx, %rdi
	movl	$.L.str2, %esi
	callq	strcpy
	movl	$10000, -52(%rbp)       # imm = 0x2710
	leaq	-96(%rbp), %rdi
	movq	%rbx, %rsi
	callq	Func2
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, BoolGlob(%rip)
	jmp	.LBB1_5
	.align	16, 0x90
.LBB1_6:                                # %while.body
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	-44(%rbp), %eax
	leal	-3(%rax,%rax,4), %eax
	movl	%eax, -48(%rbp)
	movl	-44(%rbp), %edi
	movl	$3, %esi
	movq	%r12, %rdx
	callq	Proc7
	incl	-44(%rbp)
.LBB1_5:                                # %while.cond
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$2, -44(%rbp)
	jle	.LBB1_6
# BB#7:                                 # %while.end.split
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	-48(%rbp), %ecx
	movl	-44(%rbp), %r14d
	movl	$Array1Glob, %edi
	movl	$Array2Glob, %esi
	movl	%r14d, %edx
	callq	Proc8
	movq	PtrGlb(%rip), %rdi
	callq	Proc1
	leal	(%r14,%r14,2), %r14d
	movb	$65, %bl
	jmp	.LBB1_8
	.align	16, 0x90
.LBB1_11:                               # %for.inc34
                                        #   in Loop: Header=BB1_8 Depth=2
	incb	%bl
.LBB1_8:                                # %for.cond24
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	%bl, %edi
	movsbl	Char2Glob(%rip), %eax
	cmpl	%eax, %edi
	jg	.LBB1_12
# BB#9:                                 # %for.body28
                                        #   in Loop: Header=BB1_8 Depth=2
	movl	-52(%rbp), %r13d
	movl	$67, %esi
	callq	Func1
	cmpl	%eax, %r13d
	jne	.LBB1_11
# BB#10:                                # %if.then
                                        #   in Loop: Header=BB1_8 Depth=2
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	Proc6
	jmp	.LBB1_11
.LBB1_13:                               # %for.end44
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp17:
	.size	Proc0, .Ltmp17-Proc0
	.cfi_endproc

	.globl	Proc1
	.align	16, 0x90
	.type	Proc1,@function
Proc1:                                  # @Proc1
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
	movl	$5, 16(%rdi)
	movq	(%rdi), %rax
	movl	$5, 16(%rax)
	movq	(%rdi), %rax
	movq	%rax, (%rax)
	popq	%rbp
	ret
.Ltmp23:
	.size	Proc1, .Ltmp23-Proc1
	.cfi_endproc

	.globl	Proc2
	.align	16, 0x90
	.type	Proc2,@function
Proc2:                                  # @Proc2
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
	movl	(%rdi), %eax
	addl	$10, %eax
	xorb	%cl, %cl
	.align	16, 0x90
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	Char1Glob(%rip), %edx
	cmpl	$65, %edx
	jne	.LBB3_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	decl	%eax
	movl	%eax, %edx
	subl	IntGlob(%rip), %edx
	movl	%edx, (%rdi)
.LBB3_3:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	testb	%cl, %cl
	jne	.LBB3_1
# BB#4:                                 # %for.end
	popq	%rbp
	ret
.Ltmp29:
	.size	Proc2, .Ltmp29-Proc2
	.cfi_endproc

	.globl	Proc3
	.align	16, 0x90
	.type	Proc3,@function
Proc3:                                  # @Proc3
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
	cmpq	$0, PtrGlb(%rip)
	je	.LBB4_2
# BB#1:                                 # %if.then
	movq	PtrGlb(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, (%rdi)
	jmp	.LBB4_3
.LBB4_2:                                # %if.else
	movl	$100, IntGlob(%rip)
.LBB4_3:                                # %if.end
	movl	IntGlob(%rip), %esi
	movq	PtrGlb(%rip), %rdx
	addq	$16, %rdx
	movl	$10, %edi
	callq	Proc7
	popq	%rbp
	ret
.Ltmp35:
	.size	Proc3, .Ltmp35-Proc3
	.cfi_endproc

	.globl	Proc4
	.align	16, 0x90
	.type	Proc4,@function
Proc4:                                  # @Proc4
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
	movb	$66, Char2Glob(%rip)
	popq	%rbp
	ret
.Ltmp41:
	.size	Proc4, .Ltmp41-Proc4
	.cfi_endproc

	.globl	Proc5
	.align	16, 0x90
	.type	Proc5,@function
Proc5:                                  # @Proc5
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
	movb	$65, Char1Glob(%rip)
	movl	$0, BoolGlob(%rip)
	popq	%rbp
	ret
.Ltmp47:
	.size	Proc5, .Ltmp47-Proc5
	.cfi_endproc

	.globl	Proc6
	.align	16, 0x90
	.type	Proc6,@function
Proc6:                                  # @Proc6
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp51:
	.cfi_def_cfa_offset 16
.Ltmp52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp53:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp54:
	.cfi_offset %rbx, -32
.Ltmp55:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	movl	%ebx, (%r14)
	callq	Func3
	testl	%eax, %eax
	jne	.LBB7_2
# BB#1:                                 # %if.then
	movl	$10002, (%r14)          # imm = 0x2712
.LBB7_2:                                # %if.end
	cmpl	$9999, %ebx             # imm = 0x270F
	ja	.LBB7_5
# BB#3:                                 # %if.end
	testl	%ebx, %ebx
	jne	.LBB7_13
# BB#4:                                 # %sw.bb
	movl	$0, (%r14)
	jmp	.LBB7_13
.LBB7_5:                                # %if.end
	cmpl	$10000, %ebx            # imm = 0x2710
	je	.LBB7_9
# BB#6:                                 # %if.end
	cmpl	$10001, %ebx            # imm = 0x2711
	jne	.LBB7_7
# BB#12:                                # %sw.bb4
	movl	$10000, (%r14)          # imm = 0x2710
	jmp	.LBB7_13
.LBB7_9:                                # %sw.bb1
	cmpl	$101, IntGlob(%rip)
	jl	.LBB7_11
# BB#10:                                # %if.then2
	movl	$0, (%r14)
	jmp	.LBB7_13
.LBB7_7:                                # %if.end
	cmpl	$10003, %ebx            # imm = 0x2713
	jne	.LBB7_13
# BB#8:                                 # %sw.bb6
	movl	$10001, (%r14)          # imm = 0x2711
	jmp	.LBB7_13
.LBB7_11:                               # %if.else
	movl	$10002, (%r14)          # imm = 0x2712
.LBB7_13:                               # %sw.epilog
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp56:
	.size	Proc6, .Ltmp56-Proc6
	.cfi_endproc

	.globl	Proc7
	.align	16, 0x90
	.type	Proc7,@function
Proc7:                                  # @Proc7
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp59:
	.cfi_def_cfa_offset 16
.Ltmp60:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp61:
	.cfi_def_cfa_register %rbp
	addl	$2, %edi
	addl	%edi, %esi
	movl	%esi, (%rdx)
	popq	%rbp
	ret
.Ltmp62:
	.size	Proc7, .Ltmp62-Proc7
	.cfi_endproc

	.globl	Proc8
	.align	16, 0x90
	.type	Proc8,@function
Proc8:                                  # @Proc8
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
	leal	5(%rdx), %r9d
	movslq	%r9d, %r8
	movl	%ecx, (%rdi,%r8,4)
	leal	6(%rdx), %eax
	movslq	%eax, %rax
	movl	%ecx, (%rdi,%rax,4)
	addl	$35, %edx
	movslq	%edx, %rax
	movl	%r8d, (%rdi,%rax,4)
	imulq	$52, %r8, %rax
	leaq	(%rsi,%rax,4), %rcx
	leal	1(%r8), %edx
	movl	%r9d, %eax
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.inc
                                        #   in Loop: Header=BB9_1 Depth=1
	movl	%r9d, (%rcx)
	addq	$4, %rcx
	incl	%eax
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edx, %eax
	jle	.LBB9_2
# BB#3:                                 # %for.end
	imulq	$204, %r8, %rax
	addq	%rsi, %rax
	leal	-1(%r8), %ecx
	movslq	%ecx, %rcx
	incl	(%rax,%rcx,4)
	leal	20(%r8), %eax
	movslq	%eax, %rax
	imulq	$204, %rax, %rax
	addq	%rsi, %rax
	movl	(%rdi,%r8,4), %ecx
	movl	%ecx, (%rax,%r8,4)
	movl	$5, IntGlob(%rip)
	popq	%rbp
	ret
.Ltmp68:
	.size	Proc8, .Ltmp68-Proc8
	.cfi_endproc

	.globl	Func1
	.align	16, 0x90
	.type	Func1,@function
Func1:                                  # @Func1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp71:
	.cfi_def_cfa_offset 16
.Ltmp72:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp73:
	.cfi_def_cfa_register %rbp
	movsbl	%sil, %eax
	movsbl	%dil, %ecx
	cmpl	%eax, %ecx
	je	.LBB10_2
# BB#1:
	xorl	%eax, %eax
	popq	%rbp
	ret
.LBB10_2:                               # %if.else
	movl	$10000, %eax            # imm = 0x2710
	popq	%rbp
	ret
.Ltmp74:
	.size	Func1, .Ltmp74-Func1
	.cfi_endproc

	.globl	Func2
	.align	16, 0x90
	.type	Func2,@function
Func2:                                  # @Func2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp78:
	.cfi_def_cfa_offset 16
.Ltmp79:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp80:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp81:
	.cfi_offset %rbx, -48
.Ltmp82:
	.cfi_offset %r12, -40
.Ltmp83:
	.cfi_offset %r14, -32
.Ltmp84:
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$1, %ebx
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_3:                               # %if.then
                                        #   in Loop: Header=BB11_1 Depth=1
	movl	%r12d, %ebx
.LBB11_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$1, %ebx
	jg	.LBB11_4
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB11_1 Depth=1
	movslq	%ebx, %rax
	movsbl	(%r15,%rax), %edi
	leal	1(%rbx), %r12d
	movslq	%r12d, %rax
	movsbl	(%r14,%rax), %esi
	callq	Func1
	testl	%eax, %eax
	jne	.LBB11_1
	jmp	.LBB11_3
.LBB11_4:                               # %while.end
	movb	$1, %al
	testb	%al, %al
	jne	.LBB11_6
# BB#5:                                 # %land.lhs.true
	xorb	%al, %al
	testb	%al, %al
.LBB11_6:                               # %if.end13
	movl	$1, %eax
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB11_9
# BB#7:                                 # %if.else
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	strcmp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.LBB11_9
# BB#8:                                 # %if.then21
	movl	$1, %eax
.LBB11_9:                               # %return
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp85:
	.size	Func2, .Ltmp85-Func2
	.cfi_endproc

	.globl	Func3
	.align	16, 0x90
	.type	Func3,@function
Func3:                                  # @Func3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp88:
	.cfi_def_cfa_offset 16
.Ltmp89:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp90:
	.cfi_def_cfa_register %rbp
	movl	$1, %eax
	cmpl	$10001, %edi            # imm = 0x2711
	je	.LBB12_2
# BB#1:                                 # %if.end
	xorl	%eax, %eax
.LBB12_2:                               # %return
	popq	%rbp
	ret
.Ltmp91:
	.size	Func3, .Ltmp91-Func3
	.cfi_endproc

	.type	Version,@object         # @Version
	.data
	.globl	Version
Version:
	.asciz	 "1.1"
	.size	Version, 4

	.type	PtrGlbNext,@object      # @PtrGlbNext
	.comm	PtrGlbNext,8,8
	.type	PtrGlb,@object          # @PtrGlb
	.comm	PtrGlb,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "DHRYSTONE PROGRAM, SOME STRING"
	.size	.L.str, 31

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "DHRYSTONE PROGRAM, 1'ST STRING"
	.size	.L.str1, 31

	.type	Array2Glob,@object      # @Array2Glob
	.comm	Array2Glob,10404,16
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "DHRYSTONE PROGRAM, 2'ND STRING"
	.size	.L.str2, 31

	.type	BoolGlob,@object        # @BoolGlob
	.comm	BoolGlob,4,4
	.type	Array1Glob,@object      # @Array1Glob
	.comm	Array1Glob,204,16
	.type	Char2Glob,@object       # @Char2Glob
	.comm	Char2Glob,1,1
	.type	Char1Glob,@object       # @Char1Glob
	.comm	Char1Glob,1,1
	.type	IntGlob,@object         # @IntGlob
	.comm	IntGlob,4,4

	.section	".note.GNU-stack","",@progbits
