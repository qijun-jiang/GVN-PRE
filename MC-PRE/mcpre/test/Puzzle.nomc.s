	.file	"test/Puzzle.nomc.bc"
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
	cmpl	$0, piecemax(,%rcx,4)
	js	.LBB2_5
# BB#1:                                 # %for.body.preheader
	movq	%rcx, %rax
	shlq	$11, %rax
	leaq	p(%rax), %r8
	xorl	%edi, %edi
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r8,%rdi,4)
	je	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=1
	leal	(%rsi,%rdi), %eax
	movslq	%eax, %rdx
	xorl	%eax, %eax
	cmpl	$0, puzzl(,%rdx,4)
	jne	.LBB2_6
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=1
	incq	%rdi
	cmpl	piecemax(,%rcx,4), %edi
	jle	.LBB2_2
.LBB2_5:
	movl	$1, %eax
.LBB2_6:                                # %return
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
	cmpl	$0, piecemax(,%rax,4)
	js	.LBB3_5
# BB#1:                                 # %for.body.preheader
	movq	%rax, %rcx
	shlq	$11, %rcx
	leaq	p(%rcx), %rcx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rcx,%rdx,4)
	je	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=1
	leal	(%rsi,%rdx), %edi
	movslq	%edi, %rdi
	movl	$1, puzzl(,%rdi,4)
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_2 Depth=1
	incq	%rdx
	cmpl	piecemax(,%rax,4), %edx
	jle	.LBB3_2
.LBB3_5:                                # %for.end
	movslq	class(,%rax,4), %rax
	decl	piececount(,%rax,4)
	xorl	%ecx, %ecx
	cmpl	$511, %esi              # imm = 0x1FF
	jg	.LBB3_9
# BB#6:                                 # %for.body17.preheader
	movslq	%esi, %rax
	.align	16, 0x90
.LBB3_7:                                # %for.body17
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, puzzl(,%rax,4)
	je	.LBB3_10
# BB#8:                                 # %for.inc23
                                        #   in Loop: Header=BB3_7 Depth=1
	incq	%rax
	cmpl	$512, %eax              # imm = 0x200
	jl	.LBB3_7
.LBB3_9:
	movl	%ecx, %eax
.LBB3_10:                               # %return
                                        # kill: EAX<def> EAX<kill> RAX<kill>
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
	cmpl	$0, piecemax(,%rax,4)
	js	.LBB4_5
# BB#1:                                 # %for.body.preheader
	movq	%rax, %rcx
	shlq	$11, %rcx
	leaq	p(%rcx), %rcx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rcx,%rdx,4)
	je	.LBB4_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB4_2 Depth=1
	leal	(%rsi,%rdx), %edi
	movslq	%edi, %rdi
	movl	$0, puzzl(,%rdi,4)
.LBB4_4:                                # %for.inc
                                        #   in Loop: Header=BB4_2 Depth=1
	incq	%rdx
	cmpl	piecemax(,%rax,4), %edx
	jle	.LBB4_2
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
	.align	16, 0x90
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movslq	class(,%r15,4), %rax
	cmpl	$0, piececount(,%rax,4)
	je	.LBB5_6
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Fit
	testl	%eax, %eax
	je	.LBB5_6
# BB#3:                                 # %if.then4
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
	jne	.LBB5_7
# BB#4:                                 # %if.then4
                                        #   in Loop: Header=BB5_1 Depth=1
	testl	%ebx, %ebx
	je	.LBB5_7
# BB#5:                                 # %if.else
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	callq	Remove
.LBB5_6:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	incq	%r15
	xorl	%eax, %eax
	cmpl	$13, %r15d
	jl	.LBB5_1
.LBB5_7:                                # %return
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
	.align	16, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, puzzl(,%rax,4)
	incq	%rax
	cmpl	$512, %eax              # imm = 0x200
	jl	.LBB6_1
