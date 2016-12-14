	.file	"correct3.nomc.bc"
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
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	%ecx, a(,%rcx,4)
	incq	%rcx
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, %ecx
	jg	.LBB0_3
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_6:                                # %for.inc11
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	a+388(%rip), %ecx
	movl	%ecx, b(,%rax,4)
	incq	%rax
.LBB0_3:                                # %for.cond1
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, %eax
	jg	.LBB0_7
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpl	$96, a(,%rax,4)
	jl	.LBB0_6
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	$1, a+4(,%rax,4)
	jmp	.LBB0_6
.LBB0_7:                                # %for.end13
	movl	b+396(%rip), %ecx
	movl	b+392(%rip), %edx
	movl	b+388(%rip), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	a,@object               # @a
	.comm	a,400,16
	.type	b,@object               # @b
	.comm	b,400,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d, %d, %d\n"
	.size	.L.str, 12


	.section	".note.GNU-stack","",@progbits
