; ModuleID = 'dry.mcpre.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, i32, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 1
@Array2Glob = common global [51 x [51 x i32]] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x i32] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %call = call i32 @Proc0()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
entry:
  %IntLoc1 = alloca i32, align 4
  %IntLoc3 = alloca i32, align 4
  %EnumLoc = alloca i32, align 4
  %String1Loc = alloca [31 x i8], align 16
  %String2Loc = alloca [31 x i8], align 16
  %call = call i64 @clock() #3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 100000000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call1 = call i64 @clock() #3
  %sub = sub nsw i64 %call1, %call
  %call2 = call noalias i8* @malloc(i64 56) #3
  %0 = bitcast i8* %call2 to %struct.Record*
  store %struct.Record* %0, %struct.Record** @PtrGlbNext, align 8
  %call3 = call noalias i8* @malloc(i64 56) #3
  %1 = bitcast i8* %call3 to %struct.Record*
  store %struct.Record* %1, %struct.Record** @PtrGlb, align 8
  %2 = load %struct.Record** @PtrGlbNext, align 8
  %3 = load %struct.Record** @PtrGlb, align 8
  %PtrComp = getelementptr inbounds %struct.Record* %3, i32 0, i32 0
  store %struct.Record* %2, %struct.Record** %PtrComp, align 8
  %4 = load %struct.Record** @PtrGlb, align 8
  %Discr = getelementptr inbounds %struct.Record* %4, i32 0, i32 1
  store i32 0, i32* %Discr, align 4
  %5 = load %struct.Record** @PtrGlb, align 8
  %EnumComp = getelementptr inbounds %struct.Record* %5, i32 0, i32 2
  store i32 10001, i32* %EnumComp, align 4
  %6 = load %struct.Record** @PtrGlb, align 8
  %IntComp = getelementptr inbounds %struct.Record* %6, i32 0, i32 3
  store i32 40, i32* %IntComp, align 4
  %7 = load %struct.Record** @PtrGlb, align 8
  %StringComp = getelementptr inbounds %struct.Record* %7, i32 0, i32 4
  %arraydecay = getelementptr inbounds [31 x i8]* %StringComp, i32 0, i32 0
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0)) #3
  %arraydecay5 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0)) #3
  store i32 10, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i64 8, i64 7), align 4
  %call7 = call i64 @clock() #3
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc42, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc43, %for.inc42 ]
  %cmp9 = icmp ult i32 %i.1, 100000000
  br i1 %cmp9, label %for.body10, label %for.end44

for.body10:                                       ; preds = %for.cond8
  %call11 = call i32 @Proc5()
  %call12 = call i32 @Proc4()
  store i32 2, i32* %IntLoc1, align 4
  %arraydecay13 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0
  %call14 = call i8* @strcpy(i8* %arraydecay13, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0)) #3
  store i32 10000, i32* %EnumLoc, align 4
  %arraydecay15 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0
  %arraydecay16 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0
  %call17 = call i32 @Func2(i8* %arraydecay15, i8* %arraydecay16)
  %tobool = icmp ne i32 %call17, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @BoolGlob, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body10
  %8 = load i32* %IntLoc1, align 4
  %cmp18 = icmp slt i32 %8, 3
  br i1 %cmp18, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32* %IntLoc1, align 4
  %ld8 = load i32* %IntLoc1
  %mul = mul nsw i32 5, %ld8
  %sub19 = sub nsw i32 %mul, 3
  store i32 %sub19, i32* %IntLoc3, align 4
  %10 = load i32* %IntLoc1, align 4
  %call20 = call i32 @Proc7(i32 %10, i32 3, i32* %IntLoc3)
  %11 = load i32* %IntLoc1, align 4
  %ld10 = load i32* %IntLoc1
  %inc21 = add nsw i32 %ld10, 1
  store i32 %inc21, i32* %IntLoc1, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ld2 = load i32* %IntLoc1
  %ni = mul i32 3, %ld2
  br label %while.end.split

