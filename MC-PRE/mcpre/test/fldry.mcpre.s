	.file	"test/fldry.mcpre.bc"
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
	movl	$.L.str, %edi
	movl	$8, %esi
	xorb	%al, %al
	callq	printf
	callq	Proc0
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4613937818241073152     # double 3
.LCPI1_1:
	.quad	4617315517961601024     # double 5
.LCPI1_2:
	.quad	4607182418800017408     # double 1
	.text
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
	movabsq	$4630826316843712512, %rcx # imm = 0x4044000000000000
	movq	%rax, PtrGlb(%rip)
	movq	PtrGlbNext(%rip), %rdx
	movq	%rdx, (%rax)
	movq	PtrGlb(%rip), %rax
	movl	$0, 8(%rax)
	movq	PtrGlb(%rip), %rax
	movl	$10001, 12(%rax)        # imm = 0x2711
	movq	PtrGlb(%rip), %rax
	movq	%rcx, 16(%rax)
	movq	PtrGlb(%rip), %rdi
	addq	$24, %rdi
	movl	$.L.str1, %esi
	callq	strcpy
	leaq	-96(%rbp), %rdi
	movl	$.L.str2, %esi
	callq	strcpy
	movabsq	$4621819117588971520, %rax # imm = 0x4024000000000000
	movq	%rax, Array2Glob+3320(%rip)
	callq	clock
	xorl	%eax, %eax
	leaq	-128(%rbp), %rbx
	leaq	-56(%rbp), %r12
	leaq	-60(%rbp), %r14
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_12:                               # %for.inc42
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovsd	-144(%rbp), %xmm0       # 8-byte Reload
	vmovsd	%xmm0, -56(%rbp)
	leaq	-48(%rbp), %rdi
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
	movabsq	$4611686018427387904, %rax # imm = 0x4000000000000000
	movq	%rax, -48(%rbp)
	movq	%rbx, %rdi
	movl	$.L.str3, %esi
	callq	strcpy
	movl	$10000, -60(%rbp)       # imm = 0x2710
	leaq	-96(%rbp), %rdi
	movq	%rbx, %rsi
	callq	Func2
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, BoolGlob(%rip)
	vmovsd	.LCPI1_0(%rip), %xmm0
	vmovapd	%xmm0, %xmm1
	jmp	.LBB1_5
	.align	16, 0x90
.LBB1_6:                                # %while.body
                                        #   in Loop: Header=BB1_5 Depth=2
	vmovsd	.LCPI1_1(%rip), %xmm0
	vmulsd	-48(%rbp), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	vmovsd	-48(%rbp), %xmm0
	movq	%r12, %rdi
	callq	Proc7
	vmovsd	.LCPI1_0(%rip), %xmm1
	vmovsd	.LCPI1_2(%rip), %xmm0
	vaddsd	-48(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)
.LBB1_5:                                # %while.cond
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vucomisd	-48(%rbp), %xmm1
	ja	.LBB1_6
# BB#7:                                 # %while.end.split
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovsd	-56(%rbp), %xmm1
	vmovsd	-48(%rbp), %xmm0
	vmovsd	%xmm0, -144(%rbp)       # 8-byte Spill
	movl	$Array1Glob, %edi
	movl	$Array2Glob, %esi
	callq	Proc8
	movq	PtrGlb(%rip), %rdi
	callq	Proc1
	vmovsd	-144(%rbp), %xmm0       # 8-byte Reload
	vmulsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rbp)       # 8-byte Spill
	movb	$65, %r13b
	jmp	.LBB1_8
	.align	16, 0x90
.LBB1_11:                               # %for.inc34
                                        #   in Loop: Header=BB1_8 Depth=2
	incb	%r13b
.LBB1_8:                                # %for.cond24
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	%r13b, %edi
	movsbl	Char2Glob(%rip), %eax
	cmpl	%eax, %edi
	jg	.LBB1_12
# BB#9:                                 # %for.body28
                                        #   in Loop: Header=BB1_8 Depth=2
	movl	-60(%rbp), %r15d
	movl	$67, %esi
	callq	Func1
	cmpl	%eax, %r15d
	jne	.LBB1_11
# BB#10:                                # %if.then
                                        #   in Loop: Header=BB1_8 Depth=2
	xorl	%edi, %edi
	movq	%r14, %rsi
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
	movabsq	$4617315517961601024, %rax # imm = 0x4014000000000000
	movq	%rax, 16(%rdi)
	movq	(%rdi), %rcx
	movq	%rax, 16(%rcx)
	movq	(%rdi), %rax
	movq	%rax, (%rax)
	popq	%rbp
	ret
.Ltmp23:
	.size	Proc1, .Ltmp23-Proc1
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4621819117588971520     # double 10
.LCPI3_1:
	.quad	-4616189618054758400    # double -1
	.text
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
	vmovsd	(%rdi), %xmm0
	vaddsd	.LCPI3_0(%rip), %xmm0, %xmm0
	vmovsd	.LCPI3_1(%rip), %xmm1
	xorb	%al, %al
	.align	16, 0x90
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	Char1Glob(%rip), %ecx
	cmpl	$65, %ecx
	jne	.LBB3_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	IntGlob(%rip), %xmm0, %xmm2
	vmovsd	%xmm2, (%rdi)
.LBB3_3:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	testb	%al, %al
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
	movabsq	$4636737291354636288, %rax # imm = 0x4059000000000000
	movq	%rax, IntGlob(%rip)
