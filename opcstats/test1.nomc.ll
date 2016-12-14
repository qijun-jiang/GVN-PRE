; ModuleID = 'test1.nomc.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %call = call i64 @clock() #3
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %entry
  %a.0 = phi i64 [ 23423234342342, %entry ], [ %a.1, %for.inc29 ]
  %out.0 = phi i32 [ 0, %entry ], [ %inc30, %for.inc29 ]
  %cmp = icmp slt i32 %out.0, 30000000
  br i1 %cmp, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %a.1 = phi i64 [ %a.0, %for.body ], [ %a.3, %for.inc ]
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %i.0, 12
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %rem = srem i32 %i.0, 3
  %cmp4 = icmp eq i32 %rem, 0
  br i1 %cmp4, label %if.then, label %if.else7

if.then:                                          ; preds = %for.body3
  %rem5 = srem i32 %i.0, 2
  %tobool = icmp ne i32 %rem5, 0
  br i1 %tobool, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %sub = sub nsw i64 %a.1, 1
  br label %if.end

if.else:                                          ; preds = %if.then
  %add = add nsw i64 %a.1, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  %a.2 = phi i64 [ %sub, %if.then6 ], [ %add, %if.else ]
  br label %if.end9

if.else7:                                         ; preds = %for.body3
  %add8 = add nsw i64 %a.1, 4234234234234234
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.end
  %a.3 = phi i64 [ %a.2, %if.end ], [ %a.1, %if.else7 ]
  %rem10 = srem i32 %i.0, 2
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.else18

if.then12:                                        ; preds = %if.end9
  %div = sdiv i32 %i.0, 2
  %rem13 = srem i32 %div, 3
  %cmp14 = icmp eq i32 %rem13, 0
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.then12
  %add16 = add nsw i64 %a.3, 4234234234234234
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.then12
  br label %if.end28

if.else18:                                        ; preds = %if.end9
  %sub20 = sub nsw i32 %i.0, 1
  %div21 = sdiv i32 %sub20, 2
  %rem22 = srem i32 %div21, 3
  %cmp23 = icmp ne i32 %rem22, 0
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else18
  %add25 = add nsw i64 %a.3, 4234234234234234
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else18
  %add27 = add nsw i64 %a.3, 4234234234234234
  br label %if.end28

if.end28:                                         ; preds = %if.end26, %if.end17
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %inc = add nsw i32 %i.0, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc29

for.inc29:                                        ; preds = %for.end
  %inc30 = add nsw i32 %out.0, 1
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  %call32 = call i64 @clock() #3
  %sub33 = sub nsw i64 %call32, %call
  %conv = sitofp i64 %sub33 to double
  %div34 = fdiv double %conv, 1.000000e+06
  %mul = fmul double %div34, 1.000000e+03
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %mul)
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @clock() #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
