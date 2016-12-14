; ModuleID = 'test_nb.slicm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rusage = type { %struct.timeval, %struct.timeval, %union.anon, %union.anon.0, %union.anon.1, %union.anon.2, %union.anon.3, %union.anon.4, %union.anon.5, %union.anon.6, %union.anon.7, %union.anon.8, %union.anon.9, %union.anon.10, %union.anon.11, %union.anon.12 }
%struct.timeval = type { i64, i64 }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%union.anon.1 = type { i64 }
%union.anon.2 = type { i64 }
%union.anon.3 = type { i64 }
%union.anon.4 = type { i64 }
%union.anon.5 = type { i64 }
%union.anon.6 = type { i64 }
%union.anon.7 = type { i64 }
%union.anon.8 = type { i64 }
%union.anon.9 = type { i64 }
%union.anon.10 = type { i64 }
%union.anon.11 = type { i64 }
%union.anon.12 = type { i64 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %stop = alloca %struct.rusage, align 8
  %start = alloca %struct.rusage, align 8
  %call = call i32 @getrusage(i32 0, %struct.rusage* %start) #3
  br label %for.cond

for.cond:                                         ; preds = %for.inc72, %entry
  %c.0 = phi i64 [ undef, %entry ], [ %c.1, %for.inc72 ]
  %ans.0 = phi i64 [ 0, %entry ], [ %ans.1, %for.inc72 ]
  %a.0 = phi i64 [ 23423234342342, %entry ], [ %a.1, %for.inc72 ]
  %out.0 = phi i32 [ 0, %entry ], [ %inc73, %for.inc72 ]
  %cmp = icmp slt i32 %out.0, 30000
  br i1 %cmp, label %for.body, label %for.end74

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %c.1 = phi i64 [ %c.0, %for.body ], [ %c.13, %for.inc ]
  %ans.1 = phi i64 [ %ans.0, %for.body ], [ %add71, %for.inc ]
  %a.1 = phi i64 [ %a.0, %for.body ], [ %a.3, %for.inc ]
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %i.0, 12
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %rem = srem i32 %i.0, 3
  %cmp4 = icmp eq i32 %rem, 0
  br i1 %cmp4, label %if.then, label %if.else8

if.then:                                          ; preds = %for.body3
  %rem5 = srem i32 %i.0, 2
  %tobool = icmp ne i32 %rem5, 0
  br i1 %tobool, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %add = add nsw i64 %a.1, 1
  br label %if.then6.split

if.then6.split:                                   ; preds = %if.then6
  %ni18 = add i64 %add, 4234234234234234
  br label %if.end

if.else:                                          ; preds = %if.then
  %add7 = add nsw i64 %a.1, 2
  br label %if.else.split

if.else.split:                                    ; preds = %if.else
  %ni15 = add i64 %add7, 4234234234234234
  br label %if.end

if.end:                                           ; preds = %if.else.split, %if.then6.split
  %a.2 = phi i64 [ %add, %if.then6.split ], [ %add7, %if.else.split ]
  %stackVar.0 = phi i64 [ %ni18, %if.then6.split ], [ %ni15, %if.else.split ]
  br label %if.end48

if.else8:                                         ; preds = %for.body3
  %ni = add i64 %a.1, 4234234234234234
  br label %if.else8.split

if.else8.split:                                   ; preds = %if.else8
  %rem10 = srem i32 %i.0, 5
  %cmp11 = icmp ne i32 %rem10, 0
  %conv = zext i1 %cmp11 to i32
  %tobool12 = icmp ne i32 %conv, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.else8.split
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.else8.split
  %tobool16 = icmp ne i32 %conv, 0
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end15
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end15
  %tobool20 = icmp ne i32 %conv, 0
  br i1 %tobool20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end19
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end19
  %tobool24 = icmp ne i32 %conv, 0
  br i1 %tobool24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end23
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.end23
  %tobool28 = icmp ne i32 %conv, 0
  br i1 %tobool28, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end27
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end27
  %tobool32 = icmp ne i32 %conv, 0
  br i1 %tobool32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end31
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end31
  %tobool36 = icmp ne i32 %conv, 0
  br i1 %tobool36, label %if.then37, label %if.end39

if.then37:                                        ; preds = %if.end35
  br label %if.end39

if.end39:                                         ; preds = %if.then37, %if.end35
  %tobool40 = icmp ne i32 %conv, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end39
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end39
  %tobool44 = icmp ne i32 %conv, 0
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end43
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end43
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end
  %c.11 = phi i64 [ %c.1, %if.end ], [ %ni, %if.end47 ]
  %a.3 = phi i64 [ %a.2, %if.end ], [ %a.1, %if.end47 ]
  %stackVar.1 = phi i64 [ %stackVar.0, %if.end ], [ %ni, %if.end47 ]
  %rem49 = srem i32 %i.0, 2
  %cmp50 = icmp eq i32 %rem49, 0
  br i1 %cmp50, label %if.then52, label %if.else59

if.then52:                                        ; preds = %if.end48
  %div = sdiv i32 %i.0, 2
  %rem53 = srem i32 %div, 3
  %cmp54 = icmp eq i32 %rem53, 0
  br i1 %cmp54, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.then52
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %if.then52
  %c.12 = phi i64 [ %stackVar.1, %if.then56 ], [ %c.11, %if.then52 ]
  br label %if.end69

if.else59:                                        ; preds = %if.end48
  %sub = sub nsw i32 %i.0, 1
  %div61 = sdiv i32 %sub, 2
  %rem62 = srem i32 %div61, 3
  %cmp63 = icmp ne i32 %rem62, 0
  br i1 %cmp63, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.else59
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.else59
  br label %if.end69

if.end69:                                         ; preds = %if.end67, %if.end58
  %c.13 = phi i64 [ %c.12, %if.end58 ], [ %stackVar.1, %if.end67 ]
  %rem70 = srem i64 %c.13, 97
  %add71 = add nsw i64 %ans.1, %rem70
  br label %for.inc

for.inc:                                          ; preds = %if.end69
  %inc = add nsw i32 %i.0, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc72

for.inc72:                                        ; preds = %for.end
  %inc73 = add nsw i32 %out.0, 1
  br label %for.cond

for.end74:                                        ; preds = %for.cond
  %call75 = call i32 @getrusage(i32 0, %struct.rusage* %stop) #3
  %ru_utime = getelementptr inbounds %struct.rusage* %start, i32 0, i32 0
  %tv_sec = getelementptr inbounds %struct.timeval* %ru_utime, i32 0, i32 0
  %0 = load i64* %tv_sec, align 8
  %mul = mul nsw i64 %0, 1000000
  %ru_utime76 = getelementptr inbounds %struct.rusage* %start, i32 0, i32 0
  %tv_usec = getelementptr inbounds %struct.timeval* %ru_utime76, i32 0, i32 1
  %1 = load i64* %tv_usec, align 8
  %add77 = add nsw i64 %mul, %1
  %conv78 = sitofp i64 %add77 to double
  %ru_utime79 = getelementptr inbounds %struct.rusage* %stop, i32 0, i32 0
  %tv_sec80 = getelementptr inbounds %struct.timeval* %ru_utime79, i32 0, i32 0
  %2 = load i64* %tv_sec80, align 8
  %mul81 = mul nsw i64 %2, 1000000
  %ru_utime82 = getelementptr inbounds %struct.rusage* %stop, i32 0, i32 0
  %tv_usec83 = getelementptr inbounds %struct.timeval* %ru_utime82, i32 0, i32 1
  %3 = load i64* %tv_usec83, align 8
  %add84 = add nsw i64 %mul81, %3
  %conv85 = sitofp i64 %add84 to double
  br label %for.end74.split

for.end74.split:                                  ; preds = %for.end74
  %ni23 = fsub double %conv85, %conv78
  br label %for.end74.split.split

for.end74.split.split:                            ; preds = %for.end74.split
  %conv87 = fptosi double %ni23 to i32
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv87)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @getrusage(i32, %struct.rusage*) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
