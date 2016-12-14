	.file	"test/linpack-pc.nomc.bc"
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
.LCPI2_4:
	.quad	4696837146684686336     # double 1.0E+6
.LCPI2_5:
	.quad	4611686018427387904     # double 2
.LCPI2_7:
	.quad	4617315517961601024     # double 5
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_1:
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
	.long	2147483648              # float -0.000000e+00
.LCPI2_2:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_3:
	.long	1065353216              # float 1
.LCPI2_6:
	.long	1030053954              # float 0.056000002
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
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, atime(%rip)
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	vmovss	%xmm0, atime+60(%rip)
	vmovss	atime(%rip), %xmm0
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	cmpl	$0, main.n(%rip)
	jle	.LBB2_2
	.align	16, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm0
	vmovss	%xmm0, main.x(,%rax,4)
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.n(%rip), %eax
	jl	.LBB2_1
.LBB2_2:                                # %for.end
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	leaq	-28(%rbp), %r8
	movl	$main.a, %edi
	movl	$main.b, %ecx
	callq	matgen
	movl	$0, main.i(%rip)
	cmpl	$0, main.n(%rip)
	jle	.LBB2_5
# BB#3:
	vmovss	.LCPI2_1(%rip), %xmm0
	.align	16, 0x90
.LBB2_4:                                # %for.body23
                                        # =>This Inner Loop Header: Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vxorps	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, main.b(,%rax,4)
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.n(%rip), %eax
	jl	.LBB2_4
.LBB2_5:                                # %for.end31
	movl	main.lda(%rip), %ecx
	movl	main.n(%rip), %edi
	movl	$main.b, %esi
	movl	%edi, %edx
	movl	$main.x, %r8d
	movl	$main.a, %r9d
	callq	dmxpy
	movl	$0, main.i(%rip)
	vxorps	%xmm4, %xmm4, %xmm4
	cmpl	$0, main.n(%rip)
	jle	.LBB2_6
# BB#7:
	vmovsd	.LCPI2_2(%rip), %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB2_8:                                # %for.body35
                                        # =>This Inner Loop Header: Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm3, %xmm3, %xmm1
	vucomisd	%xmm2, %xmm1
	ja	.LBB2_10
# BB#9:                                 # %cond.false
                                        #   in Loop: Header=BB2_8 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.b(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
.LBB2_10:                               # %cond.end
                                        #   in Loop: Header=BB2_8 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm0, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtsd2ss	%xmm1, %xmm1, %xmm3
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm4, %xmm4, %xmm1
	vucomisd	%xmm2, %xmm1
	ja	.LBB2_12
