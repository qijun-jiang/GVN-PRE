	.file	"test_nb.slicm.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$288, %rsp              # imm = 0x120
.Ltmp6:
	.cfi_offset %rbx, -48
.Ltmp7:
	.cfi_offset %r12, -40
.Ltmp8:
	.cfi_offset %r14, -32
.Ltmp9:
	.cfi_offset %r15, -24
	xorl	%r14d, %r14d
	leaq	-320(%rbp), %rsi
	xorl	%edi, %edi
	callq	getrusage
	movabsq	$23423234342342, %r12   # imm = 0x154DA58FFDC6
	xorl	%r15d, %r15d
	movabsq	$4234234234234235, %r8  # imm = 0xF0B037B6D657B
	movabsq	$4234234234234236, %r9  # imm = 0xF0B037B6D657C
	movabsq	$-6275696437447579415, %r10 # imm = 0xA8E83F5717C0A8E9
	movabsq	$4234234234234234, %r11 # imm = 0xF0B037B6D657A
                                        # implicit-def: RCX
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_12:                               # %for.inc72
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	%r14d
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$-1, %ebx
	cmpl	$29999, %r14d           # imm = 0x752F
	jg	.LBB0_13
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_11:                               # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%rcx, %rax
	imulq	%r10
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$6, %rdx
	addq	%rax, %rdx
	imulq	$97, %rdx, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	addq	%rax, %r15
.LBB0_2:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%ebx
	cmpl	$11, %ebx
	jg	.LBB0_12
# BB#3:                                 # %for.body3
                                        #   in Loop: Header=BB0_2 Depth=2
	movslq	%ebx, %rax
	imulq	$1431655766, %rax, %rax # imm = 0x55555556
	movq	%rax, %rdx
	shrq	$63, %rdx
	shrq	$32, %rax
	addl	%edx, %eax
	leal	(%rax,%rax,2), %eax
	cmpl	%eax, %ebx
	jne	.LBB0_7
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	andl	$-2, %eax
	cmpl	%eax, %ebx
	je	.LBB0_6
# BB#5:                                 # %if.then6.split
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	(%r12,%r8), %rax
	incq	%r12
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_7:                                # %if.end43
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	(%r12,%r11), %rcx
	movq	%rcx, %rax
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_6:                                # %if.else.split
                                        #   in Loop: Header=BB0_2 Depth=2
	leaq	(%r12,%r9), %rax
	addq	$2, %r12
.LBB0_8:                                # %if.end48
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%ebx, %edx
	shrl	$31, %edx
	addl	%ebx, %edx
	movl	%edx, %esi
	andl	$-2, %esi
	cmpl	%esi, %ebx
	jne	.LBB0_10
# BB#9:                                 # %if.then52
                                        #   in Loop: Header=BB0_2 Depth=2
	sarl	%edx
	movslq	%edx, %rdx
	imulq	$1431655766, %rdx, %rdi # imm = 0x55555556
	movq	%rdi, %rsi
	shrq	$63, %rsi
	shrq	$32, %rdi
	addl	%esi, %edi
	leal	(%rdi,%rdi,2), %esi
	cmpl	%esi, %edx
	jne	.LBB0_11
.LBB0_10:                               # %if.else59
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%rax, %rcx
	jmp	.LBB0_11
.LBB0_13:                               # %for.end74.split.split
	leaq	-176(%rbp), %rsi
	xorl	%edi, %edi
	callq	getrusage
	movq	-312(%rbp), %rax
	imulq	$1000000, -320(%rbp), %rcx # imm = 0xF4240
	addq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	imulq	$1000000, -176(%rbp), %rax # imm = 0xF4240
	addq	-168(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	xorl	%eax, %eax
	addq	$288, %rsp              # imm = 0x120
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp10:
	.size	main, .Ltmp10-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d\n"
	.size	.L.str, 4


	.section	".note.GNU-stack","",@progbits
