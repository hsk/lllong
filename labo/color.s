; ModuleID = 'color.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin12.3"

define void @color(float %a, float %b, float %c, float %d) nounwind ssp {
entry:
  %a_addr = alloca float, align 4                 ; <float*> [#uses=1]
  %b_addr = alloca float, align 4                 ; <float*> [#uses=1]
  %c_addr = alloca float, align 4                 ; <float*> [#uses=1]
  %d_addr = alloca float, align 4                 ; <float*> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store float %a, float* %a_addr
  store float %b, float* %b_addr
  store float %c, float* %c_addr
  store float %d, float* %d_addr
  br label %return

return:                                           ; preds = %entry
  ret void
}

define void @main() nounwind ssp {
entry:
  call void @color(float 0x3fd199999a000000, float 0x3FD19999A0000000, float 0x3FD19999A0000000, float 1.000000e+00) nounwind ssp
  br label %return

return:                                           ; preds = %entry
  ret void
}
