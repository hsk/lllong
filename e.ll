declare i32 @printf(i8*, ...) nounwind
define i32 @main() nounwind ssp {
entry:
  %..retVal = alloca i32
  %..67 = bitcast [14 x i8]* @.str68 to i8*
  call void @println(i8* %..67) nounwind ssp
  br label %leave65
leave65:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..69 = load i32* %..retVal
  ret i32 %..69
}
@.str68= private constant [14 x i8] c"あいうえa\00"
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
