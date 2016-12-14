; ModuleID = 'oourafft.slicm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %call = call double @get_time()
  %call1 = call double @get_time()
  br label %entry.split

entry.split:                                      ; preds = %entry
  %ni = fsub double %call1, %call
  br label %entry.split.split

entry.split.split:                                ; preds = %entry.split
  %call2 = call double @sqrt(double 1.024000e+03) #5
  %mul = fmul double %call2, 4.000000e+00
  %conv = fptoui double %mul to i64
  %call3 = call noalias i8* @memalign(i64 16, i64 %conv) #5
  %0 = bitcast i8* %call3 to i32*
  %call4 = call noalias i8* @memalign(i64 16, i64 20480) #5
  %1 = bitcast i8* %call4 to double*
  call void @makewt(i32 512, i32* %0, double* %1)
  %call5 = call noalias i8* @memalign(i64 16, i64 16384) #5
  %2 = bitcast i8* %call5 to double*
  %call6 = call noalias i8* @memalign(i64 16, i64 16384) #5
  %3 = bitcast i8* %call6 to double*
  %call7 = call noalias i8* @memalign(i64 16, i64 16384) #5
  %4 = bitcast i8* %call7 to double*
  call void @putdata(i32 0, i32 2047, double* %2)
  call void @cdft(i32 2048, i32 1, double* %2, i32* %0, double* %1)
  call void @cdft(i32 2048, i32 -1, double* %2, i32* %0, double* %1)
  %call8 = call double @errorcheck(i32 0, i32 2047, double 9.765625e-04, double* %2)
  %call9 = call double @fabs(double %call8) #7
  %cmp10 = fcmp ogt double %call9, 1.000000e-10
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split.split
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i32 0, i32 0), double %call8)
  call void @abort() #8
  unreachable

if.end:                                           ; preds = %entry.split.split
  %5 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16384, i32 8, i1 false)
  call void @putdata(i32 0, i32 1023, double* %2)
  call void @cdft(i32 2048, i32 1, double* %2, i32* %0, double* %1)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %j.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  %cmp13 = icmp slt i32 %j.0, 1024
  br i1 %cmp13, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul15 = mul nsw i32 2, %j.0
  %add = add nsw i32 %mul15, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %6 = load double* %arrayidx, align 8
  %sub16 = fsub double -0.000000e+00, %6
  %mul17 = mul nsw i32 2, %j.0
  %add18 = add nsw i32 %mul17, 1
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double* %2, i64 %idxprom19
  store double %sub16, double* %arrayidx20, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = bitcast double* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16384, i32 8, i1 false)
  call void @putdata(i32 0, i32 1023, double* %4)
  %call21 = call double @get_time()
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc60, %for.end
  %i.0 = phi i32 [ 0, %for.end ], [ %inc61, %for.inc60 ]
  %cmp23 = icmp slt i32 %i.0, 150000
  br i1 %cmp23, label %for.body25, label %for.end62

for.body25:                                       ; preds = %for.cond22
  %8 = bitcast double* %3 to i8*
  %9 = bitcast double* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 16384, i32 8, i1 false)
  call void @cdft(i32 2048, i32 1, double* %3, i32* %0, double* %1)
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc57, %for.body25
  %k.0 = phi i32 [ 0, %for.body25 ], [ %inc58, %for.inc57 ]
  %cmp27 = icmp slt i32 %k.0, 1024
  br i1 %cmp27, label %for.body29, label %for.end59

for.body29:                                       ; preds = %for.cond26
  %mul30 = mul nsw i32 2, %k.0
  %idxprom31 = sext i32 %mul30 to i64
  %arrayidx32 = getelementptr inbounds double* %3, i64 %idxprom31
  %10 = load double* %arrayidx32, align 8
  %mul33 = mul nsw i32 2, %k.0
  %idxprom34 = sext i32 %mul33 to i64
  %arrayidx35 = getelementptr inbounds double* %2, i64 %idxprom34
  %11 = load double* %arrayidx35, align 8
  %mul36 = mul nsw i32 2, %k.0
  %add37 = add nsw i32 %mul36, 1
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds double* %3, i64 %idxprom38
  %12 = load double* %arrayidx39, align 8
  %mul40 = mul nsw i32 2, %k.0
  %add41 = add nsw i32 %mul40, 1
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds double* %2, i64 %idxprom42
  %13 = load double* %arrayidx43, align 8
  br label %for.body29.split

for.body29.split:                                 ; preds = %for.body29
  %ni15 = fmul double %12, %13
  br label %for.body29.split.split12

for.body29.split.split12:                         ; preds = %for.body29.split
  %ni9 = fmul double %10, %11
  br label %for.body29.split.split

for.body29.split.split:                           ; preds = %for.body29.split.split12
  %ni26 = fmul double %12, %11
  br label %for.body29.split.split.split23

for.body29.split.split.split23:                   ; preds = %for.body29.split.split
  %ni20 = fmul double %10, %13
  br label %for.body29.split.split.split

for.body29.split.split.split:                     ; preds = %for.body29.split.split.split23
  %sub46 = fsub double %ni9, %ni15
  %mul47 = mul nsw i32 2, %k.0
  %idxprom48 = sext i32 %mul47 to i64
  %arrayidx49 = getelementptr inbounds double* %3, i64 %idxprom48
  store double %sub46, double* %arrayidx49, align 8
  %add52 = fadd double %ni20, %ni26
  %mul53 = mul nsw i32 2, %k.0
  %add54 = add nsw i32 %mul53, 1
  %idxprom55 = sext i32 %add54 to i64
  %arrayidx56 = getelementptr inbounds double* %3, i64 %idxprom55
  store double %add52, double* %arrayidx56, align 8
  br label %for.inc57

for.inc57:                                        ; preds = %for.body29.split.split.split
  %inc58 = add nsw i32 %k.0, 1
  br label %for.cond26

for.end59:                                        ; preds = %for.cond26
  call void @cdft(i32 2048, i32 -1, double* %3, i32* %0, double* %1)
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %inc61 = add nsw i32 %i.0, 1
  br label %for.cond22

for.end62:                                        ; preds = %for.cond22
  %call63 = call double @get_time()
  br label %for.end62.split

for.end62.split:                                  ; preds = %for.end62
  %ni4 = fsub double %call63, %call21
  br label %for.end62.split.split

for.end62.split.split:                            ; preds = %for.end62.split
  %sub65 = fsub double %ni4, %ni
  %add66 = fadd double 0.000000e+00, %sub65
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc96, %for.end62.split.split
  %j.1 = phi i32 [ 0, %for.end62.split.split ], [ %inc97, %for.inc96 ]
  %cmp68 = icmp slt i32 %j.1, 1024
  br i1 %cmp68, label %for.body70, label %for.end98

for.body70:                                       ; preds = %for.cond67
  %mul71 = mul nsw i32 2, %j.1
  %idxprom72 = sext i32 %mul71 to i64
  %arrayidx73 = getelementptr inbounds double* %3, i64 %idxprom72
  %14 = load double* %arrayidx73, align 8
  %call74 = call double @fabs(double %14) #7
  %cmp75 = fcmp ogt double %call74, 1.000000e-09
  br i1 %cmp75, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body70
  %mul77 = mul nsw i32 2, %j.1
  %idxprom78 = sext i32 %mul77 to i64
  %arrayidx79 = getelementptr inbounds double* %3, i64 %idxprom78
  %15 = load double* %arrayidx79, align 8
  br label %cond.end

cond.false:                                       ; preds = %for.body70
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %15, %cond.true ], [ 0.000000e+00, %cond.false ]
  %mul80 = mul nsw i32 2, %j.1
  %add81 = add nsw i32 %mul80, 1
  %idxprom82 = sext i32 %add81 to i64
  %arrayidx83 = getelementptr inbounds double* %3, i64 %idxprom82
  %16 = load double* %arrayidx83, align 8
  %call84 = call double @fabs(double %16) #7
  %cmp85 = fcmp ogt double %call84, 1.000000e-09
  br i1 %cmp85, label %cond.true87, label %cond.false92

cond.true87:                                      ; preds = %cond.end
  %mul88 = mul nsw i32 2, %j.1
  %add89 = add nsw i32 %mul88, 1
  %idxprom90 = sext i32 %add89 to i64
  %arrayidx91 = getelementptr inbounds double* %3, i64 %idxprom90
  %17 = load double* %arrayidx91, align 8
  br label %cond.end93

cond.false92:                                     ; preds = %cond.end
  br label %cond.end93

cond.end93:                                       ; preds = %cond.false92, %cond.true87
  %cond94 = phi double [ %17, %cond.true87 ], [ 0.000000e+00, %cond.false92 ]
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), double %cond, double %cond94)
  br label %for.inc96

for.inc96:                                        ; preds = %cond.end93
  %inc97 = add nsw i32 %j.1, 1
  br label %for.cond67

for.end98:                                        ; preds = %for.cond67
  %18 = bitcast double* %2 to i8*
  call void @free(i8* %18) #5
  %19 = bitcast double* %1 to i8*
  call void @free(i8* %19) #5
  %20 = bitcast i32* %0 to i8*
  call void @free(i8* %20) #5
  %21 = bitcast double* %3 to i8*
  call void @free(i8* %21) #5
  %22 = bitcast double* %4 to i8*
  call void @free(i8* %22) #5
  ret i32 0
}

; Function Attrs: nounwind uwtable
define double @get_time() #0 {
entry:
  %tv = alloca %struct.timeval, align 8
  %call = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %tv_sec = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %0 = load i64* %tv_sec, align 8
  %conv = sitofp i64 %0 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %1 = load i64* %tv_usec, align 8
  %conv1 = sitofp i64 %1 to double
  %mul = fmul double %conv1, 1.000000e-06
  %add = fadd double %conv, %mul
  ret double %add
}

; Function Attrs: nounwind
declare noalias i8* @memalign(i64, i64) #1

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define void @makewt(i32 %nw, i32* %ip, double* %w) #0 {
entry:
  %cmp = icmp sgt i32 %nw, 2
  br i1 %cmp, label %if.then, label %if.end32

if.then:                                          ; preds = %entry
  %shr = ashr i32 %nw, 1
  %call = call double @atan(double 1.000000e+00) #5
  %conv = sitofp i32 %shr to double
  %div = fdiv double %call, %conv
  %arrayidx = getelementptr inbounds double* %w, i64 0
  store double 1.000000e+00, double* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds double* %w, i64 1
  store double 0.000000e+00, double* %arrayidx1, align 8
  %conv2 = sitofp i32 %shr to double
  %mul = fmul double %div, %conv2
  %call3 = call double @cos(double %mul) #5
  %idxprom = sext i32 %shr to i64
  %arrayidx4 = getelementptr inbounds double* %w, i64 %idxprom
  store double %call3, double* %arrayidx4, align 8
  %idxprom5 = sext i32 %shr to i64
  %arrayidx6 = getelementptr inbounds double* %w, i64 %idxprom5
  %0 = load double* %arrayidx6, align 8
  %add = add nsw i32 %shr, 1
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds double* %w, i64 %idxprom7
  store double %0, double* %arrayidx8, align 8
  %cmp9 = icmp sgt i32 %shr, 2
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.then
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then11
  %j.0 = phi i32 [ 2, %if.then11 ], [ %add31, %for.inc ]
  %cmp12 = icmp slt i32 %j.0, %shr
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni = sub i32 %nw, %j.0
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  %conv14 = sitofp i32 %j.0 to double
  %mul15 = fmul double %div, %conv14
  %call16 = call double @cos(double %mul15) #5
  %conv17 = sitofp i32 %j.0 to double
  %mul18 = fmul double %div, %conv17
  %call19 = call double @sin(double %mul18) #5
  %idxprom20 = sext i32 %j.0 to i64
  %arrayidx21 = getelementptr inbounds double* %w, i64 %idxprom20
  store double %call16, double* %arrayidx21, align 8
  %add22 = add nsw i32 %j.0, 1
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds double* %w, i64 %idxprom23
  store double %call19, double* %arrayidx24, align 8
  %idxprom25 = sext i32 %ni to i64
  %arrayidx26 = getelementptr inbounds double* %w, i64 %idxprom25
  store double %call19, double* %arrayidx26, align 8
  %add28 = add nsw i32 %ni, 1
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds double* %w, i64 %idxprom29
  store double %call16, double* %arrayidx30, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body.split
  %add31 = add nsw i32 %j.0, 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @bitrv2(i32 %nw, i32* %ip, double* %w)
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  br label %if.end32

if.end32:                                         ; preds = %if.end, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @putdata(i32 %nini, i32 %nend, double* %a) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ %nini, %entry ], [ %inc, %for.inc ]
  %seed.0 = phi i32 [ 0, %entry ], [ %rem, %for.inc ]
  %cmp = icmp sle i32 %j.0, %nend
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %seed.0, 7141
  %add = add nsw i32 %mul, 54773
  %rem = srem i32 %add, 259200
  %conv = sitofp i32 %rem to double
  %mul1 = fmul double %conv, 0x3ED02E85C0898B71
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds double* %a, i64 %idxprom
  store double %mul1, double* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* %ip, double* %w) #0 {
entry:
  %cmp = icmp sgt i32 %n, 4
  br i1 %cmp, label %if.then, label %if.else3

if.then:                                          ; preds = %entry
  %cmp1 = icmp sge i32 %isgn, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  call void @bitrv2(i32 %n, i32* %ip, double* %a)
  call void @cftfsub(i32 %n, double* %a, double* %w)
  br label %if.end

if.else:                                          ; preds = %if.then
  call void @bitrv2conj(i32 %n, i32* %ip, double* %a)
  call void @cftbsub(i32 %n, double* %a, double* %w)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end7

if.else3:                                         ; preds = %entry
  %cmp4 = icmp eq i32 %n, 4
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.else3
  call void @cftfsub(i32 %n, double* %a, double* %w)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.else3
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  ret void
}

; Function Attrs: nounwind uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* %a) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ %nini, %entry ], [ %inc, %for.inc ]
  %seed.0 = phi i32 [ 0, %entry ], [ %rem, %for.inc ]
  %err.0 = phi double [ 0.000000e+00, %entry ], [ %cond, %for.inc ]
  %cmp = icmp sle i32 %j.0, %nend
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %seed.0, 7141
  %add = add nsw i32 %mul, 54773
  %rem = srem i32 %add, 259200
  %conv = sitofp i32 %rem to double
  %mul1 = fmul double %conv, 0x3ED02E85C0898B71
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds double* %a, i64 %idxprom
  %0 = load double* %arrayidx, align 8
  %mul2 = fmul double %0, %scale
  %sub = fsub double %mul1, %mul2
  %call = call double @fabs(double %sub) #7
  %cmp3 = fcmp ogt double %err.0, %call
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %call5 = call double @fabs(double %sub) #7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %err.0, %cond.true ], [ %call5, %cond.false ]
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %inc = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret double %err.0
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @abort() #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

; Function Attrs: nounwind uwtable
define internal void @bitrv2(i32 %n, i32* %ip, double* %a) #0 {
entry:
  %arrayidx = getelementptr inbounds i32* %ip, i64 0
  store i32 0, i32* %arrayidx, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %l.0 = phi i32 [ %n, %entry ], [ %shr, %for.end ]
  %m.0 = phi i32 [ 1, %entry ], [ %shl6, %for.end ]
  %shl = shl i32 %m.0, 3
  %cmp = icmp slt i32 %shl, %l.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %shr = ashr i32 %l.0, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %j.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ]
  %cmp1 = icmp slt i32 %j.0, %m.0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni = add i32 %m.0, %j.0
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  %idxprom = sext i32 %j.0 to i64
  %arrayidx2 = getelementptr inbounds i32* %ip, i64 %idxprom
  %0 = load i32* %arrayidx2, align 4
  %add = add nsw i32 %0, %shr
  %idxprom4 = sext i32 %ni to i64
  %arrayidx5 = getelementptr inbounds i32* %ip, i64 %idxprom4
  store i32 %add, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body.split
  %inc = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %shl6 = shl i32 %m.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %mul = mul nsw i32 2, %m.0
  %shl7 = shl i32 %m.0, 3
  %cmp8 = icmp eq i32 %shl7, %l.0
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc139, %if.then
  %k.0 = phi i32 [ 0, %if.then ], [ %inc140, %for.inc139 ]
  %cmp10 = icmp slt i32 %k.0, %m.0
  br i1 %cmp10, label %for.body11, label %for.end141

for.body11:                                       ; preds = %for.cond9
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc110, %for.body11
  %j.1 = phi i32 [ 0, %for.body11 ], [ %inc111, %for.inc110 ]
  %cmp13 = icmp slt i32 %j.1, %k.0
  br i1 %cmp13, label %for.body14, label %for.end112

for.body14:                                       ; preds = %for.cond12
  %mul15 = mul nsw i32 2, %j.1
  %idxprom16 = sext i32 %k.0 to i64
  %arrayidx17 = getelementptr inbounds i32* %ip, i64 %idxprom16
  %1 = load i32* %arrayidx17, align 4
  %add18 = add nsw i32 %mul15, %1
  %mul19 = mul nsw i32 2, %k.0
  %idxprom20 = sext i32 %j.1 to i64
  %arrayidx21 = getelementptr inbounds i32* %ip, i64 %idxprom20
  %2 = load i32* %arrayidx21, align 4
  %add22 = add nsw i32 %mul19, %2
  %idxprom23 = sext i32 %add18 to i64
  %arrayidx24 = getelementptr inbounds double* %a, i64 %idxprom23
  %3 = load double* %arrayidx24, align 8
  %add25 = add nsw i32 %add18, 1
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds double* %a, i64 %idxprom26
  %4 = load double* %arrayidx27, align 8
  %idxprom28 = sext i32 %add22 to i64
  %arrayidx29 = getelementptr inbounds double* %a, i64 %idxprom28
  %5 = load double* %arrayidx29, align 8
  %add30 = add nsw i32 %add22, 1
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds double* %a, i64 %idxprom31
  %6 = load double* %arrayidx32, align 8
  %idxprom33 = sext i32 %add18 to i64
  %arrayidx34 = getelementptr inbounds double* %a, i64 %idxprom33
  store double %5, double* %arrayidx34, align 8
  %add35 = add nsw i32 %add18, 1
  %idxprom36 = sext i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds double* %a, i64 %idxprom36
  store double %6, double* %arrayidx37, align 8
  %idxprom38 = sext i32 %add22 to i64
  %arrayidx39 = getelementptr inbounds double* %a, i64 %idxprom38
  store double %3, double* %arrayidx39, align 8
  %add40 = add nsw i32 %add22, 1
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds double* %a, i64 %idxprom41
  store double %4, double* %arrayidx42, align 8
  br label %for.body14.split

for.body14.split:                                 ; preds = %for.body14
  %ni17 = add i32 %add18, %mul
  br label %for.body14.split.split14

for.body14.split.split14:                         ; preds = %for.body14.split
  br label %for.body14.split.split

for.body14.split.split:                           ; preds = %for.body14.split.split14
  %mul44 = mul nsw i32 2, %mul
  %add45 = add nsw i32 %add22, %mul44
  %idxprom46 = sext i32 %ni17 to i64
  %arrayidx47 = getelementptr inbounds double* %a, i64 %idxprom46
  %7 = load double* %arrayidx47, align 8
  %add48 = add nsw i32 %ni17, 1
  %idxprom49 = sext i32 %add48 to i64
  %arrayidx50 = getelementptr inbounds double* %a, i64 %idxprom49
  %8 = load double* %arrayidx50, align 8
  %idxprom51 = sext i32 %add45 to i64
  %arrayidx52 = getelementptr inbounds double* %a, i64 %idxprom51
  %9 = load double* %arrayidx52, align 8
  %add53 = add nsw i32 %add45, 1
  %idxprom54 = sext i32 %add53 to i64
  %arrayidx55 = getelementptr inbounds double* %a, i64 %idxprom54
  %10 = load double* %arrayidx55, align 8
  %idxprom56 = sext i32 %ni17 to i64
  %arrayidx57 = getelementptr inbounds double* %a, i64 %idxprom56
  store double %9, double* %arrayidx57, align 8
  %add58 = add nsw i32 %ni17, 1
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds double* %a, i64 %idxprom59
  store double %10, double* %arrayidx60, align 8
  %idxprom61 = sext i32 %add45 to i64
  %arrayidx62 = getelementptr inbounds double* %a, i64 %idxprom61
  store double %7, double* %arrayidx62, align 8
  %add63 = add nsw i32 %add45, 1
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds double* %a, i64 %idxprom64
  store double %8, double* %arrayidx65, align 8
  br label %for.body14.split.split.split

