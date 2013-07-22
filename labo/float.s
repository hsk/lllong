; ModuleID = 'float.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

define float @add(float %a) nounwind ssp {
entry:
  %a_addr = alloca float, align 4                 ; <float*> [#uses=2]
  %retval = alloca float                          ; <float*> [#uses=2]
  %0 = alloca float                               ; <float*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store float %a, float* %a_addr
  %1 = load float* %a_addr, align 4               ; <float> [#uses=1]
  store float %1, float* %0, align 4
  %2 = load float* %0, align 4                    ; <float> [#uses=1]
  store float %2, float* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load float* %retval                  ; <float> [#uses=1]
  ret float %retval1
}

define void @print_f(float %a) nounwind ssp {
entry:
  %a_addr = alloca float, align 4                 ; <float*> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store float %a, float* %a_addr
  br label %return

return:                                           ; preds = %entry
  ret void
}

define void @main() nounwind ssp {
entry:
  call void @print_f(float 1.0) nounwind ssp
  br label %return

return:                                           ; preds = %entry
  ret void
}
