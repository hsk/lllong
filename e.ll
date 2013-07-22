declare i32 @printf(i8*, ...) nounwind
define void @f(float %a.v, float %b.v) nounwind ssp {
entry:
  %a = alloca float
  store float %a.v, float* %a
  %b = alloca float
  store float %b.v, float* %b
  %c = alloca [2 x float]
  %..2749 = bitcast [2 x float]* %c to float*
  %..2751 = load float* %a
  %..2752 = bitcast float* %..2749 to float*
  %..2753 = getelementptr inbounds float* %..2752, i32 0
  store float %..2751, float* %..2753
  %..2754 = bitcast [2 x float]* %c to float*
  %..2756 = load float* %b
  %..2757 = bitcast float* %..2754 to float*
  %..2758 = getelementptr inbounds float* %..2757, i32 1
  store float %..2756, float* %..2758
  br label %leave2748
leave2748:
  ret void
}
define i32 @main() nounwind ssp {
entry:
  %..retVal = alloca i32
  call void @f(float 0x3ff19999a0000000, float 0x40019999a0000000) nounwind ssp
  br label %leave2759
leave2759:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..2763 = load i32* %..retVal
  ret i32 %..2763
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
