; ModuleID = 'return.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

define i32 @aaa(i32 %a) nounwind ssp {
entry:
  %a_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %a, i32* %a_addr
  %1 = load i32* %a_addr, align 4                 ; <i32> [#uses=1]
  %2 = icmp eq i32 %1, 1                          ; <i1> [#uses=1]
  br i1 %2, label %bb, label %bb1

bb:                                               ; preds = %entry
  store i32 2, i32* %0, align 4
  br label %bb2

bb1:                                              ; preds = %entry
  store i32 3, i32* %0, align 4
  br label %bb2

bb2:                                              ; preds = %bb1, %bb
  %3 = load i32* %0, align 4                      ; <i32> [#uses=1]
  store i32 %3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %bb2
  %retval3 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval3
}
