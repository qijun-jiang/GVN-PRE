; ModuleID = 'max-flow.slicm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@tail = common global i32 0, align 4
@q = common global [1002 x i32] zeroinitializer, align 16
@color = common global [1000 x i32] zeroinitializer, align 16
@head = common global i32 0, align 4
@n = common global i32 0, align 4
@pred = common global [1000 x i32] zeroinitializer, align 16
@capacity = common global [1000 x [1000 x i32]] zeroinitializer, align 16
@flow = common global [1000 x [1000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"a.in\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@e = common global i32 0, align 4
@.str3 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @min(i32 %x, i32 %y) #0 {
entry:
  %cmp = icmp slt i32 %x, %y
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %x, %cond.true ], [ %y, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nounwind uwtable
define void @enqueue(i32 %x) #0 {
entry:
  %0 = load i32* @tail, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1002 x i32]* @q, i32 0, i64 %idxprom
  store i32 %x, i32* %arrayidx, align 4
  %1 = load i32* @tail, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @tail, align 4
  %idxprom1 = sext i32 %x to i64
  %arrayidx2 = getelementptr inbounds [1000 x i32]* @color, i32 0, i64 %idxprom1
  store i32 1, i32* %arrayidx2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @dequeue() #0 {
entry:
  %0 = load i32* @head, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1002 x i32]* @q, i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  %2 = load i32* @head, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @head, align 4
  %idxprom1 = sext i32 %1 to i64
  %arrayidx2 = getelementptr inbounds [1000 x i32]* @color, i32 0, i64 %idxprom1
  store i32 2, i32* %arrayidx2, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @bfs(i32 %start, i32 %target) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %u.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %0 = load i32* @n, align 4
  %cmp = icmp slt i32 %u.0, %0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %u.0 to i64
  %arrayidx = getelementptr inbounds [1000 x i32]* @color, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %u.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @tail, align 4
  store i32 0, i32* @head, align 4
  call void @enqueue(i32 %start)
  %idxprom1 = sext i32 %start to i64
  %arrayidx2 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom1
  store i32 -1, i32* %arrayidx2, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end23, %for.end
  %1 = load i32* @head, align 4
  %2 = load i32* @tail, align 4
  %cmp3 = icmp ne i32 %1, %2
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @dequeue()
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc21, %while.body
  %v.0 = phi i32 [ 0, %while.body ], [ %inc22, %for.inc21 ]
  %3 = load i32* @n, align 4
  %cmp5 = icmp slt i32 %v.0, %3
  br i1 %cmp5, label %for.body6, label %for.end23

for.body6:                                        ; preds = %for.cond4
  %idxprom7 = sext i32 %v.0 to i64
  %arrayidx8 = getelementptr inbounds [1000 x i32]* @color, i32 0, i64 %idxprom7
  %4 = load i32* %arrayidx8, align 4
  %cmp9 = icmp eq i32 %4, 0
  br i1 %cmp9, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body6
  %idxprom10 = sext i32 %v.0 to i64
  %idxprom11 = sext i32 %call to i64
  %arrayidx12 = getelementptr inbounds [1000 x [1000 x i32]]* @capacity, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [1000 x i32]* %arrayidx12, i32 0, i64 %idxprom10
  %5 = load i32* %arrayidx13, align 4
  %idxprom14 = sext i32 %v.0 to i64
  %idxprom15 = sext i32 %call to i64
  %arrayidx16 = getelementptr inbounds [1000 x [1000 x i32]]* @flow, i32 0, i64 %idxprom15
  %arrayidx17 = getelementptr inbounds [1000 x i32]* %arrayidx16, i32 0, i64 %idxprom14
  %6 = load i32* %arrayidx17, align 4
  %sub = sub nsw i32 %5, %6
  %cmp18 = icmp sgt i32 %sub, 0
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @enqueue(i32 %v.0)
  %idxprom19 = sext i32 %v.0 to i64
  %arrayidx20 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom19
  store i32 %call, i32* %arrayidx20, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body6
  br label %for.inc21

