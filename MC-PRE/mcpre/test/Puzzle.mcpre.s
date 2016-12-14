	.file	"test/Puzzle.mcpre.bc"
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

	.globl	Fit
	.align	16, 0x90
	.type	Fit,@function
Fit:                                    # @Fit
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
	movslq	%edi, %rcx
	movq	%rcx, %rax
	shlq	$11, %rax
	leaq	p(%rax), %r8
	xorl	%edi, %edi
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rdi
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %eax
	cmpl	piecemax(,%rcx,4), %edi
	jg	.LBB2_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpl	$0, (%r8,%rdi,4)
	je	.LBB2_4
# BB#3:                                 # %if.then.split
                                        #   in Loop: Header=BB2_1 Depth=1
	leal	(%rsi,%rdi), %eax
	movslq	%eax, %rdx
	xorl	%eax, %eax
	cmpl	$0, puzzl(,%rdx,4)
	je	.LBB2_4
.LBB2_5:                                # %return
	popq	%rbp
	ret
.Ltmp17:
	.size	Fit, .Ltmp17-Fit
	.cfi_endproc

	.globl	Place
	.align	16, 0x90
	.type	Place,@function
Place:                                  # @Place
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
	movq	%rax, %rcx
	shlq	$11, %rcx
	leaq	p(%rcx), %rcx
	xorl	%edx, %edx
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	incq	%rdx
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	piecemax(,%rax,4), %edx
	jg	.LBB3_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, (%rcx,%rdx,4)
	je	.LBB3_4
# BB#3:                                 # %if.then.split
                                        #   in Loop: Header=BB3_1 Depth=1
	leal	(%rsi,%rdx), %edi
	movslq	%edi, %rdi
	movl	$1, puzzl(,%rdi,4)
	jmp	.LBB3_4
.LBB3_5:                                # %for.end
	movslq	class(,%rax,4), %rax
	decl	piececount(,%rax,4)
	movslq	%esi, %rcx
	xorl	%eax, %eax
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_10:                               # %for.inc23
                                        #   in Loop: Header=BB3_6 Depth=1
	incq	%rcx
.LBB3_6:                                # %for.cond15
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, %ecx              # imm = 0x1FF
	jg	.LBB3_9
# BB#7:                                 # %for.body17
                                        #   in Loop: Header=BB3_6 Depth=1
	cmpl	$0, puzzl(,%rcx,4)
	jne	.LBB3_10
# BB#8:                                 # %if.then21
	movl	%ecx, %eax
.LBB3_9:                                # %return
	popq	%rbp
	ret
.Ltmp23:
	.size	Place, .Ltmp23-Place
	.cfi_endproc

	.globl	Remove
	.align	16, 0x90
	.type	Remove,@function
Remove:                                 # @Remove
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
	movslq	%edi, %rax
	movq	%rax, %rcx
	shlq	$11, %rcx
	leaq	p(%rcx), %rcx
	xorl	%edx, %edx
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_4:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	incq	%rdx
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	piecemax(,%rax,4), %edx
	jg	.LBB4_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	cmpl	$0, (%rcx,%rdx,4)
	je	.LBB4_4
# BB#3:                                 # %if.then.split
                                        #   in Loop: Header=BB4_1 Depth=1
	leal	(%rsi,%rdx), %edi
	movslq	%edi, %rdi
	movl	$0, puzzl(,%rdi,4)
	jmp	.LBB4_4
.LBB4_5:                                # %for.end
	movslq	class(,%rax,4), %rax
	incl	piececount(,%rax,4)
	popq	%rbp
	ret
.Ltmp29:
	.size	Remove, .Ltmp29-Remove
	.cfi_endproc

	.globl	Trial
	.align	16, 0x90
	.type	Trial,@function
Trial:                                  # @Trial
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
	pushq	%rax
.Ltmp36:
	.cfi_offset %rbx, -40
.Ltmp37:
	.cfi_offset %r14, -32
