	.file	"test/Puzzle.profile.ls.bc"
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
	incl	EdgeProfCounters+8(%rip)
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	incl	EdgeProfCounters+12(%rip)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_7:                                # %if.end9
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+48(%rip)
	incl	-16(%rbp)
	incl	EdgeProfCounters+52(%rip)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB2_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+16(%rip)
	movslq	-8(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB2_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	movl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	movslq	%eax, %rax
	cmpl	$0, puzzl(,%rax,4)
	jne	.LBB2_5
# BB#6:                                 # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+36(%rip)
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_3:                                # %for.body.if.end9_crit_edge
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+28(%rip)
	jmp	.LBB2_7
.LBB2_8:                                # %for.end
	incl	EdgeProfCounters+20(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB2_9
.LBB2_5:                                # %if.then8
	incl	EdgeProfCounters+32(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+40(%rip)
.LBB2_9:                                # %return
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
	incl	EdgeProfCounters+60(%rip)
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_5:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+88(%rip)
	incl	-16(%rbp)
	incl	EdgeProfCounters+92(%rip)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB3_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+68(%rip)
	movslq	-8(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB3_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+76(%rip)
	movl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, puzzl(,%rax,4)
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB3_5
	.align	16, 0x90
.LBB3_3:                                # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+80(%rip)
	jmp	.LBB3_5
.LBB3_6:                                # %for.end
	incl	EdgeProfCounters+72(%rip)
	movslq	-8(%rbp), %rax
	movslq	class(,%rax,4), %rax
	decl	piececount(,%rax,4)
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	incl	EdgeProfCounters+96(%rip)
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_10:                               # %if.end22
                                        #   in Loop: Header=BB3_7 Depth=1
	incl	EdgeProfCounters+108(%rip)
	incl	EdgeProfCounters+120(%rip)
	incl	-16(%rbp)
	incl	EdgeProfCounters+124(%rip)
.LBB3_7:                                # %for.cond15
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jg	.LBB3_11
# BB#8:                                 # %for.body17
                                        #   in Loop: Header=BB3_7 Depth=1
	incl	EdgeProfCounters+100(%rip)
	movslq	-16(%rbp), %rax
	cmpl	$0, puzzl(,%rax,4)
	jne	.LBB3_10
# BB#9:                                 # %if.then21
	incl	EdgeProfCounters+112(%rip)
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
	incl	EdgeProfCounters+116(%rip)
	jmp	.LBB3_12
.LBB3_11:                               # %for.end25
	incl	EdgeProfCounters+104(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+128(%rip)
.LBB3_12:                               # %return
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
	incl	EdgeProfCounters+132(%rip)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+136(%rip)
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_5:                                # %if.end
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	EdgeProfCounters+160(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+164(%rip)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	-12(%rbp), %ecx
	cmpl	piecemax(,%rax,4), %ecx
	jg	.LBB4_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	EdgeProfCounters+140(%rip)
	movslq	-4(%rbp), %rax
	shlq	$11, %rax
	movslq	-12(%rbp), %rcx
	cmpl	$0, p(%rax,%rcx,4)
	je	.LBB4_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	EdgeProfCounters+148(%rip)
	movl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	movslq	%eax, %rax
	movl	$0, puzzl(,%rax,4)
	incl	EdgeProfCounters+156(%rip)
	jmp	.LBB4_5
	.align	16, 0x90
.LBB4_3:                                # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	EdgeProfCounters+152(%rip)
	jmp	.LBB4_5
.LBB4_6:                                # %for.end
	incl	EdgeProfCounters+144(%rip)
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
	incl	EdgeProfCounters+168(%rip)
	movl	%edi, -8(%rbp)
	incl	kount(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+172(%rip)
	jmp	.LBB5_1
	.align	16, 0x90
.LBB5_13:                               # %if.end11
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+232(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+236(%rip)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$12, -12(%rbp)
	jg	.LBB5_14
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+176(%rip)
	movslq	-12(%rbp), %rax
	movslq	class(,%rax,4), %rax
	cmpl	$0, piececount(,%rax,4)
	je	.LBB5_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+184(%rip)
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Fit
	testl	%eax, %eax
	je	.LBB5_5
# BB#6:                                 # %if.then4
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+192(%rip)
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Place
	movl	%eax, -16(%rbp)
	movl	%eax, %edi
	callq	Trial
	testl	%eax, %eax
	jne	.LBB5_7
# BB#8:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+204(%rip)
	cmpl	$0, -16(%rbp)
	je	.LBB5_9
# BB#11:                                # %if.else
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+212(%rip)
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edi
	callq	Remove
	incl	EdgeProfCounters+220(%rip)
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB5_12
	.align	16, 0x90
.LBB5_3:                                # %for.body.if.end11_crit_edge
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB5_13
	.align	16, 0x90
.LBB5_5:                                # %if.then.if.end10_crit_edge
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+196(%rip)
.LBB5_12:                               # %if.end10
                                        #   in Loop: Header=BB5_1 Depth=1
	incl	EdgeProfCounters+228(%rip)
	jmp	.LBB5_13
.LBB5_14:                               # %for.end
	incl	EdgeProfCounters+180(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+240(%rip)
	jmp	.LBB5_15
.LBB5_7:                                # %if.then4.if.then9_crit_edge
	incl	EdgeProfCounters+200(%rip)
	jmp	.LBB5_10
.LBB5_9:                                # %lor.lhs.false.if.then9_crit_edge
	incl	EdgeProfCounters+208(%rip)
.LBB5_10:                               # %if.then9
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+216(%rip)
.LBB5_15:                               # %return
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
	incl	EdgeProfCounters+244(%rip)
	movl	$0, -16(%rbp)
	incl	EdgeProfCounters+248(%rip)
	jmp	.LBB6_1
	.align	16, 0x90
.LBB6_2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	incl	EdgeProfCounters+252(%rip)
	movslq	-16(%rbp), %rax
	movl	$1, puzzl(,%rax,4)
	incl	EdgeProfCounters+260(%rip)
	incl	-16(%rbp)
	incl	EdgeProfCounters+264(%rip)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jle	.LBB6_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+256(%rip)
	movl	$1, -4(%rbp)
	incl	EdgeProfCounters+268(%rip)
	jmp	.LBB6_4
	.align	16, 0x90
.LBB6_11:                               # %for.end19
                                        #   in Loop: Header=BB6_4 Depth=1
	incl	EdgeProfCounters+288(%rip)
	incl	EdgeProfCounters+320(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+324(%rip)
.LBB6_4:                                # %for.cond1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_6 Depth 2
                                        #       Child Loop BB6_8 Depth 3
	cmpl	$5, -4(%rbp)
	jg	.LBB6_12
# BB#5:                                 # %for.body3
                                        #   in Loop: Header=BB6_4 Depth=1
	incl	EdgeProfCounters+272(%rip)
	movl	$1, -8(%rbp)
	incl	EdgeProfCounters+280(%rip)
	jmp	.LBB6_6
	.align	16, 0x90
.LBB6_10:                               # %for.end16
                                        #   in Loop: Header=BB6_6 Depth=2
	incl	EdgeProfCounters+300(%rip)
	incl	EdgeProfCounters+312(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+316(%rip)
.LBB6_6:                                # %for.cond4
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
	cmpl	$5, -8(%rbp)
	jg	.LBB6_11
# BB#7:                                 # %for.body6
                                        #   in Loop: Header=BB6_6 Depth=2
	incl	EdgeProfCounters+284(%rip)
	movl	$1, -12(%rbp)
	incl	EdgeProfCounters+292(%rip)
	jmp	.LBB6_8
	.align	16, 0x90
.LBB6_9:                                # %for.body9
                                        #   in Loop: Header=BB6_8 Depth=3
	incl	EdgeProfCounters+296(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$0, puzzl(,%rax,4)
	incl	EdgeProfCounters+304(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+308(%rip)
.LBB6_8:                                # %for.cond7
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$5, -12(%rbp)
	jg	.LBB6_10
	jmp	.LBB6_9
.LBB6_12:                               # %for.end22
	incl	EdgeProfCounters+276(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+328(%rip)
	jmp	.LBB6_13
	.align	16, 0x90
.LBB6_17:                               # %for.end35
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	EdgeProfCounters+348(%rip)
	incl	EdgeProfCounters+360(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+364(%rip)
.LBB6_13:                               # %for.cond23
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_15 Depth 2
	cmpl	$12, -4(%rbp)
	jg	.LBB6_18
# BB#14:                                # %for.body25
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	EdgeProfCounters+332(%rip)
	movl	$0, -16(%rbp)
	incl	EdgeProfCounters+340(%rip)
	jmp	.LBB6_15
	.align	16, 0x90
.LBB6_16:                               # %for.body28
                                        #   in Loop: Header=BB6_15 Depth=2
	incl	EdgeProfCounters+344(%rip)
	movslq	-4(%rbp), %rax
	shlq	$11, %rax
	movslq	-16(%rbp), %rcx
	movl	$0, p(%rax,%rcx,4)
	incl	EdgeProfCounters+352(%rip)
	incl	-16(%rbp)
	incl	EdgeProfCounters+356(%rip)
.LBB6_15:                               # %for.cond26
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$511, -16(%rbp)         # imm = 0x1FF
	jg	.LBB6_17
	jmp	.LBB6_16
.LBB6_18:                               # %for.end38
	incl	EdgeProfCounters+336(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+368(%rip)
	jmp	.LBB6_19
	.align	16, 0x90
.LBB6_26:                               # %for.end59
                                        #   in Loop: Header=BB6_19 Depth=1
	incl	EdgeProfCounters+388(%rip)
	incl	EdgeProfCounters+420(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+424(%rip)
.LBB6_19:                               # %for.cond39
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_21 Depth 2
                                        #       Child Loop BB6_23 Depth 3
	cmpl	$3, -4(%rbp)
	jg	.LBB6_27
# BB#20:                                # %for.body41
                                        #   in Loop: Header=BB6_19 Depth=1
	incl	EdgeProfCounters+372(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+380(%rip)
	jmp	.LBB6_21
	.align	16, 0x90
.LBB6_25:                               # %for.end56
                                        #   in Loop: Header=BB6_21 Depth=2
	incl	EdgeProfCounters+400(%rip)
	incl	EdgeProfCounters+412(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+416(%rip)
.LBB6_21:                               # %for.cond42
                                        #   Parent Loop BB6_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_23 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_26
# BB#22:                                # %for.body44
                                        #   in Loop: Header=BB6_21 Depth=2
	incl	EdgeProfCounters+384(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+392(%rip)
	jmp	.LBB6_23
	.align	16, 0x90
.LBB6_24:                               # %for.body47
                                        #   in Loop: Header=BB6_23 Depth=3
	incl	EdgeProfCounters+396(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p(,%rax,4)
	incl	EdgeProfCounters+404(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+408(%rip)
.LBB6_23:                               # %for.cond45
                                        #   Parent Loop BB6_19 Depth=1
                                        #     Parent Loop BB6_21 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_25
	jmp	.LBB6_24
.LBB6_27:                               # %for.end62
	incl	EdgeProfCounters+376(%rip)
	movl	$0, class(%rip)
	movl	$11, piecemax(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+428(%rip)
	jmp	.LBB6_28
	.align	16, 0x90
.LBB6_35:                               # %for.end83
                                        #   in Loop: Header=BB6_28 Depth=1
	incl	EdgeProfCounters+448(%rip)
	incl	EdgeProfCounters+480(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+484(%rip)
.LBB6_28:                               # %for.cond63
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_30 Depth 2
                                        #       Child Loop BB6_32 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_36
# BB#29:                                # %for.body65
                                        #   in Loop: Header=BB6_28 Depth=1
	incl	EdgeProfCounters+432(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+440(%rip)
	jmp	.LBB6_30
	.align	16, 0x90
.LBB6_34:                               # %for.end80
                                        #   in Loop: Header=BB6_30 Depth=2
	incl	EdgeProfCounters+460(%rip)
	incl	EdgeProfCounters+472(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+476(%rip)
.LBB6_30:                               # %for.cond66
                                        #   Parent Loop BB6_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_32 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_35
# BB#31:                                # %for.body68
                                        #   in Loop: Header=BB6_30 Depth=2
	incl	EdgeProfCounters+444(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+452(%rip)
	jmp	.LBB6_32
	.align	16, 0x90
.LBB6_33:                               # %for.body71
                                        #   in Loop: Header=BB6_32 Depth=3
	incl	EdgeProfCounters+456(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+2048(,%rax,4)
	incl	EdgeProfCounters+464(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+468(%rip)
.LBB6_32:                               # %for.cond69
                                        #   Parent Loop BB6_28 Depth=1
                                        #     Parent Loop BB6_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$3, -12(%rbp)
	jg	.LBB6_34
	jmp	.LBB6_33
.LBB6_36:                               # %for.end86
	incl	EdgeProfCounters+436(%rip)
	movl	$0, class+4(%rip)
	movl	$193, piecemax+4(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+488(%rip)
	jmp	.LBB6_37
	.align	16, 0x90
.LBB6_44:                               # %for.end107
                                        #   in Loop: Header=BB6_37 Depth=1
	incl	EdgeProfCounters+508(%rip)
	incl	EdgeProfCounters+540(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+544(%rip)
.LBB6_37:                               # %for.cond87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_39 Depth 2
                                        #       Child Loop BB6_41 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_45
# BB#38:                                # %for.body89
                                        #   in Loop: Header=BB6_37 Depth=1
	incl	EdgeProfCounters+492(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+500(%rip)
	jmp	.LBB6_39
	.align	16, 0x90
.LBB6_43:                               # %for.end104
                                        #   in Loop: Header=BB6_39 Depth=2
	incl	EdgeProfCounters+520(%rip)
	incl	EdgeProfCounters+532(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+536(%rip)
.LBB6_39:                               # %for.cond90
                                        #   Parent Loop BB6_37 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_41 Depth 3
	cmpl	$3, -8(%rbp)
	jg	.LBB6_44
# BB#40:                                # %for.body92
                                        #   in Loop: Header=BB6_39 Depth=2
	incl	EdgeProfCounters+504(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+512(%rip)
	jmp	.LBB6_41
	.align	16, 0x90
.LBB6_42:                               # %for.body95
                                        #   in Loop: Header=BB6_41 Depth=3
	incl	EdgeProfCounters+516(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+4096(,%rax,4)
	incl	EdgeProfCounters+524(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+528(%rip)
.LBB6_41:                               # %for.cond93
                                        #   Parent Loop BB6_37 Depth=1
                                        #     Parent Loop BB6_39 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_43
	jmp	.LBB6_42
.LBB6_45:                               # %for.end110
	incl	EdgeProfCounters+496(%rip)
	movl	$0, class+8(%rip)
	movl	$88, piecemax+8(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+548(%rip)
	jmp	.LBB6_46
	.align	16, 0x90
.LBB6_53:                               # %for.end131
                                        #   in Loop: Header=BB6_46 Depth=1
	incl	EdgeProfCounters+568(%rip)
	incl	EdgeProfCounters+600(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+604(%rip)
.LBB6_46:                               # %for.cond111
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_48 Depth 2
                                        #       Child Loop BB6_50 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_54
# BB#47:                                # %for.body113
                                        #   in Loop: Header=BB6_46 Depth=1
	incl	EdgeProfCounters+552(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+560(%rip)
	jmp	.LBB6_48
	.align	16, 0x90
.LBB6_52:                               # %for.end128
                                        #   in Loop: Header=BB6_48 Depth=2
	incl	EdgeProfCounters+580(%rip)
	incl	EdgeProfCounters+592(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+596(%rip)
.LBB6_48:                               # %for.cond114
                                        #   Parent Loop BB6_46 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_50 Depth 3
	cmpl	$3, -8(%rbp)
	jg	.LBB6_53
# BB#49:                                # %for.body116
                                        #   in Loop: Header=BB6_48 Depth=2
	incl	EdgeProfCounters+564(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+572(%rip)
	jmp	.LBB6_50
	.align	16, 0x90
.LBB6_51:                               # %for.body119
                                        #   in Loop: Header=BB6_50 Depth=3
	incl	EdgeProfCounters+576(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+6144(,%rax,4)
	incl	EdgeProfCounters+584(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+588(%rip)
.LBB6_50:                               # %for.cond117
                                        #   Parent Loop BB6_46 Depth=1
                                        #     Parent Loop BB6_48 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_52
	jmp	.LBB6_51
.LBB6_54:                               # %for.end134
	incl	EdgeProfCounters+556(%rip)
	movl	$0, class+12(%rip)
	movl	$25, piecemax+12(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+608(%rip)
	jmp	.LBB6_55
	.align	16, 0x90
.LBB6_62:                               # %for.end155
                                        #   in Loop: Header=BB6_55 Depth=1
	incl	EdgeProfCounters+628(%rip)
	incl	EdgeProfCounters+660(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+664(%rip)
.LBB6_55:                               # %for.cond135
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_57 Depth 2
                                        #       Child Loop BB6_59 Depth 3
	cmpl	$3, -4(%rbp)
	jg	.LBB6_63
# BB#56:                                # %for.body137
                                        #   in Loop: Header=BB6_55 Depth=1
	incl	EdgeProfCounters+612(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+620(%rip)
	jmp	.LBB6_57
	.align	16, 0x90
.LBB6_61:                               # %for.end152
                                        #   in Loop: Header=BB6_57 Depth=2
	incl	EdgeProfCounters+640(%rip)
	incl	EdgeProfCounters+652(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+656(%rip)
.LBB6_57:                               # %for.cond138
                                        #   Parent Loop BB6_55 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_59 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_62
# BB#58:                                # %for.body140
                                        #   in Loop: Header=BB6_57 Depth=2
	incl	EdgeProfCounters+624(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+632(%rip)
	jmp	.LBB6_59
	.align	16, 0x90
.LBB6_60:                               # %for.body143
                                        #   in Loop: Header=BB6_59 Depth=3
	incl	EdgeProfCounters+636(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+8192(,%rax,4)
	incl	EdgeProfCounters+644(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+648(%rip)
.LBB6_59:                               # %for.cond141
                                        #   Parent Loop BB6_55 Depth=1
                                        #     Parent Loop BB6_57 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_61
	jmp	.LBB6_60
.LBB6_63:                               # %for.end158
	incl	EdgeProfCounters+616(%rip)
	movl	$0, class+16(%rip)
	movl	$67, piecemax+16(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+668(%rip)
	jmp	.LBB6_64
	.align	16, 0x90
.LBB6_71:                               # %for.end179
                                        #   in Loop: Header=BB6_64 Depth=1
	incl	EdgeProfCounters+688(%rip)
	incl	EdgeProfCounters+720(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+724(%rip)
.LBB6_64:                               # %for.cond159
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_66 Depth 2
                                        #       Child Loop BB6_68 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_72
# BB#65:                                # %for.body161
                                        #   in Loop: Header=BB6_64 Depth=1
	incl	EdgeProfCounters+672(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+680(%rip)
	jmp	.LBB6_66
	.align	16, 0x90
.LBB6_70:                               # %for.end176
                                        #   in Loop: Header=BB6_66 Depth=2
	incl	EdgeProfCounters+700(%rip)
	incl	EdgeProfCounters+712(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+716(%rip)
.LBB6_66:                               # %for.cond162
                                        #   Parent Loop BB6_64 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_68 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_71
# BB#67:                                # %for.body164
                                        #   in Loop: Header=BB6_66 Depth=2
	incl	EdgeProfCounters+684(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+692(%rip)
	jmp	.LBB6_68
	.align	16, 0x90
.LBB6_69:                               # %for.body167
                                        #   in Loop: Header=BB6_68 Depth=3
	incl	EdgeProfCounters+696(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+10240(,%rax,4)
	incl	EdgeProfCounters+704(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+708(%rip)
.LBB6_68:                               # %for.cond165
                                        #   Parent Loop BB6_64 Depth=1
                                        #     Parent Loop BB6_66 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$3, -12(%rbp)
	jg	.LBB6_70
	jmp	.LBB6_69
.LBB6_72:                               # %for.end182
	incl	EdgeProfCounters+676(%rip)
	movl	$0, class+20(%rip)
	movl	$200, piecemax+20(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+728(%rip)
	jmp	.LBB6_73
	.align	16, 0x90
.LBB6_80:                               # %for.end203
                                        #   in Loop: Header=BB6_73 Depth=1
	incl	EdgeProfCounters+748(%rip)
	incl	EdgeProfCounters+780(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+784(%rip)
.LBB6_73:                               # %for.cond183
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_75 Depth 2
                                        #       Child Loop BB6_77 Depth 3
	cmpl	$2, -4(%rbp)
	jg	.LBB6_81
# BB#74:                                # %for.body185
                                        #   in Loop: Header=BB6_73 Depth=1
	incl	EdgeProfCounters+732(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+740(%rip)
	jmp	.LBB6_75
	.align	16, 0x90
.LBB6_79:                               # %for.end200
                                        #   in Loop: Header=BB6_75 Depth=2
	incl	EdgeProfCounters+760(%rip)
	incl	EdgeProfCounters+772(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+776(%rip)
.LBB6_75:                               # %for.cond186
                                        #   Parent Loop BB6_73 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_77 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_80
# BB#76:                                # %for.body188
                                        #   in Loop: Header=BB6_75 Depth=2
	incl	EdgeProfCounters+744(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+752(%rip)
	jmp	.LBB6_77
	.align	16, 0x90
.LBB6_78:                               # %for.body191
                                        #   in Loop: Header=BB6_77 Depth=3
	incl	EdgeProfCounters+756(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+12288(,%rax,4)
	incl	EdgeProfCounters+764(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+768(%rip)
.LBB6_77:                               # %for.cond189
                                        #   Parent Loop BB6_73 Depth=1
                                        #     Parent Loop BB6_75 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_79
	jmp	.LBB6_78
.LBB6_81:                               # %for.end206
	incl	EdgeProfCounters+736(%rip)
	movl	$1, class+24(%rip)
	movl	$2, piecemax+24(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+788(%rip)
	jmp	.LBB6_82
	.align	16, 0x90
.LBB6_89:                               # %for.end227
                                        #   in Loop: Header=BB6_82 Depth=1
	incl	EdgeProfCounters+808(%rip)
	incl	EdgeProfCounters+840(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+844(%rip)
.LBB6_82:                               # %for.cond207
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_84 Depth 2
                                        #       Child Loop BB6_86 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_90
# BB#83:                                # %for.body209
                                        #   in Loop: Header=BB6_82 Depth=1
	incl	EdgeProfCounters+792(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+800(%rip)
	jmp	.LBB6_84
	.align	16, 0x90
.LBB6_88:                               # %for.end224
                                        #   in Loop: Header=BB6_84 Depth=2
	incl	EdgeProfCounters+820(%rip)
	incl	EdgeProfCounters+832(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+836(%rip)
.LBB6_84:                               # %for.cond210
                                        #   Parent Loop BB6_82 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_86 Depth 3
	cmpl	$2, -8(%rbp)
	jg	.LBB6_89
# BB#85:                                # %for.body212
                                        #   in Loop: Header=BB6_84 Depth=2
	incl	EdgeProfCounters+804(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+812(%rip)
	jmp	.LBB6_86
	.align	16, 0x90
.LBB6_87:                               # %for.body215
                                        #   in Loop: Header=BB6_86 Depth=3
	incl	EdgeProfCounters+816(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+14336(,%rax,4)
	incl	EdgeProfCounters+824(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+828(%rip)
.LBB6_86:                               # %for.cond213
                                        #   Parent Loop BB6_82 Depth=1
                                        #     Parent Loop BB6_84 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_88
	jmp	.LBB6_87
.LBB6_90:                               # %for.end230
	incl	EdgeProfCounters+796(%rip)
	movl	$1, class+28(%rip)
	movl	$16, piecemax+28(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+848(%rip)
	jmp	.LBB6_91
	.align	16, 0x90
.LBB6_98:                               # %for.end251
                                        #   in Loop: Header=BB6_91 Depth=1
	incl	EdgeProfCounters+868(%rip)
	incl	EdgeProfCounters+900(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+904(%rip)
.LBB6_91:                               # %for.cond231
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_93 Depth 2
                                        #       Child Loop BB6_95 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_99
# BB#92:                                # %for.body233
                                        #   in Loop: Header=BB6_91 Depth=1
	incl	EdgeProfCounters+852(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+860(%rip)
	jmp	.LBB6_93
	.align	16, 0x90
.LBB6_97:                               # %for.end248
                                        #   in Loop: Header=BB6_93 Depth=2
	incl	EdgeProfCounters+880(%rip)
	incl	EdgeProfCounters+892(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+896(%rip)
.LBB6_93:                               # %for.cond234
                                        #   Parent Loop BB6_91 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_95 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_98
# BB#94:                                # %for.body236
                                        #   in Loop: Header=BB6_93 Depth=2
	incl	EdgeProfCounters+864(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+872(%rip)
	jmp	.LBB6_95
	.align	16, 0x90
.LBB6_96:                               # %for.body239
                                        #   in Loop: Header=BB6_95 Depth=3
	incl	EdgeProfCounters+876(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+16384(,%rax,4)
	incl	EdgeProfCounters+884(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+888(%rip)
.LBB6_95:                               # %for.cond237
                                        #   Parent Loop BB6_91 Depth=1
                                        #     Parent Loop BB6_93 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$2, -12(%rbp)
	jg	.LBB6_97
	jmp	.LBB6_96
.LBB6_99:                               # %for.end254
	incl	EdgeProfCounters+856(%rip)
	movl	$1, class+32(%rip)
	movl	$128, piecemax+32(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+908(%rip)
	jmp	.LBB6_100
	.align	16, 0x90
.LBB6_107:                              # %for.end275
                                        #   in Loop: Header=BB6_100 Depth=1
	incl	EdgeProfCounters+928(%rip)
	incl	EdgeProfCounters+960(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+964(%rip)
.LBB6_100:                              # %for.cond255
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_102 Depth 2
                                        #       Child Loop BB6_104 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_108
# BB#101:                               # %for.body257
                                        #   in Loop: Header=BB6_100 Depth=1
	incl	EdgeProfCounters+912(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+920(%rip)
	jmp	.LBB6_102
	.align	16, 0x90
.LBB6_106:                              # %for.end272
                                        #   in Loop: Header=BB6_102 Depth=2
	incl	EdgeProfCounters+940(%rip)
	incl	EdgeProfCounters+952(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+956(%rip)
.LBB6_102:                              # %for.cond258
                                        #   Parent Loop BB6_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_104 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_107
# BB#103:                               # %for.body260
                                        #   in Loop: Header=BB6_102 Depth=2
	incl	EdgeProfCounters+924(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+932(%rip)
	jmp	.LBB6_104
	.align	16, 0x90
.LBB6_105:                              # %for.body263
                                        #   in Loop: Header=BB6_104 Depth=3
	incl	EdgeProfCounters+936(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+18432(,%rax,4)
	incl	EdgeProfCounters+944(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+948(%rip)
.LBB6_104:                              # %for.cond261
                                        #   Parent Loop BB6_100 Depth=1
                                        #     Parent Loop BB6_102 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -12(%rbp)
	jg	.LBB6_106
	jmp	.LBB6_105
.LBB6_108:                              # %for.end278
	incl	EdgeProfCounters+916(%rip)
	movl	$2, class+36(%rip)
	movl	$9, piecemax+36(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+968(%rip)
	jmp	.LBB6_109
	.align	16, 0x90
.LBB6_116:                              # %for.end299
                                        #   in Loop: Header=BB6_109 Depth=1
	incl	EdgeProfCounters+988(%rip)
	incl	EdgeProfCounters+1020(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+1024(%rip)
.LBB6_109:                              # %for.cond279
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_111 Depth 2
                                        #       Child Loop BB6_113 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_117
# BB#110:                               # %for.body281
                                        #   in Loop: Header=BB6_109 Depth=1
	incl	EdgeProfCounters+972(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+980(%rip)
	jmp	.LBB6_111
	.align	16, 0x90
.LBB6_115:                              # %for.end296
                                        #   in Loop: Header=BB6_111 Depth=2
	incl	EdgeProfCounters+1000(%rip)
	incl	EdgeProfCounters+1012(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+1016(%rip)
.LBB6_111:                              # %for.cond282
                                        #   Parent Loop BB6_109 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_113 Depth 3
	cmpl	$0, -8(%rbp)
	jg	.LBB6_116
# BB#112:                               # %for.body284
                                        #   in Loop: Header=BB6_111 Depth=2
	incl	EdgeProfCounters+984(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+992(%rip)
	jmp	.LBB6_113
	.align	16, 0x90
.LBB6_114:                              # %for.body287
                                        #   in Loop: Header=BB6_113 Depth=3
	incl	EdgeProfCounters+996(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+20480(,%rax,4)
	incl	EdgeProfCounters+1004(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+1008(%rip)
.LBB6_113:                              # %for.cond285
                                        #   Parent Loop BB6_109 Depth=1
                                        #     Parent Loop BB6_111 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_115
	jmp	.LBB6_114
.LBB6_117:                              # %for.end302
	incl	EdgeProfCounters+976(%rip)
	movl	$2, class+40(%rip)
	movl	$65, piecemax+40(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+1028(%rip)
	jmp	.LBB6_118
	.align	16, 0x90
.LBB6_125:                              # %for.end323
                                        #   in Loop: Header=BB6_118 Depth=1
	incl	EdgeProfCounters+1048(%rip)
	incl	EdgeProfCounters+1080(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+1084(%rip)
.LBB6_118:                              # %for.cond303
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_120 Depth 2
                                        #       Child Loop BB6_122 Depth 3
	cmpl	$0, -4(%rbp)
	jg	.LBB6_126
# BB#119:                               # %for.body305
                                        #   in Loop: Header=BB6_118 Depth=1
	incl	EdgeProfCounters+1032(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+1040(%rip)
	jmp	.LBB6_120
	.align	16, 0x90
.LBB6_124:                              # %for.end320
                                        #   in Loop: Header=BB6_120 Depth=2
	incl	EdgeProfCounters+1060(%rip)
	incl	EdgeProfCounters+1072(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+1076(%rip)
.LBB6_120:                              # %for.cond306
                                        #   Parent Loop BB6_118 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_122 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_125
# BB#121:                               # %for.body308
                                        #   in Loop: Header=BB6_120 Depth=2
	incl	EdgeProfCounters+1044(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+1052(%rip)
	jmp	.LBB6_122
	.align	16, 0x90
.LBB6_123:                              # %for.body311
                                        #   in Loop: Header=BB6_122 Depth=3
	incl	EdgeProfCounters+1056(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+22528(,%rax,4)
	incl	EdgeProfCounters+1064(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+1068(%rip)
.LBB6_122:                              # %for.cond309
                                        #   Parent Loop BB6_118 Depth=1
                                        #     Parent Loop BB6_120 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_124
	jmp	.LBB6_123
.LBB6_126:                              # %for.end326
	incl	EdgeProfCounters+1036(%rip)
	movl	$2, class+44(%rip)
	movl	$72, piecemax+44(%rip)
	movl	$0, -4(%rbp)
	incl	EdgeProfCounters+1088(%rip)
	jmp	.LBB6_127
	.align	16, 0x90
.LBB6_134:                              # %for.end347
                                        #   in Loop: Header=BB6_127 Depth=1
	incl	EdgeProfCounters+1108(%rip)
	incl	EdgeProfCounters+1140(%rip)
	incl	-4(%rbp)
	incl	EdgeProfCounters+1144(%rip)
.LBB6_127:                              # %for.cond327
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_129 Depth 2
                                        #       Child Loop BB6_131 Depth 3
	cmpl	$1, -4(%rbp)
	jg	.LBB6_135
# BB#128:                               # %for.body329
                                        #   in Loop: Header=BB6_127 Depth=1
	incl	EdgeProfCounters+1092(%rip)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+1100(%rip)
	jmp	.LBB6_129
	.align	16, 0x90
.LBB6_133:                              # %for.end344
                                        #   in Loop: Header=BB6_129 Depth=2
	incl	EdgeProfCounters+1120(%rip)
	incl	EdgeProfCounters+1132(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+1136(%rip)
.LBB6_129:                              # %for.cond330
                                        #   Parent Loop BB6_127 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_131 Depth 3
	cmpl	$1, -8(%rbp)
	jg	.LBB6_134
# BB#130:                               # %for.body332
                                        #   in Loop: Header=BB6_129 Depth=2
	incl	EdgeProfCounters+1104(%rip)
	movl	$0, -12(%rbp)
	incl	EdgeProfCounters+1112(%rip)
	jmp	.LBB6_131
	.align	16, 0x90
.LBB6_132:                              # %for.body335
                                        #   in Loop: Header=BB6_131 Depth=3
	incl	EdgeProfCounters+1116(%rip)
	movl	-12(%rbp), %eax
	shll	$3, %eax
	addl	-8(%rbp), %eax
	shll	$3, %eax
	addl	-4(%rbp), %eax
	movslq	%eax, %rax
	movl	$1, p+24576(,%rax,4)
	incl	EdgeProfCounters+1124(%rip)
	incl	-12(%rbp)
	incl	EdgeProfCounters+1128(%rip)
.LBB6_131:                              # %for.cond333
                                        #   Parent Loop BB6_127 Depth=1
                                        #     Parent Loop BB6_129 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1, -12(%rbp)
	jg	.LBB6_133
	jmp	.LBB6_132
.LBB6_135:                              # %for.end350
	incl	EdgeProfCounters+1096(%rip)
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
	incl	EdgeProfCounters+1148(%rip)
	movl	-16(%rbp), %esi
	xorl	%edi, %edi
	callq	Place
	movl	%eax, n(%rip)
	incl	EdgeProfCounters+1156(%rip)
	jmp	.LBB6_138
.LBB6_137:                              # %if.else
	incl	EdgeProfCounters+1152(%rip)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+1160(%rip)
.LBB6_138:                              # %if.end
	movl	n(%rip), %edi
	callq	Trial
	testl	%eax, %eax
	je	.LBB6_139
# BB#140:                               # %if.else357
	incl	EdgeProfCounters+1164(%rip)
	cmpl	$2005, kount(%rip)      # imm = 0x7D5
	je	.LBB6_141
# BB#142:                               # %if.then359
	incl	EdgeProfCounters+1176(%rip)
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+1184(%rip)
	jmp	.LBB6_143
.LBB6_139:                              # %if.then355
	incl	EdgeProfCounters+1168(%rip)
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+1172(%rip)
	jmp	.LBB6_144
.LBB6_141:                              # %if.else357.if.end361_crit_edge
	incl	EdgeProfCounters+1180(%rip)
.LBB6_143:                              # %if.end361
	incl	EdgeProfCounters+1188(%rip)
.LBB6_144:                              # %if.end362
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
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$304, %ecx              # imm = 0x130
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+1192(%rip)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	incl	EdgeProfCounters+1196(%rip)
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+1200(%rip)
	callq	Puzzle
	incl	EdgeProfCounters+1208(%rip)
	incl	-8(%rbp)
	incl	EdgeProfCounters+1212(%rip)
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -8(%rbp)
	jle	.LBB7_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+1204(%rip)
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
	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,1216,16

	.section	".note.GNU-stack","",@progbits