for.body14.split.split.split:                     ; preds = %for.body14.split.split
  %ni21 = add i32 %ni17, %mul
  br label %for.body14.split.split.split.split18

for.body14.split.split.split.split18:             ; preds = %for.body14.split.split.split
  br label %for.body14.split.split.split.split

for.body14.split.split.split.split:               ; preds = %for.body14.split.split.split.split18
  %ni32 = sub i32 %add45, %mul
  br label %for.body14.split.split.split.split.split29

for.body14.split.split.split.split.split29:       ; preds = %for.body14.split.split.split.split
  br label %for.body14.split.split.split.split.split26

for.body14.split.split.split.split.split26:       ; preds = %for.body14.split.split.split.split.split29
  %idxprom67 = sext i32 %ni21 to i64
  %arrayidx68 = getelementptr inbounds double* %a, i64 %idxprom67
  %11 = load double* %arrayidx68, align 8
  %add69 = add nsw i32 %ni21, 1
  %idxprom70 = sext i32 %add69 to i64
  %arrayidx71 = getelementptr inbounds double* %a, i64 %idxprom70
  %12 = load double* %arrayidx71, align 8
  %idxprom72 = sext i32 %ni32 to i64
  %arrayidx73 = getelementptr inbounds double* %a, i64 %idxprom72
  %13 = load double* %arrayidx73, align 8
  %add74 = add nsw i32 %ni32, 1
  %idxprom75 = sext i32 %add74 to i64
  %arrayidx76 = getelementptr inbounds double* %a, i64 %idxprom75
  %14 = load double* %arrayidx76, align 8
  %idxprom77 = sext i32 %ni21 to i64
  %arrayidx78 = getelementptr inbounds double* %a, i64 %idxprom77
  store double %13, double* %arrayidx78, align 8
  %add79 = add nsw i32 %ni21, 1
  %idxprom80 = sext i32 %add79 to i64
  %arrayidx81 = getelementptr inbounds double* %a, i64 %idxprom80
  store double %14, double* %arrayidx81, align 8
  %idxprom82 = sext i32 %ni32 to i64
  %arrayidx83 = getelementptr inbounds double* %a, i64 %idxprom82
  store double %11, double* %arrayidx83, align 8
  %add84 = add nsw i32 %ni32, 1
  %idxprom85 = sext i32 %add84 to i64
  %arrayidx86 = getelementptr inbounds double* %a, i64 %idxprom85
  store double %12, double* %arrayidx86, align 8
  br label %for.body14.split.split.split.split.split

for.body14.split.split.split.split.split:         ; preds = %for.body14.split.split.split.split.split26
  %ni25 = add i32 %ni21, %mul
  br label %for.body14.split.split.split.split.split.split22

for.body14.split.split.split.split.split.split22: ; preds = %for.body14.split.split.split.split.split
  br label %for.body14.split.split.split.split.split.split

for.body14.split.split.split.split.split.split:   ; preds = %for.body14.split.split.split.split.split.split22
  %mul88 = mul nsw i32 2, %mul
  %add89 = add nsw i32 %ni32, %mul88
  %idxprom90 = sext i32 %ni25 to i64
  %arrayidx91 = getelementptr inbounds double* %a, i64 %idxprom90
  %15 = load double* %arrayidx91, align 8
  %add92 = add nsw i32 %ni25, 1
  %idxprom93 = sext i32 %add92 to i64
  %arrayidx94 = getelementptr inbounds double* %a, i64 %idxprom93
  %16 = load double* %arrayidx94, align 8
  %idxprom95 = sext i32 %add89 to i64
  %arrayidx96 = getelementptr inbounds double* %a, i64 %idxprom95
  %17 = load double* %arrayidx96, align 8
  %add97 = add nsw i32 %add89, 1
  %idxprom98 = sext i32 %add97 to i64
  %arrayidx99 = getelementptr inbounds double* %a, i64 %idxprom98
  %18 = load double* %arrayidx99, align 8
  %idxprom100 = sext i32 %ni25 to i64
  %arrayidx101 = getelementptr inbounds double* %a, i64 %idxprom100
  store double %17, double* %arrayidx101, align 8
  %add102 = add nsw i32 %ni25, 1
  %idxprom103 = sext i32 %add102 to i64
  %arrayidx104 = getelementptr inbounds double* %a, i64 %idxprom103
  store double %18, double* %arrayidx104, align 8
  %idxprom105 = sext i32 %add89 to i64
  %arrayidx106 = getelementptr inbounds double* %a, i64 %idxprom105
  store double %15, double* %arrayidx106, align 8
  %add107 = add nsw i32 %add89, 1
  %idxprom108 = sext i32 %add107 to i64
  %arrayidx109 = getelementptr inbounds double* %a, i64 %idxprom108
  store double %16, double* %arrayidx109, align 8
  br label %for.inc110

for.inc110:                                       ; preds = %for.body14.split.split.split.split.split.split
  %inc111 = add nsw i32 %j.1, 1
  br label %for.cond12

for.end112:                                       ; preds = %for.cond12
  %mul113 = mul nsw i32 2, %k.0
  %add114 = add nsw i32 %mul113, %mul
  %idxprom115 = sext i32 %k.0 to i64
  %arrayidx116 = getelementptr inbounds i32* %ip, i64 %idxprom115
  %19 = load i32* %arrayidx116, align 4
  %add117 = add nsw i32 %add114, %19
  br label %for.end112.split

for.end112.split:                                 ; preds = %for.end112
  %ni13 = add i32 %add117, %mul
  br label %for.end112.split.split

for.end112.split.split:                           ; preds = %for.end112.split
  %idxprom119 = sext i32 %add117 to i64
  %arrayidx120 = getelementptr inbounds double* %a, i64 %idxprom119
  %20 = load double* %arrayidx120, align 8
  %add121 = add nsw i32 %add117, 1
  %idxprom122 = sext i32 %add121 to i64
  %arrayidx123 = getelementptr inbounds double* %a, i64 %idxprom122
  %21 = load double* %arrayidx123, align 8
  %idxprom124 = sext i32 %ni13 to i64
  %arrayidx125 = getelementptr inbounds double* %a, i64 %idxprom124
  %22 = load double* %arrayidx125, align 8
  %add126 = add nsw i32 %ni13, 1
  %idxprom127 = sext i32 %add126 to i64
  %arrayidx128 = getelementptr inbounds double* %a, i64 %idxprom127
  %23 = load double* %arrayidx128, align 8
  %idxprom129 = sext i32 %add117 to i64
  %arrayidx130 = getelementptr inbounds double* %a, i64 %idxprom129
  store double %22, double* %arrayidx130, align 8
  %add131 = add nsw i32 %add117, 1
  %idxprom132 = sext i32 %add131 to i64
  %arrayidx133 = getelementptr inbounds double* %a, i64 %idxprom132
  store double %23, double* %arrayidx133, align 8
  %idxprom134 = sext i32 %ni13 to i64
  %arrayidx135 = getelementptr inbounds double* %a, i64 %idxprom134
  store double %20, double* %arrayidx135, align 8
  %add136 = add nsw i32 %ni13, 1
  %idxprom137 = sext i32 %add136 to i64
  %arrayidx138 = getelementptr inbounds double* %a, i64 %idxprom137
  store double %21, double* %arrayidx138, align 8
  br label %for.inc139

for.inc139:                                       ; preds = %for.end112.split.split
  %inc140 = add nsw i32 %k.0, 1
  br label %for.cond9

for.end141:                                       ; preds = %for.cond9
  br label %if.end

if.else:                                          ; preds = %while.end
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc201, %if.else
  %k.1 = phi i32 [ 1, %if.else ], [ %inc202, %for.inc201 ]
  %cmp143 = icmp slt i32 %k.1, %m.0
  br i1 %cmp143, label %for.body144, label %for.end203

for.body144:                                      ; preds = %for.cond142
  br label %for.cond145

for.cond145:                                      ; preds = %for.inc198, %for.body144
  %j.2 = phi i32 [ 0, %for.body144 ], [ %inc199, %for.inc198 ]
  %cmp146 = icmp slt i32 %j.2, %k.1
  br i1 %cmp146, label %for.body147, label %for.end200

for.body147:                                      ; preds = %for.cond145
  %mul148 = mul nsw i32 2, %j.2
  %idxprom149 = sext i32 %k.1 to i64
  %arrayidx150 = getelementptr inbounds i32* %ip, i64 %idxprom149
  %24 = load i32* %arrayidx150, align 4
  %add151 = add nsw i32 %mul148, %24
  %mul152 = mul nsw i32 2, %k.1
  %idxprom153 = sext i32 %j.2 to i64
  %arrayidx154 = getelementptr inbounds i32* %ip, i64 %idxprom153
  %25 = load i32* %arrayidx154, align 4
  %add155 = add nsw i32 %mul152, %25
  %idxprom156 = sext i32 %add151 to i64
  %arrayidx157 = getelementptr inbounds double* %a, i64 %idxprom156
  %26 = load double* %arrayidx157, align 8
  %add158 = add nsw i32 %add151, 1
  %idxprom159 = sext i32 %add158 to i64
  %arrayidx160 = getelementptr inbounds double* %a, i64 %idxprom159
  %27 = load double* %arrayidx160, align 8
  %idxprom161 = sext i32 %add155 to i64
  %arrayidx162 = getelementptr inbounds double* %a, i64 %idxprom161
  %28 = load double* %arrayidx162, align 8
  %add163 = add nsw i32 %add155, 1
  %idxprom164 = sext i32 %add163 to i64
  %arrayidx165 = getelementptr inbounds double* %a, i64 %idxprom164
  %29 = load double* %arrayidx165, align 8
  %idxprom166 = sext i32 %add151 to i64
  %arrayidx167 = getelementptr inbounds double* %a, i64 %idxprom166
  store double %28, double* %arrayidx167, align 8
  %add168 = add nsw i32 %add151, 1
  %idxprom169 = sext i32 %add168 to i64
  %arrayidx170 = getelementptr inbounds double* %a, i64 %idxprom169
  store double %29, double* %arrayidx170, align 8
  %idxprom171 = sext i32 %add155 to i64
  %arrayidx172 = getelementptr inbounds double* %a, i64 %idxprom171
  store double %26, double* %arrayidx172, align 8
  %add173 = add nsw i32 %add155, 1
  %idxprom174 = sext i32 %add173 to i64
  %arrayidx175 = getelementptr inbounds double* %a, i64 %idxprom174
  store double %27, double* %arrayidx175, align 8
  br label %for.body147.split

for.body147.split:                                ; preds = %for.body147
  %ni38 = add i32 %add155, %mul
  br label %for.body147.split.split35

for.body147.split.split35:                        ; preds = %for.body147.split
  %ni10 = add i32 %add151, %mul
  br label %for.body147.split.split7

for.body147.split.split7:                         ; preds = %for.body147.split.split35
  br label %for.body147.split.split

for.body147.split.split:                          ; preds = %for.body147.split.split7
  br label %for.body147.split.split.split

for.body147.split.split.split:                    ; preds = %for.body147.split.split
  %idxprom178 = sext i32 %ni10 to i64
  %arrayidx179 = getelementptr inbounds double* %a, i64 %idxprom178
  %30 = load double* %arrayidx179, align 8
  %add180 = add nsw i32 %ni10, 1
  %idxprom181 = sext i32 %add180 to i64
  %arrayidx182 = getelementptr inbounds double* %a, i64 %idxprom181
  %31 = load double* %arrayidx182, align 8
  %idxprom183 = sext i32 %ni38 to i64
  %arrayidx184 = getelementptr inbounds double* %a, i64 %idxprom183
  %32 = load double* %arrayidx184, align 8
  %add185 = add nsw i32 %ni38, 1
  %idxprom186 = sext i32 %add185 to i64
  %arrayidx187 = getelementptr inbounds double* %a, i64 %idxprom186
  %33 = load double* %arrayidx187, align 8
  %idxprom188 = sext i32 %ni10 to i64
  %arrayidx189 = getelementptr inbounds double* %a, i64 %idxprom188
  store double %32, double* %arrayidx189, align 8
  %add190 = add nsw i32 %ni10, 1
  %idxprom191 = sext i32 %add190 to i64
  %arrayidx192 = getelementptr inbounds double* %a, i64 %idxprom191
  store double %33, double* %arrayidx192, align 8
  %idxprom193 = sext i32 %ni38 to i64
  %arrayidx194 = getelementptr inbounds double* %a, i64 %idxprom193
  store double %30, double* %arrayidx194, align 8
  %add195 = add nsw i32 %ni38, 1
  %idxprom196 = sext i32 %add195 to i64
  %arrayidx197 = getelementptr inbounds double* %a, i64 %idxprom196
  store double %31, double* %arrayidx197, align 8
  br label %for.inc198

for.inc198:                                       ; preds = %for.body147.split.split.split
  %inc199 = add nsw i32 %j.2, 1
  br label %for.cond145

for.end200:                                       ; preds = %for.cond145
  br label %for.inc201

for.inc201:                                       ; preds = %for.end200
  %inc202 = add nsw i32 %k.1, 1
  br label %for.cond142

for.end203:                                       ; preds = %for.cond142
  br label %if.end

if.end:                                           ; preds = %for.end203, %for.end141
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @cftfsub(i32 %n, double* %a, double* %w) #0 {
entry:
  %cmp = icmp sgt i32 %n, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @cft1st(i32 %n, double* %a, double* %w)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %l.0 = phi i32 [ 8, %if.then ], [ %shl2, %while.body ]
  %shl = shl i32 %l.0, 2
  %cmp1 = icmp slt i32 %shl, %n
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @cftmdl(i32 %n, i32 %l.0, double* %a, double* %w)
  %shl2 = shl i32 %l.0, 2
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %l.1 = phi i32 [ %l.0, %while.end ], [ 2, %entry ]
  %shl3 = shl i32 %l.1, 2
  %cmp4 = icmp eq i32 %shl3, %n
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5
  %j.0 = phi i32 [ 0, %if.then5 ], [ %add82, %for.inc ]
  %cmp6 = icmp slt i32 %j.0, %l.1
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni7 = add i32 %j.0, %l.1
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  br label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %ni12 = add i32 %ni7, %l.1
  br label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split
  br label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %ni17 = add i32 %ni12, %l.1
  br label %for.body.split.split.split.split.split

for.body.split.split.split.split.split:           ; preds = %for.body.split.split.split.split
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds double* %a, i64 %idxprom
  %0 = load double* %arrayidx, align 8
  %idxprom9 = sext i32 %ni7 to i64
  %arrayidx10 = getelementptr inbounds double* %a, i64 %idxprom9
  %1 = load double* %arrayidx10, align 8
  %add11 = fadd double %0, %1
  %add12 = add nsw i32 %j.0, 1
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds double* %a, i64 %idxprom13
  %2 = load double* %arrayidx14, align 8
  %add15 = add nsw i32 %ni7, 1
  %idxprom16 = sext i32 %add15 to i64
  %arrayidx17 = getelementptr inbounds double* %a, i64 %idxprom16
  %3 = load double* %arrayidx17, align 8
  %add18 = fadd double %2, %3
  %idxprom19 = sext i32 %j.0 to i64
  %arrayidx20 = getelementptr inbounds double* %a, i64 %idxprom19
  %4 = load double* %arrayidx20, align 8
  %idxprom21 = sext i32 %ni7 to i64
  %arrayidx22 = getelementptr inbounds double* %a, i64 %idxprom21
  %5 = load double* %arrayidx22, align 8
  %sub = fsub double %4, %5
  %add23 = add nsw i32 %j.0, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double* %a, i64 %idxprom24
  %6 = load double* %arrayidx25, align 8
  %add26 = add nsw i32 %ni7, 1
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds double* %a, i64 %idxprom27
  %7 = load double* %arrayidx28, align 8
  %sub29 = fsub double %6, %7
  %idxprom30 = sext i32 %ni12 to i64
  %arrayidx31 = getelementptr inbounds double* %a, i64 %idxprom30
  %8 = load double* %arrayidx31, align 8
  %idxprom32 = sext i32 %ni17 to i64
  %arrayidx33 = getelementptr inbounds double* %a, i64 %idxprom32
  %9 = load double* %arrayidx33, align 8
  %add34 = fadd double %8, %9
  %add35 = add nsw i32 %ni12, 1
  %idxprom36 = sext i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds double* %a, i64 %idxprom36
  %10 = load double* %arrayidx37, align 8
  %add38 = add nsw i32 %ni17, 1
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds double* %a, i64 %idxprom39
  %11 = load double* %arrayidx40, align 8
  %add41 = fadd double %10, %11
  %idxprom42 = sext i32 %ni12 to i64
  %arrayidx43 = getelementptr inbounds double* %a, i64 %idxprom42
  %12 = load double* %arrayidx43, align 8
  %idxprom44 = sext i32 %ni17 to i64
  %arrayidx45 = getelementptr inbounds double* %a, i64 %idxprom44
  %13 = load double* %arrayidx45, align 8
  %sub46 = fsub double %12, %13
  %add47 = add nsw i32 %ni12, 1
  %idxprom48 = sext i32 %add47 to i64
  %arrayidx49 = getelementptr inbounds double* %a, i64 %idxprom48
  %14 = load double* %arrayidx49, align 8
  %add50 = add nsw i32 %ni17, 1
  %idxprom51 = sext i32 %add50 to i64
  %arrayidx52 = getelementptr inbounds double* %a, i64 %idxprom51
  %15 = load double* %arrayidx52, align 8
  %sub53 = fsub double %14, %15
  br label %for.body.split.split.split.split.split.split

for.body.split.split.split.split.split.split:     ; preds = %for.body.split.split.split.split.split
  %ni28 = fadd double %add18, %add41
  br label %for.body.split.split.split.split.split.split.split25

for.body.split.split.split.split.split.split.split25: ; preds = %for.body.split.split.split.split.split.split
  %ni22 = fadd double %add11, %add34
  br label %for.body.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split25
  %ni63 = fsub double %sub29, %sub46
  br label %for.body.split.split.split.split.split.split.split.split60

for.body.split.split.split.split.split.split.split.split60: ; preds = %for.body.split.split.split.split.split.split.split
  %ni57 = fadd double %sub, %sub53
  br label %for.body.split.split.split.split.split.split.split.split54

for.body.split.split.split.split.split.split.split.split54: ; preds = %for.body.split.split.split.split.split.split.split.split60
  %ni51 = fadd double %sub29, %sub46
  br label %for.body.split.split.split.split.split.split.split.split48

for.body.split.split.split.split.split.split.split.split48: ; preds = %for.body.split.split.split.split.split.split.split.split54
  %ni45 = fsub double %sub, %sub53
  br label %for.body.split.split.split.split.split.split.split.split42

for.body.split.split.split.split.split.split.split.split42: ; preds = %for.body.split.split.split.split.split.split.split.split48
  %ni39 = fsub double %add18, %add41
  br label %for.body.split.split.split.split.split.split.split.split36