.Ltmp38:
	.cfi_offset %r15, -24
	movl	%edi, %r14d
	incl	kount(%rip)
	xorl	%r15d, %r15d
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_7:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	incq	%r15
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	cmpl	$12, %r15d
	jg	.LBB5_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movslq	class(,%r15,4), %rax
	cmpl	$0, piececount(,%rax,4)
	je	.LBB5_7
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Fit
	testl	%eax, %eax
	je	.LBB5_7
# BB#4:                                 # %if.then4
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Place
	movl	%eax, %ebx
	movl	%ebx, %edi
	callq	Trial
	movl	%eax, %ecx
	movl	$1, %eax
	testl	%ecx, %ecx
	jne	.LBB5_8
# BB#5:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB5_1 Depth=1
	testl	%ebx, %ebx
	je	.LBB5_8
# BB#6:                                 # %if.else
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Remove
	jmp	.LBB5_7
.LBB5_8:                                # %return
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp39:
	.size	Trial, .Ltmp39-Trial
	.cfi_endproc

	.globl	Puzzle
	.align	16, 0x90
	.type	Puzzle,@function
Puzzle:                                 # @Puzzle
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
	xorl	%eax, %eax
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_115:                              # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$1, puzzl(,%rax,4)
	incq	%rax
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, %eax              # imm = 0x1FF
	jle	.LBB6_115
# BB#2:
	movl	$1, %r8d
	movl	$puzzl+292, %ecx
	jmp	.LBB6_3
	.align	16, 0x90
.LBB6_13:                               # %for.inc20
                                        #   in Loop: Header=BB6_3 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_3:                                # %for.cond1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
                                        #       Child Loop BB6_11 Depth 3
	movl	$1, %edx
	cmpl	$5, %r8d
	movq	%rcx, %rax
	jle	.LBB6_10
	jmp	.LBB6_4
	.align	16, 0x90
.LBB6_9:                                # %for.inc17
                                        #   in Loop: Header=BB6_10 Depth=2
	addq	$32, %rax
	incl	%edx
.LBB6_10:                               # %for.cond4
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_11 Depth 3
	xorl	%edi, %edi
	cmpl	$5, %edx
	movq	%rax, %rsi
	jg	.LBB6_13
	jmp	.LBB6_11
	.align	16, 0x90
.LBB6_12:                               # %for.body9
                                        #   in Loop: Header=BB6_11 Depth=3
	movl	$0, (%rsi)
	addq	$256, %rsi              # imm = 0x100
.LBB6_11:                               # %for.cond7
                                        #   Parent Loop BB6_3 Depth=1
                                        #     Parent Loop BB6_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$5, %edi
	jg	.LBB6_9
	jmp	.LBB6_12
.LBB6_4:
	xorl	%ecx, %ecx
	movl	$p, %edx
	jmp	.LBB6_5
	.align	16, 0x90
.LBB6_14:                               # %for.inc36
                                        #   in Loop: Header=BB6_5 Depth=1
	addq	$2048, %rdx             # imm = 0x800
	incl	%ecx
.LBB6_5:                                # %for.cond23
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_7 Depth 2
	xorl	%eax, %eax
	cmpl	$12, %ecx
	jg	.LBB6_15
# BB#6:                                 #   in Loop: Header=BB6_5 Depth=1
	movq	%rdx, %rsi
	jmp	.LBB6_7
	.align	16, 0x90
.LBB6_8:                                # %for.inc33
                                        #   in Loop: Header=BB6_7 Depth=2
	movl	$0, (%rsi)
	addq	$4, %rsi
	incl	%eax
.LBB6_7:                                # %for.cond26
                                        #   Parent Loop BB6_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$511, %eax              # imm = 0x1FF
	jg	.LBB6_14
	jmp	.LBB6_8
.LBB6_15:
	movl	$p, %r8d
	jmp	.LBB6_16
	.align	16, 0x90
