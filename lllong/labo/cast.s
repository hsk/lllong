; ModuleID = 'cast.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

@.str = private constant [4 x i8] c"%ld\00", align 1 ; <[4 x i8]*> [#uses=1]

define void @main() nounwind ssp {
entry:
  %a = alloca [10 x i64]                          ; <[10 x i64]*> [#uses=1]
  %p = alloca i64*                                ; <i64**> [#uses=2]
  %aa = alloca i64                                ; <i64*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  %a1 = bitcast [10 x i64]* %a to i64*            ; <i64*> [#uses=1]
  store i64* %a1, i64** %p, align 8
  %0 = load i64** %p, align 8                     ; <i64*> [#uses=1]
  %1 = ptrtoint i64* %0 to i64                    ; <i64> [#uses=1]
  store i64 %1, i64* %aa, align 8
  %2 = load i64* %aa, align 8                     ; <i64> [#uses=1]
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i64 %2) nounwind ; <i32> [#uses=0]
  br label %return

return:                                           ; preds = %entry
  ret void
}

declare i32 @printf(i8*, ...) nounwind