for.body.split.split.split.split.split.split.split.split36: ; preds = %for.body.split.split.split.split.split.split.split.split42
  %ni33 = fsub double %add11, %add34
  br label %for.body.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split36
  %idxprom55 = sext i32 %j.0 to i64
  %arrayidx56 = getelementptr inbounds double* %a, i64 %idxprom55
  store double %ni22, double* %arrayidx56, align 8
  %add58 = add nsw i32 %j.0, 1
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds double* %a, i64 %idxprom59
  store double %ni28, double* %arrayidx60, align 8
  %idxprom62 = sext i32 %ni12 to i64
  %arrayidx63 = getelementptr inbounds double* %a, i64 %idxprom62
  store double %ni33, double* %arrayidx63, align 8
  %add65 = add nsw i32 %ni12, 1
  %idxprom66 = sext i32 %add65 to i64
  %arrayidx67 = getelementptr inbounds double* %a, i64 %idxprom66
  store double %ni39, double* %arrayidx67, align 8
  %idxprom69 = sext i32 %ni7 to i64
  %arrayidx70 = getelementptr inbounds double* %a, i64 %idxprom69
  store double %ni45, double* %arrayidx70, align 8
  %add72 = add nsw i32 %ni7, 1
  %idxprom73 = sext i32 %add72 to i64
  %arrayidx74 = getelementptr inbounds double* %a, i64 %idxprom73
  store double %ni51, double* %arrayidx74, align 8
  %idxprom76 = sext i32 %ni17 to i64
  %arrayidx77 = getelementptr inbounds double* %a, i64 %idxprom76
  store double %ni57, double* %arrayidx77, align 8
  %add79 = add nsw i32 %ni17, 1
  %idxprom80 = sext i32 %add79 to i64
  %arrayidx81 = getelementptr inbounds double* %a, i64 %idxprom80
  store double %ni63, double* %arrayidx81, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body.split.split.split.split.split.split.split.split
  %add82 = add nsw i32 %j.0, 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end119

if.else:                                          ; preds = %if.end
  br label %if.else.split

if.else.split:                                    ; preds = %if.else
  %ni = add i32 0, %l.1
  br label %for.cond83

for.cond83:                                       ; preds = %for.inc116.split, %if.else.split
  %stackVar.0 = phi i32 [ %ni, %if.else.split ], [ %ni4, %for.inc116.split ]
  %j.1 = phi i32 [ 0, %if.else.split ], [ %add117, %for.inc116.split ]
  %cmp84 = icmp slt i32 %j.1, %l.1
  br i1 %cmp84, label %for.body85, label %for.end118

for.body85:                                       ; preds = %for.cond83
  %idxprom87 = sext i32 %j.1 to i64
  %arrayidx88 = getelementptr inbounds double* %a, i64 %idxprom87
  %16 = load double* %arrayidx88, align 8
  %idxprom89 = sext i32 %stackVar.0 to i64
  %arrayidx90 = getelementptr inbounds double* %a, i64 %idxprom89
  %17 = load double* %arrayidx90, align 8
  %sub91 = fsub double %16, %17
  %add92 = add nsw i32 %j.1, 1
  %idxprom93 = sext i32 %add92 to i64
  %arrayidx94 = getelementptr inbounds double* %a, i64 %idxprom93
  %18 = load double* %arrayidx94, align 8
  %add95 = add nsw i32 %stackVar.0, 1
  %idxprom96 = sext i32 %add95 to i64
  %arrayidx97 = getelementptr inbounds double* %a, i64 %idxprom96
  %19 = load double* %arrayidx97, align 8
  %sub98 = fsub double %18, %19
  %idxprom99 = sext i32 %stackVar.0 to i64
  %arrayidx100 = getelementptr inbounds double* %a, i64 %idxprom99
  %20 = load double* %arrayidx100, align 8
  %idxprom101 = sext i32 %j.1 to i64
  %arrayidx102 = getelementptr inbounds double* %a, i64 %idxprom101
  %21 = load double* %arrayidx102, align 8
  %add103 = fadd double %21, %20
  store double %add103, double* %arrayidx102, align 8
  %add104 = add nsw i32 %stackVar.0, 1
  %idxprom105 = sext i32 %add104 to i64
  %arrayidx106 = getelementptr inbounds double* %a, i64 %idxprom105
  %22 = load double* %arrayidx106, align 8
  %add107 = add nsw i32 %j.1, 1
  %idxprom108 = sext i32 %add107 to i64
  %arrayidx109 = getelementptr inbounds double* %a, i64 %idxprom108
  %23 = load double* %arrayidx109, align 8
  %add110 = fadd double %23, %22
  store double %add110, double* %arrayidx109, align 8
  %idxprom111 = sext i32 %stackVar.0 to i64
  %arrayidx112 = getelementptr inbounds double* %a, i64 %idxprom111
  store double %sub91, double* %arrayidx112, align 8
  %add113 = add nsw i32 %stackVar.0, 1
  %idxprom114 = sext i32 %add113 to i64
  %arrayidx115 = getelementptr inbounds double* %a, i64 %idxprom114
  store double %sub98, double* %arrayidx115, align 8
  br label %for.inc116

for.inc116:                                       ; preds = %for.body85
  %add117 = add nsw i32 %j.1, 2
  br label %for.inc116.split

for.inc116.split:                                 ; preds = %for.inc116
  %ni4 = add i32 %add117, %l.1
  br label %for.cond83

for.end118:                                       ; preds = %for.cond83
  br label %if.end119

if.end119:                                        ; preds = %for.end118, %for.end
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @bitrv2conj(i32 %n, i32* %ip, double* %a) #0 {
entry:
  %arrayidx = getelementptr inbounds i32* %ip, i64 0
  store i32 0, i32* %arrayidx, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %l.0 = phi i32 [ %n, %entry ], [ %shr, %for.end ]
  %m.0 = phi i32 [ 1, %entry ], [ %shl6, %for.end ]
  %shl = shl i32 %m.0, 3
  %cmp = icmp slt i32 %shl, %l.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %shr = ashr i32 %l.0, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %j.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ]
  %cmp1 = icmp slt i32 %j.0, %m.0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni = add i32 %m.0, %j.0
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  %idxprom = sext i32 %j.0 to i64
  %arrayidx2 = getelementptr inbounds i32* %ip, i64 %idxprom
  %0 = load i32* %arrayidx2, align 4
  %add = add nsw i32 %0, %shr
  %idxprom4 = sext i32 %ni to i64
  %arrayidx5 = getelementptr inbounds i32* %ip, i64 %idxprom4
  store i32 %add, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body.split
  %inc = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %shl6 = shl i32 %m.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %mul = mul nsw i32 2, %m.0
  %shl7 = shl i32 %m.0, 3
  %cmp8 = icmp eq i32 %shl7, %l.0
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc164, %if.then
  %k.0 = phi i32 [ 0, %if.then ], [ %inc165, %for.inc164 ]
  %cmp10 = icmp slt i32 %k.0, %m.0
  br i1 %cmp10, label %for.body11, label %for.end166

for.body11:                                       ; preds = %for.cond9
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc118, %for.body11
  %j.1 = phi i32 [ 0, %for.body11 ], [ %inc119, %for.inc118 ]
  %cmp13 = icmp slt i32 %j.1, %k.0
  br i1 %cmp13, label %for.body14, label %for.end120

for.body14:                                       ; preds = %for.cond12
  %mul15 = mul nsw i32 2, %j.1
  %idxprom16 = sext i32 %k.0 to i64
  %arrayidx17 = getelementptr inbounds i32* %ip, i64 %idxprom16
  %1 = load i32* %arrayidx17, align 4
  %add18 = add nsw i32 %mul15, %1
  %mul19 = mul nsw i32 2, %k.0
  %idxprom20 = sext i32 %j.1 to i64
  %arrayidx21 = getelementptr inbounds i32* %ip, i64 %idxprom20
  %2 = load i32* %arrayidx21, align 4
  %add22 = add nsw i32 %mul19, %2
  %idxprom23 = sext i32 %add18 to i64
  %arrayidx24 = getelementptr inbounds double* %a, i64 %idxprom23
  %3 = load double* %arrayidx24, align 8
  %add25 = add nsw i32 %add18, 1
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds double* %a, i64 %idxprom26
  %4 = load double* %arrayidx27, align 8
  %sub = fsub double -0.000000e+00, %4
  %idxprom28 = sext i32 %add22 to i64
  %arrayidx29 = getelementptr inbounds double* %a, i64 %idxprom28
  %5 = load double* %arrayidx29, align 8
  %add30 = add nsw i32 %add22, 1
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds double* %a, i64 %idxprom31
  %6 = load double* %arrayidx32, align 8
  %sub33 = fsub double -0.000000e+00, %6
  %idxprom34 = sext i32 %add18 to i64
  %arrayidx35 = getelementptr inbounds double* %a, i64 %idxprom34
  store double %5, double* %arrayidx35, align 8
  %add36 = add nsw i32 %add18, 1
  %idxprom37 = sext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds double* %a, i64 %idxprom37
  store double %sub33, double* %arrayidx38, align 8
  %idxprom39 = sext i32 %add22 to i64
  %arrayidx40 = getelementptr inbounds double* %a, i64 %idxprom39
  store double %3, double* %arrayidx40, align 8
  %add41 = add nsw i32 %add22, 1
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds double* %a, i64 %idxprom42
  store double %sub, double* %arrayidx43, align 8
  br label %for.body14.split

for.body14.split:                                 ; preds = %for.body14
  %ni17 = add i32 %add18, %mul
  br label %for.body14.split.split14

for.body14.split.split14:                         ; preds = %for.body14.split
  br label %for.body14.split.split

for.body14.split.split:                           ; preds = %for.body14.split.split14
  %mul45 = mul nsw i32 2, %mul
  %add46 = add nsw i32 %add22, %mul45
  %idxprom47 = sext i32 %ni17 to i64
  %arrayidx48 = getelementptr inbounds double* %a, i64 %idxprom47
  %7 = load double* %arrayidx48, align 8
  %add49 = add nsw i32 %ni17, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds double* %a, i64 %idxprom50
  %8 = load double* %arrayidx51, align 8
  %sub52 = fsub double -0.000000e+00, %8
  %idxprom53 = sext i32 %add46 to i64
  %arrayidx54 = getelementptr inbounds double* %a, i64 %idxprom53
  %9 = load double* %arrayidx54, align 8
  %add55 = add nsw i32 %add46, 1
  %idxprom56 = sext i32 %add55 to i64
  %arrayidx57 = getelementptr inbounds double* %a, i64 %idxprom56
  %10 = load double* %arrayidx57, align 8
  %sub58 = fsub double -0.000000e+00, %10
  %idxprom59 = sext i32 %ni17 to i64
  %arrayidx60 = getelementptr inbounds double* %a, i64 %idxprom59
  store double %9, double* %arrayidx60, align 8
  %add61 = add nsw i32 %ni17, 1
  %idxprom62 = sext i32 %add61 to i64
  %arrayidx63 = getelementptr inbounds double* %a, i64 %idxprom62
  store double %sub58, double* %arrayidx63, align 8
  %idxprom64 = sext i32 %add46 to i64
  %arrayidx65 = getelementptr inbounds double* %a, i64 %idxprom64
  store double %7, double* %arrayidx65, align 8
  %add66 = add nsw i32 %add46, 1
  %idxprom67 = sext i32 %add66 to i64
  %arrayidx68 = getelementptr inbounds double* %a, i64 %idxprom67
  store double %sub52, double* %arrayidx68, align 8
  br label %for.body14.split.split.split

for.body14.split.split.split:                     ; preds = %for.body14.split.split
  %ni21 = add i32 %ni17, %mul
  br label %for.body14.split.split.split.split18

for.body14.split.split.split.split18:             ; preds = %for.body14.split.split.split
  br label %for.body14.split.split.split.split

for.body14.split.split.split.split:               ; preds = %for.body14.split.split.split.split18
  %ni32 = sub i32 %add46, %mul
  br label %for.body14.split.split.split.split.split29

for.body14.split.split.split.split.split29:       ; preds = %for.body14.split.split.split.split
  br label %for.body14.split.split.split.split.split26

for.body14.split.split.split.split.split26:       ; preds = %for.body14.split.split.split.split.split29
  %idxprom71 = sext i32 %ni21 to i64
  %arrayidx72 = getelementptr inbounds double* %a, i64 %idxprom71
  %11 = load double* %arrayidx72, align 8
  %add73 = add nsw i32 %ni21, 1
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds double* %a, i64 %idxprom74
  %12 = load double* %arrayidx75, align 8
  %sub76 = fsub double -0.000000e+00, %12
  %idxprom77 = sext i32 %ni32 to i64
  %arrayidx78 = getelementptr inbounds double* %a, i64 %idxprom77
  %13 = load double* %arrayidx78, align 8
  %add79 = add nsw i32 %ni32, 1
  %idxprom80 = sext i32 %add79 to i64
  %arrayidx81 = getelementptr inbounds double* %a, i64 %idxprom80
  %14 = load double* %arrayidx81, align 8
  %sub82 = fsub double -0.000000e+00, %14
  %idxprom83 = sext i32 %ni21 to i64
  %arrayidx84 = getelementptr inbounds double* %a, i64 %idxprom83
  store double %13, double* %arrayidx84, align 8
  %add85 = add nsw i32 %ni21, 1
  %idxprom86 = sext i32 %add85 to i64
  %arrayidx87 = getelementptr inbounds double* %a, i64 %idxprom86
  store double %sub82, double* %arrayidx87, align 8
  %idxprom88 = sext i32 %ni32 to i64
  %arrayidx89 = getelementptr inbounds double* %a, i64 %idxprom88
  store double %11, double* %arrayidx89, align 8
  %add90 = add nsw i32 %ni32, 1
  %idxprom91 = sext i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds double* %a, i64 %idxprom91
  store double %sub76, double* %arrayidx92, align 8
  br label %for.body14.split.split.split.split.split

for.body14.split.split.split.split.split:         ; preds = %for.body14.split.split.split.split.split26
  %ni25 = add i32 %ni21, %mul
  br label %for.body14.split.split.split.split.split.split22

for.body14.split.split.split.split.split.split22: ; preds = %for.body14.split.split.split.split.split
  br label %for.body14.split.split.split.split.split.split

for.body14.split.split.split.split.split.split:   ; preds = %for.body14.split.split.split.split.split.split22
  %mul94 = mul nsw i32 2, %mul
  %add95 = add nsw i32 %ni32, %mul94
  %idxprom96 = sext i32 %ni25 to i64
  %arrayidx97 = getelementptr inbounds double* %a, i64 %idxprom96
  %15 = load double* %arrayidx97, align 8
  %add98 = add nsw i32 %ni25, 1
  %idxprom99 = sext i32 %add98 to i64
  %arrayidx100 = getelementptr inbounds double* %a, i64 %idxprom99
  %16 = load double* %arrayidx100, align 8
  %sub101 = fsub double -0.000000e+00, %16
  %idxprom102 = sext i32 %add95 to i64
  %arrayidx103 = getelementptr inbounds double* %a, i64 %idxprom102
  %17 = load double* %arrayidx103, align 8
  %add104 = add nsw i32 %add95, 1
  %idxprom105 = sext i32 %add104 to i64
  %arrayidx106 = getelementptr inbounds double* %a, i64 %idxprom105
  %18 = load double* %arrayidx106, align 8
  %sub107 = fsub double -0.000000e+00, %18
  %idxprom108 = sext i32 %ni25 to i64
  %arrayidx109 = getelementptr inbounds double* %a, i64 %idxprom108
  store double %17, double* %arrayidx109, align 8
  %add110 = add nsw i32 %ni25, 1
  %idxprom111 = sext i32 %add110 to i64
  %arrayidx112 = getelementptr inbounds double* %a, i64 %idxprom111
  store double %sub107, double* %arrayidx112, align 8
  %idxprom113 = sext i32 %add95 to i64
  %arrayidx114 = getelementptr inbounds double* %a, i64 %idxprom113
  store double %15, double* %arrayidx114, align 8
  %add115 = add nsw i32 %add95, 1
  %idxprom116 = sext i32 %add115 to i64
  %arrayidx117 = getelementptr inbounds double* %a, i64 %idxprom116
  store double %sub101, double* %arrayidx117, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.body14.split.split.split.split.split.split
  %inc119 = add nsw i32 %j.1, 1
  br label %for.cond12

for.end120:                                       ; preds = %for.cond12
  %mul121 = mul nsw i32 2, %k.0
  %idxprom122 = sext i32 %k.0 to i64
  %arrayidx123 = getelementptr inbounds i32* %ip, i64 %idxprom122
  %19 = load i32* %arrayidx123, align 4
  %add124 = add nsw i32 %mul121, %19
  %add125 = add nsw i32 %add124, 1
  %idxprom126 = sext i32 %add125 to i64
  %arrayidx127 = getelementptr inbounds double* %a, i64 %idxprom126
  %20 = load double* %arrayidx127, align 8
  %sub128 = fsub double -0.000000e+00, %20
  %add129 = add nsw i32 %add124, 1
  %idxprom130 = sext i32 %add129 to i64
  %arrayidx131 = getelementptr inbounds double* %a, i64 %idxprom130
  store double %sub128, double* %arrayidx131, align 8
  br label %for.end120.split33

for.end120.split33:                               ; preds = %for.end120
  %ni49 = add i32 %add124, %mul
  br label %for.end120.split33.split

for.end120.split33.split:                         ; preds = %for.end120.split33
  br label %for.end120.split

for.end120.split:                                 ; preds = %for.end120.split33.split
  %ni13 = add i32 %ni49, %mul
  br label %for.end120.split.split

for.end120.split.split:                           ; preds = %for.end120.split
  %idxprom134 = sext i32 %ni49 to i64
  %arrayidx135 = getelementptr inbounds double* %a, i64 %idxprom134
  %21 = load double* %arrayidx135, align 8
  %add136 = add nsw i32 %ni49, 1
  %idxprom137 = sext i32 %add136 to i64
  %arrayidx138 = getelementptr inbounds double* %a, i64 %idxprom137
  %22 = load double* %arrayidx138, align 8
  %sub139 = fsub double -0.000000e+00, %22
  %idxprom140 = sext i32 %ni13 to i64
  %arrayidx141 = getelementptr inbounds double* %a, i64 %idxprom140
  %23 = load double* %arrayidx141, align 8
  %add142 = add nsw i32 %ni13, 1
  %idxprom143 = sext i32 %add142 to i64
  %arrayidx144 = getelementptr inbounds double* %a, i64 %idxprom143
  %24 = load double* %arrayidx144, align 8
  %sub145 = fsub double -0.000000e+00, %24
  %idxprom146 = sext i32 %ni49 to i64
  %arrayidx147 = getelementptr inbounds double* %a, i64 %idxprom146
  store double %23, double* %arrayidx147, align 8
  %add148 = add nsw i32 %ni49, 1
  %idxprom149 = sext i32 %add148 to i64
  %arrayidx150 = getelementptr inbounds double* %a, i64 %idxprom149
  store double %sub145, double* %arrayidx150, align 8
  %idxprom151 = sext i32 %ni13 to i64
  %arrayidx152 = getelementptr inbounds double* %a, i64 %idxprom151
  store double %21, double* %arrayidx152, align 8
  %add153 = add nsw i32 %ni13, 1
  %idxprom154 = sext i32 %add153 to i64
  %arrayidx155 = getelementptr inbounds double* %a, i64 %idxprom154
  store double %sub139, double* %arrayidx155, align 8
  br label %for.end120.split.split.split

for.end120.split.split.split:                     ; preds = %for.end120.split.split
  %ni53 = add i32 %ni13, %mul
  br label %for.end120.split.split.split.split50

for.end120.split.split.split.split50:             ; preds = %for.end120.split.split.split
  br label %for.end120.split.split.split.split

for.end120.split.split.split.split:               ; preds = %for.end120.split.split.split.split50
  %add157 = add nsw i32 %ni53, 1
  %idxprom158 = sext i32 %add157 to i64
  %arrayidx159 = getelementptr inbounds double* %a, i64 %idxprom158
  %25 = load double* %arrayidx159, align 8
  %sub160 = fsub double -0.000000e+00, %25
  %add161 = add nsw i32 %ni53, 1
  %idxprom162 = sext i32 %add161 to i64
  %arrayidx163 = getelementptr inbounds double* %a, i64 %idxprom162
  store double %sub160, double* %arrayidx163, align 8
  br label %for.inc164

