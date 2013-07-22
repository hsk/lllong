; ModuleID = 'array_literal.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define void @color(i32 %a, i32 %b, i32 %c, i32 %d) nounwind ssp {
entry:
  %a_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %b_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %c_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %d_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %aa = alloca [4 x i32]                          ; <[4 x i32]*> [#uses=5]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %a, i32* %a_addr
  store i32 %b, i32* %b_addr
  store i32 %c, i32* %c_addr
  store i32 %d, i32* %d_addr
  %0 = getelementptr inbounds [4 x i32]* %aa, i64 0, i64 0 ; <i32*> [#uses=1]
  %1 = load i32* %a_addr, align 4                 ; <i32> [#uses=1]
  store i32 %1, i32* %0, align 4
  %2 = getelementptr inbounds [4 x i32]* %aa, i64 0, i64 1 ; <i32*> [#uses=1]
  %3 = load i32* %b_addr, align 4                 ; <i32> [#uses=1]
  store i32 %3, i32* %2, align 4
  %4 = getelementptr inbounds [4 x i32]* %aa, i64 0, i64 2 ; <i32*> [#uses=1]
  %5 = load i32* %c_addr, align 4                 ; <i32> [#uses=1]
  store i32 %5, i32* %4, align 4
  %6 = getelementptr inbounds [4 x i32]* %aa, i64 0, i64 3 ; <i32*> [#uses=1]
  %7 = load i32* %d_addr, align 4                 ; <i32> [#uses=1]
  store i32 %7, i32* %6, align 4
  %8 = getelementptr inbounds [4 x i32]* %aa, i64 0, i64 0 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %9) nounwind ; <i32> [#uses=0]
  br label %return

return:                                           ; preds = %entry
  ret void
}

declare i32 @printf(i8*, ...) nounwind

define i32 @main() nounwind ssp {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 0, i32* %0, align 4
  %1 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval1
}
