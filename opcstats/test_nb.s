	.file	"test_nb.bc"
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
	movabsq	$-6275696437447579415, %rsi # imm = 0xA8E83F5717C0A8E9
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_33:                               # %for.inc72
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	-332(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$29999, -332(%rbp)      # imm = 0x752F
	jg	.LBB0_34
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -336(%rbp)
	jmp	.LBB0_3
	.align	16, 0x90
.LBB0_32:                               # %for.inc
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
	incl	-336(%rbp)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$11, -336(%rbp)
	jg	.LBB0_33
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
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
	movl	-336(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_7
# BB#6:                                 # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=2
	incq	-304(%rbp)
	jmp	.LBB0_26
	.align	16, 0x90
.LBB0_8:                                # %if.else8
                                        #   in Loop: Header=BB0_3 Depth=2
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
	je	.LBB0_10
# BB#9:                                 # %if.then13
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_10:                               # %if.end15
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_12
# BB#11:                                # %if.then17
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_12:                               # %if.end19
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_14
# BB#13:                                # %if.then21
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_14:                               # %if.end23
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_16
# BB#15:                                # %if.then25
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_16:                               # %if.end27
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_18
# BB#17:                                # %if.then29
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_18:                               # %if.end31
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_20
# BB#19:                                # %if.then33
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_20:                               # %if.end35
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_22
# BB#21:                                # %if.then37
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_22:                               # %if.end39
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_24
# BB#23:                                # %if.then41
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_24:                               # %if.end43
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpl	$0, -340(%rbp)
	je	.LBB0_26
# BB#25:                                # %if.then45
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	jmp	.LBB0_26
	.align	16, 0x90
.LBB0_7:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=2
	addq	$2, -304(%rbp)
.LBB0_26:                               # %if.end48
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	-336(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_28
# BB#27:                                # %if.then52
                                        #   in Loop: Header=BB0_3 Depth=2
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
	je	.LBB0_31
	jmp	.LBB0_32
	.align	16, 0x90
.LBB0_28:                               # %if.else59
                                        #   in Loop: Header=BB0_3 Depth=2
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
	je	.LBB0_30
# BB#29:                                # %if.then65
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.LBB0_30:                               # %if.end67
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	$0, -320(%rbp)
.LBB0_31:                               # %if.end67
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-304(%rbp), %rax
	addq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	jmp	.LBB0_32
.LBB0_34:                               # %for.end74
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


	.section	".note.GNU-stack","",@progbits
