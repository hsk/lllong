; ModuleID = 'int.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

define i64 @itol(i32 %a) nounwind ssp {
entry:
  %a_addr = alloca i32, align 4                   ; <i32*> [#uses=2]
  %retval = alloca i64                            ; <i64*> [#uses=2]
  %0 = alloca i64                                 ; <i64*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %a, i32* %a_addr
  %1 = load i32* %a_addr, align 4                 ; <i32> [#uses=1]
  %2 = sext i32 %1 to i64                         ; <i64> [#uses=1]
  store i64 %2, i64* %0, align 8
  %3 = load i64* %0, align 8                      ; <i64> [#uses=1]
  store i64 %3, i64* %retval, align 8
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i64* %retval                    ; <i64> [#uses=1]
  ret i64 %retval1
}