for.inc164:                                       ; preds = %for.end120.split.split.split.split
  %inc165 = add nsw i32 %k.0, 1
  br label %for.cond9

for.end166:                                       ; preds = %for.cond9
  br label %if.end

if.else:                                          ; preds = %while.end
  %arrayidx167 = getelementptr inbounds double* %a, i64 1
  %26 = load double* %arrayidx167, align 8
  %sub168 = fsub double -0.000000e+00, %26
  %arrayidx169 = getelementptr inbounds double* %a, i64 1
  store double %sub168, double* %arrayidx169, align 8
  %add170 = add nsw i32 %mul, 1
  %idxprom171 = sext i32 %add170 to i64
  %arrayidx172 = getelementptr inbounds double* %a, i64 %idxprom171
  %27 = load double* %arrayidx172, align 8
  %sub173 = fsub double -0.000000e+00, %27
  %add174 = add nsw i32 %mul, 1
  %idxprom175 = sext i32 %add174 to i64
  %arrayidx176 = getelementptr inbounds double* %a, i64 %idxprom175
  store double %sub173, double* %arrayidx176, align 8
  br label %for.cond177

for.cond177:                                      ; preds = %for.inc260, %if.else
  %k.1 = phi i32 [ 1, %if.else ], [ %inc261, %for.inc260 ]
  %cmp178 = icmp slt i32 %k.1, %m.0
  br i1 %cmp178, label %for.body179, label %for.end262

for.body179:                                      ; preds = %for.cond177
  br label %for.cond180

for.cond180:                                      ; preds = %for.inc237, %for.body179
  %j.2 = phi i32 [ 0, %for.body179 ], [ %inc238, %for.inc237 ]
  %cmp181 = icmp slt i32 %j.2, %k.1
  br i1 %cmp181, label %for.body182, label %for.end239

for.body182:                                      ; preds = %for.cond180
  %mul183 = mul nsw i32 2, %j.2
  %idxprom184 = sext i32 %k.1 to i64
  %arrayidx185 = getelementptr inbounds i32* %ip, i64 %idxprom184
  %28 = load i32* %arrayidx185, align 4
  %add186 = add nsw i32 %mul183, %28
  %mul187 = mul nsw i32 2, %k.1
  %idxprom188 = sext i32 %j.2 to i64
  %arrayidx189 = getelementptr inbounds i32* %ip, i64 %idxprom188
  %29 = load i32* %arrayidx189, align 4
  %add190 = add nsw i32 %mul187, %29
  %idxprom191 = sext i32 %add186 to i64
  %arrayidx192 = getelementptr inbounds double* %a, i64 %idxprom191
  %30 = load double* %arrayidx192, align 8
  %add193 = add nsw i32 %add186, 1
  %idxprom194 = sext i32 %add193 to i64
  %arrayidx195 = getelementptr inbounds double* %a, i64 %idxprom194
  %31 = load double* %arrayidx195, align 8
  %sub196 = fsub double -0.000000e+00, %31
  %idxprom197 = sext i32 %add190 to i64
  %arrayidx198 = getelementptr inbounds double* %a, i64 %idxprom197
  %32 = load double* %arrayidx198, align 8
  %add199 = add nsw i32 %add190, 1
  %idxprom200 = sext i32 %add199 to i64
  %arrayidx201 = getelementptr inbounds double* %a, i64 %idxprom200
  %33 = load double* %arrayidx201, align 8
  %sub202 = fsub double -0.000000e+00, %33
  %idxprom203 = sext i32 %add186 to i64
  %arrayidx204 = getelementptr inbounds double* %a, i64 %idxprom203
  store double %32, double* %arrayidx204, align 8
  %add205 = add nsw i32 %add186, 1
  %idxprom206 = sext i32 %add205 to i64
  %arrayidx207 = getelementptr inbounds double* %a, i64 %idxprom206
  store double %sub202, double* %arrayidx207, align 8
  %idxprom208 = sext i32 %add190 to i64
  %arrayidx209 = getelementptr inbounds double* %a, i64 %idxprom208
  store double %30, double* %arrayidx209, align 8
  %add210 = add nsw i32 %add190, 1
  %idxprom211 = sext i32 %add210 to i64
  %arrayidx212 = getelementptr inbounds double* %a, i64 %idxprom211
  store double %sub196, double* %arrayidx212, align 8
  br label %for.body182.split

for.body182.split:                                ; preds = %for.body182
  %ni46 = add i32 %add190, %mul
  br label %for.body182.split.split43

for.body182.split.split43:                        ; preds = %for.body182.split
  %ni10 = add i32 %add186, %mul
  br label %for.body182.split.split7

for.body182.split.split7:                         ; preds = %for.body182.split.split43
  br label %for.body182.split.split

for.body182.split.split:                          ; preds = %for.body182.split.split7
  br label %for.body182.split.split.split

for.body182.split.split.split:                    ; preds = %for.body182.split.split
  %idxprom215 = sext i32 %ni10 to i64
  %arrayidx216 = getelementptr inbounds double* %a, i64 %idxprom215
  %34 = load double* %arrayidx216, align 8
  %add217 = add nsw i32 %ni10, 1
  %idxprom218 = sext i32 %add217 to i64
  %arrayidx219 = getelementptr inbounds double* %a, i64 %idxprom218
  %35 = load double* %arrayidx219, align 8
  %sub220 = fsub double -0.000000e+00, %35
  %idxprom221 = sext i32 %ni46 to i64
  %arrayidx222 = getelementptr inbounds double* %a, i64 %idxprom221
  %36 = load double* %arrayidx222, align 8
  %add223 = add nsw i32 %ni46, 1
  %idxprom224 = sext i32 %add223 to i64
  %arrayidx225 = getelementptr inbounds double* %a, i64 %idxprom224
  %37 = load double* %arrayidx225, align 8
  %sub226 = fsub double -0.000000e+00, %37
  %idxprom227 = sext i32 %ni10 to i64
  %arrayidx228 = getelementptr inbounds double* %a, i64 %idxprom227
  store double %36, double* %arrayidx228, align 8
  %add229 = add nsw i32 %ni10, 1
  %idxprom230 = sext i32 %add229 to i64
  %arrayidx231 = getelementptr inbounds double* %a, i64 %idxprom230
  store double %sub226, double* %arrayidx231, align 8
  %idxprom232 = sext i32 %ni46 to i64
  %arrayidx233 = getelementptr inbounds double* %a, i64 %idxprom232
  store double %34, double* %arrayidx233, align 8
  %add234 = add nsw i32 %ni46, 1
  %idxprom235 = sext i32 %add234 to i64
  %arrayidx236 = getelementptr inbounds double* %a, i64 %idxprom235
  store double %sub220, double* %arrayidx236, align 8
  br label %for.inc237

for.inc237:                                       ; preds = %for.body182.split.split.split
  %inc238 = add nsw i32 %j.2, 1
  br label %for.cond180

for.end239:                                       ; preds = %for.cond180
  %mul240 = mul nsw i32 2, %k.1
  %idxprom241 = sext i32 %k.1 to i64
  %arrayidx242 = getelementptr inbounds i32* %ip, i64 %idxprom241
  %38 = load i32* %arrayidx242, align 4
  %add243 = add nsw i32 %mul240, %38
  %add244 = add nsw i32 %add243, 1
  %idxprom245 = sext i32 %add244 to i64
  %arrayidx246 = getelementptr inbounds double* %a, i64 %idxprom245
  %39 = load double* %arrayidx246, align 8
  %sub247 = fsub double -0.000000e+00, %39
  %add248 = add nsw i32 %add243, 1
  %idxprom249 = sext i32 %add248 to i64
  %arrayidx250 = getelementptr inbounds double* %a, i64 %idxprom249
  store double %sub247, double* %arrayidx250, align 8
  br label %for.end239.split

for.end239.split:                                 ; preds = %for.end239
  %ni42 = add i32 %add243, %mul
  br label %for.end239.split.split

for.end239.split.split:                           ; preds = %for.end239.split
  %add252 = add nsw i32 %ni42, 1
  %idxprom253 = sext i32 %add252 to i64
  %arrayidx254 = getelementptr inbounds double* %a, i64 %idxprom253
  %40 = load double* %arrayidx254, align 8
  %sub255 = fsub double -0.000000e+00, %40
  %add257 = add nsw i32 %ni42, 1
  %idxprom258 = sext i32 %add257 to i64
  %arrayidx259 = getelementptr inbounds double* %a, i64 %idxprom258
  store double %sub255, double* %arrayidx259, align 8
  br label %for.inc260

for.inc260:                                       ; preds = %for.end239.split.split
  %inc261 = add nsw i32 %k.1, 1
  br label %for.cond177

for.end262:                                       ; preds = %for.cond177
  br label %if.end

if.end:                                           ; preds = %for.end262, %for.end166
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @cftbsub(i32 %n, double* %a, double* %w) #0 {
entry:
  %cmp = icmp sgt i32 %n, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @cft1st(i32 %n, double* %a, double* %w)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %l.0 = phi i32 [ 8, %if.then ], [ %shl2, %while.body ]
  %shl = shl i32 %l.0, 2
  %cmp1 = icmp slt i32 %shl, %n
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @cftmdl(i32 %n, i32 %l.0, double* %a, double* %w)
  %shl2 = shl i32 %l.0, 2
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %l.1 = phi i32 [ %l.0, %while.end ], [ 2, %entry ]
  %shl3 = shl i32 %l.1, 2
  %cmp4 = icmp eq i32 %shl3, %n
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5
  %j.0 = phi i32 [ 0, %if.then5 ], [ %add84, %for.inc ]
  %cmp6 = icmp slt i32 %j.0, %l.1
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni7 = add i32 %j.0, %l.1
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  br label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %ni12 = add i32 %ni7, %l.1
  br label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split
  br label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %ni17 = add i32 %ni12, %l.1
  br label %for.body.split.split.split.split.split

for.body.split.split.split.split.split:           ; preds = %for.body.split.split.split.split
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds double* %a, i64 %idxprom
  %0 = load double* %arrayidx, align 8
  %idxprom9 = sext i32 %ni7 to i64
  %arrayidx10 = getelementptr inbounds double* %a, i64 %idxprom9
  %1 = load double* %arrayidx10, align 8
  %add11 = fadd double %0, %1
  %add12 = add nsw i32 %j.0, 1
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds double* %a, i64 %idxprom13
  %2 = load double* %arrayidx14, align 8
  %sub = fsub double -0.000000e+00, %2
  %add15 = add nsw i32 %ni7, 1
  %idxprom16 = sext i32 %add15 to i64
  %arrayidx17 = getelementptr inbounds double* %a, i64 %idxprom16
  %3 = load double* %arrayidx17, align 8
  %sub18 = fsub double %sub, %3
  %idxprom19 = sext i32 %j.0 to i64
  %arrayidx20 = getelementptr inbounds double* %a, i64 %idxprom19
  %4 = load double* %arrayidx20, align 8
  %idxprom21 = sext i32 %ni7 to i64
  %arrayidx22 = getelementptr inbounds double* %a, i64 %idxprom21
  %5 = load double* %arrayidx22, align 8
  %sub23 = fsub double %4, %5
  %add24 = add nsw i32 %j.0, 1
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds double* %a, i64 %idxprom25
  %6 = load double* %arrayidx26, align 8
  %sub27 = fsub double -0.000000e+00, %6
  %add28 = add nsw i32 %ni7, 1
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds double* %a, i64 %idxprom29
  %7 = load double* %arrayidx30, align 8
  %add31 = fadd double %sub27, %7
  %idxprom32 = sext i32 %ni12 to i64
  %arrayidx33 = getelementptr inbounds double* %a, i64 %idxprom32
  %8 = load double* %arrayidx33, align 8
  %idxprom34 = sext i32 %ni17 to i64
  %arrayidx35 = getelementptr inbounds double* %a, i64 %idxprom34
  %9 = load double* %arrayidx35, align 8
  %add36 = fadd double %8, %9
  %add37 = add nsw i32 %ni12, 1
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds double* %a, i64 %idxprom38
  %10 = load double* %arrayidx39, align 8
  %add40 = add nsw i32 %ni17, 1
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds double* %a, i64 %idxprom41
  %11 = load double* %arrayidx42, align 8
  %add43 = fadd double %10, %11
  %idxprom44 = sext i32 %ni12 to i64
  %arrayidx45 = getelementptr inbounds double* %a, i64 %idxprom44
  %12 = load double* %arrayidx45, align 8
  %idxprom46 = sext i32 %ni17 to i64
  %arrayidx47 = getelementptr inbounds double* %a, i64 %idxprom46
  %13 = load double* %arrayidx47, align 8
  %sub48 = fsub double %12, %13
  %add49 = add nsw i32 %ni12, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds double* %a, i64 %idxprom50
  %14 = load double* %arrayidx51, align 8
  %add52 = add nsw i32 %ni17, 1
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds double* %a, i64 %idxprom53
  %15 = load double* %arrayidx54, align 8
  %sub55 = fsub double %14, %15
  br label %for.body.split.split.split.split.split.split

for.body.split.split.split.split.split.split:     ; preds = %for.body.split.split.split.split.split
  %ni28 = fsub double %sub18, %add43
  br label %for.body.split.split.split.split.split.split.split25

for.body.split.split.split.split.split.split.split25: ; preds = %for.body.split.split.split.split.split.split
  %ni22 = fadd double %add11, %add36
  br label %for.body.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split25
  %ni63 = fadd double %add31, %sub48
  br label %for.body.split.split.split.split.split.split.split.split60

for.body.split.split.split.split.split.split.split.split60: ; preds = %for.body.split.split.split.split.split.split.split
  %ni57 = fadd double %sub23, %sub55
  br label %for.body.split.split.split.split.split.split.split.split54

for.body.split.split.split.split.split.split.split.split54: ; preds = %for.body.split.split.split.split.split.split.split.split60
  %ni51 = fsub double %add31, %sub48
  br label %for.body.split.split.split.split.split.split.split.split48

for.body.split.split.split.split.split.split.split.split48: ; preds = %for.body.split.split.split.split.split.split.split.split54
  %ni45 = fsub double %sub23, %sub55
  br label %for.body.split.split.split.split.split.split.split.split42

for.body.split.split.split.split.split.split.split.split42: ; preds = %for.body.split.split.split.split.split.split.split.split48
  %ni39 = fadd double %sub18, %add43
  br label %for.body.split.split.split.split.split.split.split.split36

for.body.split.split.split.split.split.split.split.split36: ; preds = %for.body.split.split.split.split.split.split.split.split42
  %ni33 = fsub double %add11, %add36
  br label %for.body.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split36
  %idxprom57 = sext i32 %j.0 to i64
  %arrayidx58 = getelementptr inbounds double* %a, i64 %idxprom57
  store double %ni22, double* %arrayidx58, align 8
  %add60 = add nsw i32 %j.0, 1
  %idxprom61 = sext i32 %add60 to i64
  %arrayidx62 = getelementptr inbounds double* %a, i64 %idxprom61
  store double %ni28, double* %arrayidx62, align 8
  %idxprom64 = sext i32 %ni12 to i64
  %arrayidx65 = getelementptr inbounds double* %a, i64 %idxprom64
  store double %ni33, double* %arrayidx65, align 8
  %add67 = add nsw i32 %ni12, 1
  %idxprom68 = sext i32 %add67 to i64
  %arrayidx69 = getelementptr inbounds double* %a, i64 %idxprom68
  store double %ni39, double* %arrayidx69, align 8
  %idxprom71 = sext i32 %ni7 to i64
  %arrayidx72 = getelementptr inbounds double* %a, i64 %idxprom71
  store double %ni45, double* %arrayidx72, align 8
  %add74 = add nsw i32 %ni7, 1
  %idxprom75 = sext i32 %add74 to i64
  %arrayidx76 = getelementptr inbounds double* %a, i64 %idxprom75
  store double %ni51, double* %arrayidx76, align 8
  %idxprom78 = sext i32 %ni17 to i64
  %arrayidx79 = getelementptr inbounds double* %a, i64 %idxprom78
  store double %ni57, double* %arrayidx79, align 8
  %add81 = add nsw i32 %ni17, 1
  %idxprom82 = sext i32 %add81 to i64
  %arrayidx83 = getelementptr inbounds double* %a, i64 %idxprom82
  store double %ni63, double* %arrayidx83, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body.split.split.split.split.split.split.split.split
  %add84 = add nsw i32 %j.0, 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end126

if.else:                                          ; preds = %if.end
  br label %if.else.split

if.else.split:                                    ; preds = %if.else
  %ni = add i32 0, %l.1
  br label %for.cond85

for.cond85:                                       ; preds = %for.inc123.split, %if.else.split
  %stackVar.0 = phi i32 [ %ni, %if.else.split ], [ %ni4, %for.inc123.split ]
  %j.1 = phi i32 [ 0, %if.else.split ], [ %add124, %for.inc123.split ]
  %cmp86 = icmp slt i32 %j.1, %l.1
  br i1 %cmp86, label %for.body87, label %for.end125

for.body87:                                       ; preds = %for.cond85
  %idxprom89 = sext i32 %j.1 to i64
  %arrayidx90 = getelementptr inbounds double* %a, i64 %idxprom89
  %16 = load double* %arrayidx90, align 8
  %idxprom91 = sext i32 %stackVar.0 to i64
  %arrayidx92 = getelementptr inbounds double* %a, i64 %idxprom91
  %17 = load double* %arrayidx92, align 8
  %sub93 = fsub double %16, %17
  %add94 = add nsw i32 %j.1, 1
  %idxprom95 = sext i32 %add94 to i64
  %arrayidx96 = getelementptr inbounds double* %a, i64 %idxprom95
  %18 = load double* %arrayidx96, align 8
  %sub97 = fsub double -0.000000e+00, %18
  %add98 = add nsw i32 %stackVar.0, 1
  %idxprom99 = sext i32 %add98 to i64
  %arrayidx100 = getelementptr inbounds double* %a, i64 %idxprom99
  %19 = load double* %arrayidx100, align 8
  %add101 = fadd double %sub97, %19
  %idxprom102 = sext i32 %stackVar.0 to i64
  %arrayidx103 = getelementptr inbounds double* %a, i64 %idxprom102
  %20 = load double* %arrayidx103, align 8
  %idxprom104 = sext i32 %j.1 to i64
  %arrayidx105 = getelementptr inbounds double* %a, i64 %idxprom104
  %21 = load double* %arrayidx105, align 8
  %add106 = fadd double %21, %20
  store double %add106, double* %arrayidx105, align 8
  %add107 = add nsw i32 %j.1, 1
  %idxprom108 = sext i32 %add107 to i64
  %arrayidx109 = getelementptr inbounds double* %a, i64 %idxprom108
  %22 = load double* %arrayidx109, align 8
  %sub110 = fsub double -0.000000e+00, %22
  %add111 = add nsw i32 %stackVar.0, 1
  %idxprom112 = sext i32 %add111 to i64
  %arrayidx113 = getelementptr inbounds double* %a, i64 %idxprom112
  %23 = load double* %arrayidx113, align 8
  %sub114 = fsub double %sub110, %23
  %add115 = add nsw i32 %j.1, 1
  %idxprom116 = sext i32 %add115 to i64
  %arrayidx117 = getelementptr inbounds double* %a, i64 %idxprom116
  store double %sub114, double* %arrayidx117, align 8
  %idxprom118 = sext i32 %stackVar.0 to i64
  %arrayidx119 = getelementptr inbounds double* %a, i64 %idxprom118
  store double %sub93, double* %arrayidx119, align 8
  %add120 = add nsw i32 %stackVar.0, 1
  %idxprom121 = sext i32 %add120 to i64
  %arrayidx122 = getelementptr inbounds double* %a, i64 %idxprom121
  store double %add101, double* %arrayidx122, align 8
  br label %for.inc123

