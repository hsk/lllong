; ModuleID = 'pointer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

@g = common global i32 (i32)* null                ; <i32 (i32)**> [#uses=2]

define i32 @a(i32 %b) nounwind ssp {
entry:
  %b_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %b, i32* %b_addr
  %1 = load i32* %b_addr, align 4                 ; <i32> [#uses=1]
  store i32 %1, i32* %0, align 4
  %2 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval1
}

define i32 @main() nounwind ssp {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %f = alloca i32 (i32)*                          ; <i32 (i32)**> [#uses=4]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 (i32)* @a, i32 (i32)** %f, align 8
  store i32 (i32)* @a, i32 (i32)** @g, align 8
  %1 = load i32 (i32)** %f, align 8               ; <i32 (i32)*> [#uses=1]
  %2 = call i32 %1(i32 10) nounwind               ; <i32> [#uses=0]
  %3 = load i32 (i32)** @g, align 8               ; <i32 (i32)*> [#uses=1]
  store i32 (i32)* %3, i32 (i32)** %f, align 8
  %4 = load i32 (i32)** %f, align 8               ; <i32 (i32)*> [#uses=1]
  %5 = call i32 %4(i32 10) nounwind               ; <i32> [#uses=0]
  store i32 0, i32* %0, align 4
  %6 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval1
}
