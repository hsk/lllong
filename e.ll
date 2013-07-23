declare i32 @printf(i8*, ...) nounwind
define void @f(float %a.v, float %b.v) nounwind ssp {
entry:
  %a = alloca float
  store float %a.v, float* %a
  %b = alloca float
  store float %b.v, float* %b
  %c = alloca [2 x float]
  %..2827 = bitcast [2 x float]* %c to float*
  %..2829 = load float* %a
  %..2830 = bitcast float* %..2827 to float*
  %..2831 = getelementptr inbounds float* %..2830, i32 0
  store float %..2829, float* %..2831
  %..2832 = bitcast [2 x float]* %c to float*
  %..2834 = load float* %b
  %..2835 = bitcast float* %..2832 to float*
  %..2836 = getelementptr inbounds float* %..2835, i32 1
  store float %..2834, float* %..2836
  br label %leave2826
leave2826:
  ret void
}
define i32 @main() nounwind ssp {
entry:
  %..retVal = alloca i32
  call void @f(float 0x3ff19999a0000000, float 0x40019999a0000000) nounwind ssp
  br label %leave2837
leave2837:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..2841 = load i32* %..retVal
  ret i32 %..2841
}
declare void @print_f(float) nounwind
declare void @print_b(i8) nounwind
@float = external global float
@short = external global i16
declare void @print_d(double) nounwind
@char = external global i8
declare void @println(i8*) nounwind
@double = external global double
@long = external global i64
@int = external global i32
declare void @print_l(i64) nounwind
@byte = external global i8
declare void @print_s(i16) nounwind
declare void @print_i(i32) nounwind
