; ModuleID = 'struct.c'

%struct..0anon = type { i8 }
%struct..1anon = type { i8, %struct..0anon }

define void @main() nounwind ssp {
entry:
  %b = alloca %struct..1anon                      ; <%struct..1anon*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  %0 = getelementptr inbounds %struct..1anon* %b, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 3, i8* %0, align 1
  %1 = getelementptr inbounds %struct..1anon* %b, i32 0, i32 1 ; <%struct..0anon*> [#uses=1]
  %2 = getelementptr inbounds %struct..0anon* %1, i32 0, i32 0 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1                       ; <i8> [#uses=1]
  %4 = sext i8 %3 to i64                          ; <i64> [#uses=1]
  call void @print_l(i64 %4) nounwind
  br label %return

return:                                           ; preds = %entry
  ret void
}

declare void @print_l(i64)
