	.file	"test/linpack-pc.bc"
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_0:
	.long	1232348160              # float 1.0E+6
	.text
	.globl	second
	.align	16, 0x90
	.type	second,@function
second:                                 # @second
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
	subq	$16, %rsp
	callq	clock
	vcvtsi2ssq	%rax, %xmm0, %xmm0
	vdivss	.LCPI0_0(%rip), %xmm0, %xmm0
	movq	%rax, -16(%rbp)
	vmovss	%xmm0, -4(%rbp)
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	second, .Ltmp5-second
	.cfi_endproc

	.globl	what_date
	.align	16, 0x90
	.type	what_date,@function
what_date:                              # @what_date
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
	popq	%rbp
	ret
.Ltmp11:
	.size	what_date, .Ltmp11-what_date
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4613937818241073152     # double 3
.LCPI2_2:
	.quad	4696837146684686336     # double 1.0E+6
.LCPI2_3:
	.quad	4611686018427387904     # double 2
.LCPI2_4:
	.quad	4617315517961601024     # double 5
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_1:
	.long	1065353216              # float 1
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_5:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI2_6:
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp17:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$824, %rsp              # imm = 0x338
.Ltmp18:
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	leaq	-832(%rbp), %rdi
	xorl	%esi, %esi
	movl	$720, %edx              # imm = 0x2D0
	callq	memset
	movb	$32, -832(%rbp)
	movq	$.L.str, -104(%rbp)
	movq	$.L.str1, -112(%rbp)
	movl	$201, main.lda(%rip)
	movl	$200, main.ldaa(%rip)
	movl	$1030053954, -16(%rbp)  # imm = 0x3D656042
	movl	$100, main.n(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str2, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str4, %esi
	xorb	%al, %al
	callq	fprintf
	movq	-104(%rbp), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str5, %esi
	xorb	%al, %al
	callq	fprintf
	movq	-112(%rbp), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str6, %esi
	xorb	%al, %al
	callq	fprintf
	leaq	-28(%rbp), %r8
	movl	main.n(%rip), %ecx
	movl	%ecx, %eax
	imull	%eax, %eax
	imull	%eax, %ecx
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_0(%rip), %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm0, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -20(%rbp)
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	callq	matgen
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	callq	second
	vsubss	-48(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, atime(%rip)
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	callq	second
	vsubss	-48(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, atime+60(%rip)
	vaddss	atime(%rip), %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm0
	vmovss	%xmm0, main.x(,%rax,4)
	incl	main.i(%rip)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	main.i(%rip), %eax
	cmpl	main.n(%rip), %eax
	jl	.LBB2_2
# BB#3:                                 # %for.end
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	leaq	-28(%rbp), %r8
	movl	$main.a, %edi
	movl	$main.b, %ecx
	callq	matgen
	movl	$0, main.i(%rip)
	vmovss	.LCPI2_6(%rip), %xmm0
	jmp	.LBB2_4
	.align	16, 0x90
.LBB2_5:                                # %for.inc29
                                        #   in Loop: Header=BB2_4 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vxorps	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, main.b(,%rax,4)
	incl	main.i(%rip)
.LBB2_4:                                # %for.cond20
                                        # =>This Inner Loop Header: Depth=1
	movl	main.i(%rip), %eax
	cmpl	main.n(%rip), %eax
	jl	.LBB2_5
# BB#6:                                 # %for.end31
	movl	main.lda(%rip), %ecx
	movl	main.n(%rip), %edi
	movl	$main.b, %esi
	movl	%edi, %edx
	movl	$main.x, %r8d
	movl	$main.a, %r9d
	callq	dmxpy
	movl	$0, -36(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, main.i(%rip)
	vmovsd	.LCPI2_5(%rip), %xmm0
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_14:                               # %for.inc66
                                        #   in Loop: Header=BB2_7 Depth=1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, -32(%rbp)
	incl	main.i(%rip)
.LBB2_7:                                # %for.cond32
                                        # =>This Inner Loop Header: Depth=1
	movl	main.i(%rip), %eax
	cmpl	main.n(%rip), %eax
	jge	.LBB2_15
# BB#8:                                 # %for.body35
                                        #   in Loop: Header=BB2_7 Depth=1
	vmovss	-36(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jbe	.LBB2_10
# BB#9:                                 # %cond.true
                                        #   in Loop: Header=BB2_7 Depth=1
	vmovss	-36(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	jmp	.LBB2_11
	.align	16, 0x90
.LBB2_10:                               # %cond.false
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
.LBB2_11:                               # %cond.end
                                        #   in Loop: Header=BB2_7 Depth=1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, -36(%rbp)
	vmovss	-32(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jbe	.LBB2_13
# BB#12:                                # %cond.true56
                                        #   in Loop: Header=BB2_7 Depth=1
	vmovss	-32(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	jmp	.LBB2_14
	.align	16, 0x90
.LBB2_13:                               # %cond.false58
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	jmp	.LBB2_14
.LBB2_15:                               # %for.end68
	vmovss	.LCPI2_1(%rip), %xmm0
	callq	epslon
	vmovss	%xmm0, -44(%rbp)
	vcvtsi2ssl	main.n(%rip), %xmm0, %xmm1
	vmulss	-28(%rbp), %xmm1, %xmm1
	vmulss	-32(%rbp), %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm0
	vmovss	-36(%rbp), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -40(%rbp)
	vmovss	-44(%rbp), %xmm0
	vmovss	%xmm0, -56(%rbp)
	vmovss	main.x(%rip), %xmm0
	vmovss	.LCPI2_1(%rip), %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -60(%rbp)
	movl	main.n(%rip), %eax
	decl	%eax
	movslq	%eax, %rax
	vmovss	main.x(,%rax,4), %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -64(%rbp)
	movq	stderr(%rip), %rdi
	movl	$.L.str7, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str8, %esi
	xorb	%al, %al
	callq	fprintf
	vmovss	-60(%rbp), %xmm0
	vmovss	-64(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm4
	vcvtss2sd	%xmm0, %xmm0, %xmm3
	vmovss	-56(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm2
	vmovss	-36(%rbp), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovss	-40(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	stderr(%rip), %rdi
	movl	$.L.str9, %esi
	movb	$5, %al
	callq	fprintf
	movl	main.n(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str10, %esi
	xorb	%al, %al
	callq	fprintf
	movl	main.lda(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str11, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str12, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str13, %esi
	xorb	%al, %al
	callq	fprintf
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovss	-24(%rbp), %xmm1
	vmovss	%xmm1, atime+120(%rip)
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vucomisd	%xmm0, %xmm1
	jbe	.LBB2_17
# BB#16:                                # %if.then
	vmovss	-20(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmulsd	.LCPI2_2(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm1
	vmovsd	.LCPI2_3(%rip), %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(%rip)
	vmovss	atime+180(%rip), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+240(%rip)
	jmp	.LBB2_18
.LBB2_17:                               # %if.else
	movl	$0, atime+180(%rip)
	movl	$0, atime+240(%rip)
.LBB2_18:                               # %if.end
	vmovss	-24(%rbp), %xmm0
	vdivss	-16(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, atime+300(%rip)
	xorl	%edi, %edi
	callq	print_time
	movq	stderr(%rip), %rdi
	movl	$.L.str14, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$-3, -72(%rbp)
	movl	$100, -76(%rbp)
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_19:                               # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_20 Depth 2
	callq	second
	vmovss	%xmm0, -88(%rbp)
	incl	-72(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_20
	.align	16, 0x90
.LBB2_21:                               # %for.inc111
                                        #   in Loop: Header=BB2_20 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	incl	main.i(%rip)
.LBB2_20:                               # %for.cond107
                                        #   Parent Loop BB2_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	-76(%rbp), %eax
	jl	.LBB2_21
# BB#22:                                # %for.end113
                                        #   in Loop: Header=BB2_19 Depth=1
	callq	second
	vmovss	%xmm0, -92(%rbp)
	vsubss	-88(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -80(%rbp)
	movl	-76(%rbp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	cmpl	$0, -72(%rbp)
	jns	.LBB2_24
# BB#23:                                # %if.then119
                                        #   in Loop: Header=BB2_19 Depth=1
	shll	-76(%rbp)
.LBB2_24:                               # %do.cond
                                        #   in Loop: Header=BB2_19 Depth=1
	cmpl	$0, -72(%rbp)
	js	.LBB2_19
# BB#25:                                # %do.end
	vmovss	-80(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	-76(%rbp), %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -80(%rbp)
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str17, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$-3, -72(%rbp)
	movl	$100, main.ntimes(%rip)
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_26:                               # %do.body130
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_27 Depth 2
	callq	second
	vmovss	%xmm0, -88(%rbp)
	incl	-72(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_27
	.align	16, 0x90
.LBB2_28:                               # %for.inc137
                                        #   in Loop: Header=BB2_27 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	incl	main.i(%rip)
.LBB2_27:                               # %for.cond133
                                        #   Parent Loop BB2_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_28
# BB#29:                                # %for.end139
                                        #   in Loop: Header=BB2_26 Depth=1
	callq	second
	vsubss	-88(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -92(%rbp)
	movl	main.ntimes(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	cmpl	$0, -72(%rbp)
	jns	.LBB2_31
# BB#30:                                # %if.then145
                                        #   in Loop: Header=BB2_26 Depth=1
	shll	main.ntimes(%rip)
.LBB2_31:                               # %do.cond148
                                        #   in Loop: Header=BB2_26 Depth=1
	cmpl	$0, -72(%rbp)
	js	.LBB2_26
# BB#32:                                # %do.end151
	movl	$1000, main.ntimes(%rip) # imm = 0x3E8
	movb	$1, %al
	testb	%al, %al
	jne	.LBB2_34
# BB#33:                                # %if.then154
	movl	$1, main.ntimes(%rip)
.LBB2_34:                               # %if.end155
	movq	stderr(%rip), %rdi
	movl	$.L.str18, %esi
	xorl	%edx, %edx
	xorb	%al, %al
	callq	fprintf
	movl	main.lda(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str12, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str13, %esi
	xorb	%al, %al
	callq	fprintf
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm0
	vmulss	-80(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -52(%rbp)
	movl	$0, atime+204(%rip)
	movl	$1, main.j(%rip)
	leaq	-28(%rbp), %rbx
	jmp	.LBB2_35
	.align	16, 0x90
.LBB2_42:                               # %for.inc222
                                        #   in Loop: Header=BB2_35 Depth=1
	callq	second
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vsubss	-48(%rbp), %xmm0, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+120(,%rax,4)
	vmovss	-20(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmulsd	.LCPI2_2(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI2_3(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+240(,%rax,4)
	vmovss	-24(%rbp), %xmm0
	vdivss	-16(%rbp), %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+300(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+204(%rip), %xmm0
	vaddss	atime+180(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, atime+204(%rip)
	movl	main.j(%rip), %edi
	callq	print_time
	incl	main.j(%rip)
.LBB2_35:                               # %for.cond162
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_37 Depth 2
                                        #     Child Loop BB2_40 Depth 2
	cmpl	$5, main.j(%rip)
	jg	.LBB2_43
# BB#36:                                # %for.body165
                                        #   in Loop: Header=BB2_35 Depth=1
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_37
	.align	16, 0x90
.LBB2_38:                               # %for.inc171
                                        #   in Loop: Header=BB2_37 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	incl	main.i(%rip)
.LBB2_37:                               # %for.cond167
                                        #   Parent Loop BB2_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_38
# BB#39:                                # %for.end173
                                        #   in Loop: Header=BB2_35 Depth=1
	callq	second
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vsubss	-48(%rbp), %xmm0, %xmm0
	vsubss	-52(%rbp), %xmm0, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_40
	.align	16, 0x90
.LBB2_41:                               # %for.inc186
                                        #   in Loop: Header=BB2_40 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	incl	main.i(%rip)
.LBB2_40:                               # %for.cond182
                                        #   Parent Loop BB2_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jge	.LBB2_42
	jmp	.LBB2_41
.LBB2_43:                               # %for.end224
	vmovss	atime+204(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_4(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+204(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str20, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str21, %esi
	xorb	%al, %al
	callq	fprintf
	callq	second
	vmovss	%xmm0, -88(%rbp)
	movl	$0, main.i(%rip)
	leaq	-28(%rbp), %rbx
	jmp	.LBB2_44
	.align	16, 0x90
.LBB2_45:                               # %for.inc235
                                        #   in Loop: Header=BB2_44 Depth=1
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	incl	main.i(%rip)
.LBB2_44:                               # %for.cond231
                                        # =>This Inner Loop Header: Depth=1
	movl	main.i(%rip), %eax
	cmpl	-76(%rbp), %eax
	jl	.LBB2_45
# BB#46:                                # %for.end237
	callq	second
	vmovss	%xmm0, -92(%rbp)
	vsubss	-88(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -84(%rbp)
	vmovss	-84(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	-76(%rbp), %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -84(%rbp)
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	movl	main.ldaa(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str12, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str13, %esi
	xorb	%al, %al
	callq	fprintf
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm0
	vmulss	-84(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -52(%rbp)
	movl	$0, atime+228(%rip)
	movl	$7, main.j(%rip)
	leaq	-28(%rbp), %rbx
	jmp	.LBB2_47
	.align	16, 0x90
.LBB2_54:                               # %for.inc310
                                        #   in Loop: Header=BB2_47 Depth=1
	callq	second
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vsubss	-48(%rbp), %xmm0, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+120(,%rax,4)
	vmovss	-20(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmulsd	.LCPI2_2(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI2_3(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+240(,%rax,4)
	vmovss	-24(%rbp), %xmm0
	vdivss	-16(%rbp), %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+300(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+228(%rip), %xmm0
	vaddss	atime+180(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, atime+228(%rip)
	movl	main.j(%rip), %edi
	callq	print_time
	incl	main.j(%rip)
.LBB2_47:                               # %for.cond250
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_49 Depth 2
                                        #     Child Loop BB2_52 Depth 2
	cmpl	$11, main.j(%rip)
	jg	.LBB2_55
# BB#48:                                # %for.body253
                                        #   in Loop: Header=BB2_47 Depth=1
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_49
	.align	16, 0x90
.LBB2_50:                               # %for.inc259
                                        #   in Loop: Header=BB2_49 Depth=2
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	incl	main.i(%rip)
.LBB2_49:                               # %for.cond255
                                        #   Parent Loop BB2_47 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_50
# BB#51:                                # %for.end261
                                        #   in Loop: Header=BB2_47 Depth=1
	callq	second
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vsubss	-48(%rbp), %xmm0, %xmm0
	vsubss	-52(%rbp), %xmm0, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -48(%rbp)
	movl	$0, main.i(%rip)
	jmp	.LBB2_52
	.align	16, 0x90
.LBB2_53:                               # %for.inc274
                                        #   in Loop: Header=BB2_52 Depth=2
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	incl	main.i(%rip)
.LBB2_52:                               # %for.cond270
                                        #   Parent Loop BB2_47 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jge	.LBB2_54
	jmp	.LBB2_53
.LBB2_55:                               # %for.end312
	vmovss	atime+228(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_4(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+228(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str20, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	xorl	%eax, %eax
	addq	$824, %rsp              # imm = 0x338
	popq	%rbx
	popq	%rbp
	ret
.Ltmp19:
	.size	main, .Ltmp19-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	-4548635623644200960    # double -32768
.LCPI3_1:
	.quad	4670232813583204352     # double 16384
	.text
	.globl	matgen
	.align	16, 0x90
	.type	matgen,@function
matgen:                                 # @matgen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp22:
	.cfi_def_cfa_offset 16
.Ltmp23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp24:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	$1325, -36(%rbp)        # imm = 0x52D
	movq	-32(%rbp), %rax
	movl	$0, (%rax)
	movl	$0, -44(%rbp)
	vmovsd	.LCPI3_0(%rip), %xmm0
	vmovsd	.LCPI3_1(%rip), %xmm1
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_8:                                # %for.inc16
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	-44(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -40(%rbp)
	jmp	.LBB3_3
	.align	16, 0x90
.LBB3_7:                                # %for.inc
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	-32(%rbp), %rax
	vmovss	%xmm2, (%rax)
	incl	-40(%rbp)
.LBB3_3:                                # %for.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_8
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB3_3 Depth=2
	imull	$3125, -36(%rbp), %eax  # imm = 0xC35
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$16, %ecx
	addl	%eax, %ecx
	andl	$-65536, %ecx           # imm = 0xFFFFFFFFFFFF0000
	subl	%ecx, %eax
	movl	%eax, -36(%rbp)
	vcvtsi2sdl	%eax, %xmm0, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	movl	-12(%rbp), %eax
	imull	-44(%rbp), %eax
	addl	-40(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, (%rcx,%rax,4)
	movl	-12(%rbp), %eax
	imull	-44(%rbp), %eax
	addl	-40(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm2
	movq	-32(%rbp), %rax
	vucomiss	(%rax), %xmm2
	jbe	.LBB3_6
# BB#5:                                 # %cond.true
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-12(%rbp), %eax
	imull	-44(%rbp), %eax
	addl	-40(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm2
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_6:                                # %cond.false
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	-32(%rbp), %rax
	vmovss	(%rax), %xmm2
	jmp	.LBB3_7
.LBB3_9:                                # %for.end18
	movl	$0, -40(%rbp)
	jmp	.LBB3_10
	.align	16, 0x90
.LBB3_11:                               # %for.inc25
                                        #   in Loop: Header=BB3_10 Depth=1
	movq	-24(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	-40(%rbp)
.LBB3_10:                               # %for.cond19
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB3_11
# BB#12:                                # %for.end27
	movl	$0, -44(%rbp)
	jmp	.LBB3_13
	.align	16, 0x90
.LBB3_17:                               # %for.inc48
                                        #   in Loop: Header=BB3_13 Depth=1
	incl	-44(%rbp)
.LBB3_13:                               # %for.cond28
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_15 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_18
# BB#14:                                # %for.body31
                                        #   in Loop: Header=BB3_13 Depth=1
	movl	$0, -40(%rbp)
	jmp	.LBB3_15
	.align	16, 0x90
.LBB3_16:                               # %for.inc45
                                        #   in Loop: Header=BB3_15 Depth=2
	movslq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	movl	-12(%rbp), %edx
	imull	-44(%rbp), %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	movq	-8(%rbp), %rsi
	vaddss	(%rsi,%rdx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-40(%rbp)
.LBB3_15:                               # %for.cond32
                                        #   Parent Loop BB3_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_17
	jmp	.LBB3_16
.LBB3_18:                               # %for.end50
	popq	%rbp
	ret
.Ltmp25:
	.size	matgen, .Ltmp25-matgen
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_0:
	.quad	-4616189618054758400    # double -1
.LCPI4_1:
	.quad	0                       # double 0
	.text
	.globl	dgefa
	.align	16, 0x90
	.type	dgefa,@function
dgefa:                                  # @dgefa
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp30:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	$0, (%r8)
	movl	-16(%rbp), %eax
	decl	%eax
	movl	%eax, -56(%rbp)
	js	.LBB4_13
# BB#1:                                 # %if.then
	movl	$0, -44(%rbp)
	jmp	.LBB4_2
	.align	16, 0x90
.LBB4_12:                               # %for.inc83
                                        #   in Loop: Header=BB4_2 Depth=1
	incl	-44(%rbp)
.LBB4_2:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jge	.LBB4_13
# BB#3:                                 # %for.body
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-44(%rbp), %eax
	incl	%eax
	movl	%eax, -48(%rbp)
	movl	-44(%rbp), %eax
	movl	-12(%rbp), %ecx
	imull	%eax, %ecx
	movl	-16(%rbp), %edi
	subl	%eax, %edi
	addl	%eax, %ecx
	movslq	%ecx, %rax
	movq	-8(%rbp), %rcx
	leaq	(%rcx,%rax,4), %rsi
	movl	$1, %edx
	callq	idamax
	addl	-44(%rbp), %eax
	movl	%eax, -52(%rbp)
	movq	-24(%rbp), %rcx
	movslq	-44(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	-12(%rbp), %eax
	imull	-44(%rbp), %eax
	addl	-52(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI4_1, %xmm0
	jne	.LBB4_4
	jnp	.LBB4_11
.LBB4_4:                                # %if.then13
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-52(%rbp), %eax
	cmpl	-44(%rbp), %eax
	je	.LBB4_6
# BB#5:                                 # %if.then16
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-12(%rbp), %eax
	imull	-44(%rbp), %eax
	addl	-52(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -36(%rbp)
	movl	-44(%rbp), %ecx
	movl	-12(%rbp), %eax
	imull	%ecx, %eax
	addl	%eax, %ecx
	movslq	%ecx, %rdx
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rdx,4), %xmm0
	addl	-52(%rbp), %eax
	movslq	%eax, %rax
	vmovss	%xmm0, (%rcx,%rax,4)
	movl	-44(%rbp), %eax
	movl	-12(%rbp), %ecx
	imull	%eax, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rax
	movq	-8(%rbp), %rcx
	vmovss	-36(%rbp), %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
.LBB4_6:                                # %if.end
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-44(%rbp), %eax
	movl	-12(%rbp), %ecx
	imull	%eax, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI4_0(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -36(%rbp)
	movl	-44(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-16(%rbp), %edi
	subl	%ecx, %edi
	movl	-12(%rbp), %ecx
	imull	%eax, %ecx
	leal	1(%rcx,%rax), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	leaq	(%rcx,%rax,4), %rsi
	movl	$1, %edx
	callq	dscal
	movl	-48(%rbp), %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB4_7
	.align	16, 0x90
.LBB4_10:                               # %for.inc
                                        #   in Loop: Header=BB4_7 Depth=2
	movl	-44(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	%ecx, %edx
	imull	%eax, %edx
	leal	1(%rdx,%rax), %edx
	movslq	%edx, %r8
	imull	-40(%rbp), %ecx
	leal	1(%rax), %esi
	movq	-8(%rbp), %rdx
	movl	-16(%rbp), %edi
	subl	%esi, %edi
	leaq	(%rdx,%r8,4), %rsi
	leal	1(%rcx,%rax), %eax
	movslq	%eax, %rax
	leaq	(%rdx,%rax,4), %rcx
	vmovss	-36(%rbp), %xmm0
	movl	$1, %edx
	movl	$1, %r8d
	callq	daxpy
	incl	-40(%rbp)
.LBB4_7:                                # %for.cond46
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB4_12
# BB#8:                                 # %for.body49
                                        #   in Loop: Header=BB4_7 Depth=2
	movl	-12(%rbp), %eax
	imull	-40(%rbp), %eax
	addl	-52(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -36(%rbp)
	movl	-52(%rbp), %eax
	cmpl	-44(%rbp), %eax
	je	.LBB4_10
# BB#9:                                 # %if.then56
                                        #   in Loop: Header=BB4_7 Depth=2
	movl	-12(%rbp), %eax
	imull	-40(%rbp), %eax
	movl	-44(%rbp), %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rdx
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rdx,4), %xmm0
	addl	-52(%rbp), %eax
	movslq	%eax, %rax
	vmovss	%xmm0, (%rcx,%rax,4)
	movl	-12(%rbp), %eax
	imull	-40(%rbp), %eax
	addl	-44(%rbp), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	-36(%rbp), %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_11:                               # %if.else
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	-32(%rbp), %rax
	movl	-44(%rbp), %ecx
	movl	%ecx, (%rax)
	jmp	.LBB4_12
.LBB4_13:                               # %if.end86
	movl	-16(%rbp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx,%rax,4)
	movl	-16(%rbp), %eax
	leal	-1(%rax), %ecx
	imull	-12(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	-1(%rcx,%rax), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vucomisd	%xmm0, %xmm1
	jne	.LBB4_15
	jp	.LBB4_15
# BB#14:                                # %if.then100
	movl	-16(%rbp), %eax
	decl	%eax
	movq	-32(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB4_15:                               # %if.end102
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp31:
	.size	dgefa, .Ltmp31-dgefa
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.text
	.globl	dgesl
	.align	16, 0x90
	.type	dgesl,@function
dgesl:                                  # @dgesl
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	%r9d, -36(%rbp)
	movl	-16(%rbp), %eax
	decl	%eax
	movl	%eax, -56(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB5_1
# BB#10:                                # %if.else
	movl	$0, -44(%rbp)
	jmp	.LBB5_11
	.align	16, 0x90
.LBB5_12:                               # %for.inc65
                                        #   in Loop: Header=BB5_11 Depth=1
	movl	-44(%rbp), %edi
	movl	-12(%rbp), %eax
	imull	%edi, %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	leaq	(%rcx,%rax,4), %rsi
	movq	-32(%rbp), %rcx
	movl	$1, %edx
	movl	$1, %r8d
	callq	ddot
	vmovss	%xmm0, -40(%rbp)
	movslq	-44(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm1
	vsubss	%xmm0, %xmm1, %xmm0
	movl	-12(%rbp), %edx
	imull	%eax, %edx
	addl	%eax, %edx
	movslq	%edx, %rdx
	movq	-8(%rbp), %rsi
	vdivss	(%rsi,%rdx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-44(%rbp)
.LBB5_11:                               # %for.cond47
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB5_12
# BB#13:                                # %for.end67
	cmpl	$0, -56(%rbp)
	jle	.LBB5_19
# BB#14:                                # %if.then69
	movl	$1, -48(%rbp)
	jmp	.LBB5_15
	.align	16, 0x90
.LBB5_18:                               # %for.inc104
                                        #   in Loop: Header=BB5_15 Depth=1
	incl	-48(%rbp)
.LBB5_15:                               # %for.cond70
                                        # =>This Inner Loop Header: Depth=1
	movl	-48(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jge	.LBB5_19
# BB#16:                                # %for.body72
                                        #   in Loop: Header=BB5_15 Depth=1
	movl	-48(%rbp), %eax
	incl	%eax
	movl	-16(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -44(%rbp)
	movslq	-44(%rbp), %rax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -60(%rbp)        # 4-byte Spill
	movslq	%edx, %rdx
	movl	-16(%rbp), %edi
	subl	%edx, %edi
	leaq	(%rcx,%rdx,4), %rcx
	movl	-12(%rbp), %edx
	imull	%eax, %edx
	leal	1(%rdx,%rax), %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rdx
	leaq	(%rdx,%rax,4), %rsi
	movl	$1, %edx
	movl	$1, %r8d
	callq	ddot
	vmovss	-60(%rbp), %xmm1        # 4-byte Reload
	vaddss	%xmm0, %xmm1, %xmm0
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	vmovss	%xmm0, (%rax,%rcx,4)
	movslq	-44(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rbp)
	cmpl	-44(%rbp), %eax
	je	.LBB5_18
# BB#17:                                # %if.then94
                                        #   in Loop: Header=BB5_15 Depth=1
	movslq	-52(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -40(%rbp)
	movslq	-44(%rbp), %rcx
	movq	-32(%rbp), %rax
	vmovss	(%rax,%rcx,4), %xmm0
	movslq	-52(%rbp), %rcx
	vmovss	%xmm0, (%rax,%rcx,4)
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	vmovss	-40(%rbp), %xmm0
	vmovss	%xmm0, (%rax,%rcx,4)
	jmp	.LBB5_18
.LBB5_1:                                # %if.then
	cmpl	$0, -56(%rbp)
	jle	.LBB5_7
# BB#2:                                 # %if.then2
	movl	$0, -44(%rbp)
	jmp	.LBB5_3
	.align	16, 0x90
.LBB5_6:                                # %for.inc
                                        #   in Loop: Header=BB5_3 Depth=1
	movl	-44(%rbp), %ecx
	movl	-12(%rbp), %eax
	imull	%ecx, %eax
	leal	1(%rax,%rcx), %eax
	incl	%ecx
	movslq	%ecx, %rcx
	movq	-32(%rbp), %rdx
	movl	-16(%rbp), %edi
	subl	%ecx, %edi
	leaq	(%rdx,%rcx,4), %rcx
	movslq	%eax, %rax
	movq	-8(%rbp), %rdx
	leaq	(%rdx,%rax,4), %rsi
	vmovss	-40(%rbp), %xmm0
	movl	$1, %edx
	movl	$1, %r8d
	callq	daxpy
	incl	-44(%rbp)
.LBB5_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jge	.LBB5_7
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB5_3 Depth=1
	movslq	-44(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rbp)
	movslq	-52(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -40(%rbp)
	movl	-52(%rbp), %eax
	cmpl	-44(%rbp), %eax
	je	.LBB5_6
# BB#5:                                 # %if.then7
                                        #   in Loop: Header=BB5_3 Depth=1
	movslq	-44(%rbp), %rcx
	movq	-32(%rbp), %rax
	vmovss	(%rax,%rcx,4), %xmm0
	movslq	-52(%rbp), %rcx
	vmovss	%xmm0, (%rax,%rcx,4)
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	vmovss	-40(%rbp), %xmm0
	vmovss	%xmm0, (%rax,%rcx,4)
	jmp	.LBB5_6
.LBB5_7:                                # %if.end22
	movl	$0, -48(%rbp)
	jmp	.LBB5_8
	.align	16, 0x90
.LBB5_9:                                # %for.inc44
                                        #   in Loop: Header=BB5_8 Depth=1
	movl	-48(%rbp), %eax
	incl	%eax
	movl	-16(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -44(%rbp)
	movslq	-44(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	movl	-12(%rbp), %edx
	imull	%eax, %edx
	movq	-8(%rbp), %rsi
	addl	%eax, %edx
	movslq	%edx, %rdx
	vdivss	(%rsi,%rdx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	movslq	-44(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	vxorps	.LCPI5_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, -40(%rbp)
	movl	-44(%rbp), %edi
	movl	-12(%rbp), %eax
	imull	%edi, %eax
	movslq	%eax, %rax
	movq	-8(%rbp), %rcx
	leaq	(%rcx,%rax,4), %rsi
	movq	-32(%rbp), %rcx
	movl	$1, %edx
	movl	$1, %r8d
	callq	daxpy
	incl	-48(%rbp)
.LBB5_8:                                # %for.cond23
                                        # =>This Inner Loop Header: Depth=1
	movl	-48(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB5_9
.LBB5_19:                               # %if.end108
	addq	$64, %rsp
	popq	%rbp
	ret
.Ltmp37:
	.size	dgesl, .Ltmp37-dgesl
	.cfi_endproc

	.globl	dmxpy
	.align	16, 0x90
	.type	dmxpy,@function
dmxpy:                                  # @dmxpy
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp41:
	.cfi_def_cfa_offset 16
.Ltmp42:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp43:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
.Ltmp44:
	.cfi_offset %rbx, -40
.Ltmp45:
	.cfi_offset %r14, -32
.Ltmp46:
	.cfi_offset %r15, -24
	movl	%edi, -28(%rbp)
	movq	%rsi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movl	%ecx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	movl	%eax, -68(%rbp)
	testl	%eax, %eax
	jle	.LBB6_4
# BB#1:                                 # %if.then
	decl	-68(%rbp)
	movl	$0, -72(%rbp)
	jmp	.LBB6_2
	.align	16, 0x90
.LBB6_3:                                # %for.inc
                                        #   in Loop: Header=BB6_2 Depth=1
	movslq	-68(%rbp), %rcx
	movq	-56(%rbp), %rax
	vmovss	(%rax,%rcx,4), %xmm0
	movslq	-72(%rbp), %rax
	imull	-48(%rbp), %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	movq	-64(%rbp), %rdx
	vmulss	(%rdx,%rcx,4), %xmm0, %xmm0
	movq	-40(%rbp), %rcx
	vaddss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-72(%rbp)
.LBB6_2:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB6_3
.LBB6_4:                                # %if.end
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$30, %ecx
	addl	%eax, %ecx
	andl	$-4, %ecx
	subl	%ecx, %eax
	movl	%eax, -68(%rbp)
	cmpl	$2, %eax
	jl	.LBB6_8
# BB#5:                                 # %if.then12
	decl	-68(%rbp)
	movl	$0, -72(%rbp)
	jmp	.LBB6_6
	.align	16, 0x90
.LBB6_7:                                # %for.inc39
                                        #   in Loop: Header=BB6_6 Depth=1
	movslq	-68(%rbp), %rsi
	movl	-48(%rbp), %ecx
	movq	-56(%rbp), %rdx
	vmovss	(%rdx,%rsi,4), %xmm0
	movl	%ecx, %edi
	imull	%esi, %edi
	movslq	-72(%rbp), %rax
	addl	%eax, %edi
	movslq	%edi, %rbx
	leal	-1(%rsi), %esi
	movslq	%esi, %rsi
	movq	-64(%rbp), %rdi
	vmulss	(%rdi,%rbx,4), %xmm0, %xmm0
	vmovss	(%rdx,%rsi,4), %xmm1
	imull	%ecx, %esi
	addl	%eax, %esi
	movslq	%esi, %rcx
	vmulss	(%rdi,%rcx,4), %xmm1, %xmm1
	movq	-40(%rbp), %rcx
	vaddss	(%rcx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-72(%rbp)
.LBB6_6:                                # %for.cond14
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB6_7
.LBB6_8:                                # %if.end42
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%eax, %ecx
	andl	$-8, %ecx
	subl	%ecx, %eax
	movl	%eax, -68(%rbp)
	cmpl	$4, %eax
	jl	.LBB6_12
# BB#9:                                 # %if.then45
	decl	-68(%rbp)
	movl	$0, -72(%rbp)
	jmp	.LBB6_10
	.align	16, 0x90
.LBB6_11:                               # %for.inc92
                                        #   in Loop: Header=BB6_10 Depth=1
	movslq	-68(%rbp), %rdx
	leal	-2(%rdx), %esi
	movl	-48(%rbp), %ecx
	movl	%ecx, %edi
	imull	%esi, %edi
	movslq	-72(%rbp), %rax
	addl	%eax, %edi
	leal	-1(%rdx), %ebx
	movslq	%ebx, %rbx
	movslq	%esi, %r8
	movq	-56(%rbp), %rsi
	vmovss	(%rsi,%r8,4), %xmm1
	movslq	%edi, %r8
	vmovss	(%rsi,%rbx,4), %xmm0
	imull	%ecx, %ebx
	addl	%eax, %ebx
	movslq	%ebx, %r9
	leal	-3(%rdx), %edi
	movslq	%edi, %rbx
	movq	-64(%rbp), %rdi
	vmulss	(%rdi,%r9,4), %xmm0, %xmm0
	vmulss	(%rdi,%r8,4), %xmm1, %xmm1
	vmovss	(%rsi,%rbx,4), %xmm2
	imull	%ecx, %ebx
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	vmulss	(%rdi,%rbx,4), %xmm2, %xmm2
	movq	-40(%rbp), %rbx
	vaddss	(%rbx,%rax,4), %xmm2, %xmm3
	vmovss	(%rsi,%rdx,4), %xmm2
	vaddss	%xmm1, %xmm3, %xmm1
	imull	%edx, %ecx
	vaddss	%xmm0, %xmm1, %xmm0
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	vmulss	(%rdi,%rcx,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%rbx,%rax,4)
	incl	-72(%rbp)
.LBB6_10:                               # %for.cond47
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB6_11
.LBB6_12:                               # %if.end95
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$28, %ecx
	addl	%eax, %ecx
	andl	$-16, %ecx
	subl	%ecx, %eax
	movl	%eax, -68(%rbp)
	cmpl	$8, %eax
	jl	.LBB6_16
# BB#13:                                # %if.then98
	decl	-68(%rbp)
	movl	$0, -72(%rbp)
	jmp	.LBB6_14
	.align	16, 0x90
.LBB6_15:                               # %for.inc185
                                        #   in Loop: Header=BB6_14 Depth=1
	movslq	-68(%rbp), %rdx
	leal	-7(%rdx), %eax
	movslq	%eax, %rdi
	movl	-48(%rbp), %r11d
	movq	-56(%rbp), %rsi
	vmovss	(%rsi,%rdi,4), %xmm0
	imull	%r11d, %edi
	movslq	-72(%rbp), %rax
	addl	%eax, %edi
	movslq	%edi, %rcx
	leal	-6(%rdx), %ebx
	movq	-64(%rbp), %rdi
	vmulss	(%rdi,%rcx,4), %xmm0, %xmm0
	movslq	%ebx, %rcx
	vmovss	(%rsi,%rcx,4), %xmm1
	imull	%r11d, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	movq	-40(%rbp), %r8
	vmulss	(%rdi,%rcx,4), %xmm1, %xmm1
	vaddss	(%r8,%rax,4), %xmm0, %xmm0
	leal	-5(%rdx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rsi,%rcx,4), %xmm2
	imull	%r11d, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	(%rdi,%rcx,4), %xmm2, %xmm1
	leal	-4(%rdx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rsi,%rcx,4), %xmm2
	imull	%r11d, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	leal	-2(%rdx), %r10d
	vaddss	%xmm1, %xmm0, %xmm1
	leal	-3(%rdx), %ebx
	vmulss	(%rdi,%rcx,4), %xmm2, %xmm2
	movslq	%ebx, %rbx
	vmovss	(%rsi,%rbx,4), %xmm0
	movl	%r11d, %ecx
	imull	%r10d, %ecx
	addl	%eax, %ecx
	imull	%r11d, %ebx
	addl	%eax, %ebx
	movslq	%ebx, %r9
	movslq	%ecx, %rbx
	movslq	%r10d, %rcx
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	(%rsi,%rcx,4), %xmm3
	vmovss	(%rsi,%rdx,4), %xmm2
	movl	%r11d, %ecx
	imull	%edx, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	vmulss	(%rdi,%rcx,4), %xmm2, %xmm2
	vmulss	(%rdi,%rbx,4), %xmm3, %xmm3
	vmulss	(%rdi,%r9,4), %xmm0, %xmm0
	leal	-1(%rdx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rsi,%rcx,4), %xmm4
	imull	%r11d, %ecx
	addl	%eax, %ecx
	vaddss	%xmm0, %xmm1, %xmm0
	movslq	%ecx, %rcx
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	(%rdi,%rcx,4), %xmm4, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	%xmm0, (%r8,%rax,4)
	incl	-72(%rbp)
.LBB6_14:                               # %for.cond100
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB6_15
.LBB6_16:                               # %if.end188
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$28, %ecx
	addl	%eax, %ecx
	andl	$-16, %ecx
	movl	%eax, %edx
	subl	%ecx, %edx
	addl	$16, %edx
	movl	%edx, -76(%rbp)
	negl	%ecx
	leal	15(%rax,%rcx), %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB6_17
	.align	16, 0x90
.LBB6_21:                               # %for.inc363
                                        #   in Loop: Header=BB6_17 Depth=1
	addl	$16, -68(%rbp)
.LBB6_17:                               # %for.cond192
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_19 Depth 2
	movl	-68(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB6_22
# BB#18:                                # %for.body194
                                        #   in Loop: Header=BB6_17 Depth=1
	movl	$0, -72(%rbp)
	jmp	.LBB6_19
	.align	16, 0x90
.LBB6_20:                               # %for.inc360
                                        #   in Loop: Header=BB6_19 Depth=2
	movslq	-68(%rbp), %r15
	leal	-15(%r15), %ecx
	movl	-48(%rbp), %edx
	movl	%edx, %eax
	imull	%ecx, %eax
	movslq	-72(%rbp), %r11
	addl	%r11d, %eax
	movslq	%ecx, %rcx
	movq	-56(%rbp), %r10
	vmovss	(%r10,%rcx,4), %xmm1
	movslq	%eax, %rax
	leal	-12(%r15), %ecx
	leal	-11(%r15), %edi
	leal	-14(%r15), %esi
	movslq	%esi, %rsi
	vmovss	(%r10,%rsi,4), %xmm0
	movq	-64(%rbp), %r14
	vmulss	(%r14,%rax,4), %xmm1, %xmm4
	movslq	%edi, %rax
	vmovss	(%r10,%rax,4), %xmm1
	movslq	%ecx, %rdi
	vmovss	(%r10,%rdi,4), %xmm3
	leal	-13(%r15), %ecx
	movslq	%ecx, %rbx
	vmovss	(%r10,%rbx,4), %xmm6
	imull	%edx, %esi
	addl	%r11d, %esi
	movslq	%esi, %rcx
	vmulss	(%r14,%rcx,4), %xmm0, %xmm0
	leal	-10(%r15), %ecx
	movslq	%ecx, %rsi
	vmovss	(%r10,%rsi,4), %xmm2
	imull	%edx, %ebx
	addl	%r11d, %ebx
	imull	%edx, %edi
	addl	%r11d, %edi
	imull	%edx, %eax
	addl	%r11d, %eax
	movslq	%eax, %r9
	movslq	%edi, %rax
	movslq	%ebx, %rcx
	vmovss	(%r10,%r15,4), %xmm5
	movq	-40(%rbp), %r8
	vaddss	(%r8,%r11,4), %xmm4, %xmm4
	imull	%edx, %esi
	vmulss	(%r14,%rcx,4), %xmm6, %xmm6
	leal	-1(%r15), %ecx
	vmulss	(%r14,%rax,4), %xmm3, %xmm9
	movslq	%ecx, %rax
	vmovss	(%r10,%rax,4), %xmm3
	leal	-4(%r15), %ecx
	vmulss	(%r14,%r9,4), %xmm1, %xmm8
	movslq	%ecx, %r9
	vmovss	(%r10,%r9,4), %xmm1
	movl	%edx, %ecx
	imull	%r15d, %ecx
	addl	%r11d, %ecx
	movslq	%ecx, %rdi
	imull	%edx, %eax
	addl	%r11d, %esi
	movslq	%esi, %rcx
	vmulss	(%r14,%rcx,4), %xmm2, %xmm11
	leal	-3(%r15), %ecx
	movslq	%ecx, %rsi
	vmovss	(%r10,%rsi,4), %xmm7
	vaddss	%xmm0, %xmm4, %xmm0
	addl	%r11d, %eax
	imull	%edx, %r9d
	vmulss	(%r14,%rdi,4), %xmm5, %xmm10
	leal	-2(%r15), %edi
	movl	%edx, %ecx
	imull	%edi, %ecx
	addl	%r11d, %ecx
	imull	%edx, %esi
	addl	%r11d, %esi
	movslq	%edi, %rdi
	vmovss	(%r10,%rdi,4), %xmm4
	vaddss	%xmm6, %xmm0, %xmm2
	movslq	%esi, %rdi
	movslq	%ecx, %rbx
	addl	%r11d, %r9d
	movslq	%eax, %rax
	vmulss	(%r14,%rax,4), %xmm3, %xmm12
	leal	-5(%r15), %eax
	movl	%edx, %ecx
	imull	%eax, %ecx
	movslq	%eax, %rax
	vmovss	(%r10,%rax,4), %xmm0
	vaddss	%xmm9, %xmm2, %xmm2
	movslq	%r9d, %rax
	addl	%r11d, %ecx
	movslq	%ecx, %rsi
	vmulss	(%r14,%rbx,4), %xmm4, %xmm5
	leal	-7(%r15), %ebx
	vmulss	(%r14,%rdi,4), %xmm7, %xmm6
	movl	%edx, %ecx
	imull	%ebx, %ecx
	addl	%r11d, %ecx
	vmulss	(%r14,%rax,4), %xmm1, %xmm4
	leal	-9(%r15), %eax
	movl	%edx, %edi
	imull	%eax, %edi
	addl	%r11d, %edi
	movslq	%ebx, %rbx
	vmovss	(%r10,%rbx,4), %xmm7
	vaddss	%xmm8, %xmm2, %xmm2
	movslq	%edi, %rdi
	movslq	%ecx, %rcx
	vmulss	(%r14,%rsi,4), %xmm0, %xmm1
	leal	-6(%r15), %esi
	movslq	%esi, %rsi
	vmovss	(%r10,%rsi,4), %xmm0
	imull	%edx, %esi
	addl	%r11d, %esi
	movslq	%esi, %rsi
	movslq	%eax, %rax
	vaddss	%xmm11, %xmm2, %xmm3
	vmulss	(%r14,%rsi,4), %xmm0, %xmm0
	vmulss	(%r14,%rcx,4), %xmm7, %xmm2
	vmovss	(%r10,%rax,4), %xmm7
	vmulss	(%r14,%rdi,4), %xmm7, %xmm7
	leal	-8(%r15), %eax
	imull	%eax, %edx
	addl	%r11d, %edx
	movslq	%edx, %rcx
	movslq	%eax, %rax
	vaddss	%xmm7, %xmm3, %xmm3
	vmovss	(%r10,%rax,4), %xmm7
	vmulss	(%r14,%rcx,4), %xmm7, %xmm7
	vaddss	%xmm7, %xmm3, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vaddss	%xmm5, %xmm0, %xmm0
	vaddss	%xmm12, %xmm0, %xmm0
	vaddss	%xmm10, %xmm0, %xmm0
	vmovss	%xmm0, (%r8,%r11,4)
	incl	-72(%rbp)
.LBB6_19:                               # %for.cond195
                                        #   Parent Loop BB6_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-72(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB6_21
	jmp	.LBB6_20
.LBB6_22:                               # %for.end365
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp47:
	.size	dmxpy, .Ltmp47-dmxpy
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI7_1:
	.quad	4607182418800017408     # double 1
	.text
	.globl	epslon
	.align	16, 0x90
	.type	epslon,@function
epslon:                                 # @epslon
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
.Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp52:
	.cfi_def_cfa_register %rbp
	vmovss	%xmm0, -4(%rbp)
	movl	$1068149419, -8(%rbp)   # imm = 0x3FAAAAAB
	movl	$0, -20(%rbp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI7_1(%rip), %xmm1
	vmovsd	.LCPI7_0(%rip), %xmm2
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %while.body
                                        #   in Loop: Header=BB7_1 Depth=1
	vmovss	-8(%rbp), %xmm3
	vcvtss2sd	%xmm3, %xmm0, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmovss	%xmm3, -12(%rbp)
	vaddss	%xmm3, %xmm3, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovss	%xmm3, -16(%rbp)
	vmovss	-16(%rbp), %xmm3
	vcvtss2sd	%xmm3, %xmm0, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm3
	vandpd	%xmm2, %xmm3, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmovss	%xmm3, -20(%rbp)
.LBB7_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	vmovss	-20(%rbp), %xmm3
	vcvtss2sd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm0, %xmm3
	jne	.LBB7_3
	jp	.LBB7_3
	jmp	.LBB7_2
.LBB7_3:                                # %while.end
	vmovss	-20(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	-4(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	.LCPI7_0(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	popq	%rbp
	ret
.Ltmp53:
	.size	epslon, .Ltmp53-epslon
	.cfi_endproc

	.globl	print_time
	.align	16, 0x90
	.type	print_time,@function
print_time:                             # @print_time
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp58:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	popq	%rbp
	ret
.Ltmp59:
	.size	print_time, .Ltmp59-print_time
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_0:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.text
	.globl	idamax
	.align	16, 0x90
	.type	idamax,@function
idamax:                                 # @idamax
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
.Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp64:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	cmpl	$0, -8(%rbp)
	jle	.LBB9_1
# BB#2:                                 # %if.end
	cmpl	$1, -8(%rbp)
	jne	.LBB9_4
# BB#3:                                 # %if.then2
	movl	$0, -4(%rbp)
	jmp	.LBB9_16
.LBB9_1:                                # %if.then
	movl	$-1, -4(%rbp)
	jmp	.LBB9_16
.LBB9_4:                                # %if.end3
	cmpl	$1, -20(%rbp)
	je	.LBB9_10
# BB#5:                                 # %if.then5
	movl	$1, -32(%rbp)
	movq	-16(%rbp), %rax
	vmovss	(%rax), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, -32(%rbp)
	movl	$1, -28(%rbp)
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_6
	.align	16, 0x90
.LBB9_9:                                # %for.inc
                                        #   in Loop: Header=BB9_6 Depth=1
	movl	-20(%rbp), %eax
	addl	%eax, -32(%rbp)
	incl	-28(%rbp)
.LBB9_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB9_15
# BB#7:                                 # %for.body
                                        #   in Loop: Header=BB9_6 Depth=1
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	movslq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vucomisd	%xmm1, %xmm2
	jbe	.LBB9_9
# BB#8:                                 # %if.then15
                                        #   in Loop: Header=BB9_6 Depth=1
	movl	-28(%rbp), %eax
	movl	%eax, -36(%rbp)
	movslq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, -24(%rbp)
	jmp	.LBB9_9
.LBB9_10:                               # %if.else
	movl	$0, -36(%rbp)
	movq	-16(%rbp), %rax
	vmovss	(%rax), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -24(%rbp)
	movl	$1, -28(%rbp)
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_11
	.align	16, 0x90
.LBB9_14:                               # %for.inc45
                                        #   in Loop: Header=BB9_11 Depth=1
	incl	-28(%rbp)
.LBB9_11:                               # %for.cond27
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB9_15
# BB#12:                                # %for.body30
                                        #   in Loop: Header=BB9_11 Depth=1
	vmovss	-24(%rbp), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vucomisd	%xmm1, %xmm2
	jbe	.LBB9_14
# BB#13:                                # %if.then38
                                        #   in Loop: Header=BB9_11 Depth=1
	movl	-28(%rbp), %eax
	movl	%eax, -36(%rbp)
	movslq	-28(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, -24(%rbp)
	jmp	.LBB9_14
.LBB9_15:                               # %if.end48
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB9_16:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp65:
	.size	idamax, .Ltmp65-idamax
	.cfi_endproc

	.globl	dscal
	.align	16, 0x90
	.type	dscal,@function
dscal:                                  # @dscal
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp68:
	.cfi_def_cfa_offset 16
.Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp70:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	vmovss	%xmm0, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.LBB10_8
# BB#1:                                 # %if.end
	cmpl	$1, -20(%rbp)
	je	.LBB10_5
# BB#2:                                 # %if.then2
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	$0, -24(%rbp)
	jmp	.LBB10_3
	.align	16, 0x90
.LBB10_4:                               # %for.inc
                                        #   in Loop: Header=BB10_3 Depth=1
	movslq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	-8(%rbp), %xmm0
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	movl	-20(%rbp), %eax
	addl	%eax, -24(%rbp)
.LBB10_3:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB10_8
	jmp	.LBB10_4
.LBB10_5:                               # %if.end7
	movl	$0, -24(%rbp)
	jmp	.LBB10_6
	.align	16, 0x90
.LBB10_7:                               # %for.inc16
                                        #   in Loop: Header=BB10_6 Depth=1
	movslq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	-8(%rbp), %xmm0
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-24(%rbp)
.LBB10_6:                               # %for.cond8
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB10_7
.LBB10_8:                               # %for.end17
	popq	%rbp
	ret
.Ltmp71:
	.size	dscal, .Ltmp71-dscal
	.cfi_endproc

	.globl	daxpy
	.align	16, 0x90
	.type	daxpy,@function
daxpy:                                  # @daxpy
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp74:
	.cfi_def_cfa_offset 16
.Ltmp75:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp76:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	vmovss	%xmm0, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -52(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.LBB11_14
# BB#1:                                 # %if.end
	vmovss	-8(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB11_2
	jnp	.LBB11_14
.LBB11_2:                               # %if.end4
	cmpl	$1, -20(%rbp)
	jne	.LBB11_4
# BB#3:                                 # %lor.lhs.false
	cmpl	$1, -36(%rbp)
	je	.LBB11_11
.LBB11_4:                               # %if.then9
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.LBB11_6
# BB#5:                                 # %if.then12
	movl	$1, %eax
	subl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, -44(%rbp)
.LBB11_6:                               # %if.end13
	cmpl	$0, -36(%rbp)
	jns	.LBB11_8
# BB#7:                                 # %if.then16
	movl	$1, %eax
	subl	-4(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
.LBB11_8:                               # %if.end20
	movl	$0, -40(%rbp)
	jmp	.LBB11_9
	.align	16, 0x90
.LBB11_10:                              # %for.inc
                                        #   in Loop: Header=BB11_9 Depth=1
	movslq	-44(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	-8(%rbp), %xmm0
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	movslq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	vaddss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	movl	-20(%rbp), %eax
	addl	%eax, -44(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, -48(%rbp)
	incl	-40(%rbp)
.LBB11_9:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB11_14
	jmp	.LBB11_10
.LBB11_11:                              # %if.end31
	movl	$0, -40(%rbp)
	jmp	.LBB11_12
	.align	16, 0x90
.LBB11_13:                              # %for.inc44
                                        #   in Loop: Header=BB11_12 Depth=1
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	-8(%rbp), %xmm0
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	movq	-32(%rbp), %rcx
	vaddss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	-40(%rbp)
.LBB11_12:                              # %for.cond32
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB11_13
.LBB11_14:                              # %return
	popq	%rbp
	ret
.Ltmp77:
	.size	daxpy, .Ltmp77-daxpy
	.cfi_endproc

	.globl	ddot
	.align	16, 0x90
	.type	ddot,@function
ddot:                                   # @ddot
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp80:
	.cfi_def_cfa_offset 16
.Ltmp81:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp82:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -40(%rbp)
	cmpl	$0, -8(%rbp)
	jg	.LBB12_2
# BB#1:                                 # %if.then
	movl	$0, -4(%rbp)
	jmp	.LBB12_15
.LBB12_2:                               # %if.end
	cmpl	$1, -20(%rbp)
	jne	.LBB12_4
# BB#3:                                 # %lor.lhs.false
	cmpl	$1, -36(%rbp)
	je	.LBB12_11
.LBB12_4:                               # %if.then3
	movl	$0, -48(%rbp)
	movl	$0, -52(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.LBB12_6
# BB#5:                                 # %if.then5
	movl	$1, %eax
	subl	-8(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, -48(%rbp)
.LBB12_6:                               # %if.end6
	cmpl	$0, -36(%rbp)
	jns	.LBB12_8
# BB#7:                                 # %if.then8
	movl	$1, %eax
	subl	-8(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	%eax, -52(%rbp)
.LBB12_8:                               # %if.end12
	movl	$0, -44(%rbp)
	jmp	.LBB12_9
	.align	16, 0x90
.LBB12_10:                              # %for.body
                                        #   in Loop: Header=BB12_9 Depth=1
	movslq	-48(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	movslq	-52(%rbp), %rax
	movq	-32(%rbp), %rcx
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	vaddss	-40(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -40(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, -48(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, -52(%rbp)
	incl	-44(%rbp)
.LBB12_9:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB12_14
	jmp	.LBB12_10
.LBB12_11:                              # %if.end20
	movl	$0, -44(%rbp)
	jmp	.LBB12_12
	.align	16, 0x90
.LBB12_13:                              # %for.body23
                                        #   in Loop: Header=BB12_12 Depth=1
	movslq	-44(%rbp), %rax
	movq	-16(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm0
	movq	-32(%rbp), %rcx
	vmulss	(%rcx,%rax,4), %xmm0, %xmm0
	vaddss	-40(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -40(%rbp)
	incl	-44(%rbp)
.LBB12_12:                              # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB12_13
.LBB12_14:                              # %for.end32
	vmovss	-40(%rbp), %xmm0
	vmovss	%xmm0, -4(%rbp)
.LBB12_15:                              # %return
	vmovss	-4(%rbp), %xmm0
	popq	%rbp
	ret
.Ltmp83:
	.size	ddot, .Ltmp83-ddot
	.cfi_endproc

	.type	main.aa,@object         # @main.aa
	.local	main.aa
	.comm	main.aa,160000,16
	.type	main.a,@object          # @main.a
	.local	main.a
	.comm	main.a,160800,16
	.type	main.b,@object          # @main.b
	.local	main.b
	.comm	main.b,800,16
	.type	main.x,@object          # @main.x
	.local	main.x
	.comm	main.x,800,16
	.type	main.ipvt,@object       # @main.ipvt
	.local	main.ipvt
	.comm	main.ipvt,800,16
	.type	main.n,@object          # @main.n
	.local	main.n
	.comm	main.n,4,4
	.type	main.i,@object          # @main.i
	.local	main.i
	.comm	main.i,4,4
	.type	main.j,@object          # @main.j
	.local	main.j
	.comm	main.j,4,4
	.type	main.ntimes,@object     # @main.ntimes
	.local	main.ntimes
	.comm	main.ntimes,4,4
	.type	main.info,@object       # @main.info
	.local	main.info
	.comm	main.info,4,4
	.type	main.lda,@object        # @main.lda
	.local	main.lda
	.comm	main.lda,4,4
	.type	main.ldaa,@object       # @main.ldaa
	.local	main.ldaa
	.comm	main.ldaa,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "INSERT COMPILER NAME HERE"
	.size	.L.str, 26

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "INSERT OPTIMISATION OPTIONS HERE"
	.size	.L.str1, 33

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Rolled "
	.size	.L.str2, 8

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "Single "
	.size	.L.str3, 8

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "Precision Linpack Benchmark - PC Version in 'C/C++'\n\n"
	.size	.L.str4, 54

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "Compiler     %s\n"
	.size	.L.str5, 17

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "Optimisation %s\n\n"
	.size	.L.str6, 18

	.type	atime,@object           # @atime
	.local	atime
	.comm	atime,540,16
	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "norm resid      resid           machep"
	.size	.L.str7, 39

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "         x[0]-1          x[n-1]-1\n"
	.size	.L.str8, 35

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	 "%6.1f %17.8e%17.8e%17.8e%17.8e\n\n"
	.size	.L.str9, 33

	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	 "Times are reported for matrices of order        %5d\n"
	.size	.L.str10, 53

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "1 pass times for array with leading dimension of%5d\n\n"
	.size	.L.str11, 54

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	 "      dgefa      dgesl      total     Mflops       unit"
	.size	.L.str12, 56

	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	 "      ratio\n"
	.size	.L.str13, 13

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	 "\nCalculating matgen overhead\n"
	.size	.L.str14, 30

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	 "%10d times %6.2f seconds\n"
	.size	.L.str15, 26

	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	 "Overhead for 1 matgen %12.5f seconds\n\n"
	.size	.L.str16, 39

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	 "Calculating matgen/dgefa passes for 5 seconds\n"
	.size	.L.str17, 47

	.type	.L.str18,@object        # @.str18
.L.str18:
	.asciz	 "Passes used %10d \n\n"
	.size	.L.str18, 20

	.type	.L.str19,@object        # @.str19
.L.str19:
	.asciz	 "Times for array with leading dimension of%4d\n\n"
	.size	.L.str19, 47

	.type	.L.str20,@object        # @.str20
.L.str20:
	.asciz	 "Average                          %11.2f\n"
	.size	.L.str20, 41

	.type	.L.str21,@object        # @.str21
.L.str21:
	.asciz	 "\nCalculating matgen2 overhead\n"
	.size	.L.str21, 31


	.section	".note.GNU-stack","",@progbits
