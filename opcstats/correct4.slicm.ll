; ModuleID = 'correct4.slicm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [100 x i32] zeroinitializer, align 16
@b = common global [100 x i32] zeroinitializer, align 16
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
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ]
  %cmp2 = icmp slt i32 %i.1, 100
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64
  %arrayidx5 = getelementptr inbounds [100 x i32]* @a, i32 0, i64 %idxprom4
  %0 = load i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %0, 95
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %add = add nsw i32 %i.1, 1
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds [100 x i32]* @a, i32 0, i64 %idxprom7
  store i32 1, i32* %arrayidx8, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  %1 = load i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 97), align 4
  %add9 = add nsw i32 %1, 5
  %mul = mul nsw i32 %add9, 3
  %idxprom10 = sext i32 %i.1 to i64
  %arrayidx11 = getelementptr inbounds [100 x i32]* @b, i32 0, i64 %idxprom10
  store i32 %mul, i32* %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %inc13 = add nsw i32 %i.1, 1
  br label %for.cond1

for.end14:                                        ; preds = %for.cond1
  %2 = load i32* getelementptr inbounds ([100 x i32]* @b, i32 0, i64 97), align 4
  %3 = load i32* getelementptr inbounds ([100 x i32]* @b, i32 0, i64 98), align 4
  %4 = load i32* getelementptr inbounds ([100 x i32]* @b, i32 0, i64 99), align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %3, i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