.LBB6_21:                               # %for.inc60
                                        #   in Loop: Header=BB6_16 Depth=1
	addq	$4, %r8
	incl	%eax
.LBB6_16:                               # %for.cond39
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_17 Depth 2
                                        #       Child Loop BB6_18 Depth 3
	xorl	%edx, %edx
	cmpl	$3, %eax
	movq	%r8, %rcx
	jg	.LBB6_22
	jmp	.LBB6_17
	.align	16, 0x90
.LBB6_20:                               # %for.inc57
                                        #   in Loop: Header=BB6_17 Depth=2
	addq	$32, %rcx
	incl	%edx
.LBB6_17:                               # %for.cond42
                                        #   Parent Loop BB6_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_18 Depth 3
	movl	$-1, %edi
	cmpl	$1, %edx
	movq	%rcx, %rsi
	jg	.LBB6_21
	jmp	.LBB6_18
	.align	16, 0x90
.LBB6_19:                               # %for.body47
                                        #   in Loop: Header=BB6_18 Depth=3
	movl	$1, (%rsi)
	addq	$256, %rsi              # imm = 0x100
.LBB6_18:                               # %for.cond45
                                        #   Parent Loop BB6_16 Depth=1
                                        #     Parent Loop BB6_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	testl	%edi, %edi
	jg	.LBB6_20
	jmp	.LBB6_19
.LBB6_22:                               # %for.end62
	movl	$0, class(%rip)
	movl	$11, piecemax(%rip)
	xorl	%r8d, %r8d
	movl	$p+2048, %ecx
	jmp	.LBB6_23
	.align	16, 0x90
.LBB6_28:                               # %for.inc84
                                        #   in Loop: Header=BB6_23 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_23:                               # %for.cond63
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_24 Depth 2
                                        #       Child Loop BB6_25 Depth 3
	cmpl	$1, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_29
	jmp	.LBB6_24
	.align	16, 0x90
.LBB6_27:                               # %for.inc81
                                        #   in Loop: Header=BB6_24 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_24:                               # %for.cond66
                                        #   Parent Loop BB6_23 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_25 Depth 3
	movl	$-1, %edi
	testl	%esi, %esi
	movq	%rax, %rdx
	jg	.LBB6_28
	jmp	.LBB6_25
	.align	16, 0x90
.LBB6_26:                               # %for.body71
                                        #   in Loop: Header=BB6_25 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_25:                               # %for.cond69
                                        #   Parent Loop BB6_23 Depth=1
                                        #     Parent Loop BB6_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$3, %edi
	jg	.LBB6_27
	jmp	.LBB6_26
.LBB6_29:                               # %for.end86
	movl	$0, class+4(%rip)
	movl	$193, piecemax+4(%rip)
	xorl	%r8d, %r8d
	movl	$p+4096, %ecx
	jmp	.LBB6_30
	.align	16, 0x90
.LBB6_35:                               # %for.inc108
                                        #   in Loop: Header=BB6_30 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_30:                               # %for.cond87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_31 Depth 2
                                        #       Child Loop BB6_32 Depth 3
	testl	%r8d, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_36
	jmp	.LBB6_31
	.align	16, 0x90
.LBB6_34:                               # %for.inc105
                                        #   in Loop: Header=BB6_31 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_31:                               # %for.cond90
                                        #   Parent Loop BB6_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_32 Depth 3
	movl	$-1, %edi
	cmpl	$3, %esi
	movq	%rax, %rdx
	jg	.LBB6_35
	jmp	.LBB6_32
	.align	16, 0x90
.LBB6_33:                               # %for.body95
                                        #   in Loop: Header=BB6_32 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_32:                               # %for.cond93
                                        #   Parent Loop BB6_30 Depth=1
                                        #     Parent Loop BB6_31 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$1, %edi
	jg	.LBB6_34
	jmp	.LBB6_33
