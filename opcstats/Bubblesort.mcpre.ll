; ModuleID = 'Bubblesort.mcpre.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8
  %mul = mul nsw i64 %0, 1309
  %add = add nsw i64 %mul, 13849
  %and = and i64 %add, 65535
  store i64 %and, i64* @seed, align 8
  %1 = load i64* @seed, align 8
  %conv = trunc i64 %1 to i32
  ret i32 %conv
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
entry:
  call void @Initrand()
  store i32 0, i32* @biggest, align 4
  store i32 0, i32* @littlest, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %cmp = icmp sle i32 %i.0, 500
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @Rand()
  %conv = sext i32 %call to i64
  %div = sdiv i64 %conv, 100000
  %mul = mul nsw i64 %div, 100000
  %sub = sub nsw i64 %conv, %mul
  %sub1 = sub nsw i64 %sub, 50000
  %conv2 = trunc i64 %sub1 to i32
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom
  store i32 %conv2, i32* %arrayidx, align 4
  %idxprom3 = sext i32 %i.0 to i64
  %arrayidx4 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom3
  %0 = load i32* %arrayidx4, align 4
  %1 = load i32* @biggest, align 4
  %cmp5 = icmp sgt i32 %0, %1
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %idxprom7 = sext i32 %i.0 to i64
  %arrayidx8 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom7
  %2 = load i32* %arrayidx8, align 4
  store i32 %2, i32* @biggest, align 4
  br label %if.end16

if.else:                                          ; preds = %for.body
  %idxprom9 = sext i32 %i.0 to i64
  %arrayidx10 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom9
  %3 = load i32* %arrayidx10, align 4
  %4 = load i32* @littlest, align 4
  %cmp11 = icmp slt i32 %3, %4
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.else
  %idxprom14 = sext i32 %i.0 to i64
  %arrayidx15 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom14
  %5 = load i32* %arrayidx15, align 4
  store i32 %5, i32* @littlest, align 4
  br label %if.end

if.end:                                           ; preds = %if.then13, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
entry:
  call void @bInitarr()
  store i32 500, i32* @top, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32* @top, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %while.body, label %while.end18

while.body:                                       ; preds = %while.cond
  br label %while.cond1

while.cond1:                                      ; preds = %if.end, %while.body
  %i.0 = phi i32 [ 1, %while.body ], [ %add17, %if.end ]
  %1 = load i32* @top, align 4
  %cmp2 = icmp slt i32 %i.0, %1
  br i1 %cmp2, label %while.body3, label %while.end

while.body3:                                      ; preds = %while.cond1
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  %add = add nsw i32 %i.0, 1
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom4
  %3 = load i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %2, %3
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body3
  %idxprom7 = sext i32 %i.0 to i64
  %arrayidx8 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom7
  %4 = load i32* %arrayidx8, align 4
  %add9 = add nsw i32 %i.0, 1
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom10
  %5 = load i32* %arrayidx11, align 4
  %idxprom12 = sext i32 %i.0 to i64
  %arrayidx13 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom12
  store i32 %5, i32* %arrayidx13, align 4
  %add14 = add nsw i32 %i.0, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom15
  store i32 %4, i32* %arrayidx16, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body3
  %add17 = add nsw i32 %i.0, 1
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  %6 = load i32* @top, align 4
  %sub = sub nsw i32 %6, 1
  store i32 %sub, i32* @top, align 4
  br label %while.cond

while.end18:                                      ; preds = %while.cond
  %7 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 1), align 4
  %8 = load i32* @littlest, align 4
  %cmp19 = icmp ne i32 %7, %8
  br i1 %cmp19, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end18
  %9 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 500), align 4
  %10 = load i32* @biggest, align 4
  %cmp20 = icmp ne i32 %9, %10
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %lor.lhs.false, %while.end18
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %lor.lhs.false
  %add23 = add nsw i32 %run, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %idxprom24
  %11 = load i32* %arrayidx25, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %11)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @Bubble(i32 %i.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