# BB#2:
	movl	$1, %r8d
	movl	$puzzl+292, %ecx
	.align	16, 0x90
.LBB6_3:                                # %for.body3
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
                                        #       Child Loop BB6_5 Depth 3
	movl	$1, %edx
	movq	%rcx, %rsi
	.align	16, 0x90
.LBB6_4:                                # %for.body6
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_5 Depth 3
	movq	%rsi, %rdi
	movl	$1, %eax
	.align	16, 0x90
.LBB6_5:                                # %for.body9
                                        #   Parent Loop BB6_3 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdi)
	addq	$256, %rdi              # imm = 0x100
	incl	%eax
	cmpl	$6, %eax
	jl	.LBB6_5
# BB#6:                                 # %for.inc17
                                        #   in Loop: Header=BB6_4 Depth=2
	addq	$32, %rsi
	incl	%edx
	cmpl	$6, %edx
	jl	.LBB6_4
# BB#7:                                 # %for.inc20
                                        #   in Loop: Header=BB6_3 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$6, %r8d
	jl	.LBB6_3
# BB#8:
	xorl	%eax, %eax
	movl	$p, %ecx
	.align	16, 0x90
.LBB6_9:                                # %for.body25
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	xorl	%edx, %edx
	movq	%rcx, %rsi
	.align	16, 0x90
.LBB6_10:                               # %for.body28
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rsi)
	addq	$4, %rsi
	incl	%edx
	cmpl	$512, %edx              # imm = 0x200
	jl	.LBB6_10
# BB#11:                                # %for.inc36
                                        #   in Loop: Header=BB6_9 Depth=1
	addq	$2048, %rcx             # imm = 0x800
	incl	%eax
	cmpl	$13, %eax
	jl	.LBB6_9
# BB#12:
	xorl	%r8d, %r8d
	movl	$p, %ecx
	.align	16, 0x90
.LBB6_13:                               # %for.body41
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
                                        #       Child Loop BB6_15 Depth 3
	xorl	%edx, %edx
	movq	%rcx, %rsi
	.align	16, 0x90
.LBB6_14:                               # %for.body44
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_15 Depth 3
	movq	%rsi, %rdi
	xorl	%eax, %eax
	.align	16, 0x90
.LBB6_15:                               # %for.body47
                                        #   Parent Loop BB6_13 Depth=1
                                        #     Parent Loop BB6_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdi)
	addq	$256, %rdi              # imm = 0x100
	incl	%eax
	testl	%eax, %eax
	jle	.LBB6_15
# BB#16:                                # %for.inc57
                                        #   in Loop: Header=BB6_14 Depth=2
	addq	$32, %rsi
	incl	%edx
	cmpl	$2, %edx
	jl	.LBB6_14
# BB#17:                                # %for.inc60
                                        #   in Loop: Header=BB6_13 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$4, %r8d
	jl	.LBB6_13
# BB#18:                                # %for.end62
	movl	$0, class(%rip)
	movl	$11, piecemax(%rip)
	xorl	%r8d, %r8d
	movl	$p+2048, %ecx
	.align	16, 0x90
.LBB6_19:                               # %for.body65
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_20 Depth 2
                                        #       Child Loop BB6_21 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_20:                               # %for.body68
                                        #   Parent Loop BB6_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_21 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_21:                               # %for.body71
                                        #   Parent Loop BB6_19 Depth=1
                                        #     Parent Loop BB6_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$4, %edi
	jl	.LBB6_21
# BB#22:                                # %for.inc81
                                        #   in Loop: Header=BB6_20 Depth=2
	addq	$32, %rax
	incl	%esi
	testl	%esi, %esi
	jle	.LBB6_20
# BB#23:                                # %for.inc84
                                        #   in Loop: Header=BB6_19 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$2, %r8d
	jl	.LBB6_19
