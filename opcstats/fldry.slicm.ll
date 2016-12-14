; ModuleID = 'fldry.slicm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, double, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@.str = private unnamed_addr constant [53 x i8] c"calculate floating dhrystones using doubles size %d\0A\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 1
@Array2Glob = common global [51 x [51 x double]] zeroinitializer, align 16
@.str3 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x double] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str, i32 0, i32 0), i64 8)
  %call1 = call i32 @Proc0()
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
entry:
  %IntLoc1 = alloca double, align 8
  %IntLoc3 = alloca double, align 8
  %EnumLoc = alloca i32, align 4
  %String1Loc = alloca [31 x i8], align 16
  %String2Loc = alloca [31 x i8], align 16
  %call = call i64 @clock() #4
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
  %call1 = call i64 @clock() #4
  %sub = sub nsw i64 %call1, %call
  %call2 = call noalias i8* @malloc(i64 56) #4
  %0 = bitcast i8* %call2 to %struct.Record*
  store %struct.Record* %0, %struct.Record** @PtrGlbNext, align 8
  %call3 = call noalias i8* @malloc(i64 56) #4
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
  store double 4.000000e+01, double* %IntComp, align 8
  %7 = load %struct.Record** @PtrGlb, align 8
  %StringComp = getelementptr inbounds %struct.Record* %7, i32 0, i32 4
  %arraydecay = getelementptr inbounds [31 x i8]* %StringComp, i32 0, i32 0
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0)) #4
  %arraydecay5 = getelementptr inbounds [31 x i8]* %String1Loc, i32 0, i32 0
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0)) #4
  store double 1.000000e+01, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i64 8, i64 7), align 8
  %call7 = call i64 @clock() #4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc42, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc43, %for.inc42 ]
  %cmp9 = icmp ult i32 %i.1, 100000000
  br i1 %cmp9, label %for.body10, label %for.end44

for.body10:                                       ; preds = %for.cond8
  %call11 = call i32 @Proc5()
  %call12 = call i32 @Proc4()
  store double 2.000000e+00, double* %IntLoc1, align 8
  %arraydecay13 = getelementptr inbounds [31 x i8]* %String2Loc, i32 0, i32 0
  %call14 = call i8* @strcpy(i8* %arraydecay13, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0)) #4
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
  %8 = load double* %IntLoc1, align 8
  %cmp18 = fcmp olt double %8, 3.000000e+00
  br i1 %cmp18, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load double* %IntLoc1, align 8
  %ld15 = load double* %IntLoc1
  %mul = fmul double 5.000000e+00, %ld15
  %sub19 = fsub double %mul, 3.000000e+00
  store double %sub19, double* %IntLoc3, align 8
  %10 = load double* %IntLoc1, align 8
  %call20 = call i32 @Proc7(double %10, double 3.000000e+00, double* %IntLoc3)
  %11 = load double* %IntLoc1, align 8
  %ld17 = load double* %IntLoc1
  %inc21 = fadd double %ld17, 1.000000e+00
  store double %inc21, double* %IntLoc1, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ld2 = load double* %IntLoc1
  %ni = fmul double 3.000000e+00, %ld2
  br label %while.end.split

while.end.split:                                  ; preds = %while.end
  %12 = load double* %IntLoc1, align 8
  %13 = load double* %IntLoc3, align 8
  %call22 = call i32 @Proc8(double* getelementptr inbounds ([51 x double]* @Array1Glob, i32 0, i32 0), [51 x double]* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 0), double %12, double %13)
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
  %17 = load double* %IntLoc1, align 8
  store double %ni, double* %IntLoc3, align 8
  %18 = load double* %IntLoc3, align 8
  %19 = load double* %IntLoc1, align 8
  br label %for.end36.split1

for.end36.split1:                                 ; preds = %for.end36
  %ld14 = load double* %IntLoc3
  %ld25 = load double* %IntLoc1
  %ni6 = fdiv double %ld14, %ld25
  br label %for.end36.split1.split

for.end36.split1.split:                           ; preds = %for.end36.split1
  br label %for.end36.split

for.end36.split:                                  ; preds = %for.end36.split1.split
  %20 = load double* %IntLoc3, align 8
  br label %for.end36.split.split

