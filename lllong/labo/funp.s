; ModuleID = 'funp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define i32 @add(i32 %a, i32 %b) nounwind ssp {
entry:
  %a_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %b_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %a, i32* %a_addr
  store i32 %b, i32* %b_addr
  %1 = load i32* %a_addr, align 4                 ; <i32> [#uses=1]
  %2 = load i32* %b_addr, align 4                 ; <i32> [#uses=1]
  %3 = add nsw i32 %1, %2                         ; <i32> [#uses=1]
  store i32 %3, i32* %0, align 4
  %4 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval1
}

define i32 @main() nounwind ssp {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %f = alloca i32 (i32, i32)*                     ; <i32 (i32, i32)**> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 (i32, i32)* @add, i32 (i32, i32)** %f, align 8
  %1 = load i32 (i32, i32)** %f, align 8          ; <i32 (i32, i32)*> [#uses=1]
  %2 = call i32 %1(i32 1, i32 2) nounwind         ; <i32> [#uses=1]
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %2) nounwind ; <i32> [#uses=0]
  store i32 0, i32* %0, align 4
  %4 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval1
}

declare i32 @printf(i8*, ...) nounwind