for.inc21:                                        ; preds = %if.end
  %inc22 = add nsw i32 %v.0, 1
  br label %for.cond4

for.end23:                                        ; preds = %for.cond4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %idxprom24 = sext i32 %target to i64
  %arrayidx25 = getelementptr inbounds [1000 x i32]* @color, i32 0, i64 %idxprom24
  %7 = load i32* %arrayidx25, align 4
  %cmp26 = icmp eq i32 %7, 2
  %conv = zext i1 %cmp26 to i32
  ret i32 %conv
}

; Function Attrs: nounwind uwtable
define i32 @max_flow(i32 %source, i32 %sink) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc6 ]
  %0 = load i32* @n, align 4
  %cmp = icmp slt i32 %i.0, %0
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %1 = load i32* @n, align 4
  %cmp2 = icmp slt i32 %j.0, %1
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %idxprom = sext i32 %j.0 to i64
  %idxprom4 = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [1000 x [1000 x i32]]* @flow, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1000 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nsw i32 %i.0, 1
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %for.end54.split, %for.end8
  %max_flow.0 = phi i32 [ 0, %for.end8 ], [ %ni, %for.end54.split ]
  %call = call i32 @bfs(i32 %source, i32 %sink)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* @n, align 4
  %sub = sub nsw i32 %2, 1
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc28, %while.body
  %u.0 = phi i32 [ %sub, %while.body ], [ %8, %for.inc28 ]
  %increment.0 = phi i32 [ 1000000000, %while.body ], [ %call27, %for.inc28 ]
  %idxprom10 = sext i32 %u.0 to i64
  %arrayidx11 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom10
  %3 = load i32* %arrayidx11, align 4
  %cmp12 = icmp sge i32 %3, 0
  br i1 %cmp12, label %for.body13, label %for.end31

for.body13:                                       ; preds = %for.cond9
  %idxprom14 = sext i32 %u.0 to i64
  %idxprom15 = sext i32 %u.0 to i64
  %arrayidx16 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom15
  %4 = load i32* %arrayidx16, align 4
  %idxprom17 = sext i32 %4 to i64
  %arrayidx18 = getelementptr inbounds [1000 x [1000 x i32]]* @capacity, i32 0, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [1000 x i32]* %arrayidx18, i32 0, i64 %idxprom14
  %5 = load i32* %arrayidx19, align 4
  %idxprom20 = sext i32 %u.0 to i64
  %idxprom21 = sext i32 %u.0 to i64
  %arrayidx22 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom21
  %6 = load i32* %arrayidx22, align 4
  %idxprom23 = sext i32 %6 to i64
  %arrayidx24 = getelementptr inbounds [1000 x [1000 x i32]]* @flow, i32 0, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [1000 x i32]* %arrayidx24, i32 0, i64 %idxprom20
  %7 = load i32* %arrayidx25, align 4
  %sub26 = sub nsw i32 %5, %7
  %call27 = call i32 @min(i32 %increment.0, i32 %sub26)
  br label %for.inc28

for.inc28:                                        ; preds = %for.body13
  %idxprom29 = sext i32 %u.0 to i64
  %arrayidx30 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom29
  %8 = load i32* %arrayidx30, align 4
  br label %for.cond9

for.end31:                                        ; preds = %for.cond9
  %ni = add i32 %max_flow.0, %increment.0
  br label %for.end31.split

for.end31.split:                                  ; preds = %for.end31
  %9 = load i32* @n, align 4
  %sub32 = sub nsw i32 %9, 1
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc51, %for.end31.split
  %u.1 = phi i32 [ %sub32, %for.end31.split ], [ %15, %for.inc51 ]
  %idxprom34 = sext i32 %u.1 to i64
  %arrayidx35 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom34
  %10 = load i32* %arrayidx35, align 4
  %cmp36 = icmp sge i32 %10, 0
  br i1 %cmp36, label %for.body37, label %for.end54