for.inc123:                                       ; preds = %for.body87
  %add124 = add nsw i32 %j.1, 2
  br label %for.inc123.split

for.inc123.split:                                 ; preds = %for.inc123
  %ni4 = add i32 %add124, %l.1
  br label %for.cond85

for.end125:                                       ; preds = %for.cond85
  br label %if.end126

if.end126:                                        ; preds = %for.end125, %for.end
  ret void
}

; Function Attrs: nounwind
declare double @atan(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: inlinehint nounwind uwtable
define internal void @cft1st(i32 %n, double* %a, double* %w) #6 {
entry:
  %arrayidx = getelementptr inbounds double* %a, i64 0
  %0 = load double* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds double* %a, i64 2
  %1 = load double* %arrayidx1, align 8
  %add = fadd double %0, %1
  %arrayidx2 = getelementptr inbounds double* %a, i64 1
  %2 = load double* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds double* %a, i64 3
  %3 = load double* %arrayidx3, align 8
  %add4 = fadd double %2, %3
  %arrayidx5 = getelementptr inbounds double* %a, i64 0
  %4 = load double* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds double* %a, i64 2
  %5 = load double* %arrayidx6, align 8
  %sub = fsub double %4, %5
  %arrayidx7 = getelementptr inbounds double* %a, i64 1
  %6 = load double* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds double* %a, i64 3
  %7 = load double* %arrayidx8, align 8
  %sub9 = fsub double %6, %7
  %arrayidx10 = getelementptr inbounds double* %a, i64 4
  %8 = load double* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds double* %a, i64 6
  %9 = load double* %arrayidx11, align 8
  %add12 = fadd double %8, %9
  %arrayidx13 = getelementptr inbounds double* %a, i64 5
  %10 = load double* %arrayidx13, align 8
  %arrayidx14 = getelementptr inbounds double* %a, i64 7
  %11 = load double* %arrayidx14, align 8
  %add15 = fadd double %10, %11
  %arrayidx16 = getelementptr inbounds double* %a, i64 4
  %12 = load double* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds double* %a, i64 6
  %13 = load double* %arrayidx17, align 8
  %sub18 = fsub double %12, %13
  %arrayidx19 = getelementptr inbounds double* %a, i64 5
  %14 = load double* %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds double* %a, i64 7
  %15 = load double* %arrayidx20, align 8
  %sub21 = fsub double %14, %15
  br label %entry.split

entry.split:                                      ; preds = %entry
  %ni25 = fadd double %add4, %add15
  br label %entry.split.split22

entry.split.split22:                              ; preds = %entry.split
  %ni = fadd double %add, %add12
  br label %entry.split.split4

entry.split.split4:                               ; preds = %entry.split.split22
  %ni142 = fsub double %sub9, %sub18
  br label %entry.split.split4.split139

entry.split.split4.split139:                      ; preds = %entry.split.split4
  %ni122 = fadd double %sub, %sub21
  br label %entry.split.split4.split119

entry.split.split4.split119:                      ; preds = %entry.split.split4.split139
  %ni101 = fadd double %sub9, %sub18
  br label %entry.split.split4.split98

entry.split.split4.split98:                       ; preds = %entry.split.split4.split119
  %ni80 = fsub double %sub, %sub21
  br label %entry.split.split4.split77

entry.split.split4.split77:                       ; preds = %entry.split.split4.split98
  %ni63 = fsub double %add4, %add15
  br label %entry.split.split4.split60

entry.split.split4.split60:                       ; preds = %entry.split.split4.split77
  %ni45 = fsub double %add, %add12
  br label %entry.split.split4.split

entry.split.split4.split:                         ; preds = %entry.split.split4.split60
  %arrayidx23 = getelementptr inbounds double* %a, i64 0
  store double %ni, double* %arrayidx23, align 8
  %arrayidx25 = getelementptr inbounds double* %a, i64 1
  store double %ni25, double* %arrayidx25, align 8
  %arrayidx27 = getelementptr inbounds double* %a, i64 4
  store double %ni45, double* %arrayidx27, align 8
  %arrayidx29 = getelementptr inbounds double* %a, i64 5
  store double %ni63, double* %arrayidx29, align 8
  %arrayidx31 = getelementptr inbounds double* %a, i64 2
  store double %ni80, double* %arrayidx31, align 8
  %arrayidx33 = getelementptr inbounds double* %a, i64 3
  store double %ni101, double* %arrayidx33, align 8
  %arrayidx35 = getelementptr inbounds double* %a, i64 6
  store double %ni122, double* %arrayidx35, align 8
  %arrayidx37 = getelementptr inbounds double* %a, i64 7
  store double %ni142, double* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds double* %w, i64 2
  %16 = load double* %arrayidx38, align 8
  %arrayidx39 = getelementptr inbounds double* %a, i64 8
  %17 = load double* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds double* %a, i64 10
  %18 = load double* %arrayidx40, align 8
  %add41 = fadd double %17, %18
  br label %entry.split.split

entry.split.split:                                ; preds = %entry.split.split4.split
  %arrayidx42 = getelementptr inbounds double* %a, i64 9
  %19 = load double* %arrayidx42, align 8
  %arrayidx43 = getelementptr inbounds double* %a, i64 11
  %20 = load double* %arrayidx43, align 8
  %add44 = fadd double %19, %20
  %arrayidx45 = getelementptr inbounds double* %a, i64 8
  %21 = load double* %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds double* %a, i64 10
  %22 = load double* %arrayidx46, align 8
  %sub47 = fsub double %21, %22
  %arrayidx48 = getelementptr inbounds double* %a, i64 9
  %23 = load double* %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds double* %a, i64 11
  %24 = load double* %arrayidx49, align 8
  %sub50 = fsub double %23, %24
  %arrayidx51 = getelementptr inbounds double* %a, i64 12
  %25 = load double* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds double* %a, i64 14
  %26 = load double* %arrayidx52, align 8
  %add53 = fadd double %25, %26
  %arrayidx54 = getelementptr inbounds double* %a, i64 13
  %27 = load double* %arrayidx54, align 8
  %arrayidx55 = getelementptr inbounds double* %a, i64 15
  %28 = load double* %arrayidx55, align 8
  %add56 = fadd double %27, %28
  %arrayidx57 = getelementptr inbounds double* %a, i64 12
  %29 = load double* %arrayidx57, align 8
  %arrayidx58 = getelementptr inbounds double* %a, i64 14
  %30 = load double* %arrayidx58, align 8
  %sub59 = fsub double %29, %30
  %arrayidx60 = getelementptr inbounds double* %a, i64 13
  %31 = load double* %arrayidx60, align 8
  %arrayidx61 = getelementptr inbounds double* %a, i64 15
  %32 = load double* %arrayidx61, align 8
  %sub62 = fsub double %31, %32
  br label %entry.split.split.split

entry.split.split.split:                          ; preds = %entry.split.split
  %ni29 = fadd double %add44, %add56
  br label %entry.split.split.split.split26

entry.split.split.split.split26:                  ; preds = %entry.split.split.split
  %ni8 = fadd double %add41, %add53
  br label %entry.split.split.split.split5

entry.split.split.split.split5:                   ; preds = %entry.split.split.split.split26
  %ni178 = fsub double %sub59, %sub50
  br label %entry.split.split.split.split5.split175

entry.split.split.split.split5.split175:          ; preds = %entry.split.split.split.split5
  %ni156 = fsub double %add56, %add44
  br label %entry.split.split.split.split5.split153

entry.split.split.split.split5.split153:          ; preds = %entry.split.split.split.split5.split175
  %ni126 = fadd double %sub47, %sub62
  br label %entry.split.split.split.split5.split123

entry.split.split.split.split5.split123:          ; preds = %entry.split.split.split.split5.split153
  %ni105 = fadd double %sub50, %sub59
  br label %entry.split.split.split.split5.split102

entry.split.split.split.split5.split102:          ; preds = %entry.split.split.split.split5.split123
  %ni84 = fsub double %sub47, %sub62
  br label %entry.split.split.split.split5.split81

entry.split.split.split.split5.split81:           ; preds = %entry.split.split.split.split5.split102
  %ni48 = fsub double %add41, %add53
  br label %entry.split.split.split.split5.split

entry.split.split.split.split5.split:             ; preds = %entry.split.split.split.split5.split81
  %arrayidx64 = getelementptr inbounds double* %a, i64 8
  store double %ni8, double* %arrayidx64, align 8
  %arrayidx66 = getelementptr inbounds double* %a, i64 9
  store double %ni29, double* %arrayidx66, align 8
  %arrayidx68 = getelementptr inbounds double* %a, i64 12
  store double %ni156, double* %arrayidx68, align 8
  %arrayidx70 = getelementptr inbounds double* %a, i64 13
  store double %ni48, double* %arrayidx70, align 8
  br label %entry.split.split.split.split

entry.split.split.split.split:                    ; preds = %entry.split.split.split.split5.split
  br label %entry.split.split.split.split.split

entry.split.split.split.split.split:              ; preds = %entry.split.split.split.split
  %ni169 = fadd double %ni84, %ni105
  br label %entry.split.split.split.split.split.split166

entry.split.split.split.split.split.split166:     ; preds = %entry.split.split.split.split.split
  %ni162 = fsub double %ni84, %ni105
  br label %entry.split.split.split.split.split.split159

entry.split.split.split.split.split.split159:     ; preds = %entry.split.split.split.split.split.split166
  %mul = fmul double %16, %ni162
  %arrayidx74 = getelementptr inbounds double* %a, i64 10
  store double %mul, double* %arrayidx74, align 8
  %mul76 = fmul double %16, %ni169
  %arrayidx77 = getelementptr inbounds double* %a, i64 11
  store double %mul76, double* %arrayidx77, align 8
  br label %entry.split.split.split.split.split.split

entry.split.split.split.split.split.split:        ; preds = %entry.split.split.split.split.split.split159
  br label %entry.split.split.split.split.split.split.split179

entry.split.split.split.split.split.split.split179: ; preds = %entry.split.split.split.split.split.split
  %ni184 = fsub double %ni178, %ni126
  br label %entry.split.split.split.split.split.split.split179.split

entry.split.split.split.split.split.split.split179.split: ; preds = %entry.split.split.split.split.split.split.split179
  %mul81 = fmul double %16, %ni184
  %arrayidx82 = getelementptr inbounds double* %a, i64 14
  store double %mul81, double* %arrayidx82, align 8
  br label %entry.split.split.split.split.split.split.split

entry.split.split.split.split.split.split.split:  ; preds = %entry.split.split.split.split.split.split.split179.split
  %ni172 = fadd double %ni126, %ni178
  br label %entry.split.split.split.split.split.split.split.split

entry.split.split.split.split.split.split.split.split: ; preds = %entry.split.split.split.split.split.split.split
  %mul84 = fmul double %16, %ni172
  %arrayidx85 = getelementptr inbounds double* %a, i64 15
  store double %mul84, double* %arrayidx85, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry.split.split.split.split.split.split.split.split
  %k1.0 = phi i32 [ 0, %entry.split.split.split.split.split.split.split.split ], [ %add86, %for.inc ]
  %j.0 = phi i32 [ 16, %entry.split.split.split.split.split.split.split.split ], [ %add326, %for.inc ]
  %cmp = icmp slt i32 %j.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add86 = add nsw i32 %k1.0, 2
  %mul87 = mul nsw i32 2, %add86
  %idxprom = sext i32 %add86 to i64
  %arrayidx88 = getelementptr inbounds double* %w, i64 %idxprom
  %33 = load double* %arrayidx88, align 8
  %add89 = add nsw i32 %add86, 1
  %idxprom90 = sext i32 %add89 to i64
  %arrayidx91 = getelementptr inbounds double* %w, i64 %idxprom90
  %34 = load double* %arrayidx91, align 8
  %idxprom92 = sext i32 %mul87 to i64
  %arrayidx93 = getelementptr inbounds double* %w, i64 %idxprom92
  %35 = load double* %arrayidx93, align 8
  %add94 = add nsw i32 %mul87, 1
  %idxprom95 = sext i32 %add94 to i64
  %arrayidx96 = getelementptr inbounds double* %w, i64 %idxprom95
  %36 = load double* %arrayidx96, align 8
  %mul97 = fmul double 2.000000e+00, %34
  %mul98 = fmul double %mul97, %36
  %sub99 = fsub double %35, %mul98
  %mul100 = fmul double 2.000000e+00, %34
  %mul101 = fmul double %mul100, %35
  %sub102 = fsub double %mul101, %36
  %idxprom103 = sext i32 %j.0 to i64
  %arrayidx104 = getelementptr inbounds double* %a, i64 %idxprom103
  %37 = load double* %arrayidx104, align 8
  %add105 = add nsw i32 %j.0, 2
  %idxprom106 = sext i32 %add105 to i64
  %arrayidx107 = getelementptr inbounds double* %a, i64 %idxprom106
  %38 = load double* %arrayidx107, align 8
  %add108 = fadd double %37, %38
  %add109 = add nsw i32 %j.0, 1
  %idxprom110 = sext i32 %add109 to i64
  %arrayidx111 = getelementptr inbounds double* %a, i64 %idxprom110
  %39 = load double* %arrayidx111, align 8
  %add112 = add nsw i32 %j.0, 3
  %idxprom113 = sext i32 %add112 to i64
  %arrayidx114 = getelementptr inbounds double* %a, i64 %idxprom113
  %40 = load double* %arrayidx114, align 8
  %add115 = fadd double %39, %40
  %idxprom116 = sext i32 %j.0 to i64
  %arrayidx117 = getelementptr inbounds double* %a, i64 %idxprom116
  %41 = load double* %arrayidx117, align 8
  %add118 = add nsw i32 %j.0, 2
  %idxprom119 = sext i32 %add118 to i64
  %arrayidx120 = getelementptr inbounds double* %a, i64 %idxprom119
  %42 = load double* %arrayidx120, align 8
  %sub121 = fsub double %41, %42
  %add122 = add nsw i32 %j.0, 1
  %idxprom123 = sext i32 %add122 to i64
  %arrayidx124 = getelementptr inbounds double* %a, i64 %idxprom123
  %43 = load double* %arrayidx124, align 8
  %add125 = add nsw i32 %j.0, 3
  %idxprom126 = sext i32 %add125 to i64
  %arrayidx127 = getelementptr inbounds double* %a, i64 %idxprom126
  %44 = load double* %arrayidx127, align 8
  %sub128 = fsub double %43, %44
  %add129 = add nsw i32 %j.0, 4
  %idxprom130 = sext i32 %add129 to i64
  %arrayidx131 = getelementptr inbounds double* %a, i64 %idxprom130
  %45 = load double* %arrayidx131, align 8
  %add132 = add nsw i32 %j.0, 6
  %idxprom133 = sext i32 %add132 to i64
  %arrayidx134 = getelementptr inbounds double* %a, i64 %idxprom133
  %46 = load double* %arrayidx134, align 8
  %add135 = fadd double %45, %46
  %add136 = add nsw i32 %j.0, 5
  %idxprom137 = sext i32 %add136 to i64
  %arrayidx138 = getelementptr inbounds double* %a, i64 %idxprom137
  %47 = load double* %arrayidx138, align 8
  %add139 = add nsw i32 %j.0, 7
  %idxprom140 = sext i32 %add139 to i64
  %arrayidx141 = getelementptr inbounds double* %a, i64 %idxprom140
  %48 = load double* %arrayidx141, align 8
  %add142 = fadd double %47, %48
  %add143 = add nsw i32 %j.0, 4
  %idxprom144 = sext i32 %add143 to i64
  %arrayidx145 = getelementptr inbounds double* %a, i64 %idxprom144
  %49 = load double* %arrayidx145, align 8
  %add146 = add nsw i32 %j.0, 6
  %idxprom147 = sext i32 %add146 to i64
  %arrayidx148 = getelementptr inbounds double* %a, i64 %idxprom147
  %50 = load double* %arrayidx148, align 8
  %sub149 = fsub double %49, %50
  %add150 = add nsw i32 %j.0, 5
  %idxprom151 = sext i32 %add150 to i64
  %arrayidx152 = getelementptr inbounds double* %a, i64 %idxprom151
  %51 = load double* %arrayidx152, align 8
  %add153 = add nsw i32 %j.0, 7
  %idxprom154 = sext i32 %add153 to i64
  %arrayidx155 = getelementptr inbounds double* %a, i64 %idxprom154
  %52 = load double* %arrayidx155, align 8
  %sub156 = fsub double %51, %52
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  %ni33 = fadd double %add115, %add142
  br label %for.body.split.split30

for.body.split.split30:                           ; preds = %for.body.split
  %ni12 = fadd double %add108, %add135
  br label %for.body.split.split9

for.body.split.split9:                            ; preds = %for.body.split.split30
  %ni146 = fsub double %sub128, %sub149
  br label %for.body.split.split9.split143

for.body.split.split9.split143:                   ; preds = %for.body.split.split9
  %ni130 = fadd double %sub121, %sub156
  br label %for.body.split.split9.split127

for.body.split.split9.split127:                   ; preds = %for.body.split.split9.split143
  %ni109 = fadd double %sub128, %sub149
  br label %for.body.split.split9.split106

for.body.split.split9.split106:                   ; preds = %for.body.split.split9.split127
  %ni88 = fsub double %sub121, %sub156
  br label %for.body.split.split9.split85

for.body.split.split9.split85:                    ; preds = %for.body.split.split9.split106
  %ni67 = fsub double %add115, %add142
  br label %for.body.split.split9.split64

for.body.split.split9.split64:                    ; preds = %for.body.split.split9.split85
  %ni51 = fsub double %add108, %add135
  br label %for.body.split.split9.split

for.body.split.split9.split:                      ; preds = %for.body.split.split9.split64
  %idxprom158 = sext i32 %j.0 to i64
  %arrayidx159 = getelementptr inbounds double* %a, i64 %idxprom158
  store double %ni12, double* %arrayidx159, align 8
  %add161 = add nsw i32 %j.0, 1
  %idxprom162 = sext i32 %add161 to i64
  %arrayidx163 = getelementptr inbounds double* %a, i64 %idxprom162
  store double %ni33, double* %arrayidx163, align 8
  br label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split.split9.split
  br label %for.body.split.split.split55

for.body.split.split.split55:                     ; preds = %for.body.split.split
  %ni192 = fmul double %33, %ni51
  br label %for.body.split.split.split55.split189

for.body.split.split.split55.split189:            ; preds = %for.body.split.split.split55
  br label %for.body.split.split.split55.split189.split

for.body.split.split.split55.split189.split:      ; preds = %for.body.split.split.split55.split189
  %ni208 = fmul double %33, %ni67
  br label %for.body.split.split.split55.split189.split.split205

for.body.split.split.split55.split189.split.split205: ; preds = %for.body.split.split.split55.split189.split
  %ni201 = fmul double %34, %ni67
  br label %for.body.split.split.split55.split189.split.split

for.body.split.split.split55.split189.split.split: ; preds = %for.body.split.split.split55.split189.split.split205
  %ni216 = fmul double %34, %ni51
  br label %for.body.split.split.split55.split189.split.split.split

for.body.split.split.split55.split189.split.split.split: ; preds = %for.body.split.split.split55.split189.split.split
  %sub168 = fsub double %ni192, %ni201
  %add169 = add nsw i32 %j.0, 4
  %idxprom170 = sext i32 %add169 to i64
  %arrayidx171 = getelementptr inbounds double* %a, i64 %idxprom170
  store double %sub168, double* %arrayidx171, align 8
  %add174 = fadd double %ni208, %ni216
  %add175 = add nsw i32 %j.0, 5
  %idxprom176 = sext i32 %add175 to i64
  %arrayidx177 = getelementptr inbounds double* %a, i64 %idxprom176
  store double %add174, double* %arrayidx177, align 8
  br label %for.body.split.split.split55.split185

for.body.split.split.split55.split185:            ; preds = %for.body.split.split.split55.split189.split.split.split
  br label %for.body.split.split.split55.split185.split

for.body.split.split.split55.split185.split:      ; preds = %for.body.split.split.split55.split185
  %ni234 = fmul double %36, %ni109
  br label %for.body.split.split.split55.split185.split.split231

for.body.split.split.split55.split185.split.split231: ; preds = %for.body.split.split.split55.split185.split
  %ni223 = fmul double %35, %ni88
  br label %for.body.split.split.split55.split185.split.split220

for.body.split.split.split55.split185.split.split220: ; preds = %for.body.split.split.split55.split185.split.split231
  %ni254 = fmul double %36, %ni88
  br label %for.body.split.split.split55.split185.split.split220.split251

for.body.split.split.split55.split185.split.split220.split251: ; preds = %for.body.split.split.split55.split185.split.split220
  %ni244 = fmul double %35, %ni109
  br label %for.body.split.split.split55.split185.split.split220.split

for.body.split.split.split55.split185.split.split220.split: ; preds = %for.body.split.split.split55.split185.split.split220.split251
  %sub182 = fsub double %ni223, %ni234
  %add183 = add nsw i32 %j.0, 2
  %idxprom184 = sext i32 %add183 to i64
  %arrayidx185 = getelementptr inbounds double* %a, i64 %idxprom184
  store double %sub182, double* %arrayidx185, align 8
  %add188 = fadd double %ni244, %ni254
  %add189 = add nsw i32 %j.0, 3
  %idxprom190 = sext i32 %add189 to i64
  %arrayidx191 = getelementptr inbounds double* %a, i64 %idxprom190
  store double %add188, double* %arrayidx191, align 8
  br label %for.body.split.split.split55.split185.split.split

for.body.split.split.split55.split185.split.split: ; preds = %for.body.split.split.split55.split185.split.split220.split
  br label %for.body.split.split.split55.split185.split.split.split

for.body.split.split.split55.split185.split.split.split: ; preds = %for.body.split.split.split55.split185.split.split
  %ni275 = fmul double %sub102, %ni146
  br label %for.body.split.split.split55.split185.split.split.split.split272

for.body.split.split.split55.split185.split.split.split.split272: ; preds = %for.body.split.split.split55.split185.split.split.split
  %ni265 = fmul double %sub99, %ni130
  br label %for.body.split.split.split55.split185.split.split.split.split262

for.body.split.split.split55.split185.split.split.split.split262: ; preds = %for.body.split.split.split55.split185.split.split.split.split272
  %ni295 = fmul double %sub102, %ni130
  br label %for.body.split.split.split55.split185.split.split.split.split262.split292

for.body.split.split.split55.split185.split.split.split.split262.split292: ; preds = %for.body.split.split.split55.split185.split.split.split.split262
  %ni285 = fmul double %sub99, %ni146
  br label %for.body.split.split.split55.split185.split.split.split.split262.split

for.body.split.split.split55.split185.split.split.split.split262.split: ; preds = %for.body.split.split.split55.split185.split.split.split.split262.split292
  %sub196 = fsub double %ni265, %ni275
  %add197 = add nsw i32 %j.0, 6
  %idxprom198 = sext i32 %add197 to i64
  %arrayidx199 = getelementptr inbounds double* %a, i64 %idxprom198
  store double %sub196, double* %arrayidx199, align 8
  %add202 = fadd double %ni285, %ni295
  %add203 = add nsw i32 %j.0, 7
  %idxprom204 = sext i32 %add203 to i64
  %arrayidx205 = getelementptr inbounds double* %a, i64 %idxprom204
  store double %add202, double* %arrayidx205, align 8
  %add206 = add nsw i32 %mul87, 2
  %idxprom207 = sext i32 %add206 to i64
  %arrayidx208 = getelementptr inbounds double* %w, i64 %idxprom207
  %53 = load double* %arrayidx208, align 8
  %add209 = add nsw i32 %mul87, 3
  %idxprom210 = sext i32 %add209 to i64
  %arrayidx211 = getelementptr inbounds double* %w, i64 %idxprom210
  %54 = load double* %arrayidx211, align 8
  %mul212 = fmul double 2.000000e+00, %33
  %mul213 = fmul double %mul212, %54
  %sub214 = fsub double %53, %mul213
  br label %for.body.split.split.split55.split185.split.split.split.split

for.body.split.split.split55.split185.split.split.split.split: ; preds = %for.body.split.split.split55.split185.split.split.split.split262.split
  %mul215 = fmul double 2.000000e+00, %33
  %mul216 = fmul double %mul215, %53
  %sub217 = fsub double %mul216, %54
  %add218 = add nsw i32 %j.0, 8
  %idxprom219 = sext i32 %add218 to i64
  %arrayidx220 = getelementptr inbounds double* %a, i64 %idxprom219
  %55 = load double* %arrayidx220, align 8
  %add221 = add nsw i32 %j.0, 10
  %idxprom222 = sext i32 %add221 to i64
  %arrayidx223 = getelementptr inbounds double* %a, i64 %idxprom222
  %56 = load double* %arrayidx223, align 8
  %add224 = fadd double %55, %56
  %add225 = add nsw i32 %j.0, 9
  %idxprom226 = sext i32 %add225 to i64
  %arrayidx227 = getelementptr inbounds double* %a, i64 %idxprom226
  %57 = load double* %arrayidx227, align 8
  %add228 = add nsw i32 %j.0, 11
  %idxprom229 = sext i32 %add228 to i64
  %arrayidx230 = getelementptr inbounds double* %a, i64 %idxprom229
  %58 = load double* %arrayidx230, align 8
  %add231 = fadd double %57, %58
  %add232 = add nsw i32 %j.0, 8
  %idxprom233 = sext i32 %add232 to i64
  %arrayidx234 = getelementptr inbounds double* %a, i64 %idxprom233
  %59 = load double* %arrayidx234, align 8
  %add235 = add nsw i32 %j.0, 10
  %idxprom236 = sext i32 %add235 to i64
  %arrayidx237 = getelementptr inbounds double* %a, i64 %idxprom236
  %60 = load double* %arrayidx237, align 8
  %sub238 = fsub double %59, %60
  br label %for.body.split.split.split55.split

for.body.split.split.split55.split:               ; preds = %for.body.split.split.split55.split185.split.split.split.split
  %add239 = add nsw i32 %j.0, 9
  %idxprom240 = sext i32 %add239 to i64
  %arrayidx241 = getelementptr inbounds double* %a, i64 %idxprom240
  %61 = load double* %arrayidx241, align 8
  %add242 = add nsw i32 %j.0, 11
  %idxprom243 = sext i32 %add242 to i64
  %arrayidx244 = getelementptr inbounds double* %a, i64 %idxprom243
  %62 = load double* %arrayidx244, align 8
  %sub245 = fsub double %61, %62
  %add246 = add nsw i32 %j.0, 12
  %idxprom247 = sext i32 %add246 to i64
  %arrayidx248 = getelementptr inbounds double* %a, i64 %idxprom247
  %63 = load double* %arrayidx248, align 8
  %add249 = add nsw i32 %j.0, 14
  %idxprom250 = sext i32 %add249 to i64
  %arrayidx251 = getelementptr inbounds double* %a, i64 %idxprom250
  %64 = load double* %arrayidx251, align 8
  %add252 = fadd double %63, %64
  %add253 = add nsw i32 %j.0, 13
  %idxprom254 = sext i32 %add253 to i64
  %arrayidx255 = getelementptr inbounds double* %a, i64 %idxprom254
  %65 = load double* %arrayidx255, align 8
  %add256 = add nsw i32 %j.0, 15
  %idxprom257 = sext i32 %add256 to i64
  %arrayidx258 = getelementptr inbounds double* %a, i64 %idxprom257
  %66 = load double* %arrayidx258, align 8
  %add259 = fadd double %65, %66
  %add260 = add nsw i32 %j.0, 12
  %idxprom261 = sext i32 %add260 to i64
  %arrayidx262 = getelementptr inbounds double* %a, i64 %idxprom261
  %67 = load double* %arrayidx262, align 8
  %add263 = add nsw i32 %j.0, 14
  %idxprom264 = sext i32 %add263 to i64
  %arrayidx265 = getelementptr inbounds double* %a, i64 %idxprom264
  %68 = load double* %arrayidx265, align 8
  %sub266 = fsub double %67, %68
  %add267 = add nsw i32 %j.0, 13
  %idxprom268 = sext i32 %add267 to i64
  %arrayidx269 = getelementptr inbounds double* %a, i64 %idxprom268
  %69 = load double* %arrayidx269, align 8
  %add270 = add nsw i32 %j.0, 15
  %idxprom271 = sext i32 %add270 to i64
  %arrayidx272 = getelementptr inbounds double* %a, i64 %idxprom271
  %70 = load double* %arrayidx272, align 8
  %sub273 = fsub double %69, %70
  br label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split.split55.split
  %ni37 = fadd double %add231, %add259
  br label %for.body.split.split.split.split34

for.body.split.split.split.split34:               ; preds = %for.body.split.split.split
  %ni16 = fadd double %add224, %add252
  br label %for.body.split.split.split.split13

for.body.split.split.split.split13:               ; preds = %for.body.split.split.split.split34
  %ni150 = fsub double %sub245, %sub266
  br label %for.body.split.split.split.split13.split147

for.body.split.split.split.split13.split147:      ; preds = %for.body.split.split.split.split13
  %ni134 = fadd double %sub238, %sub273
  br label %for.body.split.split.split.split13.split131

for.body.split.split.split.split13.split131:      ; preds = %for.body.split.split.split.split13.split147
  %ni113 = fadd double %sub245, %sub266
  br label %for.body.split.split.split.split13.split110

for.body.split.split.split.split13.split110:      ; preds = %for.body.split.split.split.split13.split131
  %ni92 = fsub double %sub238, %sub273
  br label %for.body.split.split.split.split13.split89

for.body.split.split.split.split13.split89:       ; preds = %for.body.split.split.split.split13.split110
  %ni71 = fsub double %add231, %add259
  br label %for.body.split.split.split.split13.split68

for.body.split.split.split.split13.split68:       ; preds = %for.body.split.split.split.split13.split89
  %ni54 = fsub double %add224, %add252
  br label %for.body.split.split.split.split13.split

for.body.split.split.split.split13.split:         ; preds = %for.body.split.split.split.split13.split68
  %add275 = add nsw i32 %j.0, 8
  %idxprom276 = sext i32 %add275 to i64
  %arrayidx277 = getelementptr inbounds double* %a, i64 %idxprom276
  store double %ni16, double* %arrayidx277, align 8
  %add279 = add nsw i32 %j.0, 9
  %idxprom280 = sext i32 %add279 to i64
  %arrayidx281 = getelementptr inbounds double* %a, i64 %idxprom280
  store double %ni37, double* %arrayidx281, align 8
  br label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split.split13.split
  br label %for.body.split.split.split.split.split

for.body.split.split.split.split.split:           ; preds = %for.body.split.split.split.split
  %ni196 = fmul double %33, %ni54
  br label %for.body.split.split.split.split.split.split193

for.body.split.split.split.split.split.split193:  ; preds = %for.body.split.split.split.split.split
  %sub284 = fsub double -0.000000e+00, %34
  %mul285 = fmul double %sub284, %ni54
  br label %for.body.split.split.split.split.split.split193.split

for.body.split.split.split.split.split.split193.split: ; preds = %for.body.split.split.split.split.split.split193
  %ni211 = fmul double %33, %ni71
  br label %for.body.split.split.split.split.split.split193.split.split

for.body.split.split.split.split.split.split193.split.split: ; preds = %for.body.split.split.split.split.split.split193.split
  %sub287 = fsub double %mul285, %ni211
  %add288 = add nsw i32 %j.0, 12
  %idxprom289 = sext i32 %add288 to i64
  %arrayidx290 = getelementptr inbounds double* %a, i64 %idxprom289
  store double %sub287, double* %arrayidx290, align 8
  %sub291 = fsub double -0.000000e+00, %34
  %mul292 = fmul double %sub291, %ni71
  %add294 = fadd double %mul292, %ni196
  %add295 = add nsw i32 %j.0, 13
  %idxprom296 = sext i32 %add295 to i64
  %arrayidx297 = getelementptr inbounds double* %a, i64 %idxprom296
  store double %add294, double* %arrayidx297, align 8
  br label %for.body.split.split.split.split.split.split

for.body.split.split.split.split.split.split:     ; preds = %for.body.split.split.split.split.split.split193.split.split
  br label %for.body.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split
  %ni238 = fmul double %54, %ni113
  br label %for.body.split.split.split.split.split.split.split.split235

for.body.split.split.split.split.split.split.split.split235: ; preds = %for.body.split.split.split.split.split.split.split
  %ni227 = fmul double %53, %ni92
  br label %for.body.split.split.split.split.split.split.split.split224

for.body.split.split.split.split.split.split.split.split224: ; preds = %for.body.split.split.split.split.split.split.split.split235
  %ni258 = fmul double %54, %ni92
  br label %for.body.split.split.split.split.split.split.split.split224.split255

for.body.split.split.split.split.split.split.split.split224.split255: ; preds = %for.body.split.split.split.split.split.split.split.split224
  %ni247 = fmul double %53, %ni113
  br label %for.body.split.split.split.split.split.split.split.split224.split

for.body.split.split.split.split.split.split.split.split224.split: ; preds = %for.body.split.split.split.split.split.split.split.split224.split255
  %sub302 = fsub double %ni227, %ni238
  %add303 = add nsw i32 %j.0, 10
  %idxprom304 = sext i32 %add303 to i64
  %arrayidx305 = getelementptr inbounds double* %a, i64 %idxprom304
  store double %sub302, double* %arrayidx305, align 8
  %add308 = fadd double %ni247, %ni258
  %add309 = add nsw i32 %j.0, 11
  %idxprom310 = sext i32 %add309 to i64
  %arrayidx311 = getelementptr inbounds double* %a, i64 %idxprom310
  store double %add308, double* %arrayidx311, align 8
  br label %for.body.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split224.split
  br label %for.body.split.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split
  %ni279 = fmul double %sub217, %ni150
  br label %for.body.split.split.split.split.split.split.split.split.split.split276

for.body.split.split.split.split.split.split.split.split.split.split276: ; preds = %for.body.split.split.split.split.split.split.split.split.split
  %ni268 = fmul double %sub214, %ni134
  br label %for.body.split.split.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split.split.split276
  %ni299 = fmul double %sub217, %ni134
  br label %for.body.split.split.split.split.split.split.split.split.split.split.split296

for.body.split.split.split.split.split.split.split.split.split.split.split296: ; preds = %for.body.split.split.split.split.split.split.split.split.split.split
  %ni288 = fmul double %sub214, %ni150
  br label %for.body.split.split.split.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split.split.split.split296
  %sub316 = fsub double %ni268, %ni279
  %add317 = add nsw i32 %j.0, 14
  %idxprom318 = sext i32 %add317 to i64
  %arrayidx319 = getelementptr inbounds double* %a, i64 %idxprom318
  store double %sub316, double* %arrayidx319, align 8
  %add322 = fadd double %ni288, %ni299
  %add323 = add nsw i32 %j.0, 15
  %idxprom324 = sext i32 %add323 to i64
  %arrayidx325 = getelementptr inbounds double* %a, i64 %idxprom324
  store double %add322, double* %arrayidx325, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body.split.split.split.split.split.split.split.split.split.split.split
  %add326 = add nsw i32 %j.0, 16
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @cftmdl(i32 %n, i32 %l, double* %a, double* %w) #6 {
entry:
  %shl = shl i32 %l, 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %add76, %for.inc ]
  %cmp = icmp slt i32 %j.0, %l
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ni8 = add i32 %j.0, %l
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  br label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %ni37 = add i32 %ni8, %l
  br label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split
  br label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %ni54 = add i32 %ni37, %l
  br label %for.body.split.split.split.split.split