while.end.split:                                  ; preds = %while.end
  %12 = load i32* %IntLoc1, align 4
  %13 = load i32* %IntLoc3, align 4
  %call22 = call i32 @Proc8(i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i32 0, i32 0), [51 x i32]* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 0), i32 %12, i32 %13)
  %14 = load %struct.Record** @PtrGlb, align 8
  %call23 = call i32 @Proc1(%struct.Record* %14)
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc34, %while.end.split
  %CharIndex.0 = phi i8 [ 65, %while.end.split ], [ %inc35, %for.inc34 ]
  %conv = sext i8 %CharIndex.0 to i32
  %15 = load i8* @Char2Glob, align 1
  %conv25 = sext i8 %15 to i32
  %cmp26 = icmp sle i32 %conv, %conv25
  br i1 %cmp26, label %for.body28, label %for.end36

for.body28:                                       ; preds = %for.cond24
  %16 = load i32* %EnumLoc, align 4
  %conv29 = sext i8 %CharIndex.0 to i32
  %call30 = call i32 @Func1(i32 %conv29, i32 67)
  %cmp31 = icmp eq i32 %16, %call30
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body28
  %call33 = call i32 @Proc6(i32 0, i32* %EnumLoc)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body28
  br label %for.inc34

for.inc34:                                        ; preds = %if.end
  %inc35 = add i8 %CharIndex.0, 1
  br label %for.cond24

for.end36:                                        ; preds = %for.cond24
  %17 = load i32* %IntLoc1, align 4
  store i32 %ni, i32* %IntLoc3, align 4
  %18 = load i32* %IntLoc3, align 4
  %19 = load i32* %IntLoc1, align 4
  %div = sdiv i32 %18, %19
  br label %for.end36.split

for.end36.split:                                  ; preds = %for.end36
  %20 = load i32* %IntLoc3, align 4
  br label %for.end36.split.split

for.end36.split.split:                            ; preds = %for.end36.split
  %ld14 = load i32* %IntLoc3
  %ni6 = sub i32 %ld14, %div
  br label %for.end36.split.split.split3

for.end36.split.split.split3:                     ; preds = %for.end36.split.split
  %mul39 = mul nsw i32 7, %ni6
  %21 = load i32* %IntLoc1, align 4
  %ld12 = load i32* %IntLoc1
  %sub40 = sub nsw i32 %mul39, %ld12
  br label %for.end36.split.split.split

for.end36.split.split.split:                      ; preds = %for.end36.split.split.split3
  %call41 = call i32 @Proc2(i32* %IntLoc1)
  br label %for.inc42

for.inc42:                                        ; preds = %for.end36.split.split.split
  %inc43 = add i32 %i.1, 1
  br label %for.cond8

for.end44:                                        ; preds = %for.cond8
  ret i32 undef
}

; Function Attrs: nounwind
declare i64 @clock() #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* %PtrParIn) #0 {
entry:
  %IntComp = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 3
  store i32 5, i32* %IntComp, align 4
  %IntComp1 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 3
  %0 = load i32* %IntComp1, align 4
  %PtrComp = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %1 = load %struct.Record** %PtrComp, align 8
  %IntComp2 = getelementptr inbounds %struct.Record* %1, i32 0, i32 3
  store i32 %0, i32* %IntComp2, align 4
  %PtrComp3 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %2 = load %struct.Record** %PtrComp3, align 8
  %PtrComp4 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %3 = load %struct.Record** %PtrComp4, align 8
  %PtrComp5 = getelementptr inbounds %struct.Record* %3, i32 0, i32 0
  store %struct.Record* %2, %struct.Record** %PtrComp5, align 8
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(i32* %IntParIO) #0 {
entry:
  %0 = load i32* %IntParIO, align 4
  %add = add nsw i32 %0, 10
  br label %for.cond

