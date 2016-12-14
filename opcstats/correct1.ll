; ModuleID = 'correct1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [100 x i32] zeroinitializer, align 16
@b = common global [100 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  store i32 1, i32* %y, align 4
  %0 = load i32* %x, align 4
  %1 = load i32* %y, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 1), align 4
  %2 = load i32* %x, align 4
  %3 = load i32* %y, align 4
  %add1 = add nsw i32 %2, %3
  store i32 %add1, i32* getelementptr inbounds ([100 x i32]* @a, i32 0, i64 2), align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