.LBB6_36:                               # %for.end110
	movl	$0, class+8(%rip)
	movl	$88, piecemax+8(%rip)
	xorl	%r8d, %r8d
	movl	$p+6144, %ecx
	jmp	.LBB6_37
	.align	16, 0x90
.LBB6_42:                               # %for.inc132
                                        #   in Loop: Header=BB6_37 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_37:                               # %for.cond111
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_38 Depth 2
                                        #       Child Loop BB6_39 Depth 3
	cmpl	$1, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_43
	jmp	.LBB6_38
	.align	16, 0x90
.LBB6_41:                               # %for.inc129
                                        #   in Loop: Header=BB6_38 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_38:                               # %for.cond114
                                        #   Parent Loop BB6_37 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_39 Depth 3
	movl	$-1, %edi
	cmpl	$3, %esi
	movq	%rax, %rdx
	jg	.LBB6_42
	jmp	.LBB6_39
	.align	16, 0x90
.LBB6_40:                               # %for.body119
                                        #   in Loop: Header=BB6_39 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_39:                               # %for.cond117
                                        #   Parent Loop BB6_37 Depth=1
                                        #     Parent Loop BB6_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	testl	%edi, %edi
	jg	.LBB6_41
	jmp	.LBB6_40
.LBB6_43:                               # %for.end134
	movl	$0, class+12(%rip)
	movl	$25, piecemax+12(%rip)
	xorl	%r8d, %r8d
	movl	$p+8192, %ecx
	jmp	.LBB6_44
	.align	16, 0x90
.LBB6_49:                               # %for.inc156
                                        #   in Loop: Header=BB6_44 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_44:                               # %for.cond135
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_45 Depth 2
                                        #       Child Loop BB6_46 Depth 3
	cmpl	$3, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_50
	jmp	.LBB6_45
	.align	16, 0x90
.LBB6_48:                               # %for.inc153
                                        #   in Loop: Header=BB6_45 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_45:                               # %for.cond138
                                        #   Parent Loop BB6_44 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_46 Depth 3
	movl	$-1, %edi
	testl	%esi, %esi
	movq	%rax, %rdx
	jg	.LBB6_49
	jmp	.LBB6_46
	.align	16, 0x90
.LBB6_47:                               # %for.body143
                                        #   in Loop: Header=BB6_46 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_46:                               # %for.cond141
                                        #   Parent Loop BB6_44 Depth=1
                                        #     Parent Loop BB6_45 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$1, %edi
	jg	.LBB6_48
	jmp	.LBB6_47
.LBB6_50:                               # %for.end158
	movl	$0, class+16(%rip)
	movl	$67, piecemax+16(%rip)
	xorl	%r8d, %r8d
	movl	$p+10240, %ecx
	jmp	.LBB6_51
	.align	16, 0x90
.LBB6_56:                               # %for.inc180
                                        #   in Loop: Header=BB6_51 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_51:                               # %for.cond159
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_52 Depth 2
                                        #       Child Loop BB6_53 Depth 3
	testl	%r8d, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_57
	jmp	.LBB6_52
	.align	16, 0x90
.LBB6_55:                               # %for.inc177
                                        #   in Loop: Header=BB6_52 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_52:                               # %for.cond162
                                        #   Parent Loop BB6_51 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_53 Depth 3
	movl	$-1, %edi
	cmpl	$1, %esi
	movq	%rax, %rdx
	jg	.LBB6_56
	jmp	.LBB6_53
	.align	16, 0x90
.LBB6_54:                               # %for.body167
                                        #   in Loop: Header=BB6_53 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_53:                               # %for.cond165
                                        #   Parent Loop BB6_51 Depth=1
                                        #     Parent Loop BB6_52 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$3, %edi
	jg	.LBB6_55
	jmp	.LBB6_54