# BB#24:                                # %for.end86
	movl	$0, class+4(%rip)
	movl	$193, piecemax+4(%rip)
	xorl	%r8d, %r8d
	movl	$p+4096, %ecx
	.align	16, 0x90
.LBB6_25:                               # %for.body89
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_26 Depth 2
                                        #       Child Loop BB6_27 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_26:                               # %for.body92
                                        #   Parent Loop BB6_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_27 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_27:                               # %for.body95
                                        #   Parent Loop BB6_25 Depth=1
                                        #     Parent Loop BB6_26 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$2, %edi
	jl	.LBB6_27
# BB#28:                                # %for.inc105
                                        #   in Loop: Header=BB6_26 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$4, %esi
	jl	.LBB6_26
# BB#29:                                # %for.inc108
                                        #   in Loop: Header=BB6_25 Depth=1
	addq	$4, %rcx
	incl	%r8d
	testl	%r8d, %r8d
	jle	.LBB6_25
# BB#30:                                # %for.end110
	movl	$0, class+8(%rip)
	movl	$88, piecemax+8(%rip)
	xorl	%r8d, %r8d
	movl	$p+6144, %ecx
	.align	16, 0x90
.LBB6_31:                               # %for.body113
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_32 Depth 2
                                        #       Child Loop BB6_33 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_32:                               # %for.body116
                                        #   Parent Loop BB6_31 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_33 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_33:                               # %for.body119
                                        #   Parent Loop BB6_31 Depth=1
                                        #     Parent Loop BB6_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	testl	%edi, %edi
	jle	.LBB6_33
# BB#34:                                # %for.inc129
                                        #   in Loop: Header=BB6_32 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$4, %esi
	jl	.LBB6_32
# BB#35:                                # %for.inc132
                                        #   in Loop: Header=BB6_31 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$2, %r8d
	jl	.LBB6_31
# BB#36:                                # %for.end134
	movl	$0, class+12(%rip)
	movl	$25, piecemax+12(%rip)
	xorl	%r8d, %r8d
	movl	$p+8192, %ecx
	.align	16, 0x90
.LBB6_37:                               # %for.body137
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_38 Depth 2
                                        #       Child Loop BB6_39 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_38:                               # %for.body140
                                        #   Parent Loop BB6_37 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_39 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_39:                               # %for.body143
                                        #   Parent Loop BB6_37 Depth=1
                                        #     Parent Loop BB6_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$2, %edi
	jl	.LBB6_39
# BB#40:                                # %for.inc153
                                        #   in Loop: Header=BB6_38 Depth=2
	addq	$32, %rax
	incl	%esi
	testl	%esi, %esi
	jle	.LBB6_38
# BB#41:                                # %for.inc156
                                        #   in Loop: Header=BB6_37 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$4, %r8d
	jl	.LBB6_37
# BB#42:                                # %for.end158
	movl	$0, class+16(%rip)
	movl	$67, piecemax+16(%rip)
	xorl	%r8d, %r8d
	movl	$p+10240, %ecx
	.align	16, 0x90
.LBB6_43:                               # %for.body161
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
                                        #       Child Loop BB6_45 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_44:                               # %for.body164
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_45 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_45:                               # %for.body167
                                        #   Parent Loop BB6_43 Depth=1
                                        #     Parent Loop BB6_44 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$4, %edi
	jl	.LBB6_45
# BB#46:                                # %for.inc177
                                        #   in Loop: Header=BB6_44 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$2, %esi
	jl	.LBB6_44
# BB#47:                                # %for.inc180
                                        #   in Loop: Header=BB6_43 Depth=1
	addq	$4, %rcx
	incl	%r8d
	testl	%r8d, %r8d
	jle	.LBB6_43
# BB#48:                                # %for.end182
	movl	$0, class+20(%rip)
	movl	$200, piecemax+20(%rip)
	xorl	%r8d, %r8d
	movl	$p+12288, %ecx
	.align	16, 0x90