for.cond:                                         ; preds = %if.end5, %entry
  %IntLoc.0 = phi i32 [ %add, %entry ], [ %IntLoc.1, %if.end5 ]
  %1 = load i8* @Char1Glob, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 65
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  %dec = add nsw i32 %IntLoc.0, -1
  %2 = load i32* @IntGlob, align 4
  %sub = sub nsw i32 %dec, %2
  store i32 %sub, i32* %IntParIO, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.cond
  %IntLoc.1 = phi i32 [ %dec, %if.then ], [ %IntLoc.0, %for.cond ]
  %cmp2 = icmp eq i32 0, 0
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %for.end

if.end5:                                          ; preds = %if.end
  br label %for.cond

for.end:                                          ; preds = %if.then4
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** %PtrParOut) #0 {
entry:
  %0 = load %struct.Record** @PtrGlb, align 8
  %cmp = icmp ne %struct.Record* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct.Record** @PtrGlb, align 8
  %PtrComp = getelementptr inbounds %struct.Record* %1, i32 0, i32 0
  %2 = load %struct.Record** %PtrComp, align 8
  store %struct.Record* %2, %struct.Record** %PtrParOut, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 100, i32* @IntGlob, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32* @IntGlob, align 4
  %4 = load %struct.Record** @PtrGlb, align 8
  %IntComp = getelementptr inbounds %struct.Record* %4, i32 0, i32 3
  %call = call i32 @Proc7(i32 10, i32 %3, i32* %IntComp)
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
entry:
  %0 = load i8* @Char1Glob, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 65
  %conv1 = zext i1 %cmp to i32
  %1 = load i32* @BoolGlob, align 4
  %or = or i32 %conv1, %1
  store i8 66, i8* @Char2Glob, align 1
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
entry:
  store i8 65, i8* @Char1Glob, align 1
  store i32 0, i32* @BoolGlob, align 4
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* %EnumParOut) #0 {
entry:
  store i32 %EnumParIn, i32* %EnumParOut, align 4
  %call = call i32 @Func3(i32 %EnumParIn)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 10002, i32* %EnumParOut, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  switch i32 %EnumParIn, label %sw.epilog [
    i32 0, label %sw.bb
    i32 10000, label %sw.bb1
    i32 10001, label %sw.bb4
    i32 10002, label %sw.bb5
    i32 10003, label %sw.bb6
  ]

sw.bb:                                            ; preds = %if.end
  store i32 0, i32* %EnumParOut, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %if.end
  %0 = load i32* @IntGlob, align 4
  %cmp = icmp sgt i32 %0, 100
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %sw.bb1
  store i32 0, i32* %EnumParOut, align 4
  br label %if.end3

if.else:                                          ; preds = %sw.bb1
  store i32 10002, i32* %EnumParOut, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  br label %sw.epilog

sw.bb4:                                           ; preds = %if.end
  store i32 10000, i32* %EnumParOut, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %if.end
  br label %sw.epilog

sw.bb6:                                           ; preds = %if.end
  store i32 10001, i32* %EnumParOut, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb6, %sw.bb5, %sw.bb4, %if.end3, %sw.bb, %if.end
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(i32 %IntParI1, i32 %IntParI2, i32* %IntParOut) #0 {
entry:
  %add = add nsw i32 %IntParI1, 2
  br label %entry.split

entry.split:                                      ; preds = %entry
  %ni = add i32 %IntParI2, %add
  br label %entry.split.split

