	.file	"test/linpack-pc.mcpre.bc"
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
	callq	clock
	vcvtsi2ssq	%rax, %xmm0, %xmm0
	vdivss	.LCPI0_0(%rip), %xmm0, %xmm0
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
.LCPI2_3:
	.quad	4696837146684686336     # double 1.0E+6
.LCPI2_4:
	.quad	4611686018427387904     # double 2
.LCPI2_5:
	.quad	4617315517961601024     # double 5
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_1:
	.long	1030053954              # float 0.056000002
.LCPI2_2:
	.long	1065353216              # float 1
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_6:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI2_7:
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$776, %rsp              # imm = 0x308
.Ltmp18:
	.cfi_offset %rbx, -40
.Ltmp19:
	.cfi_offset %r14, -32
.Ltmp20:
	.cfi_offset %r15, -24
	leaq	-752(%rbp), %rdi
	xorl	%esi, %esi
	movl	$720, %edx              # imm = 0x2D0
	callq	memset
	movb	$32, -752(%rbp)
	movl	$201, main.lda(%rip)
	movl	$200, main.ldaa(%rip)
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
	movq	stderr(%rip), %rdi
	movl	$.L.str5, %esi
	movl	$.L.str, %edx
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str6, %esi
	movl	$.L.str1, %edx
	xorb	%al, %al
	callq	fprintf
	leaq	-28(%rbp), %r8
	movl	main.lda(%rip), %esi
	movl	main.n(%rip), %ebx
	movl	$main.a, %edi
	movl	%ebx, %edx
	movl	$main.b, %ecx
	callq	matgen
	callq	second
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	callq	second
	vsubss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, atime(%rip)
	callq	second
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	movl	%ebx, %eax
	imull	%eax, %eax
	imull	%eax, %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -768(%rbp)       # 8-byte Spill
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -776(%rbp)       # 8-byte Spill
	callq	second
	vsubss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, atime+60(%rip)
	vmovsd	-768(%rbp), %xmm1       # 8-byte Reload
	vaddsd	-776(%rbp), %xmm1, %xmm1 # 8-byte Folded Reload
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, -780(%rbp)       # 4-byte Spill
	vaddss	atime(%rip), %xmm0, %xmm0
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
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
# BB#3:                                 # %for.end.split
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	leaq	-28(%rbp), %r8
	movl	$main.a, %edi
	movl	$main.b, %ecx
	callq	matgen
	vmovss	-768(%rbp), %xmm0       # 4-byte Reload
	vdivss	.LCPI2_1(%rip), %xmm0, %xmm0
	vmovss	%xmm0, -776(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	vmovss	.LCPI2_7(%rip), %xmm0
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
	movl	$0, main.i(%rip)
	vxorps	%xmm3, %xmm3, %xmm3
	vmovsd	.LCPI2_6(%rip), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_12:                               # %for.inc66
                                        #   in Loop: Header=BB2_7 Depth=1
	incl	main.i(%rip)
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
.LBB2_7:                                # %for.end31
                                        # =>This Inner Loop Header: Depth=1
	vmovss	%xmm1, -760(%rbp)       # 4-byte Spill
	movl	main.i(%rip), %eax
	cmpl	main.n(%rip), %eax
	jge	.LBB2_13
# BB#8:                                 # %for.body35
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm3, %xmm3, %xmm1
	vucomisd	%xmm2, %xmm1
	ja	.LBB2_10
# BB#9:                                 # %cond.false
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
.LBB2_10:                               # %cond.end
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vcvtsd2ss	%xmm1, %xmm1, %xmm3
	vmovss	-760(%rbp), %xmm1       # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm2, %xmm1
	ja	.LBB2_12
# BB#11:                                # %cond.false58
                                        #   in Loop: Header=BB2_7 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	jmp	.LBB2_12
.LBB2_13:                               # %for.end68
	vmovss	.LCPI2_2(%rip), %xmm0
	vmovss	%xmm3, -784(%rbp)       # 4-byte Spill
	callq	epslon
	vmovss	%xmm0, -788(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmulss	-28(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -792(%rbp)       # 4-byte Spill
	decl	%eax
	movslq	%eax, %rax
	vmovss	main.x(,%rax,4), %xmm0
	vmovss	%xmm0, -796(%rbp)       # 4-byte Spill
	vmovss	main.x(%rip), %xmm0
	vmovss	%xmm0, -800(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str7, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str8, %esi
	xorb	%al, %al
	callq	fprintf
	vmovss	-792(%rbp), %xmm0       # 4-byte Reload
	vmulss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	-788(%rbp), %xmm6       # 4-byte Reload
	vmulss	%xmm6, %xmm0, %xmm0
	vmovss	.LCPI2_2(%rip), %xmm2
	vmovss	-796(%rbp), %xmm1       # 4-byte Reload
	vsubss	%xmm2, %xmm1, %xmm1
	vmovss	-800(%rbp), %xmm3       # 4-byte Reload
	vsubss	%xmm2, %xmm3, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm2, %xmm2, %xmm3
	vcvtss2sd	%xmm1, %xmm1, %xmm4
	vmovss	-784(%rbp), %xmm5       # 4-byte Reload
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm5, %xmm5, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtss2sd	%xmm6, %xmm6, %xmm2
	vdivss	%xmm0, %xmm5, %xmm0
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
	vmovss	-768(%rbp), %xmm2       # 4-byte Reload
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovss	%xmm2, atime+120(%rip)
	jbe	.LBB2_15
# BB#14:                                # %if.then
	vmovss	-780(%rbp), %xmm1       # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	.LCPI2_3(%rip), %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm1
	vmovsd	.LCPI2_4(%rip), %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(%rip)
	vmovss	atime+180(%rip), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+240(%rip)
	jmp	.LBB2_16
.LBB2_15:                               # %if.else
	movl	$0, atime+180(%rip)
	movl	$0, atime+240(%rip)
.LBB2_16:                               # %if.end
	vmovss	-776(%rbp), %xmm0       # 4-byte Reload
	vmovss	%xmm0, atime+300(%rip)
	xorl	%edi, %edi
	callq	print_time
	movq	stderr(%rip), %rdi
	movl	$.L.str14, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$100, %r14d
	movl	$-3, %r15d
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_17:                               # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_18 Depth 2
	callq	second
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	incl	%r15d
	jmp	.LBB2_18
	.align	16, 0x90
.LBB2_19:                               # %for.inc111
                                        #   in Loop: Header=BB2_18 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	incl	main.i(%rip)
.LBB2_18:                               # %for.cond107
                                        #   Parent Loop BB2_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%r14d, main.i(%rip)
	jl	.LBB2_19
# BB#20:                                # %for.end113.split.split
                                        #   in Loop: Header=BB2_17 Depth=1
	callq	second
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	movl	%r14d, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	testl	%r15d, %r15d
	jns	.LBB2_22
# BB#21:                                # %if.then119
                                        #   in Loop: Header=BB2_17 Depth=1
	addl	%r14d, %r14d
.LBB2_22:                               # %do.cond
                                        #   in Loop: Header=BB2_17 Depth=1
	testl	%r15d, %r15d
	js	.LBB2_17
# BB#23:                                # %do.end
	vmovss	-768(%rbp), %xmm0       # 4-byte Reload
	vsubss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str17, %esi
	xorb	%al, %al
	callq	fprintf
	vcvtsi2sdl	%r14d, %xmm0, %xmm0
	vmovss	-760(%rbp), %xmm1       # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	$100, main.ntimes(%rip)
	movl	$-3, %r15d
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_24:                               # %do.body130
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_25 Depth 2
	callq	second
	movl	$0, main.i(%rip)
	incl	%r15d
	jmp	.LBB2_25
	.align	16, 0x90
.LBB2_26:                               # %for.inc137
                                        #   in Loop: Header=BB2_25 Depth=2
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
.LBB2_25:                               # %for.cond133
                                        #   Parent Loop BB2_24 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_26
# BB#27:                                # %for.end139
                                        #   in Loop: Header=BB2_24 Depth=1
	callq	second
	movl	main.ntimes(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	testl	%r15d, %r15d
	jns	.LBB2_29
# BB#28:                                # %if.then145
                                        #   in Loop: Header=BB2_24 Depth=1
	shll	main.ntimes(%rip)
.LBB2_29:                               # %do.cond148
                                        #   in Loop: Header=BB2_24 Depth=1
	testl	%r15d, %r15d
	js	.LBB2_24
# BB#30:                                # %do.end151
	movl	$1000, main.ntimes(%rip) # imm = 0x3E8
	movb	$1, %al
	testb	%al, %al
	jne	.LBB2_32
# BB#31:                                # %if.then154
	movl	$1, main.ntimes(%rip)
.LBB2_32:                               # %if.end155
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
	movl	main.ntimes(%rip), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmulss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, -776(%rbp)       # 4-byte Spill
	movl	$0, atime+204(%rip)
	movl	$1, main.j(%rip)
	leaq	-28(%rbp), %rbx
	vmovss	-780(%rbp), %xmm0       # 4-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -760(%rbp)       # 8-byte Spill
	jmp	.LBB2_33
	.align	16, 0x90
.LBB2_40:                               # %for.inc222
                                        #   in Loop: Header=BB2_33 Depth=1
	callq	second
	vsubss	-768(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmulsd	.LCPI2_3(%rip), %xmm1, %xmm1
	vmovsd	-760(%rbp), %xmm2       # 8-byte Reload
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovss	%xmm0, atime+120(,%rax,4)
	movslq	main.j(%rip), %rax
	vdivss	.LCPI2_1(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmovsd	.LCPI2_4(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+240(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+300(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+204(%rip), %xmm0
	vaddss	atime+180(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, atime+204(%rip)
	movl	main.j(%rip), %edi
	callq	print_time
	incl	main.j(%rip)
.LBB2_33:                               # %for.cond162
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_35 Depth 2
                                        #     Child Loop BB2_38 Depth 2
	cmpl	$5, main.j(%rip)
	jg	.LBB2_41
# BB#34:                                # %for.body165
                                        #   in Loop: Header=BB2_33 Depth=1
	callq	second
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	jmp	.LBB2_35
	.align	16, 0x90
.LBB2_36:                               # %for.inc171
                                        #   in Loop: Header=BB2_35 Depth=2
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
.LBB2_35:                               # %for.cond167
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_36
# BB#37:                                # %for.end173
                                        #   in Loop: Header=BB2_33 Depth=1
	callq	second
	vsubss	-768(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vsubss	-776(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	jmp	.LBB2_38
	.align	16, 0x90
.LBB2_39:                               # %for.inc186
                                        #   in Loop: Header=BB2_38 Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	incl	main.i(%rip)
.LBB2_38:                               # %for.cond182
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jge	.LBB2_40
	jmp	.LBB2_39
.LBB2_41:                               # %for.end224
	vmovss	atime+204(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_5(%rip), %xmm0, %xmm0
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
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	leaq	-28(%rbp), %rbx
	jmp	.LBB2_42
	.align	16, 0x90
.LBB2_43:                               # %for.inc235
                                        #   in Loop: Header=BB2_42 Depth=1
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	incl	main.i(%rip)
.LBB2_42:                               # %for.cond231
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r14d, main.i(%rip)
	jl	.LBB2_43
# BB#44:                                # %for.end237.split.split
	callq	second
	vmovss	%xmm0, -776(%rbp)       # 4-byte Spill
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
	vcvtsi2sdl	%r14d, %xmm0, %xmm0
	vmovss	-776(%rbp), %xmm1       # 4-byte Reload
	vsubss	-768(%rbp), %xmm1, %xmm1 # 4-byte Folded Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	main.ntimes(%rip), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm1
	vmulss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -776(%rbp)       # 4-byte Spill
	movl	$0, atime+228(%rip)
	movl	$7, main.j(%rip)
	leaq	-28(%rbp), %rbx
	jmp	.LBB2_45
	.align	16, 0x90
.LBB2_52:                               # %for.inc310
                                        #   in Loop: Header=BB2_45 Depth=1
	callq	second
	vsubss	-768(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmulsd	.LCPI2_3(%rip), %xmm1, %xmm1
	vmovsd	-760(%rbp), %xmm2       # 8-byte Reload
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovss	%xmm0, atime+120(,%rax,4)
	movslq	main.j(%rip), %rax
	vdivss	.LCPI2_1(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmovsd	.LCPI2_4(%rip), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+240(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+300(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+228(%rip), %xmm0
	vaddss	atime+180(,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, atime+228(%rip)
	movl	main.j(%rip), %edi
	callq	print_time
	incl	main.j(%rip)
.LBB2_45:                               # %for.cond250
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_47 Depth 2
                                        #     Child Loop BB2_50 Depth 2
	cmpl	$11, main.j(%rip)
	jg	.LBB2_53
# BB#46:                                # %for.body253
                                        #   in Loop: Header=BB2_45 Depth=1
	callq	second
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	jmp	.LBB2_47
	.align	16, 0x90
.LBB2_48:                               # %for.inc259
                                        #   in Loop: Header=BB2_47 Depth=2
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
.LBB2_47:                               # %for.cond255
                                        #   Parent Loop BB2_45 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_48
# BB#49:                                # %for.end261
                                        #   in Loop: Header=BB2_45 Depth=1
	callq	second
	vsubss	-768(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vsubss	-776(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -768(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	jmp	.LBB2_50
	.align	16, 0x90
.LBB2_51:                               # %for.inc274
                                        #   in Loop: Header=BB2_50 Depth=2
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	incl	main.i(%rip)
.LBB2_50:                               # %for.cond270
                                        #   Parent Loop BB2_45 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.i(%rip), %eax
	cmpl	main.ntimes(%rip), %eax
	jge	.LBB2_52
	jmp	.LBB2_51
.LBB2_53:                               # %for.end312
	vmovss	atime+228(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_5(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+228(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str20, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	xorl	%eax, %eax
	addq	$776, %rsp              # imm = 0x308
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp21:
	.size	main, .Ltmp21-main
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
.Ltmp25:
	.cfi_def_cfa_offset 16
.Ltmp26:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp27:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp28:
	.cfi_offset %rbx, -32
.Ltmp29:
	.cfi_offset %r14, -24
	movl	$0, (%r8)
	movl	$1325, %eax             # imm = 0x52D
	xorl	%r9d, %r9d
	vmovsd	.LCPI3_0(%rip), %xmm0
	vmovsd	.LCPI3_1(%rip), %xmm1
	xorl	%r10d, %r10d
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_13:                               # %for.inc16
                                        #   in Loop: Header=BB3_1 Depth=1
	addl	%esi, %r9d
	incl	%r10d
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
	cmpl	%edx, %r10d
	movl	%r9d, %r11d
	movl	$0, %r14d
	jl	.LBB3_8
	jmp	.LBB3_2
	.align	16, 0x90
.LBB3_12:                               # %for.inc
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovss	%xmm2, (%r8)
	incl	%r11d
	incl	%r14d
.LBB3_8:                                # %for.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%edx, %r14d
	jge	.LBB3_13
# BB#9:                                 # %for.body3
                                        #   in Loop: Header=BB3_8 Depth=2
	imull	$3125, %eax, %eax       # imm = 0xC35
	movl	%eax, %ebx
	sarl	$31, %ebx
	shrl	$16, %ebx
	addl	%eax, %ebx
	andl	$-65536, %ebx           # imm = 0xFFFFFFFFFFFF0000
	subl	%ebx, %eax
	movslq	%r11d, %rbx
	vcvtsi2sdl	%eax, %xmm0, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, (%rdi,%rbx,4)
	vucomiss	(%r8), %xmm2
	jbe	.LBB3_11
# BB#10:                                # %cond.true
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovss	(%rdi,%rbx,4), %xmm2
	jmp	.LBB3_12
	.align	16, 0x90
.LBB3_11:                               # %cond.false
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovss	(%r8), %xmm2
	jmp	.LBB3_12
.LBB3_2:
	xorl	%eax, %eax
	jmp	.LBB3_3
	.align	16, 0x90
.LBB3_14:                               # %for.inc25
                                        #   in Loop: Header=BB3_3 Depth=1
	movl	$0, (%rcx,%rax,4)
	incq	%rax
.LBB3_3:                                # %for.cond19
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edx, %eax
	jl	.LBB3_14
# BB#4:
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	jmp	.LBB3_5
	.align	16, 0x90
.LBB3_15:                               # %for.inc48
                                        #   in Loop: Header=BB3_5 Depth=1
	addl	%esi, %r8d
	incl	%r9d
.LBB3_5:                                # %for.cond28
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	xorl	%eax, %eax
	cmpl	%edx, %r9d
	movl	%r8d, %ebx
	jge	.LBB3_16
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_7:                                # %for.inc45
                                        #   in Loop: Header=BB3_6 Depth=2
	vmovss	(%rcx,%rax,4), %xmm0
	movslq	%ebx, %rbx
	vaddss	(%rdi,%rbx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	%ebx
	incq	%rax
.LBB3_6:                                # %for.cond32
                                        #   Parent Loop BB3_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%edx, %eax
	jge	.LBB3_15
	jmp	.LBB3_7
.LBB3_16:                               # %for.end50
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp30:
	.size	matgen, .Ltmp30-matgen
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
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp37:
	.cfi_offset %rbx, -56
.Ltmp38:
	.cfi_offset %r12, -48
.Ltmp39:
	.cfi_offset %r13, -40
.Ltmp40:
	.cfi_offset %r14, -32
.Ltmp41:
	.cfi_offset %r15, -24
	movq	%r8, -80(%rbp)          # 8-byte Spill
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movl	%esi, -48(%rbp)         # 4-byte Spill
	movq	%rdi, %rbx
	movl	$0, (%r8)
	movl	%edx, %ecx
	decl	%ecx
	movl	%ecx, -92(%rbp)         # 4-byte Spill
	js	.LBB4_13
# BB#1:                                 # %if.then
	movl	-48(%rbp), %eax         # 4-byte Reload
	leal	1(%rax), %edx
	movl	%edx, -96(%rbp)         # 4-byte Spill
	xorl	%edx, %edx
	movl	%eax, -68(%rbp)         # 4-byte Spill
	jmp	.LBB4_2
	.align	16, 0x90
.LBB4_12:                               # %for.inc83
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-68(%rbp), %eax         # 4-byte Reload
	addl	-96(%rbp), %eax         # 4-byte Folded Reload
	movl	%eax, -68(%rbp)         # 4-byte Spill
	incl	%edx
	movl	-92(%rbp), %ecx         # 4-byte Reload
.LBB4_2:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
	cmpl	%ecx, %edx
	jge	.LBB4_13
# BB#3:                                 # %for.body.split
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-44(%rbp), %edi         # 4-byte Reload
	subl	%edx, %edi
	movl	-48(%rbp), %r12d        # 4-byte Reload
	imull	%edx, %r12d
	leal	(%r12,%rdx), %eax
	movslq	%eax, %r15
	leaq	(%rbx,%r15,4), %rsi
	movl	%edx, %r14d
	movl	$1, %edx
	callq	idamax
	movl	%r14d, %edx
	movl	%eax, -52(%rbp)         # 4-byte Spill
	leal	(%rax,%rdx), %r14d
	movslq	%edx, %rax
	movq	-88(%rbp), %rcx         # 8-byte Reload
	movl	%r14d, (%rcx,%rax,4)
	leal	(%r12,%r14), %eax
	movslq	%eax, %rax
	vmovss	(%rbx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI4_1, %xmm0
	jne	.LBB4_4
	jnp	.LBB4_11
.LBB4_4:                                # %if.then13
                                        #   in Loop: Header=BB4_2 Depth=1
	cmpl	%edx, %r14d
	je	.LBB4_6
# BB#5:                                 # %if.then16
                                        #   in Loop: Header=BB4_2 Depth=1
	vmovss	(%rbx,%rax,4), %xmm0
	vmovss	(%rbx,%r15,4), %xmm1
	vmovss	%xmm1, (%rbx,%rax,4)
	vmovss	%xmm0, (%rbx,%r15,4)
.LBB4_6:                                # %if.end
                                        #   in Loop: Header=BB4_2 Depth=1
	vmovss	(%rbx,%r15,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI4_0(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	leal	1(%rdx), %eax
	movl	-44(%rbp), %edi         # 4-byte Reload
	subl	%eax, %edi
	movl	%edi, -56(%rbp)         # 4-byte Spill
	leal	1(%r12,%rdx), %eax
	movslq	%eax, %rax
	leaq	(%rbx,%rax,4), %rsi
	movq	%rsi, -64(%rbp)         # 8-byte Spill
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	%edx, %r15d
	movl	$1, %edx
	callq	dscal
	movl	%r15d, %edx
	movl	-68(%rbp), %eax         # 4-byte Reload
	jmp	.LBB4_7
	.align	16, 0x90
.LBB4_10:                               # %if.end69
                                        #   in Loop: Header=BB4_7 Depth=2
	movl	-48(%rbp), %ecx         # 4-byte Reload
	leal	(%rax,%rcx), %r12d
	incl	%eax
	movslq	%eax, %rax
	leaq	(%rbx,%rax,4), %rcx
	movl	-56(%rbp), %edi         # 4-byte Reload
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movl	$1, %edx
	movl	$1, %r8d
	callq	daxpy
	movl	%r12d, %eax
	movl	%r13d, %edx
.LBB4_7:                                # %for.cond46
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%r15d
	cmpl	-44(%rbp), %r15d        # 4-byte Folded Reload
	jge	.LBB4_12
# BB#8:                                 # %for.body49.split
                                        #   in Loop: Header=BB4_7 Depth=2
	movl	-52(%rbp), %ecx         # 4-byte Reload
	leal	(%rcx,%rax), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm0
	cmpl	%edx, %r14d
	movl	%edx, %r13d
	je	.LBB4_10
# BB#9:                                 # %if.then56
                                        #   in Loop: Header=BB4_7 Depth=2
	movslq	%eax, %rdx
	vmovss	(%rbx,%rdx,4), %xmm1
	vmovss	%xmm1, (%rbx,%rcx,4)
	vmovss	%xmm0, (%rbx,%rdx,4)
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_11:                               # %if.else
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	-80(%rbp), %rax         # 8-byte Reload
	movl	%edx, (%rax)
	jmp	.LBB4_12
.LBB4_13:                               # %if.end86
	movslq	%ecx, %rax
	movq	-88(%rbp), %rdx         # 8-byte Reload
	movl	%ecx, (%rdx,%rax,4)
	movl	-48(%rbp), %edx         # 4-byte Reload
	imull	%ecx, %edx
	movl	-44(%rbp), %eax         # 4-byte Reload
	leal	-1(%rdx,%rax), %eax
	movslq	%eax, %rax
	vmovss	(%rbx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB4_15
	jp	.LBB4_15
# BB#14:                                # %if.then100
	movq	-80(%rbp), %rax         # 8-byte Reload
	movl	%ecx, (%rax)
.LBB4_15:                               # %if.end102
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp42:
	.size	dgefa, .Ltmp42-dgefa
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
.Ltmp46:
	.cfi_def_cfa_offset 16
.Ltmp47:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp48:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp49:
	.cfi_offset %rbx, -56
.Ltmp50:
	.cfi_offset %r12, -48
.Ltmp51:
	.cfi_offset %r13, -40
.Ltmp52:
	.cfi_offset %r14, -32
.Ltmp53:
	.cfi_offset %r15, -24
	movq	%r8, %r15
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movl	%edx, -56(%rbp)         # 4-byte Spill
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	leal	-1(%rdx), %ecx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	testl	%r9d, %r9d
	je	.LBB5_1
# BB#10:                                # %if.else.split
	leal	1(%rsi), %eax
	movl	%eax, -76(%rbp)         # 4-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	movl	%r12d, %r13d
	movq	-48(%rbp), %r14         # 8-byte Reload
	jmp	.LBB5_11
	.align	16, 0x90
.LBB5_12:                               # %for.inc65.split
                                        #   in Loop: Header=BB5_11 Depth=1
	movslq	%r12d, %r12
	leaq	(%r14,%r12,4), %rsi
	movl	%ebx, %edi
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$1, %r8d
	callq	ddot
	vmovss	(%r15,%rbx,4), %xmm1
	vsubss	%xmm0, %xmm1, %xmm0
	movslq	%r13d, %r13
	vdivss	(%r14,%r13,4), %xmm0, %xmm0
	addl	-52(%rbp), %r12d        # 4-byte Folded Reload
	addl	-76(%rbp), %r13d        # 4-byte Folded Reload
	vmovss	%xmm0, (%r15,%rbx,4)
	incq	%rbx
.LBB5_11:                               # %for.cond47
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-56(%rbp), %ebx         # 4-byte Folded Reload
	jl	.LBB5_12
# BB#13:                                # %for.end67
	movq	-64(%rbp), %rcx         # 8-byte Reload
	testl	%ecx, %ecx
	jle	.LBB5_19
# BB#14:                                # %if.then69
	movl	-56(%rbp), %edx         # 4-byte Reload
	leal	-2(%rdx), %r13d
	movl	-52(%rbp), %r14d        # 4-byte Reload
	movl	%r14d, %eax
	imull	%r13d, %eax
	leal	-1(%rdx,%rax), %r12d
	notl	%r14d
	movl	%r14d, -52(%rbp)        # 4-byte Spill
	movl	$1, %r14d
	jmp	.LBB5_15
	.align	16, 0x90
.LBB5_18:                               # %for.inc104
                                        #   in Loop: Header=BB5_15 Depth=1
	addl	-52(%rbp), %r12d        # 4-byte Folded Reload
	decl	%r13d
	incl	%r14d
	movq	-64(%rbp), %rcx         # 8-byte Reload
.LBB5_15:                               # %for.cond70
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%ecx, %r14d
	jge	.LBB5_19
# BB#16:                                # %for.body72.split.split
                                        #   in Loop: Header=BB5_15 Depth=1
	movslq	%r13d, %rbx
	vmovss	(%r15,%rbx,4), %xmm0
	vmovss	%xmm0, -56(%rbp)        # 4-byte Spill
	movslq	%r12d, %rax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rsi
	leal	1(%rbx), %eax
	movslq	%eax, %rax
	leaq	(%r15,%rax,4), %rcx
	movl	%r14d, %edi
	movl	$1, %edx
	movl	$1, %r8d
	callq	ddot
	vmovss	-56(%rbp), %xmm1        # 4-byte Reload
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%r15,%rbx,4)
	movq	-72(%rbp), %rax         # 8-byte Reload
	movslq	(%rax,%rbx,4), %rax
	cmpl	%eax, %ebx
	je	.LBB5_18
# BB#17:                                # %if.then94
                                        #   in Loop: Header=BB5_15 Depth=1
	vmovss	(%r15,%rax,4), %xmm0
	vmovss	(%r15,%rbx,4), %xmm1
	vmovss	%xmm1, (%r15,%rax,4)
	vmovss	%xmm0, (%r15,%rbx,4)
	jmp	.LBB5_18
.LBB5_1:                                # %if.then
	movl	%esi, -52(%rbp)         # 4-byte Spill
	testl	%ecx, %ecx
	jle	.LBB5_7
# BB#2:                                 # %if.then2
	movl	-56(%rbp), %eax         # 4-byte Reload
	leal	-1(%rax), %r13d
	movl	-52(%rbp), %eax         # 4-byte Reload
	leal	1(%rax), %eax
	movl	%eax, -76(%rbp)         # 4-byte Spill
	leaq	4(%r15), %r14
	movl	$1, %ebx
	xorl	%r12d, %r12d
	jmp	.LBB5_3
	.align	16, 0x90
.LBB5_6:                                # %for.inc
                                        #   in Loop: Header=BB5_3 Depth=1
	movslq	%ebx, %rbx
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rbx,4), %rsi
	movl	%r13d, %edi
	movl	$1, %edx
	movq	%r14, %rcx
	movl	$1, %r8d
	callq	daxpy
	addl	-76(%rbp), %ebx         # 4-byte Folded Reload
	incq	%r12
	decl	%r13d
	addq	$4, %r14
	movq	-64(%rbp), %rcx         # 8-byte Reload
.LBB5_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%ecx, %r12d
	jge	.LBB5_7
# BB#4:                                 # %for.body.split
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movslq	(%rax,%r12,4), %rax
	vmovss	(%r15,%rax,4), %xmm0
	cmpl	%eax, %r12d
	je	.LBB5_6
# BB#5:                                 # %if.then7
                                        #   in Loop: Header=BB5_3 Depth=1
	vmovss	-4(%r14), %xmm1
	vmovss	%xmm1, (%r15,%rax,4)
	vmovss	%xmm0, -4(%r14)
	jmp	.LBB5_6
.LBB5_7:                                # %if.end22
	movl	-52(%rbp), %eax         # 4-byte Reload
	movl	%eax, %ebx
	imull	%ecx, %ebx
	movl	-56(%rbp), %edx         # 4-byte Reload
	leal	-1(%rdx,%rbx), %r14d
	notl	%eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	xorl	%r12d, %r12d
	jmp	.LBB5_8
	.align	16, 0x90
.LBB5_9:                                # %for.inc44
                                        #   in Loop: Header=BB5_8 Depth=1
	movslq	%ecx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	movslq	%r14d, %r14
	movq	-48(%rbp), %rax         # 8-byte Reload
	vdivss	(%rax,%r14,4), %xmm0, %xmm0
	movslq	%ebx, %rbx
	leaq	(%rax,%rbx,4), %rsi
	vmovss	%xmm0, (%r15,%rcx,4)
	vxorps	.LCPI5_0(%rip), %xmm0, %xmm0
	movq	%rcx, %r13
	movl	%r13d, %edi
	movl	$1, %edx
	movq	%r15, %rcx
	movl	$1, %r8d
	callq	daxpy
	movq	%r13, %rcx
	subl	-52(%rbp), %ebx         # 4-byte Folded Reload
	addl	-72(%rbp), %r14d        # 4-byte Folded Reload
	decl	%ecx
	incl	%r12d
.LBB5_8:                                # %for.cond23
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-56(%rbp), %r12d        # 4-byte Folded Reload
	jl	.LBB5_9
.LBB5_19:                               # %if.end108
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp54:
	.size	dgesl, .Ltmp54-dgesl
	.cfi_endproc

	.globl	dmxpy
	.align	16, 0x90
	.type	dmxpy,@function
dmxpy:                                  # @dmxpy
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp58:
	.cfi_def_cfa_offset 16
.Ltmp59:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp60:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp61:
	.cfi_offset %rbx, -56
.Ltmp62:
	.cfi_offset %r12, -48
.Ltmp63:
	.cfi_offset %r13, -40
.Ltmp64:
	.cfi_offset %r14, -32
.Ltmp65:
	.cfi_offset %r15, -24
	movl	%ecx, -64(%rbp)         # 4-byte Spill
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	movl	%edi, -60(%rbp)         # 4-byte Spill
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%edx, %ecx
	andl	$-2, %ecx
	movl	%edx, %eax
	movl	%edx, %edi
	subl	%ecx, %eax
	testl	%eax, %eax
	jle	.LBB6_4
# BB#1:                                 # %if.then.split
	decl	%eax
	movl	-64(%rbp), %ecx         # 4-byte Reload
                                        # kill: ECX<def> ECX<kill> RCX<def>
	imull	%eax, %ecx
	xorl	%edx, %edx
	jmp	.LBB6_2
	.align	16, 0x90
.LBB6_3:                                # %for.inc
                                        #   in Loop: Header=BB6_2 Depth=1
	movslq	%eax, %rsi
	vmovss	(%r8,%rsi,4), %xmm0
	leal	(%rcx,%rdx), %esi
	movslq	%esi, %rsi
	vmulss	(%r9,%rsi,4), %xmm0, %xmm0
	movq	-56(%rbp), %rsi         # 8-byte Reload
	vaddss	(%rsi,%rdx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%rdx,4)
	incq	%rdx
.LBB6_2:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-60(%rbp), %edx         # 4-byte Folded Reload
	jl	.LBB6_3
.LBB6_4:                                # %if.end
	movl	%edi, %ecx
	movl	%ecx, %r15d
	sarl	$31, %r15d
	movl	%r15d, %eax
	shrl	$30, %eax
	addl	%ecx, %eax
	andl	$-4, %eax
	movl	%ecx, %r10d
	subl	%eax, %edi
	cmpl	$2, %edi
	jl	.LBB6_8
# BB#5:                                 # %if.then12.split
	leal	-2(%rdi), %eax
	movl	-64(%rbp), %ecx         # 4-byte Reload
	imull	%ecx, %eax
	decl	%edi
                                        # kill: ECX<def> ECX<kill> RCX<def>
	imull	%edi, %ecx
	xorl	%edx, %edx
	movslq	%edi, %rdi
	jmp	.LBB6_6
	.align	16, 0x90
.LBB6_7:                                # %for.inc39
                                        #   in Loop: Header=BB6_6 Depth=1
	vmovss	(%r8,%rdi,4), %xmm0
	leal	(%rcx,%rdx), %esi
	movslq	%esi, %rsi
	leal	-1(%rdi), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	(%r8,%rbx,4), %xmm1
	leal	(%rax,%rdx), %esi
	movslq	%esi, %rsi
	vmulss	(%r9,%rsi,4), %xmm1, %xmm1
	movq	-56(%rbp), %rsi         # 8-byte Reload
	vaddss	(%rsi,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%rsi,%rdx,4)
	incq	%rdx
.LBB6_6:                                # %for.cond14
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-60(%rbp), %edx         # 4-byte Folded Reload
	jl	.LBB6_7
.LBB6_8:                                # %if.end42
	movl	%r15d, %ecx
	shrl	$29, %ecx
	addl	%r10d, %ecx
	andl	$-8, %ecx
	movl	%r10d, %eax
	movl	%r10d, %r14d
	subl	%ecx, %eax
	cmpl	$4, %eax
	jl	.LBB6_12
# BB#9:                                 # %if.then45.split
	leal	-4(%rax), %r10d
	movl	-64(%rbp), %ecx         # 4-byte Reload
	imull	%ecx, %r10d
	leal	-2(%rax), %r11d
	imull	%ecx, %r11d
	leal	-3(%rax), %edi
	imull	%ecx, %edi
	decl	%eax
	movl	%ecx, %ebx
	imull	%eax, %ebx
	xorl	%ecx, %ecx
	jmp	.LBB6_10
	.align	16, 0x90
.LBB6_11:                               # %for.inc92
                                        #   in Loop: Header=BB6_10 Depth=1
	leal	-2(%rax), %edx
	movslq	%edx, %rdx
	vmovss	(%r8,%rdx,4), %xmm0
	leal	(%rdi,%rcx), %edx
	movslq	%edx, %rsi
	leal	-3(%rax), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	(%r8,%rdx,4), %xmm1
	leal	(%r10,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	movq	-56(%rbp), %rsi         # 8-byte Reload
	vaddss	(%rsi,%rcx,4), %xmm1, %xmm1
	leal	-1(%rax), %edx
	movslq	%edx, %rdx
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	(%r8,%rdx,4), %xmm1
	leal	(%r11,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	movslq	%eax, %rdx
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	(%r8,%rdx,4), %xmm1
	leal	(%rbx,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%rcx,4)
	incq	%rcx
.LBB6_10:                               # %for.cond47
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-60(%rbp), %ecx         # 4-byte Folded Reload
	jl	.LBB6_11
.LBB6_12:                               # %if.end95
	shrl	$28, %r15d
	movl	%r14d, -148(%rbp)       # 4-byte Spill
	addl	%r14d, %r15d
	andl	$-16, %r15d
	movl	%r15d, -100(%rbp)       # 4-byte Spill
	movl	%r14d, %eax
	subl	%r15d, %eax
	cmpl	$8, %eax
	jl	.LBB6_16
# BB#13:                                # %if.then98.split
	leal	-7(%rax), %ecx
	movl	-64(%rbp), %esi         # 4-byte Reload
	imull	%esi, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	leal	-8(%rax), %ecx
	imull	%esi, %ecx
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	leal	-4(%rax), %ecx
	leal	-3(%rax), %edx
	leal	-2(%rax), %ebx
	leal	-1(%rax), %edi
	movl	%esi, %r12d
	imull	%edi, %r12d
	imull	%esi, %ebx
	movq	%rbx, -96(%rbp)         # 8-byte Spill
	imull	%esi, %edx
	movq	%rdx, -88(%rbp)         # 8-byte Spill
	imull	%esi, %ecx
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	leal	-5(%rax), %ecx
	imull	%esi, %ecx
	leal	-6(%rax), %edx
	imull	%esi, %edx
	xorl	%r10d, %r10d
	movq	-56(%rbp), %r13         # 8-byte Reload
	jmp	.LBB6_14
	.align	16, 0x90
.LBB6_15:                               # %for.inc185
                                        #   in Loop: Header=BB6_14 Depth=1
	leal	-7(%rdi), %esi
	movslq	%esi, %rsi
	vmovss	(%r8,%rsi,4), %xmm0
	movq	-72(%rbp), %rsi         # 8-byte Reload
	leal	(%rsi,%r10), %esi
	movslq	%esi, %rsi
	leal	-6(%rdi), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	(%r8,%rbx,4), %xmm1
	movq	-48(%rbp), %rsi         # 8-byte Reload
	leal	(%rsi,%r10), %esi
	movslq	%esi, %rbx
	leal	-5(%rdi), %esi
	vmulss	(%r9,%rbx,4), %xmm1, %xmm1
	vaddss	(%r13,%r10,4), %xmm0, %xmm0
	movslq	%esi, %rsi
	vmovss	(%r8,%rsi,4), %xmm2
	leal	(%rdx,%r10), %esi
	movslq	%esi, %rsi
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	(%r9,%rsi,4), %xmm2, %xmm1
	leal	-4(%rdi), %esi
	movslq	%esi, %rsi
	vmovss	(%r8,%rsi,4), %xmm2
	leal	(%rcx,%r10), %esi
	movslq	%esi, %rsi
	leal	-3(%rdi), %ebx
	movslq	%ebx, %rbx
	vaddss	%xmm1, %xmm0, %xmm1
	vmulss	(%r9,%rsi,4), %xmm2, %xmm2
	leal	(%r12,%r10), %esi
	vmovss	(%r8,%rbx,4), %xmm0
	movq	-80(%rbp), %rbx         # 8-byte Reload
	leal	(%rbx,%r10), %ebx
	movslq	%ebx, %rbx
	movslq	%edi, %r14
	vmulss	(%r9,%rbx,4), %xmm0, %xmm0
	movq	-96(%rbp), %rbx         # 8-byte Reload
	leal	(%rbx,%r10), %r11d
	vmovss	(%r8,%r14,4), %xmm3
	movslq	%esi, %rsi
	leal	-2(%r14), %ebx
	vaddss	%xmm2, %xmm1, %xmm2
	movslq	%ebx, %r15
	decl	%r14d
	movslq	%r14d, %rbx
	vmulss	(%r9,%rsi,4), %xmm3, %xmm1
	vmovss	(%r8,%rbx,4), %xmm3
	movslq	%r11d, %rsi
	vaddss	%xmm0, %xmm2, %xmm0
	vmovss	(%r8,%r15,4), %xmm2
	movq	-88(%rbp), %rbx         # 8-byte Reload
	leal	(%rbx,%r10), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rbx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	(%r9,%rsi,4), %xmm3, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r13,%r10,4)
	leaq	1(%r10), %r10
.LBB6_14:                               # %for.cond100
                                        # =>This Inner Loop Header: Depth=1
	cmpl	-60(%rbp), %r10d        # 4-byte Folded Reload
	jl	.LBB6_15
.LBB6_16:                               # %if.end188
	movl	-100(%rbp), %edx        # 4-byte Reload
	negl	%edx
	movl	-148(%rbp), %ecx        # 4-byte Reload
	leal	1(%rcx,%rdx), %edx
	movl	%eax, %esi
	movl	-64(%rbp), %ecx         # 4-byte Reload
	imull	%ecx, %esi
	movl	%esi, -104(%rbp)        # 4-byte Spill
	movl	%ecx, %esi
	shll	$4, %esi
	movl	%esi, -152(%rbp)        # 4-byte Spill
	imull	%ecx, %edx
	movl	%edx, -100(%rbp)        # 4-byte Spill
	xorl	%edx, %edx
	leal	15(%rax), %ebx
	leal	14(%rax), %esi
	movl	%esi, -72(%rbp)         # 4-byte Spill
	leal	13(%rax), %esi
	movl	%esi, -80(%rbp)         # 4-byte Spill
	leal	12(%rax), %esi
	movl	%esi, -88(%rbp)         # 4-byte Spill
	leal	11(%rax), %esi
	movl	%esi, -96(%rbp)         # 4-byte Spill
	leal	10(%rax), %r12d
	leal	9(%rax), %r13d
	leal	8(%rax), %esi
	leal	7(%rax), %edi
	leal	6(%rax), %r10d
	leal	5(%rax), %r11d
	leal	4(%rax), %r14d
	leal	3(%rax), %r15d
	leal	2(%rax), %eax
	imull	%ecx, %eax
	movl	%eax, -140(%rbp)        # 4-byte Spill
	imull	%ecx, %r15d
	movl	%r15d, -136(%rbp)       # 4-byte Spill
	imull	%ecx, %r14d
	movl	%r14d, -132(%rbp)       # 4-byte Spill
	imull	%ecx, %r11d
	movl	%r11d, -128(%rbp)       # 4-byte Spill
	imull	%ecx, %r10d
	movl	%r10d, -124(%rbp)       # 4-byte Spill
	imull	%ecx, %edi
	movl	%edi, -120(%rbp)        # 4-byte Spill
	imull	%ecx, %esi
	movl	%esi, -116(%rbp)        # 4-byte Spill
	imull	%ecx, %r13d
	movl	%r13d, -112(%rbp)       # 4-byte Spill
	imull	%ecx, %r12d
	movl	%r12d, -108(%rbp)       # 4-byte Spill
	movl	-96(%rbp), %eax         # 4-byte Reload
	imull	%ecx, %eax
	movl	%eax, -96(%rbp)         # 4-byte Spill
	movl	-88(%rbp), %eax         # 4-byte Reload
	imull	%ecx, %eax
	movl	%eax, -88(%rbp)         # 4-byte Spill
	movl	-80(%rbp), %eax         # 4-byte Reload
	imull	%ecx, %eax
	movl	%eax, -80(%rbp)         # 4-byte Spill
	movl	-72(%rbp), %eax         # 4-byte Reload
	imull	%ecx, %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	imull	%ebx, %ecx
	movl	%ecx, -64(%rbp)         # 4-byte Spill
	jmp	.LBB6_17
	.align	16, 0x90
.LBB6_20:                               # %for.inc363
                                        #   in Loop: Header=BB6_17 Depth=1
	movl	-144(%rbp), %edx        # 4-byte Reload
	addl	-152(%rbp), %edx        # 4-byte Folded Reload
	addl	$16, %ebx
.LBB6_17:                               # %for.cond192
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_18 Depth 2
	movl	%edx, -144(%rbp)        # 4-byte Spill
	xorl	%r13d, %r13d
	cmpl	-148(%rbp), %ebx        # 4-byte Folded Reload
	jge	.LBB6_21
	jmp	.LBB6_18
	.align	16, 0x90
.LBB6_19:                               # %for.inc360
                                        #   in Loop: Header=BB6_18 Depth=2
	leal	-15(%rbx), %eax
	movslq	%eax, %rsi
	movl	-104(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %ecx
	leal	-13(%rbx), %edi
	leal	-14(%rbx), %eax
	movslq	%eax, %rax
	vmovss	(%r8,%rsi,4), %xmm1
	movslq	%edi, %rdi
	movl	-136(%rbp), %esi        # 4-byte Reload
	leal	(%rsi,%rdx), %r10d
	movl	-128(%rbp), %esi        # 4-byte Reload
	leal	(%rsi,%rdx), %r11d
	movl	-100(%rbp), %esi        # 4-byte Reload
	leal	(%rsi,%rdx), %r14d
	movslq	%ecx, %rsi
	vmovss	(%r8,%rax,4), %xmm0
	leal	-11(%rbx), %eax
	movslq	%eax, %rcx
	movl	-140(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %r12d
	vmovss	(%r8,%rdi,4), %xmm3
	leal	-12(%rbx), %eax
	movq	%r13, %rdi
	movslq	%eax, %r13
	vmulss	(%r9,%rsi,4), %xmm1, %xmm2
	leal	-10(%rbx), %eax
	movslq	%eax, %rax
	vmovss	(%r8,%rax,4), %xmm7
	movslq	%r14d, %r15
	vmovss	(%r8,%rcx,4), %xmm1
	movl	-132(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %eax
	movl	%eax, -48(%rbp)         # 4-byte Spill
	movl	-120(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %r14d
	movslq	%r11d, %r11
	vmovss	(%r8,%r13,4), %xmm6
	movq	%rdi, %r13
	movslq	%r10d, %rdi
	movslq	%r12d, %rsi
	leal	-9(%rbx), %eax
	movslq	%eax, %rax
	vmulss	(%r9,%r15,4), %xmm0, %xmm4
	leal	-1(%rbx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%r8,%rcx,4), %xmm10
	movl	-124(%rbp), %ecx        # 4-byte Reload
	leal	(%rcx,%rdx), %ecx
	vmovss	(%r8,%rax,4), %xmm5
	vmulss	(%r9,%rsi,4), %xmm3, %xmm0
	movslq	%ebx, %rax
	vmovss	(%r8,%rax,4), %xmm3
	vmulss	(%r9,%rdi,4), %xmm6, %xmm9
	vmulss	(%r9,%r11,4), %xmm7, %xmm8
	movq	-56(%rbp), %r12         # 8-byte Reload
	vaddss	(%r12,%r13,4), %xmm2, %xmm2
	movslq	%ecx, %r10
	movslq	%r14d, %rcx
	movl	-64(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rdx), %esi
	movl	-72(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rdx), %eax
	movslq	-48(%rbp), %rdi         # 4-byte Folded Reload
	vmulss	(%r9,%rdi,4), %xmm1, %xmm7
	leal	-8(%rbx), %edi
	movslq	%edi, %rdi
	vmovss	(%r8,%rdi,4), %xmm1
	vaddss	%xmm4, %xmm2, %xmm4
	movslq	%eax, %rax
	movslq	%esi, %rdi
	movl	-88(%rbp), %esi         # 4-byte Reload
	leal	(%rsi,%rdx), %r11d
	vmulss	(%r9,%rcx,4), %xmm1, %xmm1
	leal	-2(%rbx), %ecx
	movslq	%ecx, %rcx
	vmulss	(%r9,%r10,4), %xmm5, %xmm5
	movl	-80(%rbp), %esi         # 4-byte Reload
	leal	(%rsi,%rdx), %esi
	vmulss	(%r9,%rdi,4), %xmm3, %xmm11
	vmulss	(%r9,%rax,4), %xmm10, %xmm10
	vmovss	(%r8,%rcx,4), %xmm3
	vaddss	%xmm0, %xmm4, %xmm4
	movl	-96(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%rdx), %r10d
	movl	-108(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %r14d
	movl	-112(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%rdx), %ecx
	movslq	%r11d, %rax
	movslq	%esi, %rsi
	vmulss	(%r9,%rsi,4), %xmm3, %xmm6
	leal	-3(%rbx), %esi
	movslq	%esi, %rsi
	vmovss	(%r8,%rsi,4), %xmm0
	leal	-4(%rbx), %esi
	movslq	%esi, %rdi
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	leal	-5(%rbx), %eax
	movslq	%eax, %rax
	movl	-116(%rbp), %esi        # 4-byte Reload
	leal	(%rsi,%rdx), %r15d
	vaddss	%xmm9, %xmm4, %xmm2
	movslq	%ecx, %r11
	vmovss	(%r8,%rax,4), %xmm3
	movslq	%r14d, %rax
	movslq	%r10d, %rcx
	vaddss	%xmm7, %xmm2, %xmm4
	vmovss	(%r8,%rdi,4), %xmm7
	leal	-6(%rbx), %edi
	leal	-7(%rbx), %esi
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	vaddss	%xmm8, %xmm4, %xmm2
	vmulss	(%r9,%rcx,4), %xmm7, %xmm4
	vmulss	(%r9,%rax,4), %xmm3, %xmm7
	vmovss	(%r8,%rdi,4), %xmm3
	vmulss	(%r9,%r11,4), %xmm3, %xmm3
	movslq	%r15d, %rax
	vaddss	%xmm5, %xmm2, %xmm2
	vmovss	(%r8,%rsi,4), %xmm5
	vmulss	(%r9,%rax,4), %xmm5, %xmm5
	incl	%edx
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm5, %xmm1, %xmm1
	vaddss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm7, %xmm1, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vaddss	%xmm10, %xmm0, %xmm0
	vaddss	%xmm11, %xmm0, %xmm0
	vmovss	%xmm0, (%r12,%r13,4)
	leaq	1(%r13), %r13
.LBB6_18:                               # %for.cond195
                                        #   Parent Loop BB6_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	-60(%rbp), %r13d        # 4-byte Folded Reload
	jge	.LBB6_20
	jmp	.LBB6_19
.LBB6_21:                               # %for.end365
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp66:
	.size	dmxpy, .Ltmp66-dmxpy
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI7_1:
	.long	1051372204              # float 0.33333337
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI7_2:
	.quad	-4616189618054758400    # double -1
	.text
	.globl	epslon
	.align	16, 0x90
	.type	epslon,@function
epslon:                                 # @epslon
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp69:
	.cfi_def_cfa_offset 16
.Ltmp70:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp71:
	.cfi_def_cfa_register %rbp
	vxorps	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovss	.LCPI7_1(%rip), %xmm2
	vaddss	%xmm2, %xmm2, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	.LCPI7_2(%rip), %xmm2, %xmm2
	vandpd	.LCPI7_0(%rip), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_2:                                # %while.body.split.split
                                        #   in Loop: Header=BB7_1 Depth=1
	vmovaps	%xmm2, %xmm3
.LBB7_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vucomisd	%xmm1, %xmm3
	jne	.LBB7_3
	jp	.LBB7_3
	jmp	.LBB7_2
.LBB7_3:                                # %while.end
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI7_0(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm3, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	popq	%rbp
	ret
.Ltmp72:
	.size	epslon, .Ltmp72-epslon
	.cfi_endproc

	.globl	print_time
	.align	16, 0x90
	.type	print_time,@function
print_time:                             # @print_time
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp75:
	.cfi_def_cfa_offset 16
.Ltmp76:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp77:
	.cfi_def_cfa_register %rbp
	popq	%rbp
	ret
.Ltmp78:
	.size	print_time, .Ltmp78-print_time
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
.Ltmp81:
	.cfi_def_cfa_offset 16
.Ltmp82:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp83:
	.cfi_def_cfa_register %rbp
	movl	$-1, %eax
	testl	%edi, %edi
	jle	.LBB9_13
# BB#1:                                 # %if.end
	xorl	%eax, %eax
	cmpl	$1, %edi
	je	.LBB9_13
# BB#2:                                 # %if.end3
	cmpl	$1, %edx
	je	.LBB9_8
# BB#3:                                 # %if.then5.split.split.split
	vmovss	(%rsi), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm1
	leal	1(%rdx), %r8d
	movl	$1, %r9d
	vmovsd	.LCPI9_0(%rip), %xmm0
                                        # implicit-def: EAX
	jmp	.LBB9_4
	.align	16, 0x90
.LBB9_7:                                # %for.inc.split
                                        #   in Loop: Header=BB9_4 Depth=1
	addl	%edx, %r8d
	incl	%r9d
.LBB9_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %r9d
	jge	.LBB9_13
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB9_4 Depth=1
	movslq	%r8d, %rcx
	vmovss	(%rsi,%rcx,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vcvtss2sd	%xmm1, %xmm1, %xmm3
	vucomisd	%xmm3, %xmm2
	jbe	.LBB9_7
# BB#6:                                 # %if.then15
                                        #   in Loop: Header=BB9_4 Depth=1
	vmovss	(%rsi,%rcx,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	movl	%r9d, %eax
	jmp	.LBB9_7
.LBB9_8:                                # %if.else
	vmovss	(%rsi), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm1
	xorl	%eax, %eax
	movl	$1, %ecx
	vmovsd	.LCPI9_0(%rip), %xmm0
	jmp	.LBB9_9
	.align	16, 0x90
.LBB9_12:                               # %for.inc45
                                        #   in Loop: Header=BB9_9 Depth=1
	incq	%rcx
.LBB9_9:                                # %for.cond27
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %ecx
	jge	.LBB9_13
# BB#10:                                # %for.body30
                                        #   in Loop: Header=BB9_9 Depth=1
	vmovss	(%rsi,%rcx,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vcvtss2sd	%xmm1, %xmm1, %xmm3
	vucomisd	%xmm3, %xmm2
	jbe	.LBB9_12
# BB#11:                                # %if.then38
                                        #   in Loop: Header=BB9_9 Depth=1
	vmovss	(%rsi,%rcx,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	movl	%ecx, %eax
	jmp	.LBB9_12
.LBB9_13:                               # %return
	popq	%rbp
	ret
.Ltmp84:
	.size	idamax, .Ltmp84-idamax
	.cfi_endproc

	.globl	dscal
	.align	16, 0x90
	.type	dscal,@function
dscal:                                  # @dscal
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp87:
	.cfi_def_cfa_offset 16
.Ltmp88:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp89:
	.cfi_def_cfa_register %rbp
	testl	%edi, %edi
	jle	.LBB10_8
# BB#1:                                 # %if.end
	cmpl	$1, %edx
	je	.LBB10_2
# BB#5:                                 # %if.then2
	imull	%edx, %edi
	xorl	%eax, %eax
	jmp	.LBB10_6
	.align	16, 0x90
.LBB10_7:                               # %for.inc.split.split
                                        #   in Loop: Header=BB10_6 Depth=1
	movslq	%eax, %rcx
	vmulss	(%rsi,%rcx,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rsi,%rcx,4)
	addl	%edx, %eax
.LBB10_6:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %eax
	jge	.LBB10_8
	jmp	.LBB10_7
.LBB10_2:
	xorl	%eax, %eax
	jmp	.LBB10_3
	.align	16, 0x90
.LBB10_4:                               # %for.inc16
                                        #   in Loop: Header=BB10_3 Depth=1
	vmulss	(%rsi,%rax,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rsi,%rax,4)
	incq	%rax
.LBB10_3:                               # %for.cond8
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %eax
	jl	.LBB10_4
.LBB10_8:                               # %for.end17
	popq	%rbp
	ret
.Ltmp90:
	.size	dscal, .Ltmp90-dscal
	.cfi_endproc

	.globl	daxpy
	.align	16, 0x90
	.type	daxpy,@function
daxpy:                                  # @daxpy
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp94:
	.cfi_def_cfa_offset 16
.Ltmp95:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp96:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp97:
	.cfi_offset %rbx, -32
.Ltmp98:
	.cfi_offset %r14, -24
	testl	%edi, %edi
	jle	.LBB11_15
# BB#1:                                 # %if.end
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jne	.LBB11_2
	jnp	.LBB11_15
.LBB11_2:                               # %if.end4
	cmpl	$1, %edx
	jne	.LBB11_7
# BB#3:                                 # %lor.lhs.false
	cmpl	$1, %r8d
	je	.LBB11_4
.LBB11_7:                               # %if.then9
	testl	%edx, %edx
	js	.LBB11_9
# BB#8:                                 # %if.then9.if.end13_crit_edge.split
	xorl	%r9d, %r9d
	movl	%edx, %r10d
	jmp	.LBB11_10
.LBB11_9:                               # %if.then12.split
	movl	$1, %r9d
	subl	%edi, %r9d
	imull	%edx, %r9d
	leal	(%r9,%rdx), %r10d
.LBB11_10:                              # %if.end13
	xorl	%r11d, %r11d
	movl	$-1, %eax
	testl	%r8d, %r8d
	js	.LBB11_12
# BB#11:
	movl	%r8d, %r14d
	jmp	.LBB11_13
.LBB11_12:                              # %if.then16.split
	movl	$1, %r11d
	subl	%edi, %r11d
	imull	%r8d, %r11d
	leal	(%r11,%r8), %r14d
	jmp	.LBB11_13
	.align	16, 0x90
.LBB11_14:                              # %for.inc.split19
                                        #   in Loop: Header=BB11_13 Depth=1
	movslq	%r9d, %rbx
	vmulss	(%rsi,%rbx,4), %xmm0, %xmm1
	movslq	%r11d, %rbx
	vaddss	(%rcx,%rbx,4), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%rbx,4)
	movl	%r10d, %r9d
	leal	(%r10,%rdx), %r10d
	movl	%r14d, %r11d
	leal	(%r14,%r8), %r14d
.LBB11_13:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	cmpl	%edi, %eax
	jge	.LBB11_15
	jmp	.LBB11_14
.LBB11_4:
	xorl	%eax, %eax
	jmp	.LBB11_5
	.align	16, 0x90
.LBB11_6:                               # %for.inc44
                                        #   in Loop: Header=BB11_5 Depth=1
	vmulss	(%rsi,%rax,4), %xmm0, %xmm1
	vaddss	(%rcx,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%rax,4)
	incq	%rax
.LBB11_5:                               # %for.cond32
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %eax
	jl	.LBB11_6
.LBB11_15:                              # %return
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp99:
	.size	daxpy, .Ltmp99-daxpy
	.cfi_endproc

	.globl	ddot
	.align	16, 0x90
	.type	ddot,@function
ddot:                                   # @ddot
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp103:
	.cfi_def_cfa_offset 16
.Ltmp104:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp105:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp106:
	.cfi_offset %rbx, -32
.Ltmp107:
	.cfi_offset %r14, -24
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%edi, %edi
	jle	.LBB12_14
# BB#1:                                 # %if.end
	cmpl	$1, %edx
	jne	.LBB12_6
# BB#2:                                 # %lor.lhs.false
	cmpl	$1, %r8d
	je	.LBB12_3
.LBB12_6:                               # %if.then3
	testl	%edx, %edx
	js	.LBB12_8
# BB#7:                                 # %if.then3.if.end6_crit_edge.split
	xorl	%r9d, %r9d
	movl	%edx, %r10d
	jmp	.LBB12_9
.LBB12_8:                               # %if.then5.split
	movl	$1, %r9d
	subl	%edi, %r9d
	imull	%edx, %r9d
	leal	(%r9,%rdx), %r10d
.LBB12_9:                               # %if.end6
	xorl	%r11d, %r11d
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$-1, %eax
	testl	%r8d, %r8d
	js	.LBB12_11
# BB#10:
	movl	%r8d, %r14d
	jmp	.LBB12_12
.LBB12_11:                              # %if.then8.split
	movl	$1, %r11d
	subl	%edi, %r11d
	imull	%r8d, %r11d
	leal	(%r11,%r8), %r14d
	jmp	.LBB12_12
	.align	16, 0x90
.LBB12_13:                              # %for.inc.split19
                                        #   in Loop: Header=BB12_12 Depth=1
	movslq	%r9d, %rbx
	vmovss	(%rsi,%rbx,4), %xmm1
	movslq	%r11d, %rbx
	vmulss	(%rcx,%rbx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	movl	%r10d, %r9d
	leal	(%r10,%rdx), %r10d
	movl	%r14d, %r11d
	leal	(%r14,%r8), %r14d
.LBB12_12:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	cmpl	%edi, %eax
	jge	.LBB12_14
	jmp	.LBB12_13
.LBB12_3:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.LBB12_4
	.align	16, 0x90
.LBB12_5:                               # %for.inc30
                                        #   in Loop: Header=BB12_4 Depth=1
	vmovss	(%rsi,%rax,4), %xmm1
	vmulss	(%rcx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	incq	%rax
.LBB12_4:                               # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %eax
	jl	.LBB12_5
.LBB12_14:                              # %return
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp108:
	.size	ddot, .Ltmp108-ddot
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
