	.file	"test/Puzzle.bc"
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
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_5:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	-16(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB2_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movslq	-8(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB2_5
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	movslq	%eax, %rax
	cmpl	$0, puzzl(,%rax,4)
	je	.LBB2_5
# BB#4:                                 # %if.then8
	movl	$0, -4(%rbp)
	jmp	.LBB2_7
.LBB2_6:                                # %for.end
	movl	$1, -4(%rbp)
.LBB2_7:                                # %return
	movl	-4(%rbp), %eax
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
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	-16(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB3_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	-8(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, puzzl(,%rax,4)
	jmp	.LBB3_4
.LBB3_5:                                # %for.end
	movslq	-8(%rbp), %rax
	movslq	class(,%rax,4), %rax
	decl	piececount(,%rax,4)
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_9:                                # %for.inc23
                                        #   in Loop: Header=BB3_6 Depth=1
	incl	-16(%rbp)
.LBB3_6:                                # %for.cond15
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jg	.LBB3_10
# BB#7:                                 # %for.body17
                                        #   in Loop: Header=BB3_6 Depth=1
	movslq	-16(%rbp), %rax
	cmpl	$0, puzzl(,%rax,4)
	jne	.LBB3_9
# BB#8:                                 # %if.then21
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB3_11
.LBB3_10:                               # %for.end25
	movl	$0, -4(%rbp)
.LBB3_11:                               # %return
	movl	-4(%rbp), %eax
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_4:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	-12(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	-12(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB4_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movslq	-4(%rbp), %rax
	shlq	$11, %rax
	movslq	-12(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB4_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	movslq	%eax, %rax
	movl	$0, puzzl(,%rax,4)
	jmp	.LBB4_4
.LBB4_5:                                # %for.end
	movslq	-4(%rbp), %rax
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
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	incl	kount(%rip)
	movl	$0, -12(%rbp)
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_8:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	-12(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$12, -12(%rbp)
	jg	.LBB5_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movslq	-12(%rbp), %rax
	movslq	class(,%rax,4), %rax
	cmpl	$0, piececount(,%rax,4)
	je	.LBB5_8
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Fit
	testl	%eax, %eax
	je	.LBB5_8
# BB#4:                                 # %if.then4
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Place
	movl	%eax, -16(%rbp)
	movl	%eax, %edi
	callq	Trial
	testl	%eax, %eax
	jne	.LBB5_6
# BB#5:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB5_1 Depth=1
	cmpl	$0, -16(%rbp)
	je	.LBB5_6
# BB#7:                                 # %if.else
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Remove
	jmp	.LBB5_8
.LBB5_9:                                # %for.end
	movl	$0, -4(%rbp)
	jmp	.LBB5_10
.LBB5_6:                                # %if.then9
	movl	$1, -4(%rbp)
.LBB5_10:                               # %return
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp35:
	.size	Trial, .Ltmp35-Trial
	.cfi_endproc

	.globl	Puzzle
	.align	16, 0x90
	.type	Puzzle,@function
Puzzle:                                 # @Puzzle
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
	movl	$0, -16(%rbp)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	movslq	-16(%rbp), %rax
	movl	$1, puzzl(,%rax,4)
	incl	-16(%rbp)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jle	.LBB6_2
# BB#3:                                 # %for.end
	movl	$1, -4(%rbp)
	jmp	.LBB6_4
	.align	16, 0x90
.LBB6_11:                               # %for.inc20
                                        #   in Loop: Header=BB6_4 Depth=1
	incl	-4(%rbp)
.LBB6_4:                                # %for.cond1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_6 Depth 2
                                        #       Child Loop BB6_8 Depth 3
	cmpl	$5, -4(%rbp)
	jg	.LBB6_12
# BB#5:                                 # %for.body3
                                        #   in Loop: Header=BB6_4 Depth=1
	movl	$1, -8(%rbp)
	jmp	.LBB6_6
	.align	16, 0x90
.LBB6_10:                               # %for.inc17
                                        #   in Loop: Header=BB6_6 Depth=2
	incl	-8(%rbp)
.LBB6_6:                                # %for.cond4
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
	cmpl	$5, -8(%rbp)
	jg	.LBB6_11
# BB#7:                                 # %for.body6
                                        #   in Loop: Header=BB6_6 Depth=2
	movl	$1, -12(%rbp)
	jmp	.LBB6_8
	.align	16, 0x90
.LBB6_9:                                # %for.inc14
                                        #   in Loop: Header=BB6_8 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$0, puzzl(,%rax,4)
	incl	-12(%rbp)
.LBB6_8:                                # %for.cond7
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$5, -12(%rbp)
	jg	.LBB6_10
	jmp	.LBB6_9
.LBB6_12:                               # %for.end22
	movl	$0, -4(%rbp)
	jmp	.LBB6_13
	.align	16, 0x90
.LBB6_17:                               # %for.inc36
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	-4(%rbp)
.LBB6_13:                               # %for.cond23
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_15 Depth 2
	cmpl	$12, -4(%rbp)
	jg	.LBB6_18
# BB#14:                                # %for.body25
                                        #   in Loop: Header=BB6_13 Depth=1
	movl	$0, -16(%rbp)
	jmp	.LBB6_15
	.align	16, 0x90
.LBB6_16:                               # %for.inc33
                                        #   in Loop: Header=BB6_15 Depth=2
	movslq	-4(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	movl	$0, p(%rax,%rcx,4)
	incl	-16(%rbp)
.LBB6_15:                               # %for.cond26
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jg	.LBB6_17
	jmp	.LBB6_16
.LBB6_18:                               # %for.end38
	movl	$0, -4(%rbp)
	jmp	.LBB6_19
	.align	16, 0x90
.LBB6_26:                               # %for.inc60
                                        #   in Loop: Header=BB6_19 Depth=1
	incl	-4(%rbp)
.LBB6_19:                               # %for.cond39
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_21 Depth 2
                                        #       Child Loop BB6_23 Depth 3
	cmpl	$3, -4(%rbp)
	jg	.LBB6_27
# BB#20:                                # %for.body41
                                        #   in Loop: Header=BB6_19 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_21
	.align	16, 0x90
.LBB6_25:                               # %for.inc57
                                        #   in Loop: Header=BB6_21 Depth=2
	incl	-8(%rbp)
.LBB6_21:                               # %for.cond42
                                        #   Parent Loop BB6_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_23 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_26
# BB#22:                                # %for.body44
                                        #   in Loop: Header=BB6_21 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_23
	.align	16, 0x90
.LBB6_24:                               # %for.inc54
                                        #   in Loop: Header=BB6_23 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p(,%rax,4)
	incl	-12(%rbp)
.LBB6_23:                               # %for.cond45
                                        #   Parent Loop BB6_19 Depth=1
                                        #     Parent Loop BB6_21 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_25
	jmp	.LBB6_24
.LBB6_27:                               # %for.end62
	movl	$0, class(%rip)
	movl	$11, piecemax(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_28
	.align	16, 0x90
.LBB6_35:                               # %for.inc84
                                        #   in Loop: Header=BB6_28 Depth=1
	incl	-4(%rbp)
.LBB6_28:                               # %for.cond63
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_30 Depth 2
                                        #       Child Loop BB6_32 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_36
# BB#29:                                # %for.body65
                                        #   in Loop: Header=BB6_28 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_30
	.align	16, 0x90
.LBB6_34:                               # %for.inc81
                                        #   in Loop: Header=BB6_30 Depth=2
	incl	-8(%rbp)
.LBB6_30:                               # %for.cond66
                                        #   Parent Loop BB6_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_32 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_35
# BB#31:                                # %for.body68
                                        #   in Loop: Header=BB6_30 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_32
	.align	16, 0x90
.LBB6_33:                               # %for.inc78
                                        #   in Loop: Header=BB6_32 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+2048(,%rax,4)
	incl	-12(%rbp)
.LBB6_32:                               # %for.cond69
                                        #   Parent Loop BB6_28 Depth=1
                                        #     Parent Loop BB6_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$3, -12(%rbp)
	jg	.LBB6_34
	jmp	.LBB6_33
.LBB6_36:                               # %for.end86
	movl	$0, class+4(%rip)
	movl	$193, piecemax+4(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_37
	.align	16, 0x90
.LBB6_44:                               # %for.inc108
                                        #   in Loop: Header=BB6_37 Depth=1
	incl	-4(%rbp)
.LBB6_37:                               # %for.cond87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_39 Depth 2
                                        #       Child Loop BB6_41 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_45
# BB#38:                                # %for.body89
                                        #   in Loop: Header=BB6_37 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_39
	.align	16, 0x90
.LBB6_43:                               # %for.inc105
                                        #   in Loop: Header=BB6_39 Depth=2
	incl	-8(%rbp)
.LBB6_39:                               # %for.cond90
                                        #   Parent Loop BB6_37 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_41 Depth 3
	cmpl	$3, -8(%rbp)
	jg	.LBB6_44
# BB#40:                                # %for.body92
                                        #   in Loop: Header=BB6_39 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_41
	.align	16, 0x90
.LBB6_42:                               # %for.inc102
                                        #   in Loop: Header=BB6_41 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+4096(,%rax,4)
	incl	-12(%rbp)
.LBB6_41:                               # %for.cond93
                                        #   Parent Loop BB6_37 Depth=1
                                        #     Parent Loop BB6_39 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_43
	jmp	.LBB6_42
.LBB6_45:                               # %for.end110
	movl	$0, class+8(%rip)
	movl	$88, piecemax+8(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_46
	.align	16, 0x90
.LBB6_53:                               # %for.inc132
                                        #   in Loop: Header=BB6_46 Depth=1
	incl	-4(%rbp)
.LBB6_46:                               # %for.cond111
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_48 Depth 2
                                        #       Child Loop BB6_50 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_54
# BB#47:                                # %for.body113
                                        #   in Loop: Header=BB6_46 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_48
	.align	16, 0x90
.LBB6_52:                               # %for.inc129
                                        #   in Loop: Header=BB6_48 Depth=2
	incl	-8(%rbp)
.LBB6_48:                               # %for.cond114
                                        #   Parent Loop BB6_46 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_50 Depth 3
	cmpl	$3, -8(%rbp)
	jg	.LBB6_53
# BB#49:                                # %for.body116
                                        #   in Loop: Header=BB6_48 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_50
	.align	16, 0x90
.LBB6_51:                               # %for.inc126
                                        #   in Loop: Header=BB6_50 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+6144(,%rax,4)
	incl	-12(%rbp)
.LBB6_50:                               # %for.cond117
                                        #   Parent Loop BB6_46 Depth=1
                                        #     Parent Loop BB6_48 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_52
	jmp	.LBB6_51
.LBB6_54:                               # %for.end134
	movl	$0, class+12(%rip)
	movl	$25, piecemax+12(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_55
	.align	16, 0x90
.LBB6_62:                               # %for.inc156
                                        #   in Loop: Header=BB6_55 Depth=1
	incl	-4(%rbp)
.LBB6_55:                               # %for.cond135
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_57 Depth 2
                                        #       Child Loop BB6_59 Depth 3
	cmpl	$3, -4(%rbp)
	jg	.LBB6_63
# BB#56:                                # %for.body137
                                        #   in Loop: Header=BB6_55 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_57
	.align	16, 0x90
.LBB6_61:                               # %for.inc153
                                        #   in Loop: Header=BB6_57 Depth=2
	incl	-8(%rbp)
.LBB6_57:                               # %for.cond138
                                        #   Parent Loop BB6_55 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_59 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_62
# BB#58:                                # %for.body140
                                        #   in Loop: Header=BB6_57 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_59
	.align	16, 0x90
.LBB6_60:                               # %for.inc150
                                        #   in Loop: Header=BB6_59 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+8192(,%rax,4)
	incl	-12(%rbp)
.LBB6_59:                               # %for.cond141
                                        #   Parent Loop BB6_55 Depth=1
                                        #     Parent Loop BB6_57 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_61
	jmp	.LBB6_60
.LBB6_63:                               # %for.end158
	movl	$0, class+16(%rip)
	movl	$67, piecemax+16(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_64
	.align	16, 0x90
.LBB6_71:                               # %for.inc180
                                        #   in Loop: Header=BB6_64 Depth=1
	incl	-4(%rbp)
.LBB6_64:                               # %for.cond159
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_66 Depth 2
                                        #       Child Loop BB6_68 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_72
# BB#65:                                # %for.body161
                                        #   in Loop: Header=BB6_64 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_66
	.align	16, 0x90
.LBB6_70:                               # %for.inc177
                                        #   in Loop: Header=BB6_66 Depth=2
	incl	-8(%rbp)
.LBB6_66:                               # %for.cond162
                                        #   Parent Loop BB6_64 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_68 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_71
# BB#67:                                # %for.body164
                                        #   in Loop: Header=BB6_66 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_68
	.align	16, 0x90
.LBB6_69:                               # %for.inc174
                                        #   in Loop: Header=BB6_68 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+10240(,%rax,4)
	incl	-12(%rbp)
.LBB6_68:                               # %for.cond165
                                        #   Parent Loop BB6_64 Depth=1
                                        #     Parent Loop BB6_66 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$3, -12(%rbp)
	jg	.LBB6_70
	jmp	.LBB6_69
.LBB6_72:                               # %for.end182
	movl	$0, class+20(%rip)
	movl	$200, piecemax+20(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_73
	.align	16, 0x90
.LBB6_80:                               # %for.inc204
                                        #   in Loop: Header=BB6_73 Depth=1
	incl	-4(%rbp)
.LBB6_73:                               # %for.cond183
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_75 Depth 2
                                        #       Child Loop BB6_77 Depth 3
	cmpl	$2, -4(%rbp)
	jg	.LBB6_81
# BB#74:                                # %for.body185
                                        #   in Loop: Header=BB6_73 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_75
	.align	16, 0x90
.LBB6_79:                               # %for.inc201
                                        #   in Loop: Header=BB6_75 Depth=2
	incl	-8(%rbp)
.LBB6_75:                               # %for.cond186
                                        #   Parent Loop BB6_73 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_77 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_80
# BB#76:                                # %for.body188
                                        #   in Loop: Header=BB6_75 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_77
	.align	16, 0x90
.LBB6_78:                               # %for.inc198
                                        #   in Loop: Header=BB6_77 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+12288(,%rax,4)
	incl	-12(%rbp)
.LBB6_77:                               # %for.cond189
                                        #   Parent Loop BB6_73 Depth=1
                                        #     Parent Loop BB6_75 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_79
	jmp	.LBB6_78
.LBB6_81:                               # %for.end206
	movl	$1, class+24(%rip)
	movl	$2, piecemax+24(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_82
	.align	16, 0x90
.LBB6_89:                               # %for.inc228
                                        #   in Loop: Header=BB6_82 Depth=1
	incl	-4(%rbp)
.LBB6_82:                               # %for.cond207
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_84 Depth 2
                                        #       Child Loop BB6_86 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_90
# BB#83:                                # %for.body209
                                        #   in Loop: Header=BB6_82 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_84
	.align	16, 0x90
.LBB6_88:                               # %for.inc225
                                        #   in Loop: Header=BB6_84 Depth=2
	incl	-8(%rbp)
.LBB6_84:                               # %for.cond210
                                        #   Parent Loop BB6_82 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_86 Depth 3
	cmpl	$2, -8(%rbp)
	jg	.LBB6_89
# BB#85:                                # %for.body212
                                        #   in Loop: Header=BB6_84 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_86
	.align	16, 0x90
.LBB6_87:                               # %for.inc222
                                        #   in Loop: Header=BB6_86 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+14336(,%rax,4)
	incl	-12(%rbp)
.LBB6_86:                               # %for.cond213
                                        #   Parent Loop BB6_82 Depth=1
                                        #     Parent Loop BB6_84 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_88
	jmp	.LBB6_87
.LBB6_90:                               # %for.end230
	movl	$1, class+28(%rip)
	movl	$16, piecemax+28(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_91
	.align	16, 0x90
.LBB6_98:                               # %for.inc252
                                        #   in Loop: Header=BB6_91 Depth=1
	incl	-4(%rbp)
.LBB6_91:                               # %for.cond231
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_93 Depth 2
                                        #       Child Loop BB6_95 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_99
# BB#92:                                # %for.body233
                                        #   in Loop: Header=BB6_91 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_93
	.align	16, 0x90
.LBB6_97:                               # %for.inc249
                                        #   in Loop: Header=BB6_93 Depth=2
	incl	-8(%rbp)
.LBB6_93:                               # %for.cond234
                                        #   Parent Loop BB6_91 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_95 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_98
# BB#94:                                # %for.body236
                                        #   in Loop: Header=BB6_93 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_95
	.align	16, 0x90
.LBB6_96:                               # %for.inc246
                                        #   in Loop: Header=BB6_95 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+16384(,%rax,4)
	incl	-12(%rbp)
.LBB6_95:                               # %for.cond237
                                        #   Parent Loop BB6_91 Depth=1
                                        #     Parent Loop BB6_93 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$2, -12(%rbp)
	jg	.LBB6_97
	jmp	.LBB6_96
.LBB6_99:                               # %for.end254
	movl	$1, class+32(%rip)
	movl	$128, piecemax+32(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_100
	.align	16, 0x90
.LBB6_107:                              # %for.inc276
                                        #   in Loop: Header=BB6_100 Depth=1
	incl	-4(%rbp)
.LBB6_100:                              # %for.cond255
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_102 Depth 2
                                        #       Child Loop BB6_104 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_108
# BB#101:                               # %for.body257
                                        #   in Loop: Header=BB6_100 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_102
	.align	16, 0x90
.LBB6_106:                              # %for.inc273
                                        #   in Loop: Header=BB6_102 Depth=2
	incl	-8(%rbp)
.LBB6_102:                              # %for.cond258
                                        #   Parent Loop BB6_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_104 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_107
# BB#103:                               # %for.body260
                                        #   in Loop: Header=BB6_102 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_104
	.align	16, 0x90
.LBB6_105:                              # %for.inc270
                                        #   in Loop: Header=BB6_104 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+18432(,%rax,4)
	incl	-12(%rbp)
.LBB6_104:                              # %for.cond261
                                        #   Parent Loop BB6_100 Depth=1
                                        #     Parent Loop BB6_102 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_106
	jmp	.LBB6_105
.LBB6_108:                              # %for.end278
	movl	$2, class+36(%rip)
	movl	$9, piecemax+36(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_109
	.align	16, 0x90
.LBB6_116:                              # %for.inc300
                                        #   in Loop: Header=BB6_109 Depth=1
	incl	-4(%rbp)
.LBB6_109:                              # %for.cond279
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_111 Depth 2
                                        #       Child Loop BB6_113 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_117
# BB#110:                               # %for.body281
                                        #   in Loop: Header=BB6_109 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_111
	.align	16, 0x90
.LBB6_115:                              # %for.inc297
                                        #   in Loop: Header=BB6_111 Depth=2
	incl	-8(%rbp)
.LBB6_111:                              # %for.cond282
                                        #   Parent Loop BB6_109 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_113 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_116
# BB#112:                               # %for.body284
                                        #   in Loop: Header=BB6_111 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_113
	.align	16, 0x90
.LBB6_114:                              # %for.inc294
                                        #   in Loop: Header=BB6_113 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+20480(,%rax,4)
	incl	-12(%rbp)
.LBB6_113:                              # %for.cond285
                                        #   Parent Loop BB6_109 Depth=1
                                        #     Parent Loop BB6_111 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_115
	jmp	.LBB6_114
.LBB6_117:                              # %for.end302
	movl	$2, class+40(%rip)
	movl	$65, piecemax+40(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_118
	.align	16, 0x90
.LBB6_125:                              # %for.inc324
                                        #   in Loop: Header=BB6_118 Depth=1
	incl	-4(%rbp)
.LBB6_118:                              # %for.cond303
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_120 Depth 2
                                        #       Child Loop BB6_122 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_126
# BB#119:                               # %for.body305
                                        #   in Loop: Header=BB6_118 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_120
	.align	16, 0x90
.LBB6_124:                              # %for.inc321
                                        #   in Loop: Header=BB6_120 Depth=2
	incl	-8(%rbp)
.LBB6_120:                              # %for.cond306
                                        #   Parent Loop BB6_118 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_122 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_125
# BB#121:                               # %for.body308
                                        #   in Loop: Header=BB6_120 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_122
	.align	16, 0x90
.LBB6_123:                              # %for.inc318
                                        #   in Loop: Header=BB6_122 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+22528(,%rax,4)
	incl	-12(%rbp)
.LBB6_122:                              # %for.cond309
                                        #   Parent Loop BB6_118 Depth=1
                                        #     Parent Loop BB6_120 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_124
	jmp	.LBB6_123
.LBB6_126:                              # %for.end326
	movl	$2, class+44(%rip)
	movl	$72, piecemax+44(%rip)
	movl	$0, -4(%rbp)
	jmp	.LBB6_127
	.align	16, 0x90
.LBB6_134:                              # %for.inc348
                                        #   in Loop: Header=BB6_127 Depth=1
	incl	-4(%rbp)
.LBB6_127:                              # %for.cond327
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_129 Depth 2
                                        #       Child Loop BB6_131 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_135
# BB#128:                               # %for.body329
                                        #   in Loop: Header=BB6_127 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB6_129
	.align	16, 0x90
.LBB6_133:                              # %for.inc345
                                        #   in Loop: Header=BB6_129 Depth=2
	incl	-8(%rbp)
.LBB6_129:                              # %for.cond330
                                        #   Parent Loop BB6_127 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_131 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_134
# BB#130:                               # %for.body332
                                        #   in Loop: Header=BB6_129 Depth=2
	movl	$0, -12(%rbp)
	jmp	.LBB6_131
	.align	16, 0x90
.LBB6_132:                              # %for.inc342
                                        #   in Loop: Header=BB6_131 Depth=3
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+24576(,%rax,4)
	incl	-12(%rbp)
.LBB6_131:                              # %for.cond333
                                        #   Parent Loop BB6_127 Depth=1
                                        #     Parent Loop BB6_129 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_133
	jmp	.LBB6_132
.LBB6_135:                              # %for.end350
	movl	$3, class+48(%rip)
	movl	$73, piecemax+48(%rip)
	movl	$13, piececount(%rip)
	movl	$3, piececount+4(%rip)
	movl	$1, piececount+8(%rip)
	movl	$1, piececount+12(%rip)
	movl	$73, -16(%rbp)
	movl	$0, kount(%rip)
	movl	-16(%rbp), %esi
	xorl	%edi, %edi
	callq	Fit
	testl	%eax, %eax
	je	.LBB6_137
# BB#136:                               # %if.then
	movl	-16(%rbp), %esi
	xorl	%edi, %edi
	callq	Place
	movl	%eax, n(%rip)
	jmp	.LBB6_138
.LBB6_137:                              # %if.else
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
.LBB6_138:                              # %if.end
	movl	n(%rip), %edi
	callq	Trial
	testl	%eax, %eax
	je	.LBB6_139
# BB#140:                               # %if.else357
	cmpl	$2005, kount(%rip)      # imm = 0x7D5
	je	.LBB6_143
# BB#141:                               # %if.then359
	movl	$.L.str2, %edi
	jmp	.LBB6_142
.LBB6_139:                              # %if.then355
	movl	$.L.str1, %edi
.LBB6_142:                              # %if.then359
	xorb	%al, %al
	callq	printf
.LBB6_143:                              # %if.end362
	movl	n(%rip), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	kount(%rip), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp41:
	.size	Puzzle, .Ltmp41-Puzzle
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	callq	Puzzle
	incl	-8(%rbp)
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB7_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp47:
	.size	main, .Ltmp47-main
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