entry.split.split:                                ; preds = %entry.split
  store i32 %ni, i32* %IntParOut, align 4
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(i32* %Array1Par, [51 x i32]* %Array2Par, i32 %IntParI1, i32 %IntParI2) #0 {
entry:
  %add = add nsw i32 %IntParI1, 5
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32* %Array1Par, i64 %idxprom
  store i32 %IntParI2, i32* %arrayidx, align 4
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds i32* %Array1Par, i64 %idxprom1
  %0 = load i32* %arrayidx2, align 4
  %add3 = add nsw i32 %add, 1
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds i32* %Array1Par, i64 %idxprom4
  store i32 %0, i32* %arrayidx5, align 4
  %add6 = add nsw i32 %add, 30
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds i32* %Array1Par, i64 %idxprom7
  store i32 %add, i32* %arrayidx8, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %IntIndex.0 = phi i32 [ %add, %entry ], [ %inc, %for.inc ]
  %add9 = add nsw i32 %add, 1
  %cmp = icmp sle i32 %IntIndex.0, %add9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom10 = sext i32 %IntIndex.0 to i64
  %idxprom11 = sext i32 %add to i64
  %arrayidx12 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [51 x i32]* %arrayidx12, i32 0, i64 %idxprom10
  store i32 %add, i32* %arrayidx13, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %IntIndex.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sub = sub nsw i32 %add, 1
  %idxprom14 = sext i32 %sub to i64
  %idxprom15 = sext i32 %add to i64
  %arrayidx16 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom15
  %arrayidx17 = getelementptr inbounds [51 x i32]* %arrayidx16, i32 0, i64 %idxprom14
  %1 = load i32* %arrayidx17, align 4
  %inc18 = add nsw i32 %1, 1
  store i32 %inc18, i32* %arrayidx17, align 4
  %idxprom19 = sext i32 %add to i64
  %arrayidx20 = getelementptr inbounds i32* %Array1Par, i64 %idxprom19
  %2 = load i32* %arrayidx20, align 4
  %idxprom21 = sext i32 %add to i64
  %add22 = add nsw i32 %add, 20
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [51 x i32]* %arrayidx24, i32 0, i64 %idxprom21
  store i32 %2, i32* %arrayidx25, align 4
  store i32 5, i32* @IntGlob, align 4
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Func1(i32, i32) #0 {
entry:
  %CharPar1 = trunc i32 %0 to i8
  %CharPar2 = trunc i32 %1 to i8
  %conv = sext i8 %CharPar1 to i32
  %conv1 = sext i8 %CharPar2 to i32
  %cmp = icmp ne i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %return

if.else:                                          ; preds = %entry
  br label %return

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 10000, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind uwtable
define i32 @Func2(i8* %StrParI1, i8* %StrParI2) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %IntLoc.0 = phi i32 [ 1, %entry ], [ %IntLoc.1, %if.end ]
  %cmp = icmp sle i32 %IntLoc.0, 1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %IntLoc.0 to i64
  %arrayidx = getelementptr inbounds i8* %StrParI1, i64 %idxprom
  %0 = load i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %add = add nsw i32 %IntLoc.0, 1
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds i8* %StrParI2, i64 %idxprom1
  %1 = load i8* %arrayidx2, align 1
  %conv3 = sext i8 %1 to i32
  %call = call i32 @Func1(i32 %conv, i32 %conv3)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %inc = add nsw i32 %IntLoc.0, 1
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %IntLoc.1 = phi i32 [ %inc, %if.then ], [ %IntLoc.0, %while.body ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %conv6 = sext i8 65 to i32
  %cmp7 = icmp sge i32 %conv6, 87
  br i1 %cmp7, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %while.end
  %conv9 = sext i8 65 to i32
  %cmp10 = icmp sle i32 %conv9, 90
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %land.lhs.true, %while.end
  %IntLoc.2 = phi i32 [ 7, %if.then12 ], [ %IntLoc.0, %land.lhs.true ], [ %IntLoc.0, %while.end ]
  %conv14 = sext i8 65 to i32
  %cmp15 = icmp eq i32 %conv14, 88
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.end13
  br label %return

if.else:                                          ; preds = %if.end13
  %call18 = call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #4
  %cmp19 = icmp sgt i32 %call18, 0
  br i1 %cmp19, label %if.then21, label %if.else23

if.then21:                                        ; preds = %if.else
  %add22 = add nsw i32 %IntLoc.2, 7
  br label %return

if.else23:                                        ; preds = %if.else
  br label %return

return:                                           ; preds = %if.else23, %if.then21, %if.then17
  %retval.0 = phi i32 [ 1, %if.then17 ], [ 1, %if.then21 ], [ 0, %if.else23 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @Func3(i32 %EnumParIn) #0 {
entry:
  %cmp = icmp eq i32 %EnumParIn, 10001
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }
