	%struct..anon81 = type {i8, %struct..anon88}
	%struct..anon88 = type {i8}
declare void @print_f(float) nounwind
declare void @print_b(i8) nounwind
declare i8* @malloc(i64) nounwind
declare void @print_d(double) nounwind
declare void @println(i8*) nounwind
declare void @print_l(i64) nounwind
declare void @print_s(i16) nounwind
declare void @print_i(i32) nounwind
		; (enter,EFun(Tv,main,Map(argn -> Tl, argv -> Tl),EBlock(Tv,List(EVar(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b), EAssign(Tb,EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a),ECast(Tb,ELd(Tl,3))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))), EAssign(Tb,EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c),ECast(Tb,ELd(Tl,33))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c)))))),(Map(argn -> Tl, argv -> Tl, b -> TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb))))),Map(argn -> 8, argv -> 16, b -> 18),18))
define i32 @main(i64 %..argn, i64 %..argv) nounwind ssp {
entry:
	%.argn = alloca i64
	%.argv = alloca i64
	%.b = alloca %struct..anon81
	store i64 %..argn, i64* %.argn
	store i64 %..argv, i64* %.argv
	; (nop,# EBlock(Tv,List(EVar(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b), EAssign(Tb,EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a),ECast(Tb,ELd(Tl,3))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))), EAssign(Tb,EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c),ECast(Tb,ELd(Tl,33))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c))))))
	; (nop,# EVar(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b))
	; (nop,# EAssign(Tb,EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a),ECast(Tb,ELd(Tl,3))))
	; (aload,b)
	; (nop,# ECast(Tb,ELd(Tl,3)))
	; (nop,# ELd(Tl,3))
	; (ldc,Tl,3)
	; l2b
	; (putfield,b,a,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))))
	; offset data Map(a -> Tb, b -> TStruct(Map(c -> Tb))) (Tb,0) m=List((a,Tb), (b,TStruct(Map(c -> Tb))))
	%reg_82 = getelementptr inbounds %struct..anon81* %.b, i32 0 , i32 0
	store i8 3, i8* %reg_82
	; pop
	; (nop,# ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))))
	; (nop,ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))))
	; (nop,EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))
	; (nop,# EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))
	; (aload,b)
	; (getfield,a,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))))
	; offset data Map(a -> Tb, b -> TStruct(Map(c -> Tb))) (Tb,0) m=List((a,Tb), (b,TStruct(Map(c -> Tb))))
	%reg_84 = getelementptr inbounds %struct..anon81* %.b*, i32 0, i32 0
	%...83 = load i8* %reg_84
	; (call,print_b,TFun(Tv,List(Tb)))
	call void @print_b(i8 %...83) nounwind ssp
	; (nop,# EAssign(Tb,EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c),ECast(Tb,ELd(Tl,33))))
	; (aload,b)
	; (getfield,b,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))))
	; offset data Map(a -> Tb, b -> TStruct(Map(c -> Tb))) (TStruct(Map(c -> Tb)),1) m=List((a,Tb), (b,TStruct(Map(c -> Tb))))
	%...85 = getelementptr inbounds %struct..anon81* %.b*, i32 0, i32 1
	; (nop,# ECast(Tb,ELd(Tl,33)))
	; (nop,# ELd(Tl,33))
	; (ldc,Tl,33)
	; l2b
	; (putfield,c,TStruct(Map(c -> Tb)))
	; offset data Map(c -> Tb) (Tb,0) m=List((c,Tb))
	%reg_87 = getelementptr inbounds %struct..anon88* %...85, i32 0 , i32 0
	store i8 33, i8* %reg_87
	; pop
	; (nop,# ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c))))
	; (nop,ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c))))
	; (nop,EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c))
	; (nop,# EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c))
	; (aload,b)
	; (getfield,b,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))))
	; offset data Map(a -> Tb, b -> TStruct(Map(c -> Tb))) (TStruct(Map(c -> Tb)),1) m=List((a,Tb), (b,TStruct(Map(c -> Tb))))
	%...89 = getelementptr inbounds %struct..anon81* %.b*, i32 0, i32 1
	; (getfield,c,TStruct(Map(c -> Tb)))
	; offset data Map(c -> Tb) (Tb,0) m=List((c,Tb))
	%reg_92 = getelementptr inbounds %struct..anon88* %...89, i32 0, i32 0
	%...91 = load i8* %reg_92
	; (call,print_b,TFun(Tv,List(Tb)))
	call void @print_b(i8 %...91) nounwind ssp
	; (label,leave80)
	br label %leave80
leave80:
	; (leave,EFun(Tv,main,Map(argn -> Tl, argv -> Tl),EBlock(Tv,List(EVar(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b), EAssign(Tb,EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a),ECast(Tb,ELd(Tl,3))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),a))), EAssign(Tb,EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c),ECast(Tb,ELd(Tl,33))), ECall(Tv,EId(TFun(Tv,List(Tb)),print_b),List(EField(Tb,TStruct(Map(c -> Tb)),EField(TStruct(Map(c -> Tb)),TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),EId(TStruct(Map(a -> Tb, b -> TStruct(Map(c -> Tb)))),b),b),c)))))))
	ret i32 0
}

