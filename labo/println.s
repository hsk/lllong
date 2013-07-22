; ModuleID = 'println.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

define void @println(i8* %c) nounwind ssp {
entry:
  %c_addr = alloca i8*, align 8                   ; <i8**> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i8* %c, i8** %c_addr
  br label %return

return:                                           ; preds = %entry
  ret void
}
