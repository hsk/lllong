; ModuleID = 'global.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

%struct.A = type { i32, i32 }

@aa = global %struct.A { i32 1, i32 2 }           ; <%struct.A*> [#uses=0]
@a = global i64 1                                 ; <i64*> [#uses=1]
@ab = common global %struct.A zeroinitializer     ; <%struct.A*> [#uses=0]

define void @print_l(i64 %a) nounwind ssp {
entry:
  %a_addr = alloca i64, align 8                   ; <i64*> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i64 %a, i64* %a_addr
  br label %return

return:                                           ; preds = %entry
  ret void
}

define void @main() nounwind ssp {
entry:
  %0 = load i64* @a, align 8                      ; <i64> [#uses=1]
  call void @print_l(i64 %0) nounwind ssp
  br label %return

return:                                           ; preds = %entry
  ret void
}