.LBB6_49:                               # %for.body185
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_50 Depth 2
                                        #       Child Loop BB6_51 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_50:                               # %for.body188
                                        #   Parent Loop BB6_49 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_51 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_51:                               # %for.body191
                                        #   Parent Loop BB6_49 Depth=1
                                        #     Parent Loop BB6_50 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	testl	%edi, %edi
	jle	.LBB6_51
# BB#52:                                # %for.inc201
                                        #   in Loop: Header=BB6_50 Depth=2
	addq	$32, %rax
	incl	%esi
	testl	%esi, %esi
	jle	.LBB6_50
# BB#53:                                # %for.inc204
                                        #   in Loop: Header=BB6_49 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$3, %r8d
	jl	.LBB6_49
# BB#54:                                # %for.end206
	movl	$1, class+24(%rip)
	movl	$2, piecemax+24(%rip)
	xorl	%r8d, %r8d
	movl	$p+14336, %ecx
	.align	16, 0x90
.LBB6_55:                               # %for.body209
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_56 Depth 2
                                        #       Child Loop BB6_57 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_56:                               # %for.body212
                                        #   Parent Loop BB6_55 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_57 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_57:                               # %for.body215
                                        #   Parent Loop BB6_55 Depth=1
                                        #     Parent Loop BB6_56 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	testl	%edi, %edi
	jle	.LBB6_57
# BB#58:                                # %for.inc225
                                        #   in Loop: Header=BB6_56 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$3, %esi
	jl	.LBB6_56
# BB#59:                                # %for.inc228
                                        #   in Loop: Header=BB6_55 Depth=1
	addq	$4, %rcx
	incl	%r8d
	testl	%r8d, %r8d
	jle	.LBB6_55
# BB#60:                                # %for.end230
	movl	$1, class+28(%rip)
	movl	$16, piecemax+28(%rip)
	xorl	%r8d, %r8d
	movl	$p+16384, %ecx
	.align	16, 0x90
.LBB6_61:                               # %for.body233
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_62 Depth 2
                                        #       Child Loop BB6_63 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_62:                               # %for.body236
                                        #   Parent Loop BB6_61 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_63 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_63:                               # %for.body239
                                        #   Parent Loop BB6_61 Depth=1
                                        #     Parent Loop BB6_62 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$3, %edi
	jl	.LBB6_63
# BB#64:                                # %for.inc249
                                        #   in Loop: Header=BB6_62 Depth=2
	addq	$32, %rax
	incl	%esi
	testl	%esi, %esi
	jle	.LBB6_62
# BB#65:                                # %for.inc252
                                        #   in Loop: Header=BB6_61 Depth=1
	addq	$4, %rcx
	incl	%r8d
	testl	%r8d, %r8d
	jle	.LBB6_61
# BB#66:                                # %for.end254
	movl	$1, class+32(%rip)
	movl	$128, piecemax+32(%rip)
	xorl	%r8d, %r8d
	movl	$p+18432, %ecx
	.align	16, 0x90
.LBB6_67:                               # %for.body257
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_68 Depth 2
                                        #       Child Loop BB6_69 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_68:                               # %for.body260
                                        #   Parent Loop BB6_67 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_69 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_69:                               # %for.body263
                                        #   Parent Loop BB6_67 Depth=1
                                        #     Parent Loop BB6_68 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	testl	%edi, %edi
	jle	.LBB6_69
# BB#70:                                # %for.inc273
                                        #   in Loop: Header=BB6_68 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$2, %esi
	jl	.LBB6_68
# BB#71:                                # %for.inc276
                                        #   in Loop: Header=BB6_67 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$2, %r8d
	jl	.LBB6_67
# BB#72:                                # %for.end278
	movl	$2, class+36(%rip)
	movl	$9, piecemax+36(%rip)
	xorl	%r8d, %r8d
	movl	$p+20480, %ecx
	.align	16, 0x90
