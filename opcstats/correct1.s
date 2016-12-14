	.file	"correct1.bc"
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
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$1, -12(%rbp)
	movl	-8(%rbp), %eax
	incl	%eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
