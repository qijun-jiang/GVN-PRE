	.file	"correct1.slicm.bc"
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
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