.LBB6_57:                               # %for.end182
	movl	$0, class+20(%rip)
	movl	$200, piecemax+20(%rip)
	xorl	%r8d, %r8d
	movl	$p+12288, %ecx
	jmp	.LBB6_58
	.align	16, 0x90
.LBB6_63:                               # %for.inc204
                                        #   in Loop: Header=BB6_58 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_58:                               # %for.cond183
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_59 Depth 2
                                        #       Child Loop BB6_60 Depth 3
	cmpl	$2, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_64
	jmp	.LBB6_59
	.align	16, 0x90
.LBB6_62:                               # %for.inc201
                                        #   in Loop: Header=BB6_59 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_59:                               # %for.cond186
                                        #   Parent Loop BB6_58 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_60 Depth 3
	movl	$-1, %edi
	testl	%esi, %esi
	movq	%rax, %rdx
	jg	.LBB6_63
	jmp	.LBB6_60
	.align	16, 0x90
.LBB6_61:                               # %for.body191
                                        #   in Loop: Header=BB6_60 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_60:                               # %for.cond189
                                        #   Parent Loop BB6_58 Depth=1
                                        #     Parent Loop BB6_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	testl	%edi, %edi
	jg	.LBB6_62
	jmp	.LBB6_61
.LBB6_64:                               # %for.end206
	movl	$1, class+24(%rip)
	movl	$2, piecemax+24(%rip)
	xorl	%r8d, %r8d
	movl	$p+14336, %ecx
	jmp	.LBB6_65
	.align	16, 0x90
.LBB6_70:                               # %for.inc228
                                        #   in Loop: Header=BB6_65 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_65:                               # %for.cond207
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_66 Depth 2
                                        #       Child Loop BB6_67 Depth 3
	testl	%r8d, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_71
	jmp	.LBB6_66
	.align	16, 0x90
.LBB6_69:                               # %for.inc225
                                        #   in Loop: Header=BB6_66 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_66:                               # %for.cond210
                                        #   Parent Loop BB6_65 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_67 Depth 3
	movl	$-1, %edi
	cmpl	$2, %esi
	movq	%rax, %rdx
	jg	.LBB6_70
	jmp	.LBB6_67
	.align	16, 0x90
.LBB6_68:                               # %for.body215
                                        #   in Loop: Header=BB6_67 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_67:                               # %for.cond213
                                        #   Parent Loop BB6_65 Depth=1
                                        #     Parent Loop BB6_66 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	testl	%edi, %edi
	jg	.LBB6_69
	jmp	.LBB6_68
.LBB6_71:                               # %for.end230
	movl	$1, class+28(%rip)
	movl	$16, piecemax+28(%rip)
	xorl	%r8d, %r8d
	movl	$p+16384, %ecx
	jmp	.LBB6_72
	.align	16, 0x90
.LBB6_77:                               # %for.inc252
                                        #   in Loop: Header=BB6_72 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_72:                               # %for.cond231
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_73 Depth 2
                                        #       Child Loop BB6_74 Depth 3
	testl	%r8d, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_78
	jmp	.LBB6_73
	.align	16, 0x90
.LBB6_76:                               # %for.inc249
                                        #   in Loop: Header=BB6_73 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_73:                               # %for.cond234
                                        #   Parent Loop BB6_72 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_74 Depth 3
	movl	$-1, %edi
	testl	%esi, %esi
	movq	%rax, %rdx
	jg	.LBB6_77
	jmp	.LBB6_74
	.align	16, 0x90
.LBB6_75:                               # %for.body239
                                        #   in Loop: Header=BB6_74 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_74:                               # %for.cond237
                                        #   Parent Loop BB6_72 Depth=1
                                        #     Parent Loop BB6_73 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$2, %edi
	jg	.LBB6_76
	jmp	.LBB6_75
.LBB6_78:                               # %for.end254
	movl	$1, class+32(%rip)
	movl	$128, piecemax+32(%rip)
	xorl	%r8d, %r8d
	movl	$p+18432, %ecx
	jmp	.LBB6_79
	.align	16, 0x90