for.body37:                                       ; preds = %for.cond33
  %idxprom38 = sext i32 %u.1 to i64
  %idxprom39 = sext i32 %u.1 to i64
  %arrayidx40 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom39
  %11 = load i32* %arrayidx40, align 4
  %idxprom41 = sext i32 %11 to i64
  %arrayidx42 = getelementptr inbounds [1000 x [1000 x i32]]* @flow, i32 0, i64 %idxprom41
  %arrayidx43 = getelementptr inbounds [1000 x i32]* %arrayidx42, i32 0, i64 %idxprom38
  %12 = load i32* %arrayidx43, align 4
  %add = add nsw i32 %12, %increment.0
  store i32 %add, i32* %arrayidx43, align 4
  %idxprom44 = sext i32 %u.1 to i64
  %arrayidx45 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom44
  %13 = load i32* %arrayidx45, align 4
  %idxprom46 = sext i32 %13 to i64
  %idxprom47 = sext i32 %u.1 to i64
  %arrayidx48 = getelementptr inbounds [1000 x [1000 x i32]]* @flow, i32 0, i64 %idxprom47
  %arrayidx49 = getelementptr inbounds [1000 x i32]* %arrayidx48, i32 0, i64 %idxprom46
  %14 = load i32* %arrayidx49, align 4
  %sub50 = sub nsw i32 %14, %increment.0
  store i32 %sub50, i32* %arrayidx49, align 4
  br label %for.inc51

for.inc51:                                        ; preds = %for.body37
  %idxprom52 = sext i32 %u.1 to i64
  %arrayidx53 = getelementptr inbounds [1000 x i32]* @pred, i32 0, i64 %idxprom52
  %15 = load i32* %arrayidx53, align 4
  br label %for.cond33

for.end54:                                        ; preds = %for.cond33
  br label %for.end54.split

for.end54.split:                                  ; preds = %for.end54
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %max_flow.0
}

; Function Attrs: nounwind uwtable
define void @read_input_file() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i32* @n, i32* @e)
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc8, %for.inc7 ]
  %0 = load i32* @n, align 4
  %cmp = icmp slt i32 %i.0, %0
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %1 = load i32* @n, align 4
  %cmp3 = icmp slt i32 %j.0, %1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %j.0 to i64
  %idxprom5 = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [1000 x [1000 x i32]]* @capacity, i32 0, i64 %idxprom5
  %arrayidx6 = getelementptr inbounds [1000 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %j.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %i.0, 1
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc18, %for.end9
  %i.1 = phi i32 [ 0, %for.end9 ], [ %inc19, %for.inc18 ]
  %2 = load i32* @e, align 4
  %cmp11 = icmp slt i32 %i.1, %2
  br i1 %cmp11, label %for.body12, label %for.end20

for.body12:                                       ; preds = %for.cond10
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32* %a, i32* %b, i32* %c)
  %3 = load i32* %c, align 4
  %4 = load i32* %b, align 4
  %idxprom14 = sext i32 %4 to i64
  %5 = load i32* %a, align 4
  %idxprom15 = sext i32 %5 to i64
  %arrayidx16 = getelementptr inbounds [1000 x [1000 x i32]]* @capacity, i32 0, i64 %idxprom15
  %arrayidx17 = getelementptr inbounds [1000 x i32]* %arrayidx16, i32 0, i64 %idxprom14
  store i32 %3, i32* %arrayidx17, align 4
  br label %for.inc18

for.inc18:                                        ; preds = %for.body12
  %inc19 = add nsw i32 %i.1, 1
  br label %for.cond10

for.end20:                                        ; preds = %for.cond10
  %call21 = call i32 @fclose(%struct._IO_FILE* %call)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  call void @read_input_file()
  %0 = load i32* @n, align 4
  %sub = sub nsw i32 %0, 1
  %call = call i32 @max_flow(i32 0, i32 %sub)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
