; ModuleID = 'if.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.2"

define void @main() nounwind ssp {
entry:
  %iftmp.0 = alloca i64                           ; <i64*> [#uses=3]
  %a = alloca i64                                 ; <i64*> [#uses=2]
  %b = alloca i64                                 ; <i64*> [#uses=3]
  %c = alloca i64                                 ; <i64*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i64 1, i64* %a, align 8
  store i64 0, i64* %b, align 8
  store i64 555, i64* %c, align 8
  %0 = load i64* %a, align 8                      ; <i64> [#uses=1]
  %1 = icmp ne i64 %0, 0                          ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb1

bb:                                               ; preds = %entry
  store i64 2, i64* %iftmp.0, align 8
  br label %bb2

bb1:                                              ; preds = %entry
  store i64 3, i64* %iftmp.0, align 8
  br label %bb2

bb2:                                              ; preds = %bb1, %bb
  %2 = load i64* %iftmp.0, align 8                ; <i64> [#uses=1]
  %3 = load i64* %c, align 8                      ; <i64> [#uses=1]
  %4 = add nsw i64 %2, %3                         ; <i64> [#uses=1]
  store i64 %4, i64* %b, align 8
  %5 = load i64* %b, align 8                      ; <i64> [#uses=1]
  call void @print_l(i64 %5) nounwind
  br label %return

return:                                           ; preds = %bb2
  ret void
}

declare void @print_l(i64)