.LBB6_84:                               # %for.inc276
                                        #   in Loop: Header=BB6_79 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_79:                               # %for.cond255
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_80 Depth 2
                                        #       Child Loop BB6_81 Depth 3
	cmpl	$1, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_85
	jmp	.LBB6_80
	.align	16, 0x90
.LBB6_83:                               # %for.inc273
                                        #   in Loop: Header=BB6_80 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_80:                               # %for.cond258
                                        #   Parent Loop BB6_79 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_81 Depth 3
	movl	$-1, %edi
	cmpl	$1, %esi
	movq	%rax, %rdx
	jg	.LBB6_84
	jmp	.LBB6_81
	.align	16, 0x90
.LBB6_82:                               # %for.body263
                                        #   in Loop: Header=BB6_81 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_81:                               # %for.cond261
                                        #   Parent Loop BB6_79 Depth=1
                                        #     Parent Loop BB6_80 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	testl	%edi, %edi
	jg	.LBB6_83
	jmp	.LBB6_82
.LBB6_85:                               # %for.end278
	movl	$2, class+36(%rip)
	movl	$9, piecemax+36(%rip)
	xorl	%r8d, %r8d
	movl	$p+20480, %ecx
	jmp	.LBB6_86
	.align	16, 0x90
.LBB6_91:                               # %for.inc300
                                        #   in Loop: Header=BB6_86 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_86:                               # %for.cond279
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_87 Depth 2
                                        #       Child Loop BB6_88 Depth 3
	cmpl	$1, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_92
	jmp	.LBB6_87
	.align	16, 0x90
.LBB6_90:                               # %for.inc297
                                        #   in Loop: Header=BB6_87 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_87:                               # %for.cond282
                                        #   Parent Loop BB6_86 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_88 Depth 3
	movl	$-1, %edi
	testl	%esi, %esi
	movq	%rax, %rdx
	jg	.LBB6_91
	jmp	.LBB6_88
	.align	16, 0x90
.LBB6_89:                               # %for.body287
                                        #   in Loop: Header=BB6_88 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_88:                               # %for.cond285
                                        #   Parent Loop BB6_86 Depth=1
                                        #     Parent Loop BB6_87 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$1, %edi
	jg	.LBB6_90
	jmp	.LBB6_89
.LBB6_92:                               # %for.end302
	movl	$2, class+40(%rip)
	movl	$65, piecemax+40(%rip)
	xorl	%r8d, %r8d
	movl	$p+22528, %ecx
	jmp	.LBB6_93
	.align	16, 0x90
.LBB6_98:                               # %for.inc324
                                        #   in Loop: Header=BB6_93 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_93:                               # %for.cond303
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_94 Depth 2
                                        #       Child Loop BB6_95 Depth 3
	testl	%r8d, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_99
	jmp	.LBB6_94
	.align	16, 0x90
.LBB6_97:                               # %for.inc321
                                        #   in Loop: Header=BB6_94 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_94:                               # %for.cond306
                                        #   Parent Loop BB6_93 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_95 Depth 3
	movl	$-1, %edi
	cmpl	$1, %esi
	movq	%rax, %rdx
	jg	.LBB6_98
	jmp	.LBB6_95
	.align	16, 0x90
.LBB6_96:                               # %for.body311
                                        #   in Loop: Header=BB6_95 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_95:                               # %for.cond309
                                        #   Parent Loop BB6_93 Depth=1
                                        #     Parent Loop BB6_94 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$1, %edi
	jg	.LBB6_97
	jmp	.LBB6_96
.LBB6_99:                               # %for.end326
	movl	$2, class+44(%rip)
	movl	$72, piecemax+44(%rip)
	xorl	%r8d, %r8d
	movl	$p+24576, %ecx
	jmp	.LBB6_100
	.align	16, 0x90