for.end36.split.split:                            ; preds = %for.end36.split
  %ld110 = load double* %IntLoc3
  %ni12 = fsub double %ld110, %ni6
  br label %for.end36.split.split.split9

for.end36.split.split.split9:                     ; preds = %for.end36.split.split
  %mul39 = fmul double 7.000000e+00, %ni12
  %21 = load double* %IntLoc1, align 8
  %ld19 = load double* %IntLoc1
  %sub40 = fsub double %mul39, %ld19
  br label %for.end36.split.split.split

for.end36.split.split.split:                      ; preds = %for.end36.split.split.split9
  %call41 = call i32 @Proc2(double* %IntLoc1)
  br label %for.inc42

for.inc42:                                        ; preds = %for.end36.split.split.split
  %inc43 = add i32 %i.1, 1
  br label %for.cond8

for.end44:                                        ; preds = %for.cond8
  ret i32 undef
}

; Function Attrs: nounwind
declare i64 @clock() #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* %PtrParIn) #0 {
entry:
  %IntComp = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 3
  store double 5.000000e+00, double* %IntComp, align 8
  %IntComp1 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 3
  %0 = load double* %IntComp1, align 8
  %PtrComp = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %1 = load %struct.Record** %PtrComp, align 8
  %IntComp2 = getelementptr inbounds %struct.Record* %1, i32 0, i32 3
  store double %0, double* %IntComp2, align 8
  %PtrComp3 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %2 = load %struct.Record** %PtrComp3, align 8
  %PtrComp4 = getelementptr inbounds %struct.Record* %PtrParIn, i32 0, i32 0
  %3 = load %struct.Record** %PtrComp4, align 8
  %PtrComp5 = getelementptr inbounds %struct.Record* %3, i32 0, i32 0
  store %struct.Record* %2, %struct.Record** %PtrComp5, align 8
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(double* %IntParIO) #0 {
entry:
  %0 = load double* %IntParIO, align 8
  %add = fadd double %0, 1.000000e+01
  br label %for.cond

for.cond:                                         ; preds = %if.end5, %entry
  %IntLoc.0 = phi double [ %add, %entry ], [ %IntLoc.1, %if.end5 ]
  %1 = load i8* @Char1Glob, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 65
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  %dec = fadd double %IntLoc.0, -1.000000e+00
  %2 = load double* @IntGlob, align 8
  %sub = fsub double %dec, %2
  store double %sub, double* %IntParIO, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.cond
  %IntLoc.1 = phi double [ %dec, %if.then ], [ %IntLoc.0, %for.cond ]
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
  store double 1.000000e+02, double* @IntGlob, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load double* @IntGlob, align 8
  %4 = load %struct.Record** @PtrGlb, align 8
  %IntComp = getelementptr inbounds %struct.Record* %4, i32 0, i32 3
  %call = call i32 (i32, double, double*, ...)* bitcast (i32 (double, double, double*)* @Proc7 to i32 (i32, double, double*, ...)*)(i32 10, double %3, double* %IntComp)
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
  %0 = load double* @IntGlob, align 8
  %cmp = fcmp ogt double %0, 1.000000e+02
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
define i32 @Proc7(double %IntParI1, double %IntParI2, double* %IntParOut) #0 {
entry:
  %add = fadd double %IntParI1, 2.000000e+00
  br label %entry.split

entry.split:                                      ; preds = %entry
  %ni = fadd double %IntParI2, %add
  br label %entry.split.split