.LBB4_3:                                # %if.end
	vmovsd	IntGlob(%rip), %xmm0
	movq	PtrGlb(%rip), %rsi
	addq	$16, %rsi
	movl	$10, %edi
	movb	$1, %al
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

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI7_0:
	.quad	4636737291354636288     # double 100
	.text
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
	vmovsd	IntGlob(%rip), %xmm0
	vucomisd	.LCPI7_0(%rip), %xmm0
	jbe	.LBB7_11
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

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI8_0:
	.quad	4611686018427387904     # double 2
	.text
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
	vaddsd	.LCPI8_0(%rip), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, (%rdi)
	popq	%rbp
	ret
.Ltmp62:
	.size	Proc7, .Ltmp62-Proc7
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI9_0:
	.quad	4617315517961601024     # double 5
.LCPI9_1:
	.quad	4607182418800017408     # double 1
	.text
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
	vaddsd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %eax
	movslq	%eax, %rax
	vmovsd	%xmm1, (%rdi,%rax,8)
	leal	1(%rax), %ecx
	movslq	%ecx, %rcx
	vmovsd	%xmm1, (%rdi,%rcx,8)
	leal	30(%rax), %ecx
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	vaddsd	.LCPI9_1(%rip), %xmm0, %xmm1
	imulq	$408, %rax, %rcx        # imm = 0x198
	addq	%rsi, %rcx
	vmovsd	.LCPI9_1(%rip), %xmm2
	vmovapd	%xmm0, %xmm3
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	vcvttsd2si	%xmm3, %edx
	movslq	%edx, %rdx
	vmovsd	%xmm0, (%rcx,%rdx,8)
	vaddsd	%xmm2, %xmm3, %xmm3
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	vucomisd	%xmm3, %xmm1
	jae	.LBB9_2
# BB#3:                                 # %for.end
	leal	-1(%rax), %edx
	movslq	%edx, %r9
	leal	20(%rax), %edx
	movslq	%edx, %rdx
	imulq	$408, %rdx, %rdx        # imm = 0x198
	addq	%rdx, %rsi
	vmovsd	(%rcx,%r9,8), %xmm0
	vaddsd	.LCPI9_1(%rip), %xmm0, %xmm0
	movabsq	$4617315517961601024, %r8 # imm = 0x4014000000000000
	vmovsd	%xmm0, (%rcx,%r9,8)
	vmovsd	(%rdi,%rax,8), %xmm0
	vmovsd	%xmm0, (%rsi,%rax,8)
	movq	%r8, IntGlob(%rip)
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

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI11_0:
	.quad	4607182418800017408     # double 1
.LCPI11_1:
	.quad	4619567317775286272     # double 7
	.text
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Ltmp81:
	.cfi_offset %rbx, -32
.Ltmp82:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vmovsd	.LCPI11_0(%rip), %xmm0
	vmovapd	%xmm0, %xmm1
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_3:                               # %if.then
                                        #   in Loop: Header=BB11_1 Depth=1
	vaddsd	%xmm0, %xmm1, %xmm1
.LBB11_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	vucomisd	%xmm1, %xmm0
	jb	.LBB11_4
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB11_1 Depth=1
	vcvttsd2si	%xmm1, %eax
	movslq	%eax, %rax
	movsbl	(%rbx,%rax), %edi
	incl	%eax
	movslq	%eax, %rax
	movsbl	(%r14,%rax), %esi
	vmovsd	%xmm1, -24(%rbp)        # 8-byte Spill
	callq	Func1
	vmovsd	-24(%rbp), %xmm1        # 8-byte Reload
	vmovsd	.LCPI11_0(%rip), %xmm0
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
.LBB11_6:                               # %if.end15
	movl	$1, %eax
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB11_9
# BB#7:                                 # %if.else
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	strcmp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.LBB11_9
# BB#8:                                 # %if.then23
	movl	$1, %eax
.LBB11_9:                               # %return
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp83:
	.size	Func2, .Ltmp83-Func2
	.cfi_endproc

	.globl	Func3
	.align	16, 0x90
	.type	Func3,@function
Func3:                                  # @Func3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp86:
	.cfi_def_cfa_offset 16
.Ltmp87:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp88:
	.cfi_def_cfa_register %rbp
	movl	$1, %eax
	cmpl	$10001, %edi            # imm = 0x2711
	je	.LBB12_2
# BB#1:                                 # %if.end
	xorl	%eax, %eax
.LBB12_2:                               # %return
	popq	%rbp
	ret
.Ltmp89:
	.size	Func3, .Ltmp89-Func3
	.cfi_endproc

	.type	Version,@object         # @Version
	.data
	.globl	Version
Version:
	.asciz	 "1.1"
	.size	Version, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "calculate floating dhrystones using doubles size %d\n"
	.size	.L.str, 53

	.type	PtrGlbNext,@object      # @PtrGlbNext
	.comm	PtrGlbNext,8,8
	.type	PtrGlb,@object          # @PtrGlb
	.comm	PtrGlb,8,8
	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "DHRYSTONE PROGRAM, SOME STRING"
	.size	.L.str1, 31

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "DHRYSTONE PROGRAM, 1'ST STRING"
	.size	.L.str2, 31

	.type	Array2Glob,@object      # @Array2Glob
	.comm	Array2Glob,20808,16
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "DHRYSTONE PROGRAM, 2'ND STRING"
	.size	.L.str3, 31

	.type	BoolGlob,@object        # @BoolGlob
	.comm	BoolGlob,4,4
	.type	Array1Glob,@object      # @Array1Glob
	.comm	Array1Glob,408,16
	.type	Char2Glob,@object       # @Char2Glob
	.comm	Char2Glob,1,1
	.type	Char1Glob,@object       # @Char1Glob
	.comm	Char1Glob,1,1
	.type	IntGlob,@object         # @IntGlob
	.comm	IntGlob,8,8

	.section	".note.GNU-stack","",@progbits