for.body.split.split.split.split.split:           ; preds = %for.body.split.split.split.split
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds double* %a, i64 %idxprom
  %0 = load double* %arrayidx, align 8
  %idxprom3 = sext i32 %ni8 to i64
  %arrayidx4 = getelementptr inbounds double* %a, i64 %idxprom3
  %1 = load double* %arrayidx4, align 8
  %add5 = fadd double %0, %1
  %add6 = add nsw i32 %j.0, 1
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds double* %a, i64 %idxprom7
  %2 = load double* %arrayidx8, align 8
  %add9 = add nsw i32 %ni8, 1
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds double* %a, i64 %idxprom10
  %3 = load double* %arrayidx11, align 8
  %add12 = fadd double %2, %3
  %idxprom13 = sext i32 %j.0 to i64
  %arrayidx14 = getelementptr inbounds double* %a, i64 %idxprom13
  %4 = load double* %arrayidx14, align 8
  %idxprom15 = sext i32 %ni8 to i64
  %arrayidx16 = getelementptr inbounds double* %a, i64 %idxprom15
  %5 = load double* %arrayidx16, align 8
  %sub = fsub double %4, %5
  %add17 = add nsw i32 %j.0, 1
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds double* %a, i64 %idxprom18
  %6 = load double* %arrayidx19, align 8
  %add20 = add nsw i32 %ni8, 1
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds double* %a, i64 %idxprom21
  %7 = load double* %arrayidx22, align 8
  %sub23 = fsub double %6, %7
  %idxprom24 = sext i32 %ni37 to i64
  %arrayidx25 = getelementptr inbounds double* %a, i64 %idxprom24
  %8 = load double* %arrayidx25, align 8
  %idxprom26 = sext i32 %ni54 to i64
  %arrayidx27 = getelementptr inbounds double* %a, i64 %idxprom26
  %9 = load double* %arrayidx27, align 8
  %add28 = fadd double %8, %9
  %add29 = add nsw i32 %ni37, 1
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds double* %a, i64 %idxprom30
  %10 = load double* %arrayidx31, align 8
  %add32 = add nsw i32 %ni54, 1
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double* %a, i64 %idxprom33
  %11 = load double* %arrayidx34, align 8
  %add35 = fadd double %10, %11
  %idxprom36 = sext i32 %ni37 to i64
  %arrayidx37 = getelementptr inbounds double* %a, i64 %idxprom36
  %12 = load double* %arrayidx37, align 8
  %idxprom38 = sext i32 %ni54 to i64
  %arrayidx39 = getelementptr inbounds double* %a, i64 %idxprom38
  %13 = load double* %arrayidx39, align 8
  %sub40 = fsub double %12, %13
  %add41 = add nsw i32 %ni37, 1
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds double* %a, i64 %idxprom42
  %14 = load double* %arrayidx43, align 8
  %add44 = add nsw i32 %ni54, 1
  %idxprom45 = sext i32 %add44 to i64
  %arrayidx46 = getelementptr inbounds double* %a, i64 %idxprom45
  %15 = load double* %arrayidx46, align 8
  %sub47 = fsub double %14, %15
  br label %for.body.split.split.split.split.split.split

for.body.split.split.split.split.split.split:     ; preds = %for.body.split.split.split.split.split
  %ni95 = fadd double %add12, %add35
  br label %for.body.split.split.split.split.split.split.split92

for.body.split.split.split.split.split.split.split92: ; preds = %for.body.split.split.split.split.split.split
  %ni74 = fadd double %add5, %add28
  br label %for.body.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split92
  %ni207 = fsub double %sub23, %sub40
  br label %for.body.split.split.split.split.split.split.split.split204

for.body.split.split.split.split.split.split.split.split204: ; preds = %for.body.split.split.split.split.split.split.split
  %ni191 = fadd double %sub, %sub47
  br label %for.body.split.split.split.split.split.split.split.split188

for.body.split.split.split.split.split.split.split.split188: ; preds = %for.body.split.split.split.split.split.split.split.split204
  %ni170 = fadd double %sub23, %sub40
  br label %for.body.split.split.split.split.split.split.split.split167

for.body.split.split.split.split.split.split.split.split167: ; preds = %for.body.split.split.split.split.split.split.split.split188
  %ni149 = fsub double %sub, %sub47
  br label %for.body.split.split.split.split.split.split.split.split146

for.body.split.split.split.split.split.split.split.split146: ; preds = %for.body.split.split.split.split.split.split.split.split167
  %ni128 = fsub double %add12, %add35
  br label %for.body.split.split.split.split.split.split.split.split125

for.body.split.split.split.split.split.split.split.split125: ; preds = %for.body.split.split.split.split.split.split.split.split146
  %ni112 = fsub double %add5, %add28
  br label %for.body.split.split.split.split.split.split.split.split

for.body.split.split.split.split.split.split.split.split: ; preds = %for.body.split.split.split.split.split.split.split.split125
  %idxprom49 = sext i32 %j.0 to i64
  %arrayidx50 = getelementptr inbounds double* %a, i64 %idxprom49
  store double %ni74, double* %arrayidx50, align 8
  %add52 = add nsw i32 %j.0, 1
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds double* %a, i64 %idxprom53
  store double %ni95, double* %arrayidx54, align 8
  %idxprom56 = sext i32 %ni37 to i64
  %arrayidx57 = getelementptr inbounds double* %a, i64 %idxprom56
  store double %ni112, double* %arrayidx57, align 8
  %add59 = add nsw i32 %ni37, 1
  %idxprom60 = sext i32 %add59 to i64
  %arrayidx61 = getelementptr inbounds double* %a, i64 %idxprom60
  store double %ni128, double* %arrayidx61, align 8
  %idxprom63 = sext i32 %ni8 to i64
  %arrayidx64 = getelementptr inbounds double* %a, i64 %idxprom63
  store double %ni149, double* %arrayidx64, align 8
  %add66 = add nsw i32 %ni8, 1
  %idxprom67 = sext i32 %add66 to i64
  %arrayidx68 = getelementptr inbounds double* %a, i64 %idxprom67
  store double %ni170, double* %arrayidx68, align 8
  %idxprom70 = sext i32 %ni54 to i64
  %arrayidx71 = getelementptr inbounds double* %a, i64 %idxprom70
  store double %ni191, double* %arrayidx71, align 8
  %add73 = add nsw i32 %ni54, 1
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds double* %a, i64 %idxprom74
  store double %ni207, double* %arrayidx75, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body.split.split.split.split.split.split.split.split
  %add76 = add nsw i32 %j.0, 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %ni212 = add i32 %l, %shl
  br label %for.end.split

for.end.split:                                    ; preds = %for.end
  %arrayidx77 = getelementptr inbounds double* %w, i64 2
  %16 = load double* %arrayidx77, align 8
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc168, %for.end.split
  %j.1 = phi i32 [ %shl, %for.end.split ], [ %add169, %for.inc168 ]
  %cmp80 = icmp slt i32 %j.1, %ni212
  br i1 %cmp80, label %for.body81, label %for.end170

for.body81:                                       ; preds = %for.cond78
  %ni11 = add i32 %j.1, %l
  br label %for.body81.split

for.body81.split:                                 ; preds = %for.body81
  br label %for.body81.split.split

for.body81.split.split:                           ; preds = %for.body81.split
  %ni34 = add i32 %ni11, %l
  br label %for.body81.split.split.split

for.body81.split.split.split:                     ; preds = %for.body81.split.split
  br label %for.body81.split.split.split.split

for.body81.split.split.split.split:               ; preds = %for.body81.split.split.split
  %ni51 = add i32 %ni34, %l
  br label %for.body81.split.split.split.split.split

for.body81.split.split.split.split.split:         ; preds = %for.body81.split.split.split.split
  %idxprom85 = sext i32 %j.1 to i64
  %arrayidx86 = getelementptr inbounds double* %a, i64 %idxprom85
  %17 = load double* %arrayidx86, align 8
  %idxprom87 = sext i32 %ni11 to i64
  %arrayidx88 = getelementptr inbounds double* %a, i64 %idxprom87
  %18 = load double* %arrayidx88, align 8
  %add89 = fadd double %17, %18
  %add90 = add nsw i32 %j.1, 1
  %idxprom91 = sext i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds double* %a, i64 %idxprom91
  %19 = load double* %arrayidx92, align 8
  %add93 = add nsw i32 %ni11, 1
  %idxprom94 = sext i32 %add93 to i64
  %arrayidx95 = getelementptr inbounds double* %a, i64 %idxprom94
  %20 = load double* %arrayidx95, align 8
  %add96 = fadd double %19, %20
  %idxprom97 = sext i32 %j.1 to i64
  %arrayidx98 = getelementptr inbounds double* %a, i64 %idxprom97
  %21 = load double* %arrayidx98, align 8
  %idxprom99 = sext i32 %ni11 to i64
  %arrayidx100 = getelementptr inbounds double* %a, i64 %idxprom99
  %22 = load double* %arrayidx100, align 8
  %sub101 = fsub double %21, %22
  %add102 = add nsw i32 %j.1, 1
  %idxprom103 = sext i32 %add102 to i64
  %arrayidx104 = getelementptr inbounds double* %a, i64 %idxprom103
  %23 = load double* %arrayidx104, align 8
  %add105 = add nsw i32 %ni11, 1
  %idxprom106 = sext i32 %add105 to i64
  %arrayidx107 = getelementptr inbounds double* %a, i64 %idxprom106
  %24 = load double* %arrayidx107, align 8
  %sub108 = fsub double %23, %24
  %idxprom109 = sext i32 %ni34 to i64
  %arrayidx110 = getelementptr inbounds double* %a, i64 %idxprom109
  %25 = load double* %arrayidx110, align 8
  %idxprom111 = sext i32 %ni51 to i64
  %arrayidx112 = getelementptr inbounds double* %a, i64 %idxprom111
  %26 = load double* %arrayidx112, align 8
  %add113 = fadd double %25, %26
  %add114 = add nsw i32 %ni34, 1
  %idxprom115 = sext i32 %add114 to i64
  %arrayidx116 = getelementptr inbounds double* %a, i64 %idxprom115
  %27 = load double* %arrayidx116, align 8
  %add117 = add nsw i32 %ni51, 1
  %idxprom118 = sext i32 %add117 to i64
  %arrayidx119 = getelementptr inbounds double* %a, i64 %idxprom118
  %28 = load double* %arrayidx119, align 8
  %add120 = fadd double %27, %28
  %idxprom121 = sext i32 %ni34 to i64
  %arrayidx122 = getelementptr inbounds double* %a, i64 %idxprom121
  %29 = load double* %arrayidx122, align 8
  %idxprom123 = sext i32 %ni51 to i64
  %arrayidx124 = getelementptr inbounds double* %a, i64 %idxprom123
  %30 = load double* %arrayidx124, align 8
  %sub125 = fsub double %29, %30
  %add126 = add nsw i32 %ni34, 1
  %idxprom127 = sext i32 %add126 to i64
  %arrayidx128 = getelementptr inbounds double* %a, i64 %idxprom127
  %31 = load double* %arrayidx128, align 8
  %add129 = add nsw i32 %ni51, 1
  %idxprom130 = sext i32 %add129 to i64
  %arrayidx131 = getelementptr inbounds double* %a, i64 %idxprom130
  %32 = load double* %arrayidx131, align 8
  %sub132 = fsub double %31, %32
  br label %for.body81.split.split.split.split.split.split

for.body81.split.split.split.split.split.split:   ; preds = %for.body81.split.split.split.split.split
  %ni91 = fadd double %add96, %add120
  br label %for.body81.split.split.split.split.split.split.split88

for.body81.split.split.split.split.split.split.split88: ; preds = %for.body81.split.split.split.split.split.split
  %ni71 = fadd double %add89, %add113
  br label %for.body81.split.split.split.split.split.split.split68

for.body81.split.split.split.split.split.split.split68: ; preds = %for.body81.split.split.split.split.split.split.split88
  %ni240 = fsub double %sub125, %sub108
  br label %for.body81.split.split.split.split.split.split.split68.split237

for.body81.split.split.split.split.split.split.split68.split237: ; preds = %for.body81.split.split.split.split.split.split.split68
  %ni218 = fsub double %add120, %add96
  br label %for.body81.split.split.split.split.split.split.split68.split215

for.body81.split.split.split.split.split.split.split68.split215: ; preds = %for.body81.split.split.split.split.split.split.split68.split237
  %ni187 = fadd double %sub101, %sub132
  br label %for.body81.split.split.split.split.split.split.split68.split184

for.body81.split.split.split.split.split.split.split68.split184: ; preds = %for.body81.split.split.split.split.split.split.split68.split215
  %ni166 = fadd double %sub108, %sub125
  br label %for.body81.split.split.split.split.split.split.split68.split163

for.body81.split.split.split.split.split.split.split68.split163: ; preds = %for.body81.split.split.split.split.split.split.split68.split184
  %ni145 = fsub double %sub101, %sub132
  br label %for.body81.split.split.split.split.split.split.split68.split142

for.body81.split.split.split.split.split.split.split68.split142: ; preds = %for.body81.split.split.split.split.split.split.split68.split163
  %ni109 = fsub double %add89, %add113
  br label %for.body81.split.split.split.split.split.split.split68.split

for.body81.split.split.split.split.split.split.split68.split: ; preds = %for.body81.split.split.split.split.split.split.split68.split142
  %idxprom134 = sext i32 %j.1 to i64
  %arrayidx135 = getelementptr inbounds double* %a, i64 %idxprom134
  store double %ni71, double* %arrayidx135, align 8
  %add137 = add nsw i32 %j.1, 1
  %idxprom138 = sext i32 %add137 to i64
  %arrayidx139 = getelementptr inbounds double* %a, i64 %idxprom138
  store double %ni91, double* %arrayidx139, align 8
  %idxprom141 = sext i32 %ni34 to i64
  %arrayidx142 = getelementptr inbounds double* %a, i64 %idxprom141
  store double %ni218, double* %arrayidx142, align 8
  %add144 = add nsw i32 %ni34, 1
  %idxprom145 = sext i32 %add144 to i64
  %arrayidx146 = getelementptr inbounds double* %a, i64 %idxprom145
  store double %ni109, double* %arrayidx146, align 8
  br label %for.body81.split.split.split.split.split.split.split

for.body81.split.split.split.split.split.split.split: ; preds = %for.body81.split.split.split.split.split.split.split68.split
  br label %for.body81.split.split.split.split.split.split.split.split

for.body81.split.split.split.split.split.split.split.split: ; preds = %for.body81.split.split.split.split.split.split.split
  %ni231 = fadd double %ni145, %ni166
  br label %for.body81.split.split.split.split.split.split.split.split.split228

for.body81.split.split.split.split.split.split.split.split.split228: ; preds = %for.body81.split.split.split.split.split.split.split.split
  %ni224 = fsub double %ni145, %ni166
  br label %for.body81.split.split.split.split.split.split.split.split.split221

for.body81.split.split.split.split.split.split.split.split.split221: ; preds = %for.body81.split.split.split.split.split.split.split.split.split228
  %mul = fmul double %16, %ni224
  %idxprom150 = sext i32 %ni11 to i64
  %arrayidx151 = getelementptr inbounds double* %a, i64 %idxprom150
  store double %mul, double* %arrayidx151, align 8
  %mul153 = fmul double %16, %ni231
  %add154 = add nsw i32 %ni11, 1
  %idxprom155 = sext i32 %add154 to i64
  %arrayidx156 = getelementptr inbounds double* %a, i64 %idxprom155
  store double %mul153, double* %arrayidx156, align 8
  br label %for.body81.split.split.split.split.split.split.split.split.split

for.body81.split.split.split.split.split.split.split.split.split: ; preds = %for.body81.split.split.split.split.split.split.split.split.split221
  br label %for.body81.split.split.split.split.split.split.split.split.split.split241

for.body81.split.split.split.split.split.split.split.split.split.split241: ; preds = %for.body81.split.split.split.split.split.split.split.split.split
  %ni246 = fsub double %ni240, %ni187
  br label %for.body81.split.split.split.split.split.split.split.split.split.split241.split

for.body81.split.split.split.split.split.split.split.split.split.split241.split: ; preds = %for.body81.split.split.split.split.split.split.split.split.split.split241
  %mul160 = fmul double %16, %ni246
  %idxprom161 = sext i32 %ni51 to i64
  %arrayidx162 = getelementptr inbounds double* %a, i64 %idxprom161
  store double %mul160, double* %arrayidx162, align 8
  br label %for.body81.split.split.split.split.split.split.split.split.split.split

for.body81.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body81.split.split.split.split.split.split.split.split.split.split241.split
  %ni234 = fadd double %ni187, %ni240
  br label %for.body81.split.split.split.split.split.split.split.split.split.split.split

for.body81.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body81.split.split.split.split.split.split.split.split.split.split
  %mul164 = fmul double %16, %ni234
  %add165 = add nsw i32 %ni51, 1
  %idxprom166 = sext i32 %add165 to i64
  %arrayidx167 = getelementptr inbounds double* %a, i64 %idxprom166
  store double %mul164, double* %arrayidx167, align 8
  br label %for.inc168

for.inc168:                                       ; preds = %for.body81.split.split.split.split.split.split.split.split.split.split.split
  %add169 = add nsw i32 %j.1, 2
  br label %for.cond78

for.end170:                                       ; preds = %for.cond78
  %mul171 = mul nsw i32 2, %shl
  br label %for.cond172

for.cond172:                                      ; preds = %for.inc417.split, %for.end170
  %k.0 = phi i32 [ %mul171, %for.end170 ], [ %ni, %for.inc417.split ]
  %k1.0 = phi i32 [ 0, %for.end170 ], [ %add175, %for.inc417.split ]
  %cmp173 = icmp slt i32 %k.0, %n
  br i1 %cmp173, label %for.body174, label %for.end419

for.body174:                                      ; preds = %for.cond172
  %ni = add i32 %k.0, %mul171
  br label %for.body174.split

for.body174.split:                                ; preds = %for.body174
  %add175 = add nsw i32 %k1.0, 2
  %mul176 = mul nsw i32 2, %add175
  %idxprom177 = sext i32 %add175 to i64
  %arrayidx178 = getelementptr inbounds double* %w, i64 %idxprom177
  %33 = load double* %arrayidx178, align 8
  %add179 = add nsw i32 %add175, 1
  %idxprom180 = sext i32 %add179 to i64
  %arrayidx181 = getelementptr inbounds double* %w, i64 %idxprom180
  %34 = load double* %arrayidx181, align 8
  %idxprom182 = sext i32 %mul176 to i64
  %arrayidx183 = getelementptr inbounds double* %w, i64 %idxprom182
  %35 = load double* %arrayidx183, align 8
  %add184 = add nsw i32 %mul176, 1
  %idxprom185 = sext i32 %add184 to i64
  %arrayidx186 = getelementptr inbounds double* %w, i64 %idxprom185
  %36 = load double* %arrayidx186, align 8
  %mul187 = fmul double 2.000000e+00, %34
  %mul188 = fmul double %mul187, %36
  %sub189 = fsub double %35, %mul188
  %mul190 = fmul double 2.000000e+00, %34
  %mul191 = fmul double %mul190, %35
  %sub192 = fsub double %mul191, %36
  br label %for.body174.split.split

for.body174.split.split:                          ; preds = %for.body174.split
  %ni376 = add i32 %k.0, %shl
  br label %for.body174.split.split.split373

for.body174.split.split.split373:                 ; preds = %for.body174.split.split
  %ni251 = add i32 %l, %k.0
  br label %for.body174.split.split.split

for.body174.split.split.split:                    ; preds = %for.body174.split.split.split373
  %ni14 = add i32 %k.0, %l
  br label %for.cond193

for.cond193:                                      ; preds = %for.inc294.split, %for.body174.split.split.split
  %j.2 = phi i32 [ %k.0, %for.body174.split.split.split ], [ %add295, %for.inc294.split ]
  %stackVar1.0 = phi i32 [ %ni14, %for.body174.split.split.split ], [ %ni20, %for.inc294.split ]
  %cmp195 = icmp slt i32 %j.2, %ni251
  br i1 %cmp195, label %for.body196, label %for.end296

for.body196:                                      ; preds = %for.cond193
  br label %for.body196.split

for.body196.split:                                ; preds = %for.body196
  %ni31 = add i32 %stackVar1.0, %l
  br label %for.body196.split.split

for.body196.split.split:                          ; preds = %for.body196.split
  br label %for.body196.split.split.split

for.body196.split.split.split:                    ; preds = %for.body196.split.split
  %ni48 = add i32 %ni31, %l
  br label %for.body196.split.split.split.split

for.body196.split.split.split.split:              ; preds = %for.body196.split.split.split
  %idxprom200 = sext i32 %j.2 to i64
  %arrayidx201 = getelementptr inbounds double* %a, i64 %idxprom200
  %37 = load double* %arrayidx201, align 8
  %idxprom202 = sext i32 %stackVar1.0 to i64
  %arrayidx203 = getelementptr inbounds double* %a, i64 %idxprom202
  %38 = load double* %arrayidx203, align 8
  %add204 = fadd double %37, %38
  %add205 = add nsw i32 %j.2, 1
  %idxprom206 = sext i32 %add205 to i64
  %arrayidx207 = getelementptr inbounds double* %a, i64 %idxprom206
  %39 = load double* %arrayidx207, align 8
  %add208 = add nsw i32 %stackVar1.0, 1
  %idxprom209 = sext i32 %add208 to i64
  %arrayidx210 = getelementptr inbounds double* %a, i64 %idxprom209
  %40 = load double* %arrayidx210, align 8
  %add211 = fadd double %39, %40
  %idxprom212 = sext i32 %j.2 to i64
  %arrayidx213 = getelementptr inbounds double* %a, i64 %idxprom212
  %41 = load double* %arrayidx213, align 8
  %idxprom214 = sext i32 %stackVar1.0 to i64
  %arrayidx215 = getelementptr inbounds double* %a, i64 %idxprom214
  %42 = load double* %arrayidx215, align 8
  %sub216 = fsub double %41, %42
  %add217 = add nsw i32 %j.2, 1
  %idxprom218 = sext i32 %add217 to i64
  %arrayidx219 = getelementptr inbounds double* %a, i64 %idxprom218
  %43 = load double* %arrayidx219, align 8
  %add220 = add nsw i32 %stackVar1.0, 1
  %idxprom221 = sext i32 %add220 to i64
  %arrayidx222 = getelementptr inbounds double* %a, i64 %idxprom221
  %44 = load double* %arrayidx222, align 8
  %sub223 = fsub double %43, %44
  %idxprom224 = sext i32 %ni31 to i64
  %arrayidx225 = getelementptr inbounds double* %a, i64 %idxprom224
  %45 = load double* %arrayidx225, align 8
  %idxprom226 = sext i32 %ni48 to i64
  %arrayidx227 = getelementptr inbounds double* %a, i64 %idxprom226
  %46 = load double* %arrayidx227, align 8
  %add228 = fadd double %45, %46
  %add229 = add nsw i32 %ni31, 1
  %idxprom230 = sext i32 %add229 to i64
  %arrayidx231 = getelementptr inbounds double* %a, i64 %idxprom230
  %47 = load double* %arrayidx231, align 8
  %add232 = add nsw i32 %ni48, 1
  %idxprom233 = sext i32 %add232 to i64
  %arrayidx234 = getelementptr inbounds double* %a, i64 %idxprom233
  %48 = load double* %arrayidx234, align 8
  %add235 = fadd double %47, %48
  %idxprom236 = sext i32 %ni31 to i64
  %arrayidx237 = getelementptr inbounds double* %a, i64 %idxprom236
  %49 = load double* %arrayidx237, align 8
  %idxprom238 = sext i32 %ni48 to i64
  %arrayidx239 = getelementptr inbounds double* %a, i64 %idxprom238
  %50 = load double* %arrayidx239, align 8
  %sub240 = fsub double %49, %50
  %add241 = add nsw i32 %ni31, 1
  %idxprom242 = sext i32 %add241 to i64
  %arrayidx243 = getelementptr inbounds double* %a, i64 %idxprom242
  %51 = load double* %arrayidx243, align 8
  %add244 = add nsw i32 %ni48, 1
  %idxprom245 = sext i32 %add244 to i64
  %arrayidx246 = getelementptr inbounds double* %a, i64 %idxprom245
  %52 = load double* %arrayidx246, align 8
  %sub247 = fsub double %51, %52
  br label %for.body196.split.split.split.split.split