entry.split.split:                                ; preds = %entry.split
  store double %ni, double* %IntParOut, align 8
  ret i32 undef
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(double* %Array1Par, [51 x double]* %Array2Par, double %IntParI1, double %IntParI2) #0 {
entry:
  %add = fadd double %IntParI1, 5.000000e+00
  %conv = fptosi double %add to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds double* %Array1Par, i64 %idxprom
  store double %IntParI2, double* %arrayidx, align 8
  %conv1 = fptosi double %add to i32
  %idxprom2 = sext i32 %conv1 to i64
  %arrayidx3 = getelementptr inbounds double* %Array1Par, i64 %idxprom2
  %0 = load double* %arrayidx3, align 8
  %conv4 = fptosi double %add to i32
  %add5 = add nsw i32 %conv4, 1
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds double* %Array1Par, i64 %idxprom6
  store double %0, double* %arrayidx7, align 8
  %conv8 = fptosi double %add to i32
  %add9 = add nsw i32 %conv8, 30
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds double* %Array1Par, i64 %idxprom10
  store double %add, double* %arrayidx11, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %IntIndex.0 = phi double [ %add, %entry ], [ %inc, %for.inc ]
  %add12 = fadd double %add, 1.000000e+00
  %cmp = fcmp ole double %IntIndex.0, %add12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %conv14 = fptosi double %IntIndex.0 to i32
  %idxprom15 = sext i32 %conv14 to i64
  %conv16 = fptosi double %add to i32
  %idxprom17 = sext i32 %conv16 to i64
  %arrayidx18 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [51 x double]* %arrayidx18, i32 0, i64 %idxprom15
  store double %add, double* %arrayidx19, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = fadd double %IntIndex.0, 1.000000e+00
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %conv20 = fptosi double %add to i32
  %sub = sub nsw i32 %conv20, 1
  %idxprom21 = sext i32 %sub to i64
  %conv22 = fptosi double %add to i32
  %idxprom23 = sext i32 %conv22 to i64
  %arrayidx24 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [51 x double]* %arrayidx24, i32 0, i64 %idxprom21
  %1 = load double* %arrayidx25, align 8
  %inc26 = fadd double %1, 1.000000e+00
  store double %inc26, double* %arrayidx25, align 8
  %conv27 = fptosi double %add to i32
  %idxprom28 = sext i32 %conv27 to i64
  %arrayidx29 = getelementptr inbounds double* %Array1Par, i64 %idxprom28
  %2 = load double* %arrayidx29, align 8
  %conv30 = fptosi double %add to i32
  %idxprom31 = sext i32 %conv30 to i64
  %conv32 = fptosi double %add to i32
  %add33 = add nsw i32 %conv32, 20
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom34
  %arrayidx36 = getelementptr inbounds [51 x double]* %arrayidx35, i32 0, i64 %idxprom31
  store double %2, double* %arrayidx36, align 8
  store double 5.000000e+00, double* @IntGlob, align 8
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
  %IntLoc.0 = phi double [ 1.000000e+00, %entry ], [ %IntLoc.1, %if.end ]
  %cmp = fcmp ole double %IntLoc.0, 1.000000e+00
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %conv = fptosi double %IntLoc.0 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds i8* %StrParI1, i64 %idxprom
  %0 = load i8* %arrayidx, align 1
  %conv1 = sext i8 %0 to i32
  %conv2 = fptosi double %IntLoc.0 to i32
  %add = add nsw i32 %conv2, 1
  %idxprom3 = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds i8* %StrParI2, i64 %idxprom3
  %1 = load i8* %arrayidx4, align 1
  %conv5 = sext i8 %1 to i32
  %call = call i32 @Func1(i32 %conv1, i32 %conv5)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %inc = fadd double %IntLoc.0, 1.000000e+00
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %IntLoc.1 = phi double [ %inc, %if.then ], [ %IntLoc.0, %while.body ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %conv8 = sext i8 65 to i32
  %cmp9 = icmp sge i32 %conv8, 87
  br i1 %cmp9, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %while.end
  %conv11 = sext i8 65 to i32
  %cmp12 = icmp sle i32 %conv11, 90
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %land.lhs.true
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %land.lhs.true, %while.end
  %IntLoc.2 = phi double [ 7.000000e+00, %if.then14 ], [ %IntLoc.0, %land.lhs.true ], [ %IntLoc.0, %while.end ]
  %conv16 = sext i8 65 to i32
  %cmp17 = icmp eq i32 %conv16, 88
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.end15
  br label %return

if.else:                                          ; preds = %if.end15
  %call20 = call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #5
  %cmp21 = icmp sgt i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.else25

if.then23:                                        ; preds = %if.else
  %add24 = fadd double %IntLoc.2, 7.000000e+00
  br label %return

if.else25:                                        ; preds = %if.else
  br label %return

return:                                           ; preds = %if.else25, %if.then23, %if.then19
  %retval.0 = phi i32 [ 1, %if.then19 ], [ 1, %if.then23 ], [ 0, %if.else25 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

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
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
