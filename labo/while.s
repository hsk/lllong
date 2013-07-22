; ModuleID = 'while.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define void @main() nounwind ssp {
entry:
  %i = alloca i32                                 ; <i32*> [#uses=5]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 10, i32* %i, align 4
  br label %bb1

bb:                                               ; preds = %bb1
  %0 = load i32* %i, align 4                      ; <i32> [#uses=1]
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind ; <i32> [#uses=0]
  %2 = load i32* %i, align 4                      ; <i32> [#uses=1]
  %3 = sub nsw i32 %2, 1                          ; <i32> [#uses=1]
  store i32 %3, i32* %i, align 4
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %4 = load i32* %i, align 4                      ; <i32> [#uses=1]
  %5 = icmp sgt i32 %4, 0                         ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb2

bb2:                                              ; preds = %bb1
  br label %return

return:                                           ; preds = %bb2
  ret void
}

declare i32 @printf(i8*, ...) nounwind