for.body196.split.split.split.split.split:        ; preds = %for.body196.split.split.split.split
  %ni87 = fadd double %add211, %add235
  br label %for.body196.split.split.split.split.split.split84

for.body196.split.split.split.split.split.split84: ; preds = %for.body196.split.split.split.split.split
  %ni67 = fadd double %add204, %add228
  br label %for.body196.split.split.split.split.split.split64

for.body196.split.split.split.split.split.split64: ; preds = %for.body196.split.split.split.split.split.split84
  %ni203 = fsub double %sub223, %sub240
  br label %for.body196.split.split.split.split.split.split64.split200

for.body196.split.split.split.split.split.split64.split200: ; preds = %for.body196.split.split.split.split.split.split64
  %ni183 = fadd double %sub216, %sub247
  br label %for.body196.split.split.split.split.split.split64.split180

for.body196.split.split.split.split.split.split64.split180: ; preds = %for.body196.split.split.split.split.split.split64.split200
  %ni162 = fadd double %sub223, %sub240
  br label %for.body196.split.split.split.split.split.split64.split159

for.body196.split.split.split.split.split.split64.split159: ; preds = %for.body196.split.split.split.split.split.split64.split180
  %ni141 = fsub double %sub216, %sub247
  br label %for.body196.split.split.split.split.split.split64.split138

for.body196.split.split.split.split.split.split64.split138: ; preds = %for.body196.split.split.split.split.split.split64.split159
  %ni124 = fsub double %add211, %add235
  br label %for.body196.split.split.split.split.split.split64.split121

for.body196.split.split.split.split.split.split64.split121: ; preds = %for.body196.split.split.split.split.split.split64.split138
  %ni106 = fsub double %add204, %add228
  br label %for.body196.split.split.split.split.split.split64.split

for.body196.split.split.split.split.split.split64.split: ; preds = %for.body196.split.split.split.split.split.split64.split121
  %idxprom249 = sext i32 %j.2 to i64
  %arrayidx250 = getelementptr inbounds double* %a, i64 %idxprom249
  store double %ni67, double* %arrayidx250, align 8
  %add252 = add nsw i32 %j.2, 1
  %idxprom253 = sext i32 %add252 to i64
  %arrayidx254 = getelementptr inbounds double* %a, i64 %idxprom253
  store double %ni87, double* %arrayidx254, align 8
  br label %for.body196.split.split.split.split.split.split

for.body196.split.split.split.split.split.split:  ; preds = %for.body196.split.split.split.split.split.split64.split
  br label %for.body196.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split
  %ni283 = fmul double %34, %ni106
  br label %for.body196.split.split.split.split.split.split.split.split280

for.body196.split.split.split.split.split.split.split.split280: ; preds = %for.body196.split.split.split.split.split.split.split
  %ni262 = fmul double %33, %ni106
  br label %for.body196.split.split.split.split.split.split.split.split259

for.body196.split.split.split.split.split.split.split.split259: ; preds = %for.body196.split.split.split.split.split.split.split.split280
  br label %for.body196.split.split.split.split.split.split.split.split259.split

for.body196.split.split.split.split.split.split.split.split259.split: ; preds = %for.body196.split.split.split.split.split.split.split.split259
  %ni277 = fmul double %33, %ni124
  br label %for.body196.split.split.split.split.split.split.split.split259.split.split274

for.body196.split.split.split.split.split.split.split.split259.split.split274: ; preds = %for.body196.split.split.split.split.split.split.split.split259.split
  %ni267 = fmul double %34, %ni124
  br label %for.body196.split.split.split.split.split.split.split.split259.split.split

for.body196.split.split.split.split.split.split.split.split259.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split259.split.split274
  %sub259 = fsub double %ni262, %ni267
  %idxprom260 = sext i32 %ni31 to i64
  %arrayidx261 = getelementptr inbounds double* %a, i64 %idxprom260
  store double %sub259, double* %arrayidx261, align 8
  %add264 = fadd double %ni277, %ni283
  %add265 = add nsw i32 %ni31, 1
  %idxprom266 = sext i32 %add265 to i64
  %arrayidx267 = getelementptr inbounds double* %a, i64 %idxprom266
  store double %add264, double* %arrayidx267, align 8
  br label %for.body196.split.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split259.split.split
  br label %for.body196.split.split.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split
  %ni327 = fmul double %36, %ni141
  br label %for.body196.split.split.split.split.split.split.split.split.split.split324

for.body196.split.split.split.split.split.split.split.split.split.split324: ; preds = %for.body196.split.split.split.split.split.split.split.split.split
  %ni316 = fmul double %35, %ni162
  br label %for.body196.split.split.split.split.split.split.split.split.split.split313

for.body196.split.split.split.split.split.split.split.split.split.split313: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split324
  %ni305 = fmul double %36, %ni162
  br label %for.body196.split.split.split.split.split.split.split.split.split.split302

for.body196.split.split.split.split.split.split.split.split.split.split302: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split313
  %ni294 = fmul double %35, %ni141
  br label %for.body196.split.split.split.split.split.split.split.split.split.split291

for.body196.split.split.split.split.split.split.split.split.split.split291: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split302
  %sub272 = fsub double %ni294, %ni305
  %idxprom273 = sext i32 %stackVar1.0 to i64
  %arrayidx274 = getelementptr inbounds double* %a, i64 %idxprom273
  store double %sub272, double* %arrayidx274, align 8
  %add277 = fadd double %ni316, %ni327
  %add278 = add nsw i32 %stackVar1.0, 1
  %idxprom279 = sext i32 %add278 to i64
  %arrayidx280 = getelementptr inbounds double* %a, i64 %idxprom279
  store double %add277, double* %arrayidx280, align 8
  br label %for.body196.split.split.split.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split291
  br label %for.body196.split.split.split.split.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split
  %ni369 = fmul double %sub192, %ni183
  br label %for.body196.split.split.split.split.split.split.split.split.split.split.split.split366

for.body196.split.split.split.split.split.split.split.split.split.split.split.split366: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split.split
  %ni358 = fmul double %sub189, %ni203
  br label %for.body196.split.split.split.split.split.split.split.split.split.split.split.split355

for.body196.split.split.split.split.split.split.split.split.split.split.split.split355: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split.split.split366
  %ni347 = fmul double %sub192, %ni203
  br label %for.body196.split.split.split.split.split.split.split.split.split.split.split.split344

for.body196.split.split.split.split.split.split.split.split.split.split.split.split344: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split.split.split355
  %ni336 = fmul double %sub189, %ni183
  br label %for.body196.split.split.split.split.split.split.split.split.split.split.split.split

for.body196.split.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split.split.split344
  %sub285 = fsub double %ni336, %ni347
  %idxprom286 = sext i32 %ni48 to i64
  %arrayidx287 = getelementptr inbounds double* %a, i64 %idxprom286
  store double %sub285, double* %arrayidx287, align 8
  %add290 = fadd double %ni358, %ni369
  %add291 = add nsw i32 %ni48, 1
  %idxprom292 = sext i32 %add291 to i64
  %arrayidx293 = getelementptr inbounds double* %a, i64 %idxprom292
  store double %add290, double* %arrayidx293, align 8
  br label %for.inc294

for.inc294:                                       ; preds = %for.body196.split.split.split.split.split.split.split.split.split.split.split.split
  %add295 = add nsw i32 %j.2, 2
  br label %for.inc294.split

for.inc294.split:                                 ; preds = %for.inc294
  %ni20 = add i32 %add295, %l
  br label %for.cond193

for.end296:                                       ; preds = %for.cond193
  %add297 = add nsw i32 %mul176, 2
  %idxprom298 = sext i32 %add297 to i64
  %arrayidx299 = getelementptr inbounds double* %w, i64 %idxprom298
  %53 = load double* %arrayidx299, align 8
  %add300 = add nsw i32 %mul176, 3
  %idxprom301 = sext i32 %add300 to i64
  %arrayidx302 = getelementptr inbounds double* %w, i64 %idxprom301
  %54 = load double* %arrayidx302, align 8
  %mul303 = fmul double 2.000000e+00, %33
  %mul304 = fmul double %mul303, %54
  %sub305 = fsub double %53, %mul304
  %mul306 = fmul double 2.000000e+00, %33
  %mul307 = fmul double %mul306, %53
  %sub308 = fsub double %mul307, %54
  br label %for.cond310

for.cond310:                                      ; preds = %for.inc414, %for.end296
  %j.3 = phi i32 [ %ni376, %for.end296 ], [ %add415, %for.inc414 ]
  %add312 = add nsw i32 %l, %ni376
  %cmp313 = icmp slt i32 %j.3, %add312
  br i1 %cmp313, label %for.body314, label %for.end416

for.body314:                                      ; preds = %for.cond310
  %ni17 = add i32 %j.3, %l
  br label %for.body314.split

for.body314.split:                                ; preds = %for.body314
  br label %for.body314.split.split

for.body314.split.split:                          ; preds = %for.body314.split
  %ni28 = add i32 %ni17, %l
  br label %for.body314.split.split.split

for.body314.split.split.split:                    ; preds = %for.body314.split.split
  br label %for.body314.split.split.split.split

for.body314.split.split.split.split:              ; preds = %for.body314.split.split.split
  %ni45 = add i32 %ni28, %l
  br label %for.body314.split.split.split.split.split

for.body314.split.split.split.split.split:        ; preds = %for.body314.split.split.split.split
  %idxprom318 = sext i32 %j.3 to i64
  %arrayidx319 = getelementptr inbounds double* %a, i64 %idxprom318
  %55 = load double* %arrayidx319, align 8
  %idxprom320 = sext i32 %ni17 to i64
  %arrayidx321 = getelementptr inbounds double* %a, i64 %idxprom320
  %56 = load double* %arrayidx321, align 8
  %add322 = fadd double %55, %56
  %add323 = add nsw i32 %j.3, 1
  %idxprom324 = sext i32 %add323 to i64
  %arrayidx325 = getelementptr inbounds double* %a, i64 %idxprom324
  %57 = load double* %arrayidx325, align 8
  %add326 = add nsw i32 %ni17, 1
  %idxprom327 = sext i32 %add326 to i64
  %arrayidx328 = getelementptr inbounds double* %a, i64 %idxprom327
  %58 = load double* %arrayidx328, align 8
  %add329 = fadd double %57, %58
  %idxprom330 = sext i32 %j.3 to i64
  %arrayidx331 = getelementptr inbounds double* %a, i64 %idxprom330
  %59 = load double* %arrayidx331, align 8
  %idxprom332 = sext i32 %ni17 to i64
  %arrayidx333 = getelementptr inbounds double* %a, i64 %idxprom332
  %60 = load double* %arrayidx333, align 8
  %sub334 = fsub double %59, %60
  %add335 = add nsw i32 %j.3, 1
  %idxprom336 = sext i32 %add335 to i64
  %arrayidx337 = getelementptr inbounds double* %a, i64 %idxprom336
  %61 = load double* %arrayidx337, align 8
  %add338 = add nsw i32 %ni17, 1
  %idxprom339 = sext i32 %add338 to i64
  %arrayidx340 = getelementptr inbounds double* %a, i64 %idxprom339
  %62 = load double* %arrayidx340, align 8
  %sub341 = fsub double %61, %62
  %idxprom342 = sext i32 %ni28 to i64
  %arrayidx343 = getelementptr inbounds double* %a, i64 %idxprom342
  %63 = load double* %arrayidx343, align 8
  %idxprom344 = sext i32 %ni45 to i64
  %arrayidx345 = getelementptr inbounds double* %a, i64 %idxprom344
  %64 = load double* %arrayidx345, align 8
  %add346 = fadd double %63, %64
  %add347 = add nsw i32 %ni28, 1
  %idxprom348 = sext i32 %add347 to i64
  %arrayidx349 = getelementptr inbounds double* %a, i64 %idxprom348
  %65 = load double* %arrayidx349, align 8
  %add350 = add nsw i32 %ni45, 1
  %idxprom351 = sext i32 %add350 to i64
  %arrayidx352 = getelementptr inbounds double* %a, i64 %idxprom351
  %66 = load double* %arrayidx352, align 8
  %add353 = fadd double %65, %66
  %idxprom354 = sext i32 %ni28 to i64
  %arrayidx355 = getelementptr inbounds double* %a, i64 %idxprom354
  %67 = load double* %arrayidx355, align 8
  %idxprom356 = sext i32 %ni45 to i64
  %arrayidx357 = getelementptr inbounds double* %a, i64 %idxprom356
  %68 = load double* %arrayidx357, align 8
  %sub358 = fsub double %67, %68
  %add359 = add nsw i32 %ni28, 1
  %idxprom360 = sext i32 %add359 to i64
  %arrayidx361 = getelementptr inbounds double* %a, i64 %idxprom360
  %69 = load double* %arrayidx361, align 8
  %add362 = add nsw i32 %ni45, 1
  %idxprom363 = sext i32 %add362 to i64
  %arrayidx364 = getelementptr inbounds double* %a, i64 %idxprom363
  %70 = load double* %arrayidx364, align 8
  %sub365 = fsub double %69, %70
  br label %for.body314.split.split.split.split.split.split

for.body314.split.split.split.split.split.split:  ; preds = %for.body314.split.split.split.split.split
  %ni83 = fadd double %add329, %add353
  br label %for.body314.split.split.split.split.split.split.split80

for.body314.split.split.split.split.split.split.split80: ; preds = %for.body314.split.split.split.split.split.split
  %ni63 = fadd double %add322, %add346
  br label %for.body314.split.split.split.split.split.split.split60

for.body314.split.split.split.split.split.split.split60: ; preds = %for.body314.split.split.split.split.split.split.split80
  %ni199 = fsub double %sub341, %sub358
  br label %for.body314.split.split.split.split.split.split.split60.split196

for.body314.split.split.split.split.split.split.split60.split196: ; preds = %for.body314.split.split.split.split.split.split.split60
  %ni179 = fadd double %sub334, %sub365
  br label %for.body314.split.split.split.split.split.split.split60.split176

for.body314.split.split.split.split.split.split.split60.split176: ; preds = %for.body314.split.split.split.split.split.split.split60.split196
  %ni158 = fadd double %sub341, %sub358
  br label %for.body314.split.split.split.split.split.split.split60.split155

for.body314.split.split.split.split.split.split.split60.split155: ; preds = %for.body314.split.split.split.split.split.split.split60.split176
  %ni137 = fsub double %sub334, %sub365
  br label %for.body314.split.split.split.split.split.split.split60.split134

for.body314.split.split.split.split.split.split.split60.split134: ; preds = %for.body314.split.split.split.split.split.split.split60.split155
  %ni120 = fsub double %add329, %add353
  br label %for.body314.split.split.split.split.split.split.split60.split117

for.body314.split.split.split.split.split.split.split60.split117: ; preds = %for.body314.split.split.split.split.split.split.split60.split134
  %ni103 = fsub double %add322, %add346
  br label %for.body314.split.split.split.split.split.split.split60.split

for.body314.split.split.split.split.split.split.split60.split: ; preds = %for.body314.split.split.split.split.split.split.split60.split117
  %idxprom367 = sext i32 %j.3 to i64
  %arrayidx368 = getelementptr inbounds double* %a, i64 %idxprom367
  store double %ni63, double* %arrayidx368, align 8
  %add370 = add nsw i32 %j.3, 1
  %idxprom371 = sext i32 %add370 to i64
  %arrayidx372 = getelementptr inbounds double* %a, i64 %idxprom371
  store double %ni83, double* %arrayidx372, align 8
  br label %for.body314.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split60.split
  br label %for.body314.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split
  %ni258 = fmul double %33, %ni103
  br label %for.body314.split.split.split.split.split.split.split.split.split255

for.body314.split.split.split.split.split.split.split.split.split255: ; preds = %for.body314.split.split.split.split.split.split.split.split
  %sub375 = fsub double -0.000000e+00, %34
  %mul376 = fmul double %sub375, %ni103
  br label %for.body314.split.split.split.split.split.split.split.split.split255.split

for.body314.split.split.split.split.split.split.split.split.split255.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split255
  %ni273 = fmul double %33, %ni120
  br label %for.body314.split.split.split.split.split.split.split.split.split255.split.split

for.body314.split.split.split.split.split.split.split.split.split255.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split255.split
  %sub378 = fsub double %mul376, %ni273
  %idxprom379 = sext i32 %ni28 to i64
  %arrayidx380 = getelementptr inbounds double* %a, i64 %idxprom379
  store double %sub378, double* %arrayidx380, align 8
  %sub381 = fsub double -0.000000e+00, %34
  %mul382 = fmul double %sub381, %ni120
  %add384 = fadd double %mul382, %ni258
  %add385 = add nsw i32 %ni28, 1
  %idxprom386 = sext i32 %add385 to i64
  %arrayidx387 = getelementptr inbounds double* %a, i64 %idxprom386
  store double %add384, double* %arrayidx387, align 8
  br label %for.body314.split.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split255.split.split
  br label %for.body314.split.split.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split
  %ni323 = fmul double %54, %ni137
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split320

for.body314.split.split.split.split.split.split.split.split.split.split.split320: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split
  %ni312 = fmul double %53, %ni158
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split309

for.body314.split.split.split.split.split.split.split.split.split.split.split309: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split320
  %ni301 = fmul double %54, %ni158
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split298

for.body314.split.split.split.split.split.split.split.split.split.split.split298: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split309
  %ni290 = fmul double %53, %ni137
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split287

for.body314.split.split.split.split.split.split.split.split.split.split.split287: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split298
  %sub392 = fsub double %ni290, %ni301
  %idxprom393 = sext i32 %ni17 to i64
  %arrayidx394 = getelementptr inbounds double* %a, i64 %idxprom393
  store double %sub392, double* %arrayidx394, align 8
  %add397 = fadd double %ni312, %ni323
  %add398 = add nsw i32 %ni17, 1
  %idxprom399 = sext i32 %add398 to i64
  %arrayidx400 = getelementptr inbounds double* %a, i64 %idxprom399
  store double %add397, double* %arrayidx400, align 8
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split287
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split
  %ni365 = fmul double %sub308, %ni179
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split362

for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split362: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split.split
  %ni354 = fmul double %sub305, %ni199
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split351

for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split351: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split362
  %ni343 = fmul double %sub308, %ni199
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split340

for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split340: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split351
  %ni333 = fmul double %sub305, %ni179
  br label %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split

for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split: ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split340
  %sub405 = fsub double %ni333, %ni343
  %idxprom406 = sext i32 %ni45 to i64
  %arrayidx407 = getelementptr inbounds double* %a, i64 %idxprom406
  store double %sub405, double* %arrayidx407, align 8
  %add410 = fadd double %ni354, %ni365
  %add411 = add nsw i32 %ni45, 1
  %idxprom412 = sext i32 %add411 to i64
  %arrayidx413 = getelementptr inbounds double* %a, i64 %idxprom412
  store double %add410, double* %arrayidx413, align 8
  br label %for.inc414

for.inc414:                                       ; preds = %for.body314.split.split.split.split.split.split.split.split.split.split.split.split.split
  %add415 = add nsw i32 %j.3, 2
  br label %for.cond310

for.end416:                                       ; preds = %for.cond310
  br label %for.inc417

for.inc417:                                       ; preds = %for.end416
  br label %for.inc417.split

for.inc417.split:                                 ; preds = %for.inc417
  br label %for.cond172

for.end419:                                       ; preds = %for.cond172
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn nounwind }
