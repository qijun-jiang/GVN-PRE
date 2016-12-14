	.file	"test_nb.profile.ls.bc"
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
	subq	$368, %rsp              # imm = 0x170
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$EdgeProfCounters, %edx
	movl	$56, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters(%rip)
	movl	$0, -4(%rbp)
	leaq	-296(%rbp), %rsi
	xorl	%edi, %edi
	callq	getrusage
	movabsq	$23423234342342, %rax   # imm = 0x154DA58FFDC6
	movq	%rax, -304(%rbp)
	movabsq	$4234234234234234, %rax # imm = 0xF0B037B6D657A
	movq	%rax, -312(%rbp)
	movq	$0, -328(%rbp)
	movl	$0, -332(%rbp)
	incl	EdgeProfCounters+4(%rip)
	movabsq	$-6275696437447579415, %rsi # imm = 0xA8E83F5717C0A8E9
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_45:                               # %for.inc72
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+24(%rip)
	incl	EdgeProfCounters+216(%rip)
	incl	-332(%rbp)
	incl	EdgeProfCounters+220(%rip)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$29999, -332(%rbp)      # imm = 0x752F
	jg	.LBB0_46
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movl	$0, -336(%rbp)
	incl	EdgeProfCounters+16(%rip)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_44:                               # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-320(%rbp), %rcx
	movq	%rcx, %rax
	imulq	%rsi
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$6, %rdx
	addq	%rax, %rdx
	imulq	$97, %rdx, %rax
	subq	%rax, %rcx
	addq	%rcx, -328(%rbp)
	incl	EdgeProfCounters+208(%rip)
	incl	-336(%rbp)
	incl	EdgeProfCounters+212(%rip)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$11, -336(%rbp)
	jg	.LBB0_45
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+20(%rip)
	movslq	-336(%rbp), %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_8
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+28(%rip)
	movl	-336(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_7
# BB#6:                                 # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+36(%rip)
	incq	-304(%rbp)
	incl	EdgeProfCounters+44(%rip)
	incl	EdgeProfCounters+52(%rip)
	jmp	.LBB0_36
	.align	16, 0x90
.LBB0_8:                                # %if.else8
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+32(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	movslq	-336(%rbp), %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	cmpl	%ecx, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -340(%rbp)
	je	.LBB0_9
# BB#10:                                # %if.then13
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+56(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_7:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+40(%rip)
	addq	$2, -304(%rbp)
	incl	EdgeProfCounters+48(%rip)
	incl	EdgeProfCounters+52(%rip)
	jmp	.LBB0_36
	.align	16, 0x90
.LBB0_9:                                # %if.else8.if.end15_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+60(%rip)
.LBB0_11:                               # %if.end15
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_12
# BB#13:                                # %if.then17
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+68(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+76(%rip)
	jmp	.LBB0_14
	.align	16, 0x90
.LBB0_12:                               # %if.end15.if.end19_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+72(%rip)
.LBB0_14:                               # %if.end19
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_15
# BB#16:                                # %if.then21
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+80(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+88(%rip)
	jmp	.LBB0_17
	.align	16, 0x90
.LBB0_15:                               # %if.end19.if.end23_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+84(%rip)
.LBB0_17:                               # %if.end23
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_18
# BB#19:                                # %if.then25
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+92(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+100(%rip)
	jmp	.LBB0_20
	.align	16, 0x90
.LBB0_18:                               # %if.end23.if.end27_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+96(%rip)
.LBB0_20:                               # %if.end27
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_21
# BB#22:                                # %if.then29
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+104(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+112(%rip)
	jmp	.LBB0_23
	.align	16, 0x90
.LBB0_21:                               # %if.end27.if.end31_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+108(%rip)
.LBB0_23:                               # %if.end31
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_24
# BB#25:                                # %if.then33
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+116(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+124(%rip)
	jmp	.LBB0_26
	.align	16, 0x90
.LBB0_24:                               # %if.end31.if.end35_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+120(%rip)
.LBB0_26:                               # %if.end35
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_27
# BB#28:                                # %if.then37
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+128(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+136(%rip)
	jmp	.LBB0_29
	.align	16, 0x90
.LBB0_27:                               # %if.end35.if.end39_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+132(%rip)
.LBB0_29:                               # %if.end39
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_30
# BB#31:                                # %if.then41
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+140(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+148(%rip)
	jmp	.LBB0_32
	.align	16, 0x90
.LBB0_30:                               # %if.end39.if.end43_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+144(%rip)
.LBB0_32:                               # %if.end43
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_33
# BB#34:                                # %if.then45
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+152(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+160(%rip)
	jmp	.LBB0_35
	.align	16, 0x90
.LBB0_33:                               # %if.end43.if.end47_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+156(%rip)
.LBB0_35:                               # %if.end47
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+164(%rip)
.LBB0_36:                               # %if.end48
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	-336(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_40
# BB#37:                                # %if.then52
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+168(%rip)
	movl	-336(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movl	%eax, -344(%rbp)
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_38
# BB#39:                                # %if.then56
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+176(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+184(%rip)
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB0_44
	.align	16, 0x90
.LBB0_40:                               # %if.else59
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+172(%rip)
	movl	-336(%rbp), %eax
	leal	-1(%rax), %ecx
	shrl	$31, %ecx
	leal	-1(%rax,%rcx), %eax
	sarl	%eax
	movslq	%eax, %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movl	%eax, -348(%rbp)
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	je	.LBB0_41
# BB#42:                                # %if.then65
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+192(%rip)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+200(%rip)
	jmp	.LBB0_43
	.align	16, 0x90
.LBB0_38:                               # %if.then52.if.end58_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+180(%rip)
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB0_44
	.align	16, 0x90
.LBB0_41:                               # %if.else59.if.end67_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	incl	EdgeProfCounters+196(%rip)
.LBB0_43:                               # %if.end67
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	$0, -320(%rbp)
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	incl	EdgeProfCounters+204(%rip)
	jmp	.LBB0_44
.LBB0_46:                               # %for.end74
	incl	EdgeProfCounters+12(%rip)
	leaq	-152(%rbp), %rsi
	xorl	%edi, %edi
	callq	getrusage
	imulq	$1000000, -296(%rbp), %rax # imm = 0xF4240
	addq	-288(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	%xmm0, -360(%rbp)
	imulq	$1000000, -152(%rbp), %rax # imm = 0xF4240
	addq	-144(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	%xmm0, -368(%rbp)
	vsubsd	-360(%rbp), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	xorl	%eax, %eax
	addq	$368, %rsp              # imm = 0x170
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d\n"
	.size	.L.str, 4

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,224,16

	.section	".note.GNU-stack","",@progbits