.LBB6_105:                              # %for.inc348
                                        #   in Loop: Header=BB6_100 Depth=1
	addq	$4, %rcx
	incl	%r8d
.LBB6_100:                              # %for.cond327
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_101 Depth 2
                                        #       Child Loop BB6_102 Depth 3
	cmpl	$1, %r8d
	movq	%rcx, %rax
	movl	$0, %esi
	jg	.LBB6_106
	jmp	.LBB6_101
	.align	16, 0x90
.LBB6_104:                              # %for.inc345
                                        #   in Loop: Header=BB6_101 Depth=2
	addq	$32, %rax
	incl	%esi
.LBB6_101:                              # %for.cond330
                                        #   Parent Loop BB6_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_102 Depth 3
	movl	$-1, %edi
	cmpl	$1, %esi
	movq	%rax, %rdx
	jg	.LBB6_105
	jmp	.LBB6_102
	.align	16, 0x90
.LBB6_103:                              # %for.body335
                                        #   in Loop: Header=BB6_102 Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
.LBB6_102:                              # %for.cond333
                                        #   Parent Loop BB6_100 Depth=1
                                        #     Parent Loop BB6_101 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incl	%edi
	cmpl	$1, %edi
	jg	.LBB6_104
	jmp	.LBB6_103
.LBB6_106:                              # %for.end350
	movl	$3, class+48(%rip)
	movl	$73, piecemax+48(%rip)
	movl	$13, piececount(%rip)
	movl	$3, piececount+4(%rip)
	movl	$1, piececount+8(%rip)
	movl	$1, piececount+12(%rip)
	movl	$0, kount(%rip)
	xorl	%edi, %edi
	movl	$73, %esi
	callq	Fit
	testl	%eax, %eax
	je	.LBB6_108
# BB#107:                               # %if.then
	xorl	%edi, %edi
	movl	$73, %esi
	callq	Place
	movl	%eax, n(%rip)
	jmp	.LBB6_109
.LBB6_108:                              # %if.else
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
.LBB6_109:                              # %if.end
	movl	n(%rip), %edi
	callq	Trial
	testl	%eax, %eax
	je	.LBB6_110
# BB#111:                               # %if.else357
	cmpl	$2005, kount(%rip)      # imm = 0x7D5
	je	.LBB6_114
# BB#112:                               # %if.then359
	movl	$.L.str2, %edi
	jmp	.LBB6_113
.LBB6_110:                              # %if.then355
	movl	$.L.str1, %edi
.LBB6_113:                              # %if.then359
	xorb	%al, %al
	callq	printf
.LBB6_114:                              # %if.end362
	movl	n(%rip), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	kount(%rip), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	popq	%rbp
	ret
.Ltmp45:
	.size	Puzzle, .Ltmp45-Puzzle
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp49:
	.cfi_def_cfa_offset 16
.Ltmp50:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp51:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp52:
	.cfi_offset %rbx, -24
	movl	$-1, %ebx
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	callq	Puzzle
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%ebx
	cmpl	$99, %ebx
	jle	.LBB7_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp53:
	.size	main, .Ltmp53-main
	.cfi_endproc

	.type	seed,@object            # @seed
	.comm	seed,8,8
	.type	piecemax,@object        # @piecemax
	.comm	piecemax,52,16
	.type	p,@object               # @p
	.comm	p,26624,16
	.type	puzzl,@object           # @puzzl
	.comm	puzzl,2048,16
	.type	class,@object           # @class
	.comm	class,52,16
	.type	piececount,@object      # @piececount
	.comm	piececount,16,16
	.type	kount,@object           # @kount
	.comm	kount,4,4
	.type	n,@object               # @n
	.comm	n,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Error1 in Puzzle\n"
	.size	.L.str, 18

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "Error2 in Puzzle.\n"
	.size	.L.str1, 19

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Error3 in Puzzle.\n"
	.size	.L.str2, 19

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "%d\n"
	.size	.L.str3, 4

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