# BB#11:                                # %cond.false58
                                        #   in Loop: Header=BB2_8 Depth=1
	movslq	main.i(%rip), %rax
	vmovss	main.x(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm0, %xmm1, %xmm1
.LBB2_12:                               # %cond.end63
                                        #   in Loop: Header=BB2_8 Depth=1
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	vcvtsd2ss	%xmm1, %xmm1, %xmm4
	cmpl	main.n(%rip), %eax
	jl	.LBB2_8
	jmp	.LBB2_13
.LBB2_6:
	vxorps	%xmm3, %xmm3, %xmm3
.LBB2_13:                               # %for.end68
	vmovss	%xmm4, -776(%rbp)       # 4-byte Spill
	vmovss	%xmm3, -768(%rbp)       # 4-byte Spill
	movl	%ebx, %eax
	imull	%eax, %eax
	imull	%eax, %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_0(%rip), %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm0, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -772(%rbp)       # 4-byte Spill
	vmovss	-760(%rbp), %xmm0       # 4-byte Reload
	vaddss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	vmovss	.LCPI2_3(%rip), %xmm0
	callq	epslon
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movl	main.n(%rip), %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmulss	-28(%rbp), %xmm0, %xmm0
	vmovss	%xmm0, -780(%rbp)       # 4-byte Spill
	decl	%eax
	movslq	%eax, %rax
	vmovss	main.x(,%rax,4), %xmm0
	vmovss	%xmm0, -784(%rbp)       # 4-byte Spill
	vmovss	main.x(%rip), %xmm0
	vmovss	%xmm0, -788(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str7, %esi
	xorb	%al, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str8, %esi
	xorb	%al, %al
	callq	fprintf
	vmovss	-776(%rbp), %xmm0       # 4-byte Reload
	vmulss	-780(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	-760(%rbp), %xmm6       # 4-byte Reload
	vmulss	%xmm0, %xmm6, %xmm0
	vmovss	.LCPI2_3(%rip), %xmm2
	vmovss	-784(%rbp), %xmm1       # 4-byte Reload
	vsubss	%xmm2, %xmm1, %xmm1
	vmovss	-788(%rbp), %xmm3       # 4-byte Reload
	vsubss	%xmm2, %xmm3, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm2, %xmm2, %xmm3
	vcvtss2sd	%xmm1, %xmm1, %xmm4
	vmovss	-768(%rbp), %xmm5       # 4-byte Reload
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
	vmovss	-756(%rbp), %xmm2       # 4-byte Reload
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovss	%xmm2, atime+120(%rip)
	jbe	.LBB2_15
# BB#14:                                # %if.then
	vmovss	-772(%rbp), %xmm1       # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	.LCPI2_4(%rip), %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm1
	vmovsd	.LCPI2_5(%rip), %xmm0
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
	vdivss	.LCPI2_6(%rip), %xmm2, %xmm0
	vmovss	%xmm0, atime+300(%rip)
	xorl	%edi, %edi
	callq	print_time
	movq	stderr(%rip), %rdi
	movl	$.L.str14, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$100, %r15d
	movl	$-3, %r14d
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_17:                               # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_18 Depth 2
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	testl	%r15d, %r15d
	jle	.LBB2_19
	.align	16, 0x90
.LBB2_18:                               # %for.body110
                                        #   Parent Loop BB2_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	%r15d, %eax
	jl	.LBB2_18
.LBB2_19:                               # %for.end113
                                        #   in Loop: Header=BB2_17 Depth=1
	incl	%r14d
	callq	second
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	movl	%r15d, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	testl	%r14d, %r14d
	jns	.LBB2_21
# BB#20:                                # %if.then119
                                        #   in Loop: Header=BB2_17 Depth=1
	addl	%r15d, %r15d
.LBB2_21:                               # %do.cond
                                        #   in Loop: Header=BB2_17 Depth=1
	testl	%r14d, %r14d
	js	.LBB2_17
# BB#22:                                # %do.end
	vmovss	-760(%rbp), %xmm0       # 4-byte Reload
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	movl	$.L.str17, %esi
	xorb	%al, %al
	callq	fprintf
	vcvtsi2sdl	%r15d, %xmm0, %xmm0
	vmovss	-756(%rbp), %xmm1       # 4-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	$100, main.ntimes(%rip)
	movl	$-3, %r14d
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_23:                               # %do.body130
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_24 Depth 2
	callq	second
	movl	$0, main.i(%rip)
	cmpl	$0, main.ntimes(%rip)
	jle	.LBB2_25
	.align	16, 0x90
.LBB2_24:                               # %for.body136
                                        #   Parent Loop BB2_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
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
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_24
.LBB2_25:                               # %for.end139
                                        #   in Loop: Header=BB2_23 Depth=1
	incl	%r14d
	callq	second
	movl	main.ntimes(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str15, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	testl	%r14d, %r14d
	jns	.LBB2_27
# BB#26:                                # %if.then145
                                        #   in Loop: Header=BB2_23 Depth=1
	shll	main.ntimes(%rip)
.LBB2_27:                               # %do.cond148
                                        #   in Loop: Header=BB2_23 Depth=1
	testl	%r14d, %r14d
	js	.LBB2_23
# BB#28:                                # %do.end151
	movl	$1000, main.ntimes(%rip) # imm = 0x3E8
	movl	$1, %eax
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB2_30
# BB#29:                                # %select.mid
	movl	$1000, %eax             # imm = 0x3E8
.LBB2_30:                               # %select.end
	movl	%eax, main.ntimes(%rip)
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
	testb	%bl, %bl
	movl	main.ntimes(%rip), %eax
	movl	$0, atime+204(%rip)
	movl	$1, main.j(%rip)
	jne	.LBB2_37
# BB#31:
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	-756(%rbp), %xmm1       # 4-byte Reload
	vmulss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	leaq	-28(%rbp), %r14
	vmovss	-772(%rbp), %xmm0       # 4-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -768(%rbp)       # 8-byte Spill
	.align	16, 0x90
.LBB2_32:                               # %for.body165
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_33 Depth 2
                                        #     Child Loop BB2_35 Depth 2
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	cmpl	$0, main.ntimes(%rip)
	jle	.LBB2_34
	.align	16, 0x90
.LBB2_33:                               # %for.body170
                                        #   Parent Loop BB2_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.b, %ecx
	movq	%r14, %r8
	callq	matgen
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.info, %r8d
	callq	dgefa
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_33
.LBB2_34:                               # %for.end173
                                        #   in Loop: Header=BB2_32 Depth=1
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vsubss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	cmpl	$0, main.ntimes(%rip)
	jle	.LBB2_36
	.align	16, 0x90
.LBB2_35:                               # %for.body185
                                        #   Parent Loop BB2_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.n(%rip), %edx
	movl	main.lda(%rip), %esi
	movl	$main.a, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_35
.LBB2_36:                               # %for.end188
                                        #   in Loop: Header=BB2_32 Depth=1
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmulsd	.LCPI2_4(%rip), %xmm1, %xmm1
	vmovsd	-768(%rbp), %xmm2       # 8-byte Reload
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovss	%xmm0, atime+120(,%rax,4)
	movslq	main.j(%rip), %rax
	vdivss	.LCPI2_6(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmovsd	.LCPI2_5(%rip), %xmm2
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
	movl	main.j(%rip), %eax
	incl	%eax
	movl	%eax, main.j(%rip)
	cmpl	$6, %eax
	jl	.LBB2_32
.LBB2_37:                               # %for.end224
	vmovss	atime+204(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_7(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, atime+204(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str20, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	movb	$1, %al
	callq	fprintf
	xorb	%r14b, %r14b
	movq	stderr(%rip), %rdi
	movl	$.L.str21, %esi
	xorb	%al, %al
	callq	fprintf
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	testl	%r15d, %r15d
	movl	$0, main.i(%rip)
	jle	.LBB2_40
# BB#38:
	leaq	-28(%rbp), %rbx
	.align	16, 0x90
.LBB2_39:                               # %for.body234
                                        # =>This Inner Loop Header: Depth=1
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.b, %ecx
	movq	%rbx, %r8
	callq	matgen
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	%r15d, %eax
	jl	.LBB2_39
.LBB2_40:                               # %for.end237
	callq	second
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
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
	testb	%r14b, %r14b
	movl	main.ntimes(%rip), %eax
	movl	$0, atime+228(%rip)
	movl	$7, main.j(%rip)
	jne	.LBB2_47
# BB#41:
	vcvtsi2sdl	%r15d, %xmm0, %xmm0
	vmovss	-760(%rbp), %xmm1       # 4-byte Reload
	vsubss	-756(%rbp), %xmm1, %xmm1 # 4-byte Folded Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%eax, %xmm0, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -760(%rbp)       # 4-byte Spill
	leaq	-28(%rbp), %rbx
	vmovss	-772(%rbp), %xmm0       # 4-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -768(%rbp)       # 8-byte Spill
	.align	16, 0x90
.LBB2_42:                               # %for.body253
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_43 Depth 2
                                        #     Child Loop BB2_45 Depth 2
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	cmpl	$0, main.ntimes(%rip)
	jle	.LBB2_44
	.align	16, 0x90
.LBB2_43:                               # %for.body258
                                        #   Parent Loop BB2_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
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
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_43
.LBB2_44:                               # %for.end261
                                        #   in Loop: Header=BB2_42 Depth=1
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vsubss	-760(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime(,%rax,4)
	callq	second
	vmovss	%xmm0, -756(%rbp)       # 4-byte Spill
	movl	$0, main.i(%rip)
	cmpl	$0, main.ntimes(%rip)
	jle	.LBB2_46
	.align	16, 0x90
.LBB2_45:                               # %for.body273
                                        #   Parent Loop BB2_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	main.n(%rip), %edx
	movl	main.ldaa(%rip), %esi
	movl	$main.aa, %edi
	movl	$main.ipvt, %ecx
	movl	$main.b, %r8d
	xorl	%r9d, %r9d
	callq	dgesl
	movl	main.i(%rip), %eax
	incl	%eax
	movl	%eax, main.i(%rip)
	cmpl	main.ntimes(%rip), %eax
	jl	.LBB2_45
.LBB2_46:                               # %for.end276
                                        #   in Loop: Header=BB2_42 Depth=1
	callq	second
	vsubss	-756(%rbp), %xmm0, %xmm0 # 4-byte Folded Reload
	vcvtsi2ssl	main.ntimes(%rip), %xmm0, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	movslq	main.j(%rip), %rax
	vmovss	%xmm0, atime+60(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime(,%rax,4), %xmm0
	vaddss	atime+60(,%rax,4), %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmulsd	.LCPI2_4(%rip), %xmm1, %xmm1
	vmovsd	-768(%rbp), %xmm2       # 8-byte Reload
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovss	%xmm0, atime+120(,%rax,4)
	movslq	main.j(%rip), %rax
	vdivss	.LCPI2_6(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, atime+180(,%rax,4)
	movslq	main.j(%rip), %rax
	vmovss	atime+180(,%rax,4), %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm1
	vmovsd	.LCPI2_5(%rip), %xmm2
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
	movl	main.j(%rip), %eax
	incl	%eax
	movl	%eax, main.j(%rip)
	cmpl	$12, %eax
	jl	.LBB2_42
.LBB2_47:                               # %for.end312
	vmovss	atime+228(%rip), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivsd	.LCPI2_7(%rip), %xmm0, %xmm0
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
.Ltmp28:
	.cfi_offset %rbx, -40
.Ltmp29:
	.cfi_offset %r14, -32
.Ltmp30:
	.cfi_offset %r15, -24
	movl	$0, (%r8)
	testl	%edx, %edx
	jle	.LBB3_8
# BB#1:
	movl	$1325, %r11d            # imm = 0x52D
	xorl	%r9d, %r9d
	vmovsd	.LCPI3_0(%rip), %xmm0
	vmovsd	.LCPI3_1(%rip), %xmm1
	xorl	%r10d, %r10d
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	xorl	%r15d, %r15d
	testl	%edx, %edx
	movl	%r9d, %ebx
	jle	.LBB3_7
	.align	16, 0x90
.LBB3_3:                                # %for.body3
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	imull	$3125, %r11d, %r11d     # imm = 0xC35
	movl	%r11d, %eax
	sarl	$31, %eax
	shrl	$16, %eax
	addl	%r11d, %eax
	andl	$-65536, %eax           # imm = 0xFFFFFFFFFFFF0000
	subl	%eax, %r11d
	movslq	%ebx, %r14
	vcvtsi2sdl	%r11d, %xmm0, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, (%rdi,%r14,4)
	vucomiss	(%r8), %xmm2
	jbe	.LBB3_5
# BB#4:                                 # %cond.true
                                        #   in Loop: Header=BB3_3 Depth=2
	vmovss	(%rdi,%r14,4), %xmm2
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_5:                                # %cond.false
                                        #   in Loop: Header=BB3_3 Depth=2
	vmovss	(%r8), %xmm2
.LBB3_6:                                # %cond.end
                                        #   in Loop: Header=BB3_3 Depth=2
	vmovss	%xmm2, (%r8)
	incl	%ebx
	incl	%r15d
	cmpl	%edx, %r15d
	jl	.LBB3_3
.LBB3_7:                                # %for.inc16
                                        #   in Loop: Header=BB3_2 Depth=1
	addl	%esi, %r9d
	incl	%r10d
	cmpl	%edx, %r10d
	jl	.LBB3_2
.LBB3_8:                                # %for.end18
	testl	%edx, %edx
	jle	.LBB3_11
# BB#9:
	xorl	%eax, %eax
	.align	16, 0x90
.LBB3_10:                               # %for.body22
                                        # =>This Inner Loop Header: Depth=1
	movl	$0, (%rcx,%rax,4)
	incq	%rax
	cmpl	%edx, %eax
	jl	.LBB3_10
.LBB3_11:                               # %for.end27
	testl	%edx, %edx
	jle	.LBB3_16
# BB#12:
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	.align	16, 0x90
.LBB3_13:                               # %for.body31
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_14 Depth 2
	xorl	%eax, %eax
	testl	%edx, %edx
	movl	%r8d, %ebx
	jle	.LBB3_15
	.align	16, 0x90
.LBB3_14:                               # %for.body35
                                        #   Parent Loop BB3_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovss	(%rcx,%rax,4), %xmm0
	movslq	%ebx, %rbx
	vaddss	(%rdi,%rbx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	incl	%ebx
	incq	%rax
	cmpl	%edx, %eax
	jl	.LBB3_14
.LBB3_15:                               # %for.inc48
                                        #   in Loop: Header=BB3_13 Depth=1
	addl	%esi, %r8d
	incl	%r9d
	cmpl	%edx, %r9d
	jl	.LBB3_13
.LBB3_16:                               # %for.end50
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp31:
	.size	matgen, .Ltmp31-matgen
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
.Ltmp35:
	.cfi_def_cfa_offset 16
.Ltmp36:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp37:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp38:
	.cfi_offset %rbx, -56
.Ltmp39:
	.cfi_offset %r12, -48
.Ltmp40:
	.cfi_offset %r13, -40
.Ltmp41:
	.cfi_offset %r14, -32
.Ltmp42:
	.cfi_offset %r15, -24
	movq	%r8, -72(%rbp)          # 8-byte Spill
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	movq	%rdi, %rbx
	movl	$0, (%r8)
	leal	-1(%rdx), %ecx
	movl	%ecx, -84(%rbp)         # 4-byte Spill
	testl	%ecx, %ecx
	jle	.LBB4_11
# BB#1:                                 # %for.body.preheader
	movl	-52(%rbp), %eax         # 4-byte Reload
	leal	1(%rax), %ecx
	movl	%ecx, -88(%rbp)         # 4-byte Spill
	xorl	%r12d, %r12d
	movl	%eax, -64(%rbp)         # 4-byte Spill
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
	movl	-44(%rbp), %edi         # 4-byte Reload
	subl	%r12d, %edi
	movl	%r12d, %r14d
	imull	-52(%rbp), %r14d        # 4-byte Folded Reload
	movl	%r14d, -48(%rbp)        # 4-byte Spill
	leal	(%r14,%r12), %eax
	movslq	%eax, %r15
	leaq	(%rbx,%r15,4), %rsi
	movl	$1, %edx
	callq	idamax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	leal	(%rax,%r12), %edx
	movslq	%r12d, %rax
	movq	-80(%rbp), %rcx         # 8-byte Reload
	movl	%edx, (%rcx,%rax,4)
	leal	(%rdx,%r14), %eax
	movslq	%eax, %rax
	vmovss	(%rbx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI4_1, %xmm0
	jne	.LBB4_3
	jnp	.LBB4_9
.LBB4_3:                                # %if.then13
                                        #   in Loop: Header=BB4_2 Depth=1
	leal	1(%r12), %r14d
	movl	%r12d, %ecx
	negl	%ecx
	cmpl	%r12d, %edx
	movl	%edx, -60(%rbp)         # 4-byte Spill
	je	.LBB4_5
# BB#4:                                 # %if.then16
                                        #   in Loop: Header=BB4_2 Depth=1
	vmovss	(%rbx,%rax,4), %xmm0
	vmovss	(%rbx,%r15,4), %xmm1
	vmovss	%xmm1, (%rbx,%rax,4)
	vmovss	%xmm0, (%rbx,%r15,4)
.LBB4_5:                                # %if.end
                                        #   in Loop: Header=BB4_2 Depth=1
	vmovss	(%rbx,%r15,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI4_0(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	-44(%rbp), %r15d        # 4-byte Reload
	leal	-1(%r15,%rcx), %r13d
	movl	-48(%rbp), %eax         # 4-byte Reload
	leal	1(%rax,%r12), %eax
	movslq	%eax, %rax
	leaq	(%rbx,%rax,4), %rsi
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	%r13d, %edi
	movl	$1, %edx
	callq	dscal
	cmpl	%r15d, %r14d
	movl	-64(%rbp), %r15d        # 4-byte Reload
	jge	.LBB4_10
	.align	16, 0x90
.LBB4_6:                                # %for.body49
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%r15), %eax
	movslq	%eax, %rax
	vmovss	(%rbx,%rax,4), %xmm0
	cmpl	%r12d, -60(%rbp)        # 4-byte Folded Reload
	je	.LBB4_8
# BB#7:                                 # %if.then56
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	%r15d, %rcx
	vmovss	(%rbx,%rcx,4), %xmm1
	vmovss	%xmm1, (%rbx,%rax,4)
	vmovss	%xmm0, (%rbx,%rcx,4)
.LBB4_8:                                # %if.end69
                                        #   in Loop: Header=BB4_6 Depth=2
	leal	1(%r15), %eax
	movslq	%eax, %rax
	leaq	(%rbx,%rax,4), %rcx
	movl	-48(%rbp), %eax         # 4-byte Reload
	leal	1(%r12,%rax), %eax
	movslq	%eax, %rax
	leaq	(%rbx,%rax,4), %rsi
	movl	%r13d, %edi
	movl	$1, %edx
	movl	$1, %r8d
	callq	daxpy
	addl	-52(%rbp), %r15d        # 4-byte Folded Reload
	incl	%r14d
	cmpl	-44(%rbp), %r14d        # 4-byte Folded Reload
	jl	.LBB4_6
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_9:                                # %if.else
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movl	%r12d, (%rax)
.LBB4_10:                               # %for.inc83
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	-64(%rbp), %eax         # 4-byte Reload
	addl	-88(%rbp), %eax         # 4-byte Folded Reload
	movl	%eax, -64(%rbp)         # 4-byte Spill
	incl	%r12d
	movl	-84(%rbp), %ecx         # 4-byte Reload
	cmpl	%ecx, %r12d
	jl	.LBB4_2
.LBB4_11:                               # %if.end86
	movslq	%ecx, %rax
	movq	-80(%rbp), %rdx         # 8-byte Reload
	movl	%ecx, (%rdx,%rax,4)
	movl	-52(%rbp), %edx         # 4-byte Reload
	imull	%ecx, %edx
	movl	-44(%rbp), %eax         # 4-byte Reload
	leal	-1(%rax,%rdx), %eax
	movslq	%eax, %rax
	vmovss	(%rbx,%rax,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB4_13
	jp	.LBB4_13
# BB#12:                                # %if.then100
	movq	-72(%rbp), %rax         # 8-byte Reload
	movl	%ecx, (%rax)
.LBB4_13:                               # %if.end102
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp43:
	.size	dgefa, .Ltmp43-dgefa
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
.Ltmp47:
	.cfi_def_cfa_offset 16
.Ltmp48:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp49:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp50:
	.cfi_offset %rbx, -56
.Ltmp51:
	.cfi_offset %r12, -48
.Ltmp52:
	.cfi_offset %r13, -40
.Ltmp53:
	.cfi_offset %r14, -32
.Ltmp54:
	.cfi_offset %r15, -24
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movl	%edx, %r10d
	movl	%esi, -60(%rbp)         # 4-byte Spill
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	leal	-1(%r10), %edx
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	testl	%r9d, %r9d
	je	.LBB5_1
# BB#10:                                # %if.else
	testl	%r10d, %r10d
	jle	.LBB5_13
# BB#11:                                # %for.body49.preheader
	leal	1(%rsi), %eax
	movl	%eax, -76(%rbp)         # 4-byte Spill
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movl	%r13d, %ebx
	.align	16, 0x90
.LBB5_12:                               # %for.body49
                                        # =>This Inner Loop Header: Depth=1
	movslq	%r13d, %r13
	leaq	(%rdi,%r13,4), %rsi
	movl	%r12d, %edi
	movl	$1, %edx
	movq	%r8, %rcx
	movq	%r8, %r15
	movl	$1, %r8d
	movl	%r10d, %r14d
	callq	ddot
	movl	%r14d, %r10d
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movl	-60(%rbp), %esi         # 4-byte Reload
	movq	%r15, %r8
	vmovss	(%r8,%r12,4), %xmm1
	vsubss	%xmm0, %xmm1, %xmm0
	movslq	%ebx, %rbx
	vdivss	(%rdi,%rbx,4), %xmm0, %xmm0
	addl	%esi, %r13d
	addl	-76(%rbp), %ebx         # 4-byte Folded Reload
	leaq	1(%r12), %rax
	cmpl	%r10d, %eax
	vmovss	%xmm0, (%r8,%r12,4)
	movq	%rax, %r12
	jl	.LBB5_12
.LBB5_13:                               # %for.end67
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpl	$2, %eax
	jl	.LBB5_18
# BB#14:                                # %for.body72.preheader
	leal	-2(%r10), %r14d
	movl	%esi, %eax
	imull	%r14d, %eax
	leal	-1(%r10,%rax), %r13d
	notl	%esi
	movl	%esi, -60(%rbp)         # 4-byte Spill
	movl	$1, %r12d
	.align	16, 0x90
.LBB5_15:                               # %for.body72
                                        # =>This Inner Loop Header: Depth=1
	movslq	%r14d, %rbx
	vmovss	(%r8,%rbx,4), %xmm0
	vmovss	%xmm0, -76(%rbp)        # 4-byte Spill
	movslq	%r13d, %rax
	leaq	(%rdi,%rax,4), %rsi
	leal	1(%rbx), %eax
	movslq	%eax, %rax
	leaq	(%r8,%rax,4), %rcx
	movl	%r12d, %edi
	movl	$1, %edx
	movq	%r8, %r15
	movl	$1, %r8d
	callq	ddot
	movq	%r15, %r8
	vmovss	-76(%rbp), %xmm1        # 4-byte Reload
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%r8,%rbx,4)
	movq	-72(%rbp), %rax         # 8-byte Reload
	movslq	(%rax,%rbx,4), %rax
	cmpl	%eax, %ebx
	je	.LBB5_17
# BB#16:                                # %if.then94
                                        #   in Loop: Header=BB5_15 Depth=1
	vmovss	(%r8,%rax,4), %xmm0
	vmovss	(%r8,%rbx,4), %xmm1
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rbx,4)
.LBB5_17:                               # %for.inc104
                                        #   in Loop: Header=BB5_15 Depth=1
	movl	-60(%rbp), %eax         # 4-byte Reload
	addl	%eax, %r13d
	decl	%r14d
	incl	%r12d
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpl	%eax, %r12d
	movq	-48(%rbp), %rdi         # 8-byte Reload
	jl	.LBB5_15
	jmp	.LBB5_18
.LBB5_1:                                # %if.then
	movl	%r10d, -80(%rbp)        # 4-byte Spill
	testl	%edx, %edx
	jle	.LBB5_7
# BB#2:                                 # %if.then
	jle	.LBB5_7
# BB#3:                                 # %for.body.preheader
	movl	-80(%rbp), %eax         # 4-byte Reload
	leal	-1(%rax), %r13d
	movl	-60(%rbp), %eax         # 4-byte Reload
	leal	1(%rax), %eax
	movl	%eax, -76(%rbp)         # 4-byte Spill
	leaq	4(%r8), %r14
	xorl	%ebx, %ebx
	movl	$1, %r12d
	.align	16, 0x90
.LBB5_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movslq	(%rax,%rbx,4), %rax
	vmovss	(%r8,%rax,4), %xmm0
	cmpl	%eax, %ebx
	je	.LBB5_6
# BB#5:                                 # %if.then7
                                        #   in Loop: Header=BB5_4 Depth=1
	vmovss	-4(%r14), %xmm1
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, -4(%r14)
.LBB5_6:                                # %if.end
                                        #   in Loop: Header=BB5_4 Depth=1
	movslq	%r12d, %r12
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r12,4), %rsi
	movl	%r13d, %edi
	movl	$1, %edx
	movq	%r14, %rcx
	movq	%r8, %r15
	movl	$1, %r8d
	callq	daxpy
	movq	%r15, %r8
	addl	-76(%rbp), %r12d        # 4-byte Folded Reload
	decl	%r13d
	addq	$4, %r14
	incq	%rbx
	movq	-56(%rbp), %rdx         # 8-byte Reload
	cmpl	%edx, %ebx
	jl	.LBB5_4
.LBB5_7:                                # %if.end22
	movl	-80(%rbp), %r9d         # 4-byte Reload
	testl	%r9d, %r9d
	movl	-60(%rbp), %eax         # 4-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	jle	.LBB5_18
# BB#8:                                 # %for.body25.preheader
	movl	%eax, %r14d
	imull	%edx, %r14d
	leal	-1(%r9,%r14), %ebx
	notl	%eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	xorl	%r12d, %r12d
	.align	16, 0x90
.LBB5_9:                                # %for.body25
                                        # =>This Inner Loop Header: Depth=1
	movslq	%edx, %rdx
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	vmovss	(%r8,%rdx,4), %xmm0
	movslq	%ebx, %rbx
	vdivss	(%rcx,%rbx,4), %xmm0, %xmm0
	movslq	%r14d, %r14
	leaq	(%rcx,%r14,4), %rsi
	vmovss	%xmm0, (%r8,%rdx,4)
	vxorps	.LCPI5_0(%rip), %xmm0, %xmm0
	movl	%edx, %edi
	movl	$1, %edx
	movq	%r8, %rcx
	movq	%r8, %r15
	movl	$1, %r8d
	movl	%r9d, %r13d
	callq	daxpy
	movl	%r13d, %r9d
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movl	-60(%rbp), %eax         # 4-byte Reload
	movq	%r15, %r8
	addl	-72(%rbp), %ebx         # 4-byte Folded Reload
	subl	%eax, %r14d
	decl	%edx
	incl	%r12d
	cmpl	%r9d, %r12d
	jl	.LBB5_9
.LBB5_18:                               # %if.end108
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp55:
	.size	dgesl, .Ltmp55-dgesl
	.cfi_endproc

	.globl	dmxpy
	.align	16, 0x90
	.type	dmxpy,@function
dmxpy:                                  # @dmxpy
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp62:
	.cfi_offset %rbx, -56
.Ltmp63:
	.cfi_offset %r12, -48
.Ltmp64:
	.cfi_offset %r13, -40
.Ltmp65:
	.cfi_offset %r14, -32
.Ltmp66:
	.cfi_offset %r15, -24
	movl	%ecx, -152(%rbp)        # 4-byte Spill
	movl	%edi, %r13d
	movl	%r13d, -144(%rbp)       # 4-byte Spill
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	andl	$-2, %eax
	movl	%edx, %edi
	movl	%edx, %ebx
	subl	%eax, %edi
	testl	%edi, %edi
	jle	.LBB6_4
# BB#1:                                 # %if.then
	testl	%r13d, %r13d
	jle	.LBB6_4
# BB#2:                                 # %for.body.preheader
	decl	%edi
	movl	-152(%rbp), %eax        # 4-byte Reload
                                        # kill: EAX<def> EAX<kill> RAX<def>
	imull	%edi, %eax
	xorl	%ecx, %ecx
	movslq	%edi, %rdx
	.align	16, 0x90
.LBB6_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%r8,%rdx,4), %xmm0
	leal	(%rax,%rcx), %edi
	movslq	%edi, %rdi
	vmulss	(%r9,%rdi,4), %xmm0, %xmm0
	vaddss	(%rsi,%rcx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%rcx,4)
	incq	%rcx
	cmpl	%r13d, %ecx
	jl	.LBB6_3
.LBB6_4:                                # %if.end
	movl	%ebx, %r14d
	sarl	$31, %r14d
	movl	%r14d, %ecx
	shrl	$30, %ecx
	addl	%ebx, %ecx
	andl	$-4, %ecx
	movl	%ebx, %eax
	movl	%ebx, %r11d
	subl	%ecx, %eax
	cmpl	$2, %eax
	jl	.LBB6_8
# BB#5:                                 # %if.then12
	testl	%r13d, %r13d
	jle	.LBB6_8
# BB#6:                                 # %for.body16.preheader
	leal	-1(%rax), %edi
	addl	$-2, %eax
	movl	-152(%rbp), %ecx        # 4-byte Reload
	imull	%ecx, %eax
                                        # kill: ECX<def> ECX<kill> RCX<def>
	imull	%edi, %ecx
	xorl	%edx, %edx
	movslq	%edi, %rdi
	leal	-1(%rdi), %ebx
	movslq	%ebx, %r10
	.align	16, 0x90
.LBB6_7:                                # %for.body16
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%r8,%rdi,4), %xmm0
	leal	(%rcx,%rdx), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rbx,4), %xmm0, %xmm0
	vmovss	(%r8,%r10,4), %xmm1
	leal	(%rax,%rdx), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rbx,4), %xmm1, %xmm1
	vaddss	(%rsi,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%rsi,%rdx,4)
	incq	%rdx
	cmpl	%r13d, %edx
	jl	.LBB6_7
.LBB6_8:                                # %if.end42
	movl	%r14d, %ecx
	movl	%r14d, -116(%rbp)       # 4-byte Spill
	shrl	$29, %ecx
	addl	%r11d, %ecx
	andl	$-8, %ecx
	movl	%r11d, %eax
	movl	%r11d, %r12d
	subl	%ecx, %eax
	cmpl	$4, %eax
	jl	.LBB6_12
# BB#9:                                 # %if.then45
	testl	%r13d, %r13d
	jle	.LBB6_12
# BB#10:                                # %for.body49.preheader
	leal	-4(%rax), %r10d
	movl	-152(%rbp), %ecx        # 4-byte Reload
	imull	%ecx, %r10d
	leal	-2(%rax), %r11d
	imull	%ecx, %r11d
	leal	-1(%rax), %edi
	addl	$-3, %eax
	imull	%ecx, %eax
	movl	%ecx, %r15d
	imull	%edi, %r15d
	xorl	%ecx, %ecx
	leal	-2(%rdi), %edx
	movslq	%edx, %r14
	.align	16, 0x90
.LBB6_11:                               # %for.body49
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%r8,%r14,4), %xmm0
	leal	(%rax,%rcx), %edx
	movslq	%edx, %rdx
	leal	-3(%rdi), %ebx
	movslq	%ebx, %rbx
	vmulss	(%r9,%rdx,4), %xmm0, %xmm0
	vmovss	(%r8,%rbx,4), %xmm1
	leal	(%r10,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	vaddss	(%rsi,%rcx,4), %xmm1, %xmm1
	leal	-1(%rdi), %edx
	movslq	%edx, %rdx
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	(%r8,%rdx,4), %xmm1
	leal	(%r11,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	movslq	%edi, %rdx
	vmovss	(%r8,%rdx,4), %xmm1
	leal	(%r15,%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%rcx,4)
	incq	%rcx
	cmpl	%r13d, %ecx
	jl	.LBB6_11
.LBB6_12:                               # %if.end95
	movl	-116(%rbp), %eax        # 4-byte Reload
	shrl	$28, %eax
	movl	%r12d, -156(%rbp)       # 4-byte Spill
	addl	%r12d, %eax
	andl	$-16, %eax
	movl	%eax, -116(%rbp)        # 4-byte Spill
	subl	%eax, %r12d
	movl	%r12d, -120(%rbp)       # 4-byte Spill
	cmpl	$8, %r12d
	jl	.LBB6_16
# BB#13:                                # %if.then98
	testl	%r13d, %r13d
	jle	.LBB6_16
# BB#14:                                # %for.body102.preheader
	movl	-120(%rbp), %ecx        # 4-byte Reload
	leal	-1(%rcx), %r10d
	movl	%r10d, -44(%rbp)        # 4-byte Spill
	leal	-7(%rcx), %edi
	movl	-152(%rbp), %eax        # 4-byte Reload
	imull	%eax, %edi
	movq	%rdi, -56(%rbp)         # 8-byte Spill
	leal	-8(%rcx), %edi
	imull	%eax, %edi
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	leal	-4(%rcx), %r11d
	leal	-3(%rcx), %ebx
	leal	-2(%rcx), %edx
	movl	%eax, %edi
	imull	%r10d, %edi
	movq	%rdi, -96(%rbp)         # 8-byte Spill
	imull	%eax, %edx
	movq	%rdx, -88(%rbp)         # 8-byte Spill
	imull	%eax, %ebx
	movq	%rbx, -80(%rbp)         # 8-byte Spill
	imull	%eax, %r11d
	movq	%r11, -72(%rbp)         # 8-byte Spill
	leal	-5(%rcx), %edx
	imull	%eax, %edx
	movq	%rdx, -104(%rbp)        # 8-byte Spill
	leal	-6(%rcx), %ecx
	imull	%eax, %ecx
	movq	%rcx, -112(%rbp)        # 8-byte Spill
	xorl	%r10d, %r10d
	movl	-44(%rbp), %ebx         # 4-byte Reload
	.align	16, 0x90
.LBB6_15:                               # %for.body102
                                        # =>This Inner Loop Header: Depth=1
	leal	-7(%rbx), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax         # 8-byte Reload
	leal	(%rax,%r10), %eax
	vmovss	(%r8,%rdx,4), %xmm0
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leal	(%rcx,%r10), %edx
	movslq	%edx, %rdx
	leal	-6(%rbx), %edi
	movslq	%edi, %rdi
	vmulss	(%r9,%rdx,4), %xmm0, %xmm0
	vmovss	(%r8,%rdi,4), %xmm1
	movq	-112(%rbp), %rcx        # 8-byte Reload
	leal	(%rcx,%r10), %edx
	movslq	%eax, %rax
	leal	-5(%rbx), %edi
	movslq	%edi, %rdi
	vmulss	(%r9,%rax,4), %xmm1, %xmm1
	vaddss	(%rsi,%r10,4), %xmm0, %xmm2
	vmovss	(%r8,%rdi,4), %xmm3
	movslq	%edx, %r15
	movq	-96(%rbp), %rax         # 8-byte Reload
	leal	(%rax,%r10), %edx
	movq	-80(%rbp), %rax         # 8-byte Reload
	leal	(%rax,%r10), %edi
	movq	-72(%rbp), %rax         # 8-byte Reload
	leal	(%rax,%r10), %eax
	leal	-2(%rbx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%r8,%rcx,4), %xmm0
	movslq	%ebx, %r11
	vmovss	(%r8,%r11,4), %xmm4
	movq	-88(%rbp), %rcx         # 8-byte Reload
	leal	(%rcx,%r10), %r14d
	movslq	%eax, %r12
	movl	%r13d, %ecx
	movslq	%edi, %r13
	movslq	%edx, %rdx
	vmulss	(%r9,%r15,4), %xmm3, %xmm3
	leal	-3(%r11), %eax
	movslq	%eax, %rax
	vaddss	%xmm1, %xmm2, %xmm2
	vmovss	(%r8,%rax,4), %xmm5
	leal	-1(%r11), %eax
	addl	$-4, %r11d
	movslq	%eax, %rax
	vmulss	(%r9,%rdx,4), %xmm4, %xmm1
	leaq	1(%r10), %r15
	vmulss	(%r9,%r13,4), %xmm0, %xmm0
	movl	%ecx, %r13d
	vmulss	(%r9,%r12,4), %xmm5, %xmm5
	vmovss	(%r8,%rax,4), %xmm4
	movslq	%r14d, %rax
	vaddss	%xmm3, %xmm2, %xmm2
	movslq	%r11d, %rcx
	vmovss	(%r8,%rcx,4), %xmm3
	movq	-104(%rbp), %rcx        # 8-byte Reload
	leal	(%rcx,%r10), %ecx
	movslq	%ecx, %rcx
	vmulss	(%r9,%rcx,4), %xmm3, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm5, %xmm2, %xmm2
	cmpl	%r13d, %r15d
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	(%r9,%rax,4), %xmm4, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%r10,4)
	movq	%r15, %r10
	jl	.LBB6_15
.LBB6_16:                               # %if.end188
	movq	%rsi, -168(%rbp)        # 8-byte Spill
	movl	-116(%rbp), %edx        # 4-byte Reload
	negl	%edx
	movl	-156(%rbp), %eax        # 4-byte Reload
	leal	15(%rax,%rdx), %r11d
	cmpl	%eax, %r11d
	jge	.LBB6_21
# BB#17:                                # %for.body194.preheader
	movl	-120(%rbp), %edx        # 4-byte Reload
	leal	1(%rdx), %eax
	movl	%edx, %ecx
	movl	-152(%rbp), %r14d       # 4-byte Reload
	imull	%r14d, %ecx
	movl	%ecx, -140(%rbp)        # 4-byte Spill
	xorl	%edi, %edi
	imull	%r14d, %eax
	movl	%eax, -136(%rbp)        # 4-byte Spill
	leal	15(%rdx), %eax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	leal	14(%rdx), %eax
	movl	%eax, -64(%rbp)         # 4-byte Spill
	leal	13(%rdx), %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	leal	12(%rdx), %eax
	movl	%eax, -80(%rbp)         # 4-byte Spill
	leal	11(%rdx), %eax
	movl	%eax, -88(%rbp)         # 4-byte Spill
	leal	10(%rdx), %eax
	movl	%eax, -96(%rbp)         # 4-byte Spill
	leal	9(%rdx), %eax
	movl	%eax, -44(%rbp)         # 4-byte Spill
	leal	8(%rdx), %esi
	leal	7(%rdx), %ebx
	leal	6(%rdx), %ecx
	leal	5(%rdx), %r15d
	leal	4(%rdx), %eax
	leal	3(%rdx), %r10d
	leal	2(%rdx), %r12d
	imull	%r14d, %r12d
	movl	%r12d, -132(%rbp)       # 4-byte Spill
	imull	%r14d, %r10d
	movl	%r10d, -128(%rbp)       # 4-byte Spill
	imull	%r14d, %eax
	movl	%eax, -124(%rbp)        # 4-byte Spill
	imull	%r14d, %r15d
	movl	%r15d, -120(%rbp)       # 4-byte Spill
	imull	%r14d, %ecx
	movl	%ecx, -116(%rbp)        # 4-byte Spill
	imull	%r14d, %ebx
	movl	%ebx, -112(%rbp)        # 4-byte Spill
	imull	%r14d, %esi
	movl	%esi, -104(%rbp)        # 4-byte Spill
	movl	-44(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -44(%rbp)         # 4-byte Spill
	movl	-96(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -96(%rbp)         # 4-byte Spill
	movl	-88(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -88(%rbp)         # 4-byte Spill
	movl	-80(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -80(%rbp)         # 4-byte Spill
	movl	-72(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	movl	-64(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -64(%rbp)         # 4-byte Spill
	movl	-56(%rbp), %eax         # 4-byte Reload
	imull	%r14d, %eax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	shll	$4, %r14d
	movl	%r14d, -152(%rbp)       # 4-byte Spill
	movq	-168(%rbp), %rsi        # 8-byte Reload
	.align	16, 0x90
.LBB6_18:                               # %for.body194
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_19 Depth 2
	movl	%edi, -148(%rbp)        # 4-byte Spill
	xorl	%r15d, %r15d
	testl	%r13d, %r13d
	movl	%edi, %r14d
	jle	.LBB6_20
	.align	16, 0x90
.LBB6_19:                               # %for.body197
                                        #   Parent Loop BB6_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-140(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%r14), %eax
	leal	-15(%r11), %ecx
	movslq	%ecx, %rcx
	vmovss	(%r8,%rcx,4), %xmm0
	movslq	%eax, %rcx
	leal	-11(%r11), %eax
	leal	-12(%r11), %edi
	leal	-14(%r11), %ebx
	movl	-136(%rbp), %edx        # 4-byte Reload
	leal	(%rdx,%r14), %r13d
	movl	-128(%rbp), %edx        # 4-byte Reload
	leal	(%rdx,%r14), %edx
	movslq	%ebx, %rbx
	movslq	%edi, %rdi
	movslq	%eax, %rax
	vmulss	(%r9,%rcx,4), %xmm0, %xmm4
	vmovss	(%r8,%rax,4), %xmm8
	vmovss	(%r8,%rdi,4), %xmm2
	leal	-1(%r11), %eax
	movslq	%eax, %rcx
	movslq	%edx, %r12
	movl	-124(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%r14), %r10d
	movl	-120(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%r14), %edx
	vmovss	(%r8,%rbx,4), %xmm3
	movslq	%r13d, %rdi
	movl	-132(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%r14), %eax
	leal	-13(%r11), %ebx
	movslq	%ebx, %rbx
	vmovss	(%r8,%rbx,4), %xmm1
	leal	-10(%r11), %ebx
	movslq	%ebx, %rbx
	movslq	%eax, %r13
	vmovss	(%r8,%rbx,4), %xmm0
	leal	-8(%r11), %eax
	movslq	%eax, %rax
	vmulss	(%r9,%rdi,4), %xmm3, %xmm7
	vmovss	(%r8,%rcx,4), %xmm3
	movslq	%r11d, %rcx
	vmovss	(%r8,%rcx,4), %xmm6
	movslq	%edx, %rbx
	vmovss	(%r8,%rax,4), %xmm5
	vmulss	(%r9,%r13,4), %xmm1, %xmm1
	vaddss	(%rsi,%r15,4), %xmm4, %xmm4
	movslq	%r10d, %rax
	movl	-64(%rbp), %edx         # 4-byte Reload
	leal	(%rdx,%r14), %r13d
	movl	-72(%rbp), %edx         # 4-byte Reload
	leal	(%rdx,%r14), %edi
	vmulss	(%r9,%r12,4), %xmm2, %xmm11
	leal	-9(%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rbx,4), %xmm0, %xmm9
	movl	-56(%rbp), %ebx         # 4-byte Reload
	leal	(%rbx,%r14), %ebx
	vmulss	(%r9,%rax,4), %xmm8, %xmm10
	vmovss	(%r8,%rdx,4), %xmm2
	movl	-116(%rbp), %eax        # 4-byte Reload
	leal	(%rax,%r14), %eax
	movslq	%eax, %rdx
	vaddss	%xmm7, %xmm4, %xmm0
	movl	-88(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%r14), %r12d
	movslq	%edi, %r10
	movslq	%r13d, %rdi
	movslq	%ebx, %rax
	vmulss	(%r9,%rdx,4), %xmm2, %xmm7
	movl	-112(%rbp), %edx        # 4-byte Reload
	leal	(%rdx,%r14), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rdx,4), %xmm5, %xmm12
	leal	-2(%rcx), %edx
	movslq	%edx, %rdx
	vmulss	(%r9,%rax,4), %xmm6, %xmm8
	leal	-3(%rcx), %eax
	movslq	%eax, %rax
	vmulss	(%r9,%rdi,4), %xmm3, %xmm3
	vmovss	(%r8,%rdx,4), %xmm2
	vmulss	(%r9,%r10,4), %xmm2, %xmm6
	vaddss	%xmm1, %xmm0, %xmm1
	movl	-96(%rbp), %edx         # 4-byte Reload
	leal	(%rdx,%r14), %r10d
	movl	-44(%rbp), %edx         # 4-byte Reload
	leal	(%rdx,%r14), %edx
	movl	-104(%rbp), %edi        # 4-byte Reload
	leal	(%rdi,%r14), %edi
	movslq	%r12d, %rbx
	vmovss	(%r8,%rax,4), %xmm0
	movl	-80(%rbp), %eax         # 4-byte Reload
	leal	(%rax,%r14), %eax
	movslq	%eax, %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	leal	-4(%rcx), %eax
	movslq	%eax, %rax
	vaddss	%xmm11, %xmm1, %xmm4
	vmovss	(%r8,%rax,4), %xmm1
	leal	-5(%rcx), %r12d
	vmulss	(%r9,%rbx,4), %xmm1, %xmm1
	leal	-6(%rcx), %eax
	addl	$-7, %ecx
	movslq	%edi, %r13
	movslq	%edx, %rdx
	movslq	%r10d, %rdi
	movslq	%ecx, %rbx
	movslq	%eax, %rax
	movslq	%r12d, %rcx
	vaddss	%xmm10, %xmm4, %xmm2
	vmovss	(%r8,%rcx,4), %xmm4
	vaddss	%xmm9, %xmm2, %xmm5
	vmulss	(%r9,%rdi,4), %xmm4, %xmm2
	leaq	1(%r15), %rcx
	vmovss	(%r8,%rax,4), %xmm4
	vmulss	(%r9,%rdx,4), %xmm4, %xmm4
	vaddss	%xmm7, %xmm5, %xmm5
	vmovss	(%r8,%rbx,4), %xmm7
	vmulss	(%r9,%r13,4), %xmm7, %xmm7
	movl	-144(%rbp), %r13d       # 4-byte Reload
	incl	%r14d
	cmpl	%r13d, %ecx
	vaddss	%xmm12, %xmm5, %xmm5
	vaddss	%xmm7, %xmm5, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm8, %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%r15,4)
	movq	%rcx, %r15
	jl	.LBB6_19
.LBB6_20:                               # %for.inc363
                                        #   in Loop: Header=BB6_18 Depth=1
	movl	-148(%rbp), %edi        # 4-byte Reload
	addl	-152(%rbp), %edi        # 4-byte Folded Reload
	addl	$16, %r11d
	cmpl	-156(%rbp), %r11d       # 4-byte Folded Reload
	jl	.LBB6_18
.LBB6_21:                               # %for.end365
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp67:
	.size	dmxpy, .Ltmp67-dmxpy
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI7_0:
	.long	872415232               # float 1.1920929E-7
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_1:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.text
	.globl	epslon
	.align	16, 0x90
	.type	epslon,@function
epslon:                                 # @epslon
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp70:
	.cfi_def_cfa_offset 16
.Ltmp71:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp72:
	.cfi_def_cfa_register %rbp
	vmovss	.LCPI7_0(%rip), %xmm1
	xorb	%al, %al
	.align	16, 0x90
.LBB7_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	testb	%al, %al
	jne	.LBB7_1
# BB#2:                                 # %while.end
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI7_1(%rip), %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	popq	%rbp
	ret
.Ltmp73:
	.size	epslon, .Ltmp73-epslon
	.cfi_endproc

	.globl	print_time
	.align	16, 0x90
	.type	print_time,@function
print_time:                             # @print_time
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp76:
	.cfi_def_cfa_offset 16
.Ltmp77:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp78:
	.cfi_def_cfa_register %rbp
	popq	%rbp
	ret
.Ltmp79:
	.size	print_time, .Ltmp79-print_time
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
.Ltmp82:
	.cfi_def_cfa_offset 16
.Ltmp83:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp84:
	.cfi_def_cfa_register %rbp
	movl	$-1, %eax
	testl	%edi, %edi
	jle	.LBB9_13
# BB#1:                                 # %if.end
	xorl	%eax, %eax
	cmpl	$1, %edi
	je	.LBB9_13
# BB#2:                                 # %if.end3
	vmovss	(%rsi), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	je	.LBB9_8
# BB#3:                                 # %if.then5
	cmpl	$2, %edi
                                        # implicit-def: EAX
	jl	.LBB9_13
# BB#4:                                 # %for.body.preheader
	leal	1(%rdx), %eax
	movslq	%eax, %rax
	leaq	(%rsi,%rax,4), %rcx
	movslq	%edx, %rdx
	shlq	$2, %rdx
	movl	$1, %esi
	vmovsd	.LCPI9_0(%rip), %xmm1
                                        # implicit-def: EAX
	.align	16, 0x90
.LBB9_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm1, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm0, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jbe	.LBB9_7
# BB#6:                                 # %if.then15
                                        #   in Loop: Header=BB9_5 Depth=1
	vmovss	(%rcx), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	%esi, %eax
.LBB9_7:                                # %if.end21
                                        #   in Loop: Header=BB9_5 Depth=1
	addq	%rdx, %rcx
	incl	%esi
	cmpl	%edi, %esi
	jl	.LBB9_5
	jmp	.LBB9_13
.LBB9_8:                                # %if.else
	xorl	%eax, %eax
	cmpl	$2, %edi
	jl	.LBB9_13
# BB#9:
	movl	$1, %ecx
	vmovsd	.LCPI9_0(%rip), %xmm1
	.align	16, 0x90
.LBB9_10:                               # %for.body30
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rsi,%rcx,4), %xmm2
	vcvtss2sd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm1, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm0, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jbe	.LBB9_12
# BB#11:                                # %if.then38
                                        #   in Loop: Header=BB9_10 Depth=1
	vmovss	(%rsi,%rcx,4), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vandpd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	%ecx, %eax
.LBB9_12:                               # %for.inc45
                                        #   in Loop: Header=BB9_10 Depth=1
	incq	%rcx
	cmpl	%edi, %ecx
	jl	.LBB9_10
.LBB9_13:                               # %return
	popq	%rbp
	ret
.Ltmp85:
	.size	idamax, .Ltmp85-idamax
	.cfi_endproc

	.globl	dscal
	.align	16, 0x90
	.type	dscal,@function
dscal:                                  # @dscal
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp88:
	.cfi_def_cfa_offset 16
.Ltmp89:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp90:
	.cfi_def_cfa_register %rbp
	testl	%edi, %edi
	jle	.LBB10_8
# BB#1:                                 # %if.end
	cmpl	$1, %edx
	je	.LBB10_5
# BB#2:                                 # %if.then2
	imull	%edx, %edi
	testl	%edi, %edi
	jle	.LBB10_8
# BB#3:                                 # %for.body.preheader
	movslq	%edx, %rax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB10_4:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulss	(%rsi,%rcx,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rsi,%rcx,4)
	addq	%rax, %rcx
	cmpl	%edi, %ecx
	jl	.LBB10_4
	jmp	.LBB10_8
.LBB10_5:                               # %if.end7
	testl	%edi, %edi
	jle	.LBB10_8
# BB#6:
	xorl	%eax, %eax
	.align	16, 0x90
.LBB10_7:                               # %for.body10
                                        # =>This Inner Loop Header: Depth=1
	vmulss	(%rsi,%rax,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rsi,%rax,4)
	incq	%rax
	cmpl	%edi, %eax
	jl	.LBB10_7
.LBB10_8:                               # %for.end17
	popq	%rbp
	ret
.Ltmp91:
	.size	dscal, .Ltmp91-dscal
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
	testl	%edi, %edi
	jle	.LBB11_14
# BB#1:                                 # %if.end
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jne	.LBB11_2
	jnp	.LBB11_14
.LBB11_2:                               # %if.end4
	cmpl	$1, %edx
	jne	.LBB11_4
# BB#3:                                 # %if.end4
	cmpl	$1, %r8d
	je	.LBB11_11
.LBB11_4:                               # %if.then9
	xorl	%r9d, %r9d
	testl	%edx, %edx
	movl	$0, %r10d
	jns	.LBB11_6
# BB#5:                                 # %if.then12
	movl	$1, %r10d
	subl	%edi, %r10d
	imull	%edx, %r10d
.LBB11_6:                               # %if.end13
	testl	%r8d, %r8d
	jns	.LBB11_8
# BB#7:                                 # %if.then16
	movl	$1, %r9d
	subl	%edi, %r9d
	imull	%r8d, %r9d
.LBB11_8:                               # %if.end20
	testl	%edi, %edi
	jle	.LBB11_14
# BB#9:                                 # %for.body.preheader
	movslq	%edx, %r11
	movslq	%r9d, %rax
	movslq	%r10d, %rdx
	leaq	(%rsi,%rdx,4), %rdx
	leaq	(%rcx,%rax,4), %rcx
	shlq	$2, %r11
	movslq	%r8d, %rsi
	shlq	$2, %rsi
	xorl	%eax, %eax
	.align	16, 0x90
.LBB11_10:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulss	(%rdx), %xmm0, %xmm1
	vaddss	(%rcx), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx)
	addq	%r11, %rdx
	addq	%rsi, %rcx
	incl	%eax
	cmpl	%edi, %eax
	jl	.LBB11_10
	jmp	.LBB11_14
.LBB11_11:                              # %if.end31
	testl	%edi, %edi
	jle	.LBB11_14
# BB#12:
	xorl	%eax, %eax
	.align	16, 0x90
.LBB11_13:                              # %for.body35
                                        # =>This Inner Loop Header: Depth=1
	vmulss	(%rsi,%rax,4), %xmm0, %xmm1
	vaddss	(%rcx,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%rax,4)
	incq	%rax
	cmpl	%edi, %eax
	jl	.LBB11_13
.LBB11_14:                              # %return
	popq	%rbp
	ret
.Ltmp97:
	.size	daxpy, .Ltmp97-daxpy
	.cfi_endproc

	.globl	ddot
	.align	16, 0x90
	.type	ddot,@function
ddot:                                   # @ddot
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp100:
	.cfi_def_cfa_offset 16
.Ltmp101:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp102:
	.cfi_def_cfa_register %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%edi, %edi
	jle	.LBB12_13
# BB#1:                                 # %if.end
	cmpl	$1, %edx
	jne	.LBB12_3
# BB#2:                                 # %if.end
	cmpl	$1, %r8d
	je	.LBB12_10
.LBB12_3:                               # %if.then3
	xorl	%r9d, %r9d
	testl	%edx, %edx
	movl	$0, %r10d
	jns	.LBB12_5
# BB#4:                                 # %if.then5
	movl	$1, %r10d
	subl	%edi, %r10d
	imull	%edx, %r10d
.LBB12_5:                               # %if.end6
	testl	%r8d, %r8d
	jns	.LBB12_7
# BB#6:                                 # %if.then8
	movl	$1, %r9d
	subl	%edi, %r9d
	imull	%r8d, %r9d
.LBB12_7:                               # %if.end12
	testl	%edi, %edi
	jle	.LBB12_13
# BB#8:                                 # %for.body.preheader
	movslq	%edx, %r11
	movslq	%r9d, %rax
	movslq	%r10d, %rdx
	leaq	(%rsi,%rdx,4), %rdx
	leaq	(%rcx,%rax,4), %rcx
	shlq	$2, %r11
	movslq	%r8d, %rsi
	shlq	$2, %rsi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	.align	16, 0x90
.LBB12_9:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rdx), %xmm1
	addq	%r11, %rdx
	vmulss	(%rcx), %xmm1, %xmm1
	addq	%rsi, %rcx
	vaddss	%xmm1, %xmm0, %xmm0
	incl	%eax
	cmpl	%edi, %eax
	jl	.LBB12_9
	jmp	.LBB12_13
.LBB12_10:                              # %if.end20
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%edi, %edi
	jle	.LBB12_13
# BB#11:
	xorl	%eax, %eax
	.align	16, 0x90
.LBB12_12:                              # %for.body23
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rsi,%rax,4), %xmm1
	vmulss	(%rcx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	incq	%rax
	cmpl	%edi, %eax
	jl	.LBB12_12
.LBB12_13:                              # %return
	popq	%rbp
	ret
.Ltmp103:
	.size	ddot, .Ltmp103-ddot
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
