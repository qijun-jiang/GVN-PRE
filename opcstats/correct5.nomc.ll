; ModuleID = 'correct5.nomc.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [100 x i32] zeroinitializer, align 16
@b = common global [100 x i32] zeroinitializer, align 16
@c = common global [100 x i32] zeroinitializer, align 16
@d = common global [100 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [12 x i8] c"%d, %d, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [100 x i32]* @a, i32 0, i64 %idxprom
  store i32 %i.0, i32* %arrayidx, align 4
  %idxprom1 = sext i32 %i.0 to i64
  %arrayidx2 = getelementptr inbounds [100 x i32]* @b, i32 0, i64 %idxprom1
  store i32 1, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc26, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc27, %for.inc26 ]
  %cmp4 = icmp slt i32 %i.1, 100
  br i1 %cmp4, label %for.body5, label %for.end28

for.body5:                                        ; preds = %for.cond3
  %idxprom6 = sext i32 %i.1 to i64
  %arrayidx7 = getelementptr inbounds [100 x i32]* @a, i32 0, i64 %idxprom6
  %0 = load i32* %arrayidx7, align 4
  %cmp8 = icmp sgt i32 %0, 95
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  %add = add nsw i32 %i.1, 1
  %idxprom9 = sext i32 %add to i64
  %arrayidx10 = getelementptr inbounds [100 x i32]* @a, i32 0, i64 %idxprom9
  store i32 1, i32* %arrayidx10, align 4
  %add11 = add nsw i32 %i.1, 1
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [100 x i32]* @b, i32 0, i64 %idxprom12
  store i32 0, i32* %arrayidx13, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body5
  %1 = load i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 97), align 4
  %mul = mul nsw i32 %1, 2
  %2 = load i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 98), align 4
  %mul14 = mul nsw i32 %2, 3
  %add15 = add nsw i32 %mul, %mul14
  %3 = load i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 99), align 4
  %mul16 = mul nsw i32 %3, 4
  %add17 = add nsw i32 %add15, %mul16
  %add18 = add nsw i32 %add17, 10
  %idxprom19 = sext i32 %i.1 to i64
  %arrayidx20 = getelementptr inbounds [100 x i32]* @c, i32 0, i64 %idxprom19
  store i32 %add18, i32* %arrayidx20, align 4
  %4 = load i32* getelementptr inbounds ([100 x i32]* @b, i32 0, i64 97), align 4
  %mul21 = mul nsw i32 %4, 2
  %5 = load i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 99), align 4
  %mul22 = mul nsw i32 %5, 3
  %add23 = add nsw i32 %mul21, %mul22
  %idxprom24 = sext i32 %i.1 to i64
  %arrayidx25 = getelementptr inbounds [100 x i32]* @d, i32 0, i64 %idxprom24
  store i32 %add23, i32* %arrayidx25, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %if.end
  %inc27 = add nsw i32 %i.1, 1
  br label %for.cond3

for.end28:                                        ; preds = %for.cond3
  %6 = load i32* getelementptr inbounds ([100 x i32]* @c, i32 0, i64 97), align 4
  %7 = load i32* getelementptr inbounds ([100 x i32]* @c, i32 0, i64 98), align 4
  %8 = load i32* getelementptr inbounds ([100 x i32]* @c, i32 0, i64 99), align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %7, i32 %8)
  %9 = load i32* getelementptr inbounds ([100 x i32]* @d, i32 0, i64 97), align 4
  %10 = load i32* getelementptr inbounds ([100 x i32]* @d, i32 0, i64 98), align 4
  %11 = load i32* getelementptr inbounds ([100 x i32]* @d, i32 0, i64 99), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %9, i32 %10, i32 %11)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