.LBB6_73:                               # %for.body281
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_74 Depth 2
                                        #       Child Loop BB6_75 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_74:                               # %for.body284
                                        #   Parent Loop BB6_73 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_75 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_75:                               # %for.body287
                                        #   Parent Loop BB6_73 Depth=1
                                        #     Parent Loop BB6_74 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$2, %edi
	jl	.LBB6_75
# BB#76:                                # %for.inc297
                                        #   in Loop: Header=BB6_74 Depth=2
	addq	$32, %rax
	incl	%esi
	testl	%esi, %esi
	jle	.LBB6_74
# BB#77:                                # %for.inc300
                                        #   in Loop: Header=BB6_73 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$2, %r8d
	jl	.LBB6_73
# BB#78:                                # %for.end302
	movl	$2, class+40(%rip)
	movl	$65, piecemax+40(%rip)
	xorl	%r8d, %r8d
	movl	$p+22528, %ecx
	.align	16, 0x90
.LBB6_79:                               # %for.body305
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_80 Depth 2
                                        #       Child Loop BB6_81 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_80:                               # %for.body308
                                        #   Parent Loop BB6_79 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_81 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_81:                               # %for.body311
                                        #   Parent Loop BB6_79 Depth=1
                                        #     Parent Loop BB6_80 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$2, %edi
	jl	.LBB6_81
# BB#82:                                # %for.inc321
                                        #   in Loop: Header=BB6_80 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$2, %esi
	jl	.LBB6_80
# BB#83:                                # %for.inc324
                                        #   in Loop: Header=BB6_79 Depth=1
	addq	$4, %rcx
	incl	%r8d
	testl	%r8d, %r8d
	jle	.LBB6_79
# BB#84:                                # %for.end326
	movl	$2, class+44(%rip)
	movl	$72, piecemax+44(%rip)
	xorl	%r8d, %r8d
	movl	$p+24576, %ecx
	.align	16, 0x90
.LBB6_85:                               # %for.body329
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_86 Depth 2
                                        #       Child Loop BB6_87 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB6_86:                               # %for.body332
                                        #   Parent Loop BB6_85 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_87 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	.align	16, 0x90
.LBB6_87:                               # %for.body335
                                        #   Parent Loop BB6_85 Depth=1
                                        #     Parent Loop BB6_86 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$1, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	incl	%edi
	cmpl	$2, %edi
	jl	.LBB6_87
# BB#88:                                # %for.inc345
                                        #   in Loop: Header=BB6_86 Depth=2
	addq	$32, %rax
	incl	%esi
	cmpl	$2, %esi
	jl	.LBB6_86
# BB#89:                                # %for.inc348
                                        #   in Loop: Header=BB6_85 Depth=1
	addq	$4, %rcx
	incl	%r8d
	cmpl	$2, %r8d
	jl	.LBB6_85
# BB#90:                                # %for.end350
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
	je	.LBB6_92
# BB#91:                                # %if.then
	xorl	%edi, %edi
	movl	$73, %esi
	callq	Place
	movl	%eax, n(%rip)
	jmp	.LBB6_93
.LBB6_92:                               # %if.else
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
.LBB6_93:                               # %if.end
	movl	n(%rip), %edi
	callq	Trial
	testl	%eax, %eax
	je	.LBB6_94
# BB#95:                                # %if.else357
	cmpl	$2005, kount(%rip)      # imm = 0x7D5
	je	.LBB6_98
# BB#96:                                # %if.then359
	movl	$.L.str2, %edi
	jmp	.LBB6_97
.LBB6_94:                               # %if.then355
	movl	$.L.str1, %edi
.LBB6_97:                               # %if.then359
	xorb	%al, %al
	callq	printf
.LBB6_98:                               # %if.end362
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
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB7_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	Puzzle
	incl	%ebx
	cmpl	$100, %ebx
	jl	.LBB7_1
# BB#2:                                 # %for.end
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
