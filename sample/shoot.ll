%.struct4 = type { double, double, i32, double, double, double, void(%.struct5*)*, void(%.struct5*)*, i32, double }
%.struct5 = type { double, double, i32, double, double, double, void(%.struct5*)*, void(%.struct5*)*, i32, double }
%.struct10 = type { double, double, i32, double, double, double }
%.struct9 = type { double, double, i32, double, double }
%.struct7 = type { double, double, i32, double, double, double }
%.struct8 = type { double, double, i32, double, i32, i32 }
%.struct2 = type { i32, i32, i32, i32, i32, i32 }
%.struct3 = type { double, double, i32, double, i32, i32 }
%.struct6 = type { double, double, i32, double, double }
declare i32 @printf(i8*, ...) nounwind
@false= global i32 0
@true= global i32 1
@GLUT_RGBA= global i32 0
@GLUT_NUMBER= global i32 2
@GLUT_DEPTH= global i32 16
@GLUT_KEY_LEFT= global i8 100
@GLUT_KEY_UP= global i8 101
@GLUT_KEY_RIGHT= global i8 102
@GLUT_KEY_DOWN= global i8 103
@GLUT_KEY_SPACE= global i8 32
@GL_COLOR_BUFFER_BIT= global i32 16384
@GL_QUADS= global i32 7
@GL_LINE_LOOP= global i32 2
@GL_POLYGON= global i32 9
@GL_PROJECTION= global i32 5889
@GL_DEPTH_BUFFER_BIT= global i32 256
@GL_MODELVIEW= global i32 5888
@GL_DEPTH_TEST= global i32 2929
@GL_BLEND= global i32 3042
@GL_SRC_ALPHA= global i32 770
@GL_ONE_MINUS_SRC_ALPHA= global i32 771
@GL_ONE= global i32 1
@GL_LIGHT0= global i32 16384
@GL_LIGHTING= global i32 2896
@GL_POSITION= global i32 4611
@GL_DIFFUSE= global i32 4609
@GL_FRONT_AND_BACK= global i32 1032
@fullscreen= global i32 0
@key= common global %.struct2 zeroinitializer
define void @downKey(i8 %k.v, i32 %x.v, i32 %y.v) nounwind ssp {
entry:
  %k = alloca i8
  store i8 %k.v, i8* %k
  %x = alloca i32
  store i32 %x.v, i32* %x
  %y = alloca i32
  store i32 %y.v, i32* %y
  %..12 = load i8* %k
  %..14 = load i8* @GLUT_KEY_UP
  %..1663 = icmp eq i8 %..14, %..12
  %..15 = zext i1 %..1663 to i64
  %reg_1664 = icmp ne i64 %..15, 0
  br i1 %reg_1664, label %switch13_0, label %switch13_case1
switch13_case1:
  %..16 = load i8* @GLUT_KEY_DOWN
  %..1665 = icmp eq i8 %..16, %..12
  %..17 = zext i1 %..1665 to i64
  %reg_1666 = icmp ne i64 %..17, 0
  br i1 %reg_1666, label %switch13_1, label %switch13_case2
switch13_case2:
  %..18 = load i8* @GLUT_KEY_LEFT
  %..1667 = icmp eq i8 %..18, %..12
  %..19 = zext i1 %..1667 to i64
  %reg_1668 = icmp ne i64 %..19, 0
  br i1 %reg_1668, label %switch13_2, label %switch13_case3
switch13_case3:
  %..20 = load i8* @GLUT_KEY_RIGHT
  %..1669 = icmp eq i8 %..20, %..12
  %..21 = zext i1 %..1669 to i64
  %reg_1670 = icmp ne i64 %..21, 0
  br i1 %reg_1670, label %switch13_3, label %switch13_case4
switch13_case4:
  %..22 = load i8* @GLUT_KEY_SPACE
  %..1671 = icmp eq i8 %..22, %..12
  %..23 = zext i1 %..1671 to i64
  %reg_1672 = icmp ne i64 %..23, 0
  br i1 %reg_1672, label %switch13_4, label %switch13_case5
switch13_case5:
  br label %switch13_end
switch13__block:
  br label %switch13_0
switch13_0:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   up )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..24 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..24)
  %..26 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..24, i32* %..26
  br label %switch13_end
break27:
  br label %switch13_1
switch13_1:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   down )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..28 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..28)
  %..30 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..28, i32* %..30
  br label %switch13_end
break31:
  br label %switch13_2
switch13_2:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   left )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..32 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..32)
  %..34 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..32, i32* %..34
  br label %switch13_end
break35:
  br label %switch13_3
switch13_3:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   right )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..36 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..36)
  %..38 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..36, i32* %..38
  br label %switch13_end
break39:
  br label %switch13_4
switch13_4:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   shot )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   space )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..40 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..40)
  %..42 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..40, i32* %..42
  ; b2 RL(Ti(32),..40)
  %..43 = getelementptr inbounds %.struct2* @key, i32 0, i32 5
  store i32 %..40, i32* %..43
  br label %switch13_end
break44:
  br label %switch13_end
switch13_end:
  br label %leave11
leave11:
  ret void
}
define void @upKey(i8 %k.v, i32 %x.v, i32 %y.v) nounwind ssp {
entry:
  %k = alloca i8
  store i8 %k.v, i8* %k
  %x = alloca i32
  store i32 %x.v, i32* %x
  %y = alloca i32
  store i32 %y.v, i32* %y
  %..46 = load i8* %k
  %..48 = load i8* @GLUT_KEY_UP
  %..1673 = icmp eq i8 %..48, %..46
  %..49 = zext i1 %..1673 to i64
  %reg_1674 = icmp ne i64 %..49, 0
  br i1 %reg_1674, label %switch47_0, label %switch47_case1
switch47_case1:
  %..50 = load i8* @GLUT_KEY_DOWN
  %..1675 = icmp eq i8 %..50, %..46
  %..51 = zext i1 %..1675 to i64
  %reg_1676 = icmp ne i64 %..51, 0
  br i1 %reg_1676, label %switch47_1, label %switch47_case2
switch47_case2:
  %..52 = load i8* @GLUT_KEY_LEFT
  %..1677 = icmp eq i8 %..52, %..46
  %..53 = zext i1 %..1677 to i64
  %reg_1678 = icmp ne i64 %..53, 0
  br i1 %reg_1678, label %switch47_2, label %switch47_case3
switch47_case3:
  %..54 = load i8* @GLUT_KEY_RIGHT
  %..1679 = icmp eq i8 %..54, %..46
  %..55 = zext i1 %..1679 to i64
  %reg_1680 = icmp ne i64 %..55, 0
  br i1 %reg_1680, label %switch47_3, label %switch47_case4
switch47_case4:
  %..56 = load i8* @GLUT_KEY_SPACE
  %..1681 = icmp eq i8 %..56, %..46
  %..57 = zext i1 %..1681 to i64
  %reg_1682 = icmp ne i64 %..57, 0
  br i1 %reg_1682, label %switch47_4, label %switch47_case5
switch47_case5:
  %..1683 = icmp eq i8 27, %..46
  %..59 = zext i1 %..1683 to i64
  %reg_1684 = icmp ne i64 %..59, 0
  br i1 %reg_1684, label %switch47_5, label %switch47_case6
switch47_case6:
  br label %switch47_end
switch47__block:
  br label %switch47_0
switch47_0:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   up )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..60 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..60)
  %..62 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..60, i32* %..62
  br label %switch47_end
break63:
  br label %switch47_1
switch47_1:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   down )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..64 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..64)
  %..66 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..64, i32* %..66
  br label %switch47_end
break67:
  br label %switch47_2
switch47_2:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   left )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..68 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..68)
  %..70 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..68, i32* %..70
  br label %switch47_end
break71:
  br label %switch47_3
switch47_3:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   right )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..72 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..72)
  %..74 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..72, i32* %..74
  br label %switch47_end
break75:
  br label %switch47_4
switch47_4:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   shot )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   space )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32), shot -> Ti(32)))),key)
  %..76 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..76)
  %..78 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..76, i32* %..78
  ; b2 RL(Ti(32),..76)
  %..79 = getelementptr inbounds %.struct2* @key, i32 0, i32 5
  store i32 %..76, i32* %..79
  br label %switch47_end
break80:
  br label %switch47_5
switch47_5:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch47_end
break84:
  br label %switch47_end
switch47_end:
  br label %leave45
leave45:
  ret void
}
@ship= common global %.struct8* zeroinitializer
@enemies= common global [10 x %.struct5*] zeroinitializer
@enemiesCnt= global i32 10
@bullets= common global [50 x %.struct9*] zeroinitializer
@bulletsCnt= global i32 50
@particles= common global [50 x %.struct9*] zeroinitializer
@particlesCnt= global i32 50
@shots= common global [10 x %.struct10*] zeroinitializer
@shotsCnt= global i32 10
@score= global i32 0
@rank= global i32 0
@randomValue= global i32 1143241
define i32 @main(i32 %argc.v, i8** %argv.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %argc = alloca i32
  store i32 %argc.v, i32* %argc
  %argv = alloca i8**
  store i8** %argv.v, i8*** %argv
  ; EId ship
  %..86 = call %.struct8* @newShip(double 0x406cc00000000000, double 0x407c200000000000) nounwind ssp
  %..89 = bitcast %.struct8* %..86 to %.struct8*
  store %.struct8* %..89, %.struct8** @ship
  %..91 = load %.struct8** @ship
  call void @Ship_init(%.struct8* %..91) nounwind ssp
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for93
for93:
  %..97 = load i32* %i
  %..98 = load i32* @bulletsCnt
  %..1685 = icmp slt i32 %..97, %..98
  %..96 = zext i1 %..1685 to i64
  %reg_1686 = icmp ne i64 %..96, 0
  br i1 %reg_1686, label %ok92, label %endfor94
ok92:
  %..99 = bitcast [50 x %.struct9*]* @bullets to %.struct9**
  %..100 = load i32* %i
  %..101 = call %.struct9* @newBullet() nounwind ssp
  %..102 = bitcast %.struct9** %..99 to %.struct9**
  %..103 = getelementptr inbounds %.struct9** %..102, i32 %..100
  store %.struct9* %..101, %.struct9** %..103
  ; EId i
  %..107 = load i32* %i
  %..106 = zext i32 %..107 to i64
  %..105 = add i64 %..106, 1
  %..104 = trunc i64 %..105 to i32
  store i32 %..104, i32* %i
  br label %for93
endfor94:
  %.1 = alloca i32
  ; EId .1
  store i32 0, i32* %.1
  br label %for110
for110:
  %..114 = load i32* %.1
  %..115 = load i32* @particlesCnt
  %..1687 = icmp slt i32 %..114, %..115
  %..113 = zext i1 %..1687 to i64
  %reg_1688 = icmp ne i64 %..113, 0
  br i1 %reg_1688, label %ok109, label %endfor111
ok109:
  %..116 = bitcast [50 x %.struct9*]* @particles to %.struct9**
  %..117 = load i32* %i
  %..118 = call %.struct9* @newParticle() nounwind ssp
  %..119 = bitcast %.struct9** %..116 to %.struct9**
  %..120 = getelementptr inbounds %.struct9** %..119, i32 %..117
  store %.struct9* %..118, %.struct9** %..120
  ; EId .1
  %..124 = load i32* %.1
  %..123 = zext i32 %..124 to i64
  %..122 = add i64 %..123, 1
  %..121 = trunc i64 %..122 to i32
  store i32 %..121, i32* %.1
  br label %for110
endfor111:
  ; EId i
  %..129 = trunc i64 0 to i32
  store i32 %..129, i32* %i
  br label %for127
for127:
  %..132 = load i32* %i
  %..133 = load i32* @shotsCnt
  %..1689 = icmp slt i32 %..132, %..133
  %..131 = zext i1 %..1689 to i64
  %reg_1690 = icmp ne i64 %..131, 0
  br i1 %reg_1690, label %ok126, label %endfor128
ok126:
  %..134 = bitcast [10 x %.struct10*]* @shots to %.struct10**
  %..135 = load i32* %i
  %..136 = call %.struct10* @newShot() nounwind ssp
  %..137 = bitcast %.struct10** %..134 to %.struct10**
  %..138 = getelementptr inbounds %.struct10** %..137, i32 %..135
  store %.struct10* %..136, %.struct10** %..138
  ; EId i
  %..142 = load i32* %i
  %..141 = zext i32 %..142 to i64
  %..140 = add i64 %..141, 1
  %..139 = trunc i64 %..140 to i32
  store i32 %..139, i32* %i
  br label %for127
endfor128:
  ; EId i
  %..147 = trunc i64 0 to i32
  store i32 %..147, i32* %i
  br label %for145
for145:
  %..150 = load i32* %i
  %..151 = load i32* @enemiesCnt
  %..1691 = icmp slt i32 %..150, %..151
  %..149 = zext i1 %..1691 to i64
  %reg_1692 = icmp ne i64 %..149, 0
  br i1 %reg_1692, label %ok144, label %endfor146
ok144:
  %..152 = bitcast [10 x %.struct5*]* @enemies to %.struct5**
  %..153 = load i32* %i
  %..154 = call %.struct5* @newEnemy() nounwind ssp
  %..155 = bitcast %.struct5** %..152 to %.struct5**
  %..156 = getelementptr inbounds %.struct5** %..155, i32 %..153
  store %.struct5* %..154, %.struct5** %..156
  ; EId i
  %..160 = load i32* %i
  %..159 = zext i32 %..160 to i64
  %..158 = add i64 %..159, 1
  %..157 = trunc i64 %..158 to i32
  store i32 %..157, i32* %i
  br label %for145
endfor146:
  %..163 = load i8*** %argv
  call void @glutInit(i32* %argc, i8** %..163) nounwind ssp
  call void @glutInitWindowSize(i32 640, i32 480) nounwind ssp
  %..172 = bitcast i64 0 to i64
  %reg_1693 = icmp ne i64 %..172, 0
  br i1 %reg_1693, label %ok167, label %else168
ok167:
  %..175 = bitcast [14 x i8]* @.str1694 to i8*
  call void @glutGameModeString(i8* %..175) nounwind ssp
  call void @glutEnterGameMode() nounwind ssp
  br label %else169
else169:
  br label %endif170
else168:
  %..178 = load i8*** %argv
  %..180 = bitcast i8** %..178 to i8**
  %..181 = getelementptr inbounds i8** %..180, i64 0
  %..182 = load i8** %..181
  call void @glutCreateWindow(i8* %..182) nounwind ssp
  br label %endif171
endif171:
  br label %endif170
endif170:
  %..184 = load i32* @GLUT_RGBA
  call void @glutInitDisplayMode(i32 %..184) nounwind ssp
  %..186 = load i32* @GL_BLEND
  call void @glEnable(i32 %..186) nounwind ssp
  %..188 = load i32* @GL_LIGHTING
  call void @glEnable(i32 %..188) nounwind ssp
  %..190 = load i32* @GL_LIGHT0
  call void @glEnable(i32 %..190) nounwind ssp
  call void @glutDisplayFunc(void()* @main_display) nounwind ssp
  call void @glutTimerFunc(i32 20, void(i32)* @main_loop, i32 0) nounwind ssp
  call void @glutSpecialFunc(void(i8, i32, i32)* @downKey) nounwind ssp
  call void @glutSpecialUpFunc(void(i8, i32, i32)* @upKey) nounwind ssp
  call void @glutMainLoop() nounwind ssp
  br label %leave85
leave85:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..1695 = load i32* %..retVal
  ret i32 %..1695
}
@.str1694= private constant [14 x i8] c"640x480:32@60\00"
define void @main_loop(i32 %a.v) nounwind ssp {
entry:
  %a = alloca i32
  store i32 %a.v, i32* %a
  call void @onEnter() nounwind ssp
  %..201 = sdiv i32 1000, 50
  call void @glutTimerFunc(i32 %..201, void(i32)* @main_loop, i32 0) nounwind ssp
  br label %leave198
leave198:
  ret void
}
define double @random() nounwind ssp {
entry:
  %..retVal = alloca double
  ; EId randomValue
  %..210 = load i32* @randomValue
  %..209 = zext i32 %..210 to i64
  %..208 = mul i64 %..209, 143242143
  %..207 = add i64 %..208, 432414321
  %..206 = trunc i64 %..207 to i32
  store i32 %..206, i32* @randomValue
  %a = alloca double
  ; EId a
  store double 0x421ffffffffc0000, double* %a
  ; EId randomValue
  %..217 = load i32* @randomValue
  %..216 = zext i32 %..217 to i64
  %..215 = and i64 %..216, 2147483647
  %..214 = trunc i64 %..215 to i32
  store i32 %..214, i32* @randomValue
  %b = alloca double
  ; EId b
  %..220 = load i32* @randomValue
  %..219 = sitofp i32 %..220 to double
  store double %..219, double* %b
  %..222 = bitcast [3 x i8]* @.str1696 to i8*
  call void @println(i8* %..222) nounwind ssp
  %..224 = load double* %b
  call void @print_d(double %..224) nounwind ssp
  %..226 = load double* %b
  %..227 = load double* %a
  %..225 = fdiv double %..226, %..227
  br label %leave205
leave205:
  store double %..225, double* %..retVal
  br label %..leave
..leave:
  %..1697 = load double* %..retVal
  ret double %..1697
}
@.str1696= private constant [3 x i8] c"b=\00"
define void @onEnter() nounwind ssp {
entry:
  %cnt = alloca i64
  ; EId cnt
  store i64 0, i64* %cnt
  %enemy = alloca %.struct5*
  %i = alloca i64
  ; EId i
  store i64 0, i64* %i
  br label %for231
for231:
  %..235 = load i64* %i
  %..237 = load i32* @enemiesCnt
  %..236 = zext i32 %..237 to i64
  %..1698 = icmp slt i64 %..235, %..236
  %..234 = zext i1 %..1698 to i64
  %reg_1699 = icmp ne i64 %..234, 0
  br i1 %reg_1699, label %ok230, label %endfor232
ok230:
  ; EId enemy
  %..238 = bitcast [10 x %.struct5*]* @enemies to %.struct5**
  %..239 = load i64* %i
  %..240 = bitcast %.struct5** %..238 to %.struct5**
  %..241 = getelementptr inbounds %.struct5** %..240, i64 %..239
  %..242 = load %.struct5** %..241
  %..243 = bitcast %.struct5* %..242 to %.struct5*
  store %.struct5* %..243, %.struct5** %enemy
  %..250 = load %.struct5** %enemy
  %..251 = getelementptr inbounds %.struct5* %..250, i32 0, i32 2
  %..252 = load i32* %..251
  %..249 = zext i32 %..252 to i64
  %reg_1700 = icmp ne i64 %..249, 0
  br i1 %reg_1700, label %ok244, label %else245
ok244:
  ; EId cnt
  %..254 = load i64* %cnt
  %..253 = add i64 %..254, 1
  store i64 %..253, i64* %cnt
  %..256 = load %.struct5** %enemy
  %..257 = load %.struct5** %enemy
  %..258 = getelementptr inbounds %.struct5* %..257, i32 0, i32 6
  %..259 = load void(%.struct5*)** %..258
  call void %..259(%.struct5* %..256) nounwind ssp
  br label %else246
else246:
  br label %endif247
else245:
  ; void
  br label %endif248
endif248:
  br label %endif247
endif247:
  ; EId i
  %..262 = load i64* %i
  %..261 = add i64 %..262, 1
  store i64 %..261, i64* %i
  br label %for231
endfor232:
  %..272 = load i64* %cnt
  %..1701 = icmp eq i64 %..272, 0
  %..271 = zext i1 %..1701 to i64
  %..277 = call double @random() nounwind ssp
  %..278 = sitofp i64 100 to double
  %..276 = fmul double %..277, %..278
  %..275 = fptosi double %..276 to i32
  %..280 = load i32* @rank
  %..1702 = icmp slt i32 %..275, %..280
  %..274 = zext i1 %..1702 to i64
  %..270 = or i64 %..271, %..274
  %..269 = bitcast i64 %..270 to i64
  %reg_1703 = icmp ne i64 %..269, 0
  br i1 %reg_1703, label %ok264, label %else265
ok264:
  %rn1 = alloca double
  ; EId rn1
  %..282 = call double @random() nounwind ssp
  %..283 = sitofp i64 3 to double
  %..281 = fmul double %..282, %..283
  store double %..281, double* %rn1
  %rnd = alloca i32
  ; EId rnd
  %..286 = load double* %rn1
  %..285 = fptosi double %..286 to i32
  store i32 %..285, i32* %rnd
  %..287 = load i32* %rnd
  %..1704 = icmp eq i32 0, %..287
  %..290 = zext i1 %..1704 to i64
  %reg_1705 = icmp ne i64 %..290, 0
  br i1 %reg_1705, label %switch288_0, label %switch288_case1
switch288_case1:
  %..1706 = icmp eq i32 1, %..287
  %..292 = zext i1 %..1706 to i64
  %reg_1707 = icmp ne i64 %..292, 0
  br i1 %reg_1707, label %switch288_1, label %switch288_case2
switch288_case2:
  %..1708 = icmp eq i32 2, %..287
  %..294 = zext i1 %..1708 to i64
  %reg_1709 = icmp ne i64 %..294, 0
  br i1 %reg_1709, label %switch288_2, label %switch288_case3
switch288_case3:
  br label %switch288_end
switch288__block:
  br label %switch288_0
switch288_0:
  ; 
  %..298 = call double @random() nounwind ssp
  %..297 = fmul double %..298, 0x4069000000000000
  call void @addEnemy(double 0x0, double %..297, double 0x0) nounwind ssp
  br label %switch288_end
break301:
  br label %switch288_1
switch288_1:
  ; 
  %..304 = call double @random() nounwind ssp
  %..303 = fmul double %..304, 0x407d100000000000
  %..308 = load double* @PI
  %..307 = fdiv double %..308, 0x4000000000000000
  call void @addEnemy(double %..303, double 0x0, double %..307) nounwind ssp
  br label %switch288_end
break310:
  br label %switch288_2
switch288_2:
  ; 
  %..314 = call double @random() nounwind ssp
  %..313 = fmul double %..314, 0x4069000000000000
  %..316 = load double* @PI
  call void @addEnemy(double 0x407d100000000000, double %..313, double %..316) nounwind ssp
  br label %switch288_end
break317:
  br label %switch288_end
switch288_end:
  br label %else266
else266:
  br label %endif267
else265:
  ; void
  br label %endif268
endif268:
  br label %endif267
endif267:
  %..324 = load %.struct8** @ship
  %..325 = getelementptr inbounds %.struct8* %..324, i32 0, i32 2
  %..326 = load i32* %..325
  %..323 = zext i32 %..326 to i64
  %reg_1710 = icmp ne i64 %..323, 0
  br i1 %reg_1710, label %ok318, label %else319
ok318:
  %..328 = load %.struct8** @ship
  call void @Ship_move(%.struct8* %..328) nounwind ssp
  br label %else320
else320:
  br label %endif321
else319:
  ; void
  br label %endif322
endif322:
  br label %endif321
endif321:
  ; EId i
  store i64 0, i64* %i
  br label %for330
for330:
  %..334 = load i64* %i
  %..336 = load i32* @bulletsCnt
  %..335 = zext i32 %..336 to i64
  %..1711 = icmp slt i64 %..334, %..335
  %..333 = zext i1 %..1711 to i64
  %reg_1712 = icmp ne i64 %..333, 0
  br i1 %reg_1712, label %ok329, label %endfor331
ok329:
  %b = alloca %.struct9*
  ; EId b
  %..337 = bitcast [50 x %.struct9*]* @bullets to %.struct9**
  %..338 = load i64* %i
  %..339 = bitcast %.struct9** %..337 to %.struct9**
  %..340 = getelementptr inbounds %.struct9** %..339, i64 %..338
  %..341 = load %.struct9** %..340
  %..342 = bitcast %.struct9* %..341 to %.struct9*
  store %.struct9* %..342, %.struct9** %b
  %..349 = load %.struct9** %b
  %..350 = getelementptr inbounds %.struct9* %..349, i32 0, i32 2
  %..351 = load i32* %..350
  %..348 = zext i32 %..351 to i64
  %reg_1713 = icmp ne i64 %..348, 0
  br i1 %reg_1713, label %ok343, label %else344
ok343:
  %..353 = load %.struct9** %b
  %..352 = call i32 @Bullet_move(%.struct9* %..353) nounwind ssp
  %..363 = load %.struct8** @ship
  %..364 = getelementptr inbounds %.struct8* %..363, i32 0, i32 4
  %..365 = load i32* %..364
  %..362 = zext i32 %..365 to i64
  %..369 = load %.struct8** @ship
  %..370 = getelementptr inbounds %.struct8* %..369, i32 0, i32 0
  %..371 = load double* %..370
  %..372 = load %.struct9** %b
  %..373 = getelementptr inbounds %.struct9* %..372, i32 0, i32 0
  %..374 = load double* %..373
  %..368 = fsub double %..371, %..374
  %..367 = call double @abs(double %..368) nounwind ssp
  %..375 = sitofp i64 3 to double
  %..1714 = fcmp olt double %..367, %..375
  %..366 = zext i1 %..1714 to i64
  %..361 = and i64 %..362, %..366
  %..380 = load %.struct8** @ship
  %..381 = getelementptr inbounds %.struct8* %..380, i32 0, i32 1
  %..382 = load double* %..381
  %..383 = load %.struct9** %b
  %..384 = getelementptr inbounds %.struct9* %..383, i32 0, i32 1
  %..385 = load double* %..384
  %..379 = fsub double %..382, %..385
  %..378 = call double @abs(double %..379) nounwind ssp
  %..386 = sitofp i64 3 to double
  %..1715 = fcmp olt double %..378, %..386
  %..377 = zext i1 %..1715 to i64
  %..360 = and i64 %..361, %..377
  %..359 = bitcast i64 %..360 to i64
  %reg_1716 = icmp ne i64 %..359, 0
  br i1 %reg_1716, label %ok354, label %else355
ok354:
  %..389 = load %.struct8** @ship
  %..390 = getelementptr inbounds %.struct8* %..389, i32 0, i32 0
  %..391 = load double* %..390
  %..392 = load %.struct8** @ship
  %..393 = getelementptr inbounds %.struct8* %..392, i32 0, i32 1
  %..394 = load double* %..393
  call void @addParticles(double %..391, double %..394, i32 100) nounwind ssp
  ; EField EField(   TDef(bool),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     ship   ),   exists )
  %..396 = load %.struct8** @ship
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..396)
  %..397 = load i32* @false
  ; b2 RL(Ti(32),..397)
  %..398 = getelementptr inbounds %.struct8* %..396, i32 0, i32 4
  store i32 %..397, i32* %..398
  ; EField EField(   TDef(bool),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     ship   ),   visible )
  %..399 = load %.struct8** @ship
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..399)
  %..400 = load i32* @false
  ; b2 RL(Ti(32),..400)
  %..401 = getelementptr inbounds %.struct8* %..399, i32 0, i32 2
  store i32 %..400, i32* %..401
  br label %else356
else356:
  br label %endif357
else355:
  ; void
  br label %endif358
endif358:
  br label %endif357
endif357:
  br label %else345
else345:
  br label %endif346
else344:
  ; void
  br label %endif347
endif347:
  br label %endif346
endif346:
  ; EId i
  %..403 = load i64* %i
  %..402 = add i64 %..403, 1
  store i64 %..402, i64* %i
  br label %for330
endfor331:
  ; EId i
  store i64 0, i64* %i
  br label %for406
for406:
  %..410 = load i64* %i
  %..412 = load i32* @shotsCnt
  %..411 = zext i32 %..412 to i64
  %..1717 = icmp slt i64 %..410, %..411
  %..409 = zext i1 %..1717 to i64
  %reg_1718 = icmp ne i64 %..409, 0
  br i1 %reg_1718, label %ok405, label %endfor407
ok405:
  %s = alloca %.struct10*
  ; EId s
  %..413 = bitcast [10 x %.struct10*]* @shots to %.struct10**
  %..414 = load i64* %i
  %..415 = bitcast %.struct10** %..413 to %.struct10**
  %..416 = getelementptr inbounds %.struct10** %..415, i64 %..414
  %..417 = load %.struct10** %..416
  %..418 = bitcast %.struct10* %..417 to %.struct10*
  store %.struct10* %..418, %.struct10** %s
  %..425 = load %.struct10** %s
  %..426 = getelementptr inbounds %.struct10* %..425, i32 0, i32 2
  %..427 = load i32* %..426
  %..424 = zext i32 %..427 to i64
  %reg_1719 = icmp ne i64 %..424, 0
  br i1 %reg_1719, label %ok419, label %else420
ok419:
  %j = alloca i64
  ; EId j
  store i64 0, i64* %j
  br label %for429
for429:
  %..433 = load i64* %j
  %..435 = load i32* @enemiesCnt
  %..434 = zext i32 %..435 to i64
  %..1720 = icmp slt i64 %..433, %..434
  %..432 = zext i1 %..1720 to i64
  %reg_1721 = icmp ne i64 %..432, 0
  br i1 %reg_1721, label %ok428, label %endfor430
ok428:
  ; EId enemy
  %..436 = bitcast [10 x %.struct5*]* @enemies to %.struct5**
  %..437 = load i64* %j
  %..438 = bitcast %.struct5** %..436 to %.struct5**
  %..439 = getelementptr inbounds %.struct5** %..438, i64 %..437
  %..440 = load %.struct5** %..439
  %..441 = bitcast %.struct5* %..440 to %.struct5*
  store %.struct5* %..441, %.struct5** %enemy
  %..451 = load %.struct5** %enemy
  %..452 = getelementptr inbounds %.struct5* %..451, i32 0, i32 2
  %..453 = load i32* %..452
  %..450 = zext i32 %..453 to i64
  %..457 = load %.struct5** %enemy
  %..458 = getelementptr inbounds %.struct5* %..457, i32 0, i32 0
  %..459 = load double* %..458
  %..460 = load %.struct10** %s
  %..461 = getelementptr inbounds %.struct10* %..460, i32 0, i32 0
  %..462 = load double* %..461
  %..456 = fsub double %..459, %..462
  %..455 = call double @abs(double %..456) nounwind ssp
  %..463 = sitofp i64 30 to double
  %..1722 = fcmp olt double %..455, %..463
  %..454 = zext i1 %..1722 to i64
  %..449 = and i64 %..450, %..454
  %..468 = load %.struct5** %enemy
  %..469 = getelementptr inbounds %.struct5* %..468, i32 0, i32 1
  %..470 = load double* %..469
  %..471 = load %.struct10** %s
  %..472 = getelementptr inbounds %.struct10* %..471, i32 0, i32 1
  %..473 = load double* %..472
  %..467 = fsub double %..470, %..473
  %..466 = call double @abs(double %..467) nounwind ssp
  %..474 = sitofp i64 30 to double
  %..1723 = fcmp olt double %..466, %..474
  %..465 = zext i1 %..1723 to i64
  %..448 = and i64 %..449, %..465
  %..447 = bitcast i64 %..448 to i64
  %reg_1724 = icmp ne i64 %..447, 0
  br i1 %reg_1724, label %ok442, label %else443
ok442:
  ; EId score
  %..479 = load i32* @score
  %..478 = zext i32 %..479 to i64
  %..477 = add i64 %..478, 100
  %..476 = trunc i64 %..477 to i32
  store i32 %..476, i32* @score
  ; EId rank
  %..484 = load i32* @score
  %..483 = zext i32 %..484 to i64
  %..482 = sdiv i64 %..483, 1000
  %..481 = trunc i64 %..482 to i32
  store i32 %..481, i32* @rank
  %..487 = load %.struct5** %enemy
  %..488 = getelementptr inbounds %.struct5* %..487, i32 0, i32 0
  %..489 = load double* %..488
  %..490 = load %.struct5** %enemy
  %..491 = getelementptr inbounds %.struct5* %..490, i32 0, i32 1
  %..492 = load double* %..491
  call void @addParticles(double %..489, double %..492, i32 30) nounwind ssp
  ; EField EField(   TDef(bool),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     enemy   ),   visible )
  %..494 = load %.struct5** %enemy
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..494)
  %..495 = load i32* @false
  ; b2 RL(Ti(32),..495)
  %..496 = getelementptr inbounds %.struct5* %..494, i32 0, i32 2
  store i32 %..495, i32* %..496
  br label %else444
else444:
  br label %endif445
else443:
  ; void
  br label %endif446
endif446:
  br label %endif445
endif445:
  ; EId j
  %..498 = load i64* %j
  %..497 = add i64 %..498, 1
  store i64 %..497, i64* %j
  br label %for429
endfor430:
  %..501 = load %.struct10** %s
  %..500 = call i32 @Shot_move(%.struct10* %..501) nounwind ssp
  br label %else421
else421:
  br label %endif422
else420:
  ; void
  br label %endif423
endif423:
  br label %endif422
endif422:
  ; EId i
  %..503 = load i64* %i
  %..502 = add i64 %..503, 1
  store i64 %..502, i64* %i
  br label %for406
endfor407:
  ; EId i
  store i64 0, i64* %i
  br label %for506
for506:
  %..510 = load i64* %i
  %..512 = load i32* @particlesCnt
  %..511 = zext i32 %..512 to i64
  %..1725 = icmp slt i64 %..510, %..511
  %..509 = zext i1 %..1725 to i64
  %reg_1726 = icmp ne i64 %..509, 0
  br i1 %reg_1726, label %ok505, label %endfor507
ok505:
  %p = alloca %.struct9*
  ; EId p
  %..513 = bitcast [50 x %.struct9*]* @particles to %.struct9**
  %..514 = load i64* %i
  %..515 = bitcast %.struct9** %..513 to %.struct9**
  %..516 = getelementptr inbounds %.struct9** %..515, i64 %..514
  %..517 = load %.struct9** %..516
  %..518 = bitcast %.struct9* %..517 to %.struct9*
  store %.struct9* %..518, %.struct9** %p
  %..520 = load i64* %i
  call void @print_l(i64 %..520) nounwind ssp
  %..522 = load %.struct9** %p
  %..523 = getelementptr inbounds %.struct9* %..522, i32 0, i32 2
  %..524 = load i32* %..523
  call void @print_i(i32 %..524) nounwind ssp
  ; EId i
  %..526 = load i64* %i
  %..525 = add i64 %..526, 1
  store i64 %..525, i64* %i
  br label %for506
endfor507:
  br label %leave228
leave228:
  ret void
}
define void @main_display() nounwind ssp {
entry:
  %WIDTH = alloca i32
  ; EId WIDTH
  store i32 640, i32* %WIDTH
  %HEIGHT = alloca i32
  ; EId HEIGHT
  store i32 480, i32* %HEIGHT
  %..533 = load i32* @GL_COLOR_BUFFER_BIT
  %..534 = load i32* @GL_DEPTH_BUFFER_BIT
  %..532 = or i32 %..533, %..534
  call void @glClear(i32 %..532) nounwind ssp
  call void @glViewport(i32 0, i32 0, i32 640, i32 480) nounwind ssp
  %..541 = load i32* @GL_PROJECTION
  call void @glMatrixMode(i32 %..541) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..547 = load i32* %WIDTH
  %..550 = load i32* %HEIGHT
  %..549 = sitofp i32 %..550 to double
  %..548 = fptosi double %..549 to i32
  %..546 = sdiv i32 %..547, %..548
  %..545 = sitofp i32 %..546 to double
  call void @gluPerspective(double 0x4056800000000000, double %..545, double 0x3ff0000000000000, double 0x40c3880000000000) nounwind ssp
  %n = alloca float
  ; EId n
  store float 0x4024000000000000, float* %n
  %lightpos = alloca [4 x float]
  %..554 = bitcast [4 x float]* %lightpos to float*
  %..560 = load float* %n
  %..559 = fpext float %..560 to double
  %..557 = fmul double 0x407f400000000000, %..559
  %..556 = fptrunc double %..557 to float
  %..561 = bitcast float* %..554 to float*
  %..562 = getelementptr inbounds float* %..561, i64 0
  store float %..556, float* %..562
  %..563 = bitcast [4 x float]* %lightpos to float*
  %..569 = load float* %n
  %..568 = fpext float %..569 to double
  %..566 = fmul double 0x4089100000000000, %..568
  %..565 = fptrunc double %..566 to float
  %..570 = bitcast float* %..563 to float*
  %..571 = getelementptr inbounds float* %..570, i64 1
  store float %..565, float* %..571
  %..572 = bitcast [4 x float]* %lightpos to float*
  %..578 = load float* %n
  %..577 = fpext float %..578 to double
  %..575 = fmul double 0x407f900000000000, %..577
  %..574 = fptrunc double %..575 to float
  %..579 = bitcast float* %..572 to float*
  %..580 = getelementptr inbounds float* %..579, i64 2
  store float %..574, float* %..580
  %..581 = bitcast [4 x float]* %lightpos to float*
  %..583 = fptrunc double 0x3ff0000000000000 to float
  %..585 = bitcast float* %..581 to float*
  %..586 = getelementptr inbounds float* %..585, i64 3
  store float %..583, float* %..586
  %..588 = load i32* @GL_LIGHT0
  %..589 = load i32* @GL_POSITION
  %..591 = bitcast [4 x float]* %lightpos to float*
  %..590 = bitcast float* %..591 to float*
  call void @glLightfv(i32 %..588, i32 %..589, float* %..590) nounwind ssp
  %..593 = load i32* @GL_MODELVIEW
  call void @glMatrixMode(i32 %..593) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..596 = load i32* @GL_SRC_ALPHA
  %..597 = load i32* @GL_ONE
  call void @glBlendFunc(i32 %..596, i32 %..597) nounwind ssp
  call void @gluLookAt(double 0x0, double 0x0, double 0x4074000000000000, double 0x0, double 0x0, double 0x0, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  call void @glFlush() nounwind ssp
  br label %leave528
leave528:
  ret void
}
define void @addParticles(double %x.v, double %y.v, i32 %n.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %n = alloca i32
  store i32 %n.v, i32* %n
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for611
for611:
  %..615 = load i32* %i
  %..616 = load i32* %n
  %..1727 = icmp slt i32 %..615, %..616
  %..614 = zext i1 %..1727 to i64
  %reg_1728 = icmp ne i64 %..614, 0
  br i1 %reg_1728, label %ok610, label %endfor612
ok610:
  %..618 = load double* %x
  %..619 = load double* %y
  %..621 = call double @random() nounwind ssp
  %..620 = fmul double %..621, 0x4059000000000000
  call void @addParticle(double %..618, double %..619, double %..620) nounwind ssp
  ; EId i
  %..626 = load i32* %i
  %..625 = zext i32 %..626 to i64
  %..624 = add i64 %..625, 1
  %..623 = trunc i64 %..624 to i32
  store i32 %..623, i32* %i
  br label %for611
endfor612:
  br label %leave609
leave609:
  ret void
}
define void @addBulletN(double %x.v, double %y.v, double %rad.v, i32 %n.v, double %r.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %n = alloca i32
  store i32 %n.v, i32* %n
  %r = alloca double
  store double %r.v, double* %r
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for630
for630:
  %..634 = load i32* %i
  %..635 = load i32* %n
  %..1729 = icmp slt i32 %..634, %..635
  %..633 = zext i1 %..1729 to i64
  %reg_1730 = icmp ne i64 %..633, 0
  br i1 %reg_1730, label %ok629, label %endfor631
ok629:
  %..637 = load double* %x
  %..638 = load double* %y
  %..640 = load double* %rad
  %..644 = load i32* %i
  %..648 = load i32* %n
  %..649 = fptosi double 0x4000000000000000 to i32
  %..647 = sdiv i32 %..648, %..649
  %..646 = sitofp i32 %..647 to double
  %..645 = fptosi double %..646 to i32
  %..643 = sub i32 %..644, %..645
  %..642 = sitofp i32 %..643 to double
  %..651 = load double* %r
  %..641 = fmul double %..642, %..651
  %..639 = fadd double %..640, %..641
  call void @addBullet(double %..637, double %..638, double %..639) nounwind ssp
  ; EId i
  %..655 = load i32* %i
  %..654 = zext i32 %..655 to i64
  %..653 = add i64 %..654, 1
  %..652 = trunc i64 %..653 to i32
  store i32 %..652, i32* %i
  br label %for630
endfor631:
  br label %leave628
leave628:
  ret void
}
define void @addBullet(double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for659
for659:
  %..663 = load i32* %i
  %..664 = load i32* @bulletsCnt
  %..1731 = icmp slt i32 %..663, %..664
  %..662 = zext i1 %..1731 to i64
  %reg_1732 = icmp ne i64 %..662, 0
  br i1 %reg_1732, label %ok658, label %endfor660
ok658:
  %b = alloca %.struct9*
  ; EId b
  %..665 = bitcast [50 x %.struct9*]* @bullets to %.struct9**
  %..666 = load i32* %i
  %..667 = bitcast %.struct9** %..665 to %.struct9**
  %..668 = getelementptr inbounds %.struct9** %..667, i32 %..666
  %..669 = load %.struct9** %..668
  %..670 = bitcast %.struct9* %..669 to %.struct9*
  store %.struct9* %..670, %.struct9** %b
  %..677 = load %.struct9** %b
  %..678 = getelementptr inbounds %.struct9* %..677, i32 0, i32 2
  %..679 = load i32* %..678
  %..676 = zext i32 %..679 to i64
  %reg_1733 = icmp ne i64 %..676, 0
  br i1 %reg_1733, label %ok671, label %else672
ok671:
  br label %for659
continue680:
  br label %else673
else673:
  br label %endif674
else672:
  ; void
  br label %endif675
endif675:
  br label %endif674
endif674:
  %..682 = load %.struct9** %b
  %..683 = load double* %x
  %..684 = load double* %y
  %..685 = load double* %rad
  call void @Bullet_init(%.struct9* %..682, double %..683, double %..684, double %..685) nounwind ssp
  ; void
  br label %leave657
ret686:
  ; EId i
  %..690 = load i32* %i
  %..689 = zext i32 %..690 to i64
  %..688 = add i64 %..689, 1
  %..687 = trunc i64 %..688 to i32
  store i32 %..687, i32* %i
  br label %for659
endfor660:
  br label %leave657
leave657:
  ret void
}
define void @addShot(double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for694
for694:
  %..698 = load i32* %i
  %..699 = load i32* @shotsCnt
  %..1734 = icmp slt i32 %..698, %..699
  %..697 = zext i1 %..1734 to i64
  %reg_1735 = icmp ne i64 %..697, 0
  br i1 %reg_1735, label %ok693, label %endfor695
ok693:
  %b = alloca %.struct10*
  ; EId b
  %..700 = bitcast [10 x %.struct10*]* @shots to %.struct10**
  %..701 = load i32* %i
  %..702 = bitcast %.struct10** %..700 to %.struct10**
  %..703 = getelementptr inbounds %.struct10** %..702, i32 %..701
  %..704 = load %.struct10** %..703
  %..705 = bitcast %.struct10* %..704 to %.struct10*
  store %.struct10* %..705, %.struct10** %b
  %..712 = load %.struct10** %b
  %..713 = getelementptr inbounds %.struct10* %..712, i32 0, i32 2
  %..714 = load i32* %..713
  %..711 = zext i32 %..714 to i64
  %reg_1736 = icmp ne i64 %..711, 0
  br i1 %reg_1736, label %ok706, label %else707
ok706:
  br label %for694
continue715:
  br label %else708
else708:
  br label %endif709
else707:
  ; void
  br label %endif710
endif710:
  br label %endif709
endif709:
  %..717 = load %.struct10** %b
  %..718 = load double* %x
  %..719 = load double* %y
  %..720 = load double* %rad
  call void @Shot_init(%.struct10* %..717, double %..718, double %..719, double %..720) nounwind ssp
  ; void
  br label %leave692
ret721:
  ; EId i
  %..725 = load i32* %i
  %..724 = zext i32 %..725 to i64
  %..723 = add i64 %..724, 1
  %..722 = trunc i64 %..723 to i32
  store i32 %..722, i32* %i
  br label %for694
endfor695:
  br label %leave692
leave692:
  ret void
}
define void @addParticle(double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for729
for729:
  %..733 = load i32* %i
  %..734 = load i32* @particlesCnt
  %..1737 = icmp slt i32 %..733, %..734
  %..732 = zext i1 %..1737 to i64
  %reg_1738 = icmp ne i64 %..732, 0
  br i1 %reg_1738, label %ok728, label %endfor730
ok728:
  %b = alloca %.struct9*
  ; EId b
  %..735 = bitcast [50 x %.struct9*]* @particles to %.struct9**
  %..736 = load i32* %i
  %..737 = bitcast %.struct9** %..735 to %.struct9**
  %..738 = getelementptr inbounds %.struct9** %..737, i32 %..736
  %..739 = load %.struct9** %..738
  %..740 = bitcast %.struct9* %..739 to %.struct9*
  store %.struct9* %..740, %.struct9** %b
  %..748 = load %.struct9** %b
  %..749 = getelementptr inbounds %.struct9* %..748, i32 0, i32 2
  %..750 = load i32* %..749
  %..1739 = icmp eq i32 0,  %..750
  %..747 = zext i1 %..1739 to i32
  %..746 = zext i32 %..747 to i64
  %reg_1740 = icmp ne i64 %..746, 0
  br i1 %reg_1740, label %ok741, label %else742
ok741:
  %..752 = load %.struct9** %b
  %..753 = load double* %x
  %..754 = load double* %y
  %..755 = load double* %rad
  call void @Particle_init(%.struct9* %..752, double %..753, double %..754, double %..755) nounwind ssp
  ; void
  br label %leave727
ret756:
  br label %else743
else743:
  br label %endif744
else742:
  ; void
  br label %endif745
endif745:
  br label %endif744
endif744:
  ; EId i
  %..760 = load i32* %i
  %..759 = zext i32 %..760 to i64
  %..758 = add i64 %..759, 1
  %..757 = trunc i64 %..758 to i32
  store i32 %..757, i32* %i
  br label %for729
endfor730:
  br label %leave727
leave727:
  ret void
}
define void @addEnemy(double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %i = alloca i32
  ; EId i
  store i32 0, i32* %i
  br label %for764
for764:
  %..768 = load i32* %i
  %..769 = load i32* @enemiesCnt
  %..1741 = icmp slt i32 %..768, %..769
  %..767 = zext i1 %..1741 to i64
  %reg_1742 = icmp ne i64 %..767, 0
  br i1 %reg_1742, label %ok763, label %endfor765
ok763:
  %b = alloca %.struct5*
  ; EId b
  %..770 = bitcast [10 x %.struct5*]* @enemies to %.struct5**
  %..771 = load i32* %i
  %..772 = bitcast %.struct5** %..770 to %.struct5**
  %..773 = getelementptr inbounds %.struct5** %..772, i32 %..771
  %..774 = load %.struct5** %..773
  %..775 = bitcast %.struct5* %..774 to %.struct5*
  store %.struct5* %..775, %.struct5** %b
  %..782 = load %.struct5** %b
  %..783 = getelementptr inbounds %.struct5* %..782, i32 0, i32 2
  %..784 = load i32* %..783
  %..781 = zext i32 %..784 to i64
  %reg_1743 = icmp ne i64 %..781, 0
  br i1 %reg_1743, label %ok776, label %else777
ok776:
  br label %for764
continue785:
  br label %else778
else778:
  br label %endif779
else777:
  ; void
  br label %endif780
endif780:
  br label %endif779
endif779:
  %..787 = bitcast [11 x i8]* @.str1744 to i8*
  call void @println(i8* %..787) nounwind ssp
  %..789 = load i32* %i
  call void @print_i(i32 %..789) nounwind ssp
  %..791 = load %.struct5** %b
  %..792 = load double* %x
  %..793 = load double* %y
  %..794 = load double* %rad
  call void @Enemy_init(%.struct5* %..791, double %..792, double %..793, double %..794) nounwind ssp
  ; void
  br label %leave762
ret795:
  ; EId i
  %..799 = load i32* %i
  %..798 = zext i32 %..799 to i64
  %..797 = add i64 %..798, 1
  %..796 = trunc i64 %..797 to i32
  store i32 %..796, i32* %i
  br label %for764
endfor765:
  br label %leave762
leave762:
  ret void
}
@.str1744= private constant [11 x i8] c"enemy_init\00"
define %.struct8* @newShip(double %x.v, double %y.v) nounwind ssp {
entry:
  %..retVal = alloca %.struct8*
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %this = alloca %.struct8*
  ; EId this
  %..802 = call i8* @malloc(i64 36) nounwind ssp
  %..803 = bitcast i8* %..802 to %.struct8*
  %..804 = bitcast %.struct8* %..803 to %.struct8*
  store %.struct8* %..804, %.struct8** %this
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   speed )
  %..805 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..805)
  %..806 = sitofp i64 5 to double
  ; b2 RL(Td,..806)
  %..808 = getelementptr inbounds %.struct8* %..805, i32 0, i32 3
  store double %..806, double* %..808
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   x )
  %..809 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..809)
  %..810 = load double* %x
  ; b2 RL(Td,..810)
  %..811 = getelementptr inbounds %.struct8* %..809, i32 0, i32 0
  store double %..810, double* %..811
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   y )
  %..812 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..812)
  %..813 = load double* %y
  ; b2 RL(Td,..813)
  %..814 = getelementptr inbounds %.struct8* %..812, i32 0, i32 1
  store double %..813, double* %..814
  %..815 = load %.struct8** %this
  br label %leave801
leave801:
  store %.struct8* %..815, %.struct8** %..retVal
  br label %..leave
..leave:
  %..1745 = load %.struct8** %..retVal
  ret %.struct8* %..1745
}
define void @Ship_draw(%.struct8* %ship.v) nounwind ssp {
entry:
  %ship = alloca %.struct8*
  store %.struct8* %ship.v, %.struct8** %ship
  ; void
  br label %leave816
leave816:
  ret void
}
define void @Ship_init(%.struct8* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  ; EField EField(   TDef(bool),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   exists )
  %..818 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..818)
  %..819 = load i32* @false
  ; b2 RL(Ti(32),..819)
  %..820 = getelementptr inbounds %.struct8* %..818, i32 0, i32 4
  store i32 %..819, i32* %..820
  ; EField EField(   Ti(32),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   timer )
  %..821 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..821)
  %..822 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..822)
  %..824 = getelementptr inbounds %.struct8* %..821, i32 0, i32 5
  store i32 %..822, i32* %..824
  ; EField EField(   TDef(bool),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   visible )
  %..825 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..825)
  %..826 = load i32* @true
  ; b2 RL(Ti(32),..826)
  %..827 = getelementptr inbounds %.struct8* %..825, i32 0, i32 2
  store i32 %..826, i32* %..827
  br label %leave817
leave817:
  ret void
}
define void @Ship_move(%.struct8* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  ; EField EField(   Ti(32),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   timer )
  %..829 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..829)
  %..833 = load %.struct8** %this
  %..834 = getelementptr inbounds %.struct8* %..833, i32 0, i32 5
  %..835 = load i32* %..834
  %..832 = zext i32 %..835 to i64
  %..831 = add i64 %..832, 1
  %..830 = trunc i64 %..831 to i32
  ; b2 RL(Ti(32),..830)
  %..837 = getelementptr inbounds %.struct8* %..829, i32 0, i32 5
  store i32 %..830, i32* %..837
  %..846 = load %.struct8** %this
  %..847 = getelementptr inbounds %.struct8* %..846, i32 0, i32 5
  %..848 = load i32* %..847
  %..845 = zext i32 %..848 to i64
  %..1746 = icmp sgt i64 %..845, 300
  %..844 = zext i1 %..1746 to i64
  %..843 = bitcast i64 %..844 to i64
  %reg_1747 = icmp ne i64 %..843, 0
  br i1 %reg_1747, label %ok838, label %else839
ok838:
  ; EField EField(   TDef(bool),   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   exists )
  %..850 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..850)
  %..851 = load i32* @true
  ; b2 RL(Ti(32),..851)
  %..852 = getelementptr inbounds %.struct8* %..850, i32 0, i32 4
  store i32 %..851, i32* %..852
  br label %else840
else840:
  br label %endif841
else839:
  ; void
  br label %endif842
endif842:
  br label %endif841
endif841:
  %..859 = getelementptr inbounds %.struct2* @key, i32 0, i32 5
  %..860 = load i32* %..859
  %..858 = zext i32 %..860 to i64
  %reg_1748 = icmp ne i64 %..858, 0
  br i1 %reg_1748, label %ok853, label %else854
ok853:
  %..862 = load %.struct8** %this
  %..863 = getelementptr inbounds %.struct8* %..862, i32 0, i32 0
  %..864 = load double* %..863
  %..865 = load %.struct8** %this
  %..866 = getelementptr inbounds %.struct8* %..865, i32 0, i32 1
  %..867 = load double* %..866
  %..870 = load double* @PI
  %..869 = fsub double 0.0, %..870
  %..868 = fdiv double %..869, 0x4000000000000000
  call void @addShot(double %..864, double %..867, double %..868) nounwind ssp
  br label %else855
else855:
  br label %endif856
else854:
  ; void
  br label %endif857
endif857:
  br label %endif856
endif856:
  %..878 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  %..879 = load i32* %..878
  %..877 = zext i32 %..879 to i64
  %reg_1749 = icmp ne i64 %..877, 0
  br i1 %reg_1749, label %ok872, label %else873
ok872:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   x )
  %..880 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..880)
  %..882 = load %.struct8** %this
  %..883 = getelementptr inbounds %.struct8* %..882, i32 0, i32 0
  %..884 = load double* %..883
  %..885 = load %.struct8** %this
  %..886 = getelementptr inbounds %.struct8* %..885, i32 0, i32 3
  %..887 = load double* %..886
  %..881 = fsub double %..884, %..887
  ; b2 RL(Td,..881)
  %..888 = getelementptr inbounds %.struct8* %..880, i32 0, i32 0
  store double %..881, double* %..888
  br label %else874
else874:
  br label %endif875
else873:
  ; void
  br label %endif876
endif876:
  br label %endif875
endif875:
  %..895 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  %..896 = load i32* %..895
  %..894 = zext i32 %..896 to i64
  %reg_1750 = icmp ne i64 %..894, 0
  br i1 %reg_1750, label %ok889, label %else890
ok889:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   x )
  %..897 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..897)
  %..899 = load %.struct8** %this
  %..900 = getelementptr inbounds %.struct8* %..899, i32 0, i32 0
  %..901 = load double* %..900
  %..902 = load %.struct8** %this
  %..903 = getelementptr inbounds %.struct8* %..902, i32 0, i32 3
  %..904 = load double* %..903
  %..898 = fadd double %..901, %..904
  ; b2 RL(Td,..898)
  %..905 = getelementptr inbounds %.struct8* %..897, i32 0, i32 0
  store double %..898, double* %..905
  br label %else891
else891:
  br label %endif892
else890:
  ; void
  br label %endif893
endif893:
  br label %endif892
endif892:
  %..912 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  %..913 = load i32* %..912
  %..911 = zext i32 %..913 to i64
  %reg_1751 = icmp ne i64 %..911, 0
  br i1 %reg_1751, label %ok906, label %else907
ok906:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   y )
  %..914 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..914)
  %..916 = load %.struct8** %this
  %..917 = getelementptr inbounds %.struct8* %..916, i32 0, i32 1
  %..918 = load double* %..917
  %..919 = load %.struct8** %this
  %..920 = getelementptr inbounds %.struct8* %..919, i32 0, i32 3
  %..921 = load double* %..920
  %..915 = fsub double %..918, %..921
  ; b2 RL(Td,..915)
  %..922 = getelementptr inbounds %.struct8* %..914, i32 0, i32 1
  store double %..915, double* %..922
  br label %else908
else908:
  br label %endif909
else907:
  ; void
  br label %endif910
endif910:
  br label %endif909
endif909:
  %..929 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  %..930 = load i32* %..929
  %..928 = zext i32 %..930 to i64
  %reg_1752 = icmp ne i64 %..928, 0
  br i1 %reg_1752, label %ok923, label %else924
ok923:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   y )
  %..931 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..931)
  %..933 = load %.struct8** %this
  %..934 = getelementptr inbounds %.struct8* %..933, i32 0, i32 1
  %..935 = load double* %..934
  %..936 = load %.struct8** %this
  %..937 = getelementptr inbounds %.struct8* %..936, i32 0, i32 3
  %..938 = load double* %..937
  %..932 = fadd double %..935, %..938
  ; b2 RL(Td,..932)
  %..939 = getelementptr inbounds %.struct8* %..931, i32 0, i32 1
  store double %..932, double* %..939
  br label %else925
else925:
  br label %endif926
else924:
  ; void
  br label %endif927
endif927:
  br label %endif926
endif926:
  %..947 = load %.struct8** %this
  %..948 = getelementptr inbounds %.struct8* %..947, i32 0, i32 0
  %..949 = load double* %..948
  %..950 = sitofp i64 0 to double
  %..1753 = fcmp olt double %..949, %..950
  %..946 = zext i1 %..1753 to i64
  %..945 = bitcast i64 %..946 to i64
  %reg_1754 = icmp ne i64 %..945, 0
  br i1 %reg_1754, label %ok940, label %else941
ok940:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   x )
  %..952 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..952)
  %..953 = sitofp i64 5 to double
  ; b2 RL(Td,..953)
  %..955 = getelementptr inbounds %.struct8* %..952, i32 0, i32 0
  store double %..953, double* %..955
  br label %else942
else942:
  br label %endif943
else941:
  %..963 = load %.struct8** %this
  %..964 = getelementptr inbounds %.struct8* %..963, i32 0, i32 0
  %..965 = load double* %..964
  %..966 = sitofp i64 465 to double
  %..1755 = fcmp ogt double %..965, %..966
  %..962 = zext i1 %..1755 to i64
  %..961 = bitcast i64 %..962 to i64
  %reg_1756 = icmp ne i64 %..961, 0
  br i1 %reg_1756, label %ok956, label %else957
ok956:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   x )
  %..968 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..968)
  %..969 = sitofp i64 460 to double
  ; b2 RL(Td,..969)
  %..973 = getelementptr inbounds %.struct8* %..968, i32 0, i32 0
  store double %..969, double* %..973
  br label %else958
else958:
  br label %endif959
else957:
  ; void
  br label %endif960
endif960:
  br label %endif959
endif959:
  br label %endif944
endif944:
  br label %endif943
endif943:
  %..981 = load %.struct8** %this
  %..982 = getelementptr inbounds %.struct8* %..981, i32 0, i32 1
  %..983 = load double* %..982
  %..984 = sitofp i64 0 to double
  %..1757 = fcmp olt double %..983, %..984
  %..980 = zext i1 %..1757 to i64
  %..979 = bitcast i64 %..980 to i64
  %reg_1758 = icmp ne i64 %..979, 0
  br i1 %reg_1758, label %ok974, label %else975
ok974:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   y )
  %..986 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..986)
  %..987 = sitofp i64 5 to double
  ; b2 RL(Td,..987)
  %..989 = getelementptr inbounds %.struct8* %..986, i32 0, i32 1
  store double %..987, double* %..989
  br label %else976
else976:
  br label %endif977
else975:
  %..997 = load %.struct8** %this
  %..998 = getelementptr inbounds %.struct8* %..997, i32 0, i32 1
  %..999 = load double* %..998
  %..1000 = sitofp i64 465 to double
  %..1759 = fcmp ogt double %..999, %..1000
  %..996 = zext i1 %..1759 to i64
  %..995 = bitcast i64 %..996 to i64
  %reg_1760 = icmp ne i64 %..995, 0
  br i1 %reg_1760, label %ok990, label %else991
ok990:
  ; EField EField(   Td,   Tp(TDef(Ship)),   EId(     Tp(TDef(Ship)),     this   ),   y )
  %..1002 = load %.struct8** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, exists -> Ti(32), timer -> Ti(32)))),..1002)
  %..1003 = sitofp i64 460 to double
  ; b2 RL(Td,..1003)
  %..1007 = getelementptr inbounds %.struct8* %..1002, i32 0, i32 1
  store double %..1003, double* %..1007
  br label %else992
else992:
  br label %endif993
else991:
  ; void
  br label %endif994
endif994:
  br label %endif993
endif993:
  br label %endif978
endif978:
  br label %endif977
endif977:
  br label %leave828
leave828:
  ret void
}
define %.struct5* @newEnemy() nounwind ssp {
entry:
  %..retVal = alloca %.struct5*
  %this = alloca %.struct5*
  ; EId this
  %..1009 = call i8* @malloc(i64 72) nounwind ssp
  %..1010 = bitcast i8* %..1009 to %.struct5*
  %..1011 = bitcast %.struct5* %..1010 to %.struct5*
  store %.struct5* %..1011, %.struct5** %this
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   speed )
  %..1012 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1012)
  %..1013 = sitofp i64 5 to double
  ; b2 RL(Td,..1013)
  %..1015 = getelementptr inbounds %.struct5* %..1012, i32 0, i32 3
  store double %..1013, double* %..1015
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   rad )
  %..1016 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1016)
  %..1017 = sitofp i64 0 to double
  ; b2 RL(Td,..1017)
  %..1019 = getelementptr inbounds %.struct5* %..1016, i32 0, i32 4
  store double %..1017, double* %..1019
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   r )
  %..1020 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1020)
  ; b2 RL(Td,..1021)
  %..1022 = getelementptr inbounds %.struct5* %..1020, i32 0, i32 5
  store double 0x3fa999999999999a, double* %..1022
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   r2 )
  %..1023 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1023)
  %..1024 = sitofp i64 0 to double
  ; b2 RL(Td,..1024)
  %..1026 = getelementptr inbounds %.struct5* %..1023, i32 0, i32 9
  store double %..1024, double* %..1026
  ; EField EField(   TDef(bool),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   visible )
  %..1027 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1027)
  %..1028 = load i32* @false
  ; b2 RL(Ti(32),..1028)
  %..1029 = getelementptr inbounds %.struct5* %..1027, i32 0, i32 2
  store i32 %..1028, i32* %..1029
  %..1030 = load %.struct5** %this
  br label %leave1008
leave1008:
  store %.struct5* %..1030, %.struct5** %..retVal
  br label %..leave
..leave:
  %..1761 = load %.struct5** %..retVal
  ret %.struct5* %..1761
}
define void @Enemy_draw(%.struct5* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  ; void
  br label %leave1031
leave1031:
  ret void
}
define void @Enemy_init(%.struct5* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   x )
  %..1033 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1033)
  %..1034 = load double* %x
  ; b2 RL(Td,..1034)
  %..1035 = getelementptr inbounds %.struct5* %..1033, i32 0, i32 0
  store double %..1034, double* %..1035
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   y )
  %..1036 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1036)
  %..1037 = load double* %y
  ; b2 RL(Td,..1037)
  %..1038 = getelementptr inbounds %.struct5* %..1036, i32 0, i32 1
  store double %..1037, double* %..1038
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   rad )
  %..1039 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1039)
  %..1043 = load double* %y
  %..1044 = load %.struct8** @ship
  %..1045 = getelementptr inbounds %.struct8* %..1044, i32 0, i32 1
  %..1046 = load double* %..1045
  %..1042 = fsub double %..1043, %..1046
  %..1048 = load double* %x
  %..1049 = load %.struct8** @ship
  %..1050 = getelementptr inbounds %.struct8* %..1049, i32 0, i32 0
  %..1051 = load double* %..1050
  %..1047 = fsub double %..1048, %..1051
  %..1041 = fdiv double %..1042, %..1047
  %..1040 = call double @atan(double %..1041) nounwind ssp
  ; b2 RL(Td,..1040)
  %..1052 = getelementptr inbounds %.struct5* %..1039, i32 0, i32 4
  store double %..1040, double* %..1052
  ; EField EField(   TDef(bool),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   visible )
  %..1053 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1053)
  %..1054 = load i32* @true
  ; b2 RL(Ti(32),..1054)
  %..1055 = getelementptr inbounds %.struct5* %..1053, i32 0, i32 2
  store i32 %..1054, i32* %..1055
  ; EField EField(   TFun(Tv,List(Tp(TDef(Enemy)))),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   move )
  %..1056 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1056)
  ; b2 RG(TFun(Tv,List(Tp(TDef(Enemy)))),Enemy_move1)
  %..1057 = getelementptr inbounds %.struct5* %..1056, i32 0, i32 6
  store void(%.struct5*)* @Enemy_move1, void(%.struct5*)** %..1057
  br label %leave1032
leave1032:
  ret void
}
define double @Enemy_moveBody(%.struct5* %this.v) nounwind ssp {
entry:
  %..retVal = alloca double
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %rad2 = alloca double
  ; EId rad2
  %..1061 = load %.struct8** @ship
  %..1062 = getelementptr inbounds %.struct8* %..1061, i32 0, i32 1
  %..1063 = load double* %..1062
  %..1064 = load %.struct5** %this
  %..1065 = getelementptr inbounds %.struct5* %..1064, i32 0, i32 1
  %..1066 = load double* %..1065
  %..1060 = fsub double %..1063, %..1066
  %..1068 = load %.struct8** @ship
  %..1069 = getelementptr inbounds %.struct8* %..1068, i32 0, i32 0
  %..1070 = load double* %..1069
  %..1071 = load %.struct5** %this
  %..1072 = getelementptr inbounds %.struct5* %..1071, i32 0, i32 0
  %..1073 = load double* %..1072
  %..1067 = fsub double %..1070, %..1073
  %..1059 = call double @atan2(double %..1060, double %..1067) nounwind ssp
  store double %..1059, double* %rad2
  %..1083 = load %.struct5** %this
  %..1084 = getelementptr inbounds %.struct5* %..1083, i32 0, i32 4
  %..1085 = load double* %..1084
  %..1086 = load double* %rad2
  %..1082 = fsub double %..1085, %..1086
  %..1081 = call double @normalRad(double %..1082) nounwind ssp
  %..1087 = sitofp i64 0 to double
  %..1762 = fcmp olt double %..1081, %..1087
  %..1080 = zext i1 %..1762 to i64
  %..1079 = bitcast i64 %..1080 to i64
  %reg_1763 = icmp ne i64 %..1079, 0
  br i1 %reg_1763, label %ok1074, label %else1075
ok1074:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   rad )
  %..1089 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1089)
  %..1091 = load %.struct5** %this
  %..1092 = getelementptr inbounds %.struct5* %..1091, i32 0, i32 4
  %..1093 = load double* %..1092
  %..1094 = load %.struct5** %this
  %..1095 = getelementptr inbounds %.struct5* %..1094, i32 0, i32 5
  %..1096 = load double* %..1095
  %..1090 = fadd double %..1093, %..1096
  ; b2 RL(Td,..1090)
  %..1097 = getelementptr inbounds %.struct5* %..1089, i32 0, i32 4
  store double %..1090, double* %..1097
  br label %else1076
else1076:
  br label %endif1077
else1075:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   rad )
  %..1098 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1098)
  %..1100 = load %.struct5** %this
  %..1101 = getelementptr inbounds %.struct5* %..1100, i32 0, i32 4
  %..1102 = load double* %..1101
  %..1103 = load %.struct5** %this
  %..1104 = getelementptr inbounds %.struct5* %..1103, i32 0, i32 5
  %..1105 = load double* %..1104
  %..1099 = fsub double %..1102, %..1105
  ; b2 RL(Td,..1099)
  %..1106 = getelementptr inbounds %.struct5* %..1098, i32 0, i32 4
  store double %..1099, double* %..1106
  br label %endif1078
endif1078:
  br label %endif1077
endif1077:
  %..1107 = phi double [%..1090, %else1076], [%..1099, %endif1078]
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   rad )
  %..1108 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1108)
  %..1110 = load %.struct5** %this
  %..1111 = getelementptr inbounds %.struct5* %..1110, i32 0, i32 4
  %..1112 = load double* %..1111
  %..1109 = call double @normalRad(double %..1112) nounwind ssp
  ; b2 RL(Td,..1109)
  %..1113 = getelementptr inbounds %.struct5* %..1108, i32 0, i32 4
  store double %..1109, double* %..1113
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   x )
  %..1114 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1114)
  %..1116 = load %.struct5** %this
  %..1117 = getelementptr inbounds %.struct5* %..1116, i32 0, i32 0
  %..1118 = load double* %..1117
  %..1121 = load %.struct5** %this
  %..1122 = getelementptr inbounds %.struct5* %..1121, i32 0, i32 4
  %..1123 = load double* %..1122
  %..1120 = call double @cos(double %..1123) nounwind ssp
  %..1124 = load %.struct5** %this
  %..1125 = getelementptr inbounds %.struct5* %..1124, i32 0, i32 3
  %..1126 = load double* %..1125
  %..1119 = fmul double %..1120, %..1126
  %..1115 = fadd double %..1118, %..1119
  ; b2 RL(Td,..1115)
  %..1127 = getelementptr inbounds %.struct5* %..1114, i32 0, i32 0
  store double %..1115, double* %..1127
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   y )
  %..1128 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1128)
  %..1130 = load %.struct5** %this
  %..1131 = getelementptr inbounds %.struct5* %..1130, i32 0, i32 1
  %..1132 = load double* %..1131
  %..1135 = load %.struct5** %this
  %..1136 = getelementptr inbounds %.struct5* %..1135, i32 0, i32 4
  %..1137 = load double* %..1136
  %..1134 = call double @sin(double %..1137) nounwind ssp
  %..1138 = load %.struct5** %this
  %..1139 = getelementptr inbounds %.struct5* %..1138, i32 0, i32 3
  %..1140 = load double* %..1139
  %..1133 = fmul double %..1134, %..1140
  %..1129 = fadd double %..1132, %..1133
  ; b2 RL(Td,..1129)
  %..1141 = getelementptr inbounds %.struct5* %..1128, i32 0, i32 1
  store double %..1129, double* %..1141
  %..1149 = load %.struct5** %this
  %..1150 = getelementptr inbounds %.struct5* %..1149, i32 0, i32 0
  %..1151 = load double* %..1150
  %..1152 = sitofp i64 0 to double
  %..1764 = fcmp olt double %..1151, %..1152
  %..1148 = zext i1 %..1764 to i64
  %..1147 = bitcast i64 %..1148 to i64
  %reg_1765 = icmp ne i64 %..1147, 0
  br i1 %reg_1765, label %ok1142, label %else1143
ok1142:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   x )
  %..1154 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1154)
  %..1155 = sitofp i64 5 to double
  ; b2 RL(Td,..1155)
  %..1157 = getelementptr inbounds %.struct5* %..1154, i32 0, i32 0
  store double %..1155, double* %..1157
  br label %else1144
else1144:
  br label %endif1145
else1143:
  %..1165 = load %.struct5** %this
  %..1166 = getelementptr inbounds %.struct5* %..1165, i32 0, i32 0
  %..1167 = load double* %..1166
  %..1168 = sitofp i64 465 to double
  %..1766 = fcmp ogt double %..1167, %..1168
  %..1164 = zext i1 %..1766 to i64
  %..1163 = bitcast i64 %..1164 to i64
  %reg_1767 = icmp ne i64 %..1163, 0
  br i1 %reg_1767, label %ok1158, label %else1159
ok1158:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   x )
  %..1170 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1170)
  %..1171 = sitofp i64 460 to double
  ; b2 RL(Td,..1171)
  %..1175 = getelementptr inbounds %.struct5* %..1170, i32 0, i32 0
  store double %..1171, double* %..1175
  br label %else1160
else1160:
  br label %endif1161
else1159:
  ; void
  br label %endif1162
endif1162:
  br label %endif1161
endif1161:
  br label %endif1146
endif1146:
  br label %endif1145
endif1145:
  %..1183 = load %.struct5** %this
  %..1184 = getelementptr inbounds %.struct5* %..1183, i32 0, i32 1
  %..1185 = load double* %..1184
  %..1186 = sitofp i64 0 to double
  %..1768 = fcmp olt double %..1185, %..1186
  %..1182 = zext i1 %..1768 to i64
  %..1181 = bitcast i64 %..1182 to i64
  %reg_1769 = icmp ne i64 %..1181, 0
  br i1 %reg_1769, label %ok1176, label %else1177
ok1176:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   y )
  %..1188 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1188)
  %..1189 = sitofp i64 5 to double
  ; b2 RL(Td,..1189)
  %..1191 = getelementptr inbounds %.struct5* %..1188, i32 0, i32 1
  store double %..1189, double* %..1191
  br label %else1178
else1178:
  br label %endif1179
else1177:
  %..1199 = load %.struct5** %this
  %..1200 = getelementptr inbounds %.struct5* %..1199, i32 0, i32 1
  %..1201 = load double* %..1200
  %..1202 = sitofp i64 465 to double
  %..1770 = fcmp ogt double %..1201, %..1202
  %..1198 = zext i1 %..1770 to i64
  %..1197 = bitcast i64 %..1198 to i64
  %reg_1771 = icmp ne i64 %..1197, 0
  br i1 %reg_1771, label %ok1192, label %else1193
ok1192:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   y )
  %..1204 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1204)
  %..1205 = sitofp i64 460 to double
  ; b2 RL(Td,..1205)
  %..1209 = getelementptr inbounds %.struct5* %..1204, i32 0, i32 1
  store double %..1205, double* %..1209
  br label %else1194
else1194:
  br label %endif1195
else1193:
  ; void
  br label %endif1196
endif1196:
  br label %endif1195
endif1195:
  br label %endif1180
endif1180:
  br label %endif1179
endif1179:
  %..1210 = load double* %rad2
  store double %..1210, double* %..retVal
  br label %..leave
ret1211:
  br label %leave1058
leave1058:
  store double %..1210, double* %..retVal
  br label %..leave
..leave:
  %..1772 = load double* %..retVal
  ret double %..1772
}
define void @Enemy_wait(%.struct5* %this.v, i32 %w.v, void(%.struct5*)* %next.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %w = alloca i32
  store i32 %w.v, i32* %w
  %next = alloca void(%.struct5*)*
  store void(%.struct5*)* %next.v, void(%.struct5*)** %next
  ; EField EField(   Ti(32),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   time )
  %..1213 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1213)
  %..1214 = load i32* %w
  ; b2 RL(Ti(32),..1214)
  %..1215 = getelementptr inbounds %.struct5* %..1213, i32 0, i32 8
  store i32 %..1214, i32* %..1215
  ; EField EField(   TFun(Tv,List(Tp(TDef(Enemy)))),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   move )
  %..1216 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1216)
  ; b2 RG(TFun(Tv,List(Tp(TDef(Enemy)))),Enemy_moveWait)
  %..1217 = getelementptr inbounds %.struct5* %..1216, i32 0, i32 6
  store void(%.struct5*)* @Enemy_moveWait, void(%.struct5*)** %..1217
  ; EField EField(   TFun(Tv,List(Tp(TDef(Enemy)))),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   nextMove )
  %..1218 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1218)
  ; R2--------- RL(TFun(Tv,List(Tp(TDef(Enemy)))),next)
  %..1219 = load void(%.struct5*)** %next
  ; b2 RL(TFun(Tv,List(Tp(TDef(Enemy)))),..1219)
  %..1220 = getelementptr inbounds %.struct5* %..1218, i32 0, i32 7
  store void(%.struct5*)* %..1219, void(%.struct5*)** %..1220
  br label %leave1212
leave1212:
  ret void
}
define void @Enemy_moveWait(%.struct5* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %..1223 = load %.struct5** %this
  %..1222 = call double @Enemy_moveBody(%.struct5* %..1223) nounwind ssp
  ; EField EField(   Ti(32),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   time )
  %..1224 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1224)
  %..1228 = load %.struct5** %this
  %..1229 = getelementptr inbounds %.struct5* %..1228, i32 0, i32 8
  %..1230 = load i32* %..1229
  %..1227 = zext i32 %..1230 to i64
  %..1226 = sub i64 %..1227, 1
  %..1225 = trunc i64 %..1226 to i32
  ; b2 RL(Ti(32),..1225)
  %..1232 = getelementptr inbounds %.struct5* %..1224, i32 0, i32 8
  store i32 %..1225, i32* %..1232
  %..1241 = load %.struct5** %this
  %..1242 = getelementptr inbounds %.struct5* %..1241, i32 0, i32 8
  %..1243 = load i32* %..1242
  %..1240 = zext i32 %..1243 to i64
  %..1773 = icmp sle i64 %..1240, 0
  %..1239 = zext i1 %..1773 to i64
  %..1238 = bitcast i64 %..1239 to i64
  %reg_1774 = icmp ne i64 %..1238, 0
  br i1 %reg_1774, label %ok1233, label %else1234
ok1233:
  ; EField EField(   TFun(Tv,List(Tp(TDef(Enemy)))),   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   move )
  %..1245 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1245)
  %..1246 = load %.struct5** %this
  %..1247 = getelementptr inbounds %.struct5* %..1246, i32 0, i32 7
  %..1248 = load void(%.struct5*)** %..1247
  ; b2 RL(TFun(Tv,List(Tp(TDef(Enemy)))),..1248)
  %..1249 = getelementptr inbounds %.struct5* %..1245, i32 0, i32 6
  store void(%.struct5*)* %..1248, void(%.struct5*)** %..1249
  br label %else1235
else1235:
  br label %endif1236
else1234:
  ; void
  br label %endif1237
endif1237:
  br label %endif1236
endif1236:
  br label %leave1221
leave1221:
  ret void
}
define void @Enemy_move1(%.struct5* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %r = alloca double
  ; EId r
  %..1252 = load %.struct5** %this
  %..1251 = call double @Enemy_moveBody(%.struct5* %..1252) nounwind ssp
  store double %..1251, double* %r
  %..1260 = call double @random() nounwind ssp
  %..1775 = fcmp ogt double %..1260, 0x3fe999999999999a
  %..1259 = zext i1 %..1775 to i64
  %..1258 = bitcast i64 %..1259 to i64
  %reg_1776 = icmp ne i64 %..1258, 0
  br i1 %reg_1776, label %ok1253, label %else1254
ok1253:
  %..1263 = load %.struct5** %this
  %..1264 = getelementptr inbounds %.struct5* %..1263, i32 0, i32 0
  %..1265 = load double* %..1264
  %..1266 = load %.struct5** %this
  %..1267 = getelementptr inbounds %.struct5* %..1266, i32 0, i32 1
  %..1268 = load double* %..1267
  %..1269 = load %.struct5** %this
  %..1270 = getelementptr inbounds %.struct5* %..1269, i32 0, i32 5
  %..1271 = load double* %..1270
  call void @addBullet(double %..1265, double %..1268, double %..1271) nounwind ssp
  %..1279 = call double @random() nounwind ssp
  %..1777 = fcmp ogt double %..1279, 0x3fe999999999999a
  %..1278 = zext i1 %..1777 to i64
  %..1277 = bitcast i64 %..1278 to i64
  %reg_1778 = icmp ne i64 %..1277, 0
  br i1 %reg_1778, label %ok1272, label %else1273
ok1272:
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   r2 )
  %..1281 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1281)
  %..1282 = sitofp i64 0 to double
  ; b2 RL(Td,..1282)
  %..1284 = getelementptr inbounds %.struct5* %..1281, i32 0, i32 9
  store double %..1282, double* %..1284
  %..1286 = load %.struct5** %this
  call void @Enemy_wait(%.struct5* %..1286, i32 30, void(%.struct5*)* @Enemy_move2) nounwind ssp
  br label %else1274
else1274:
  br label %endif1275
else1273:
  ; void
  br label %endif1276
endif1276:
  br label %endif1275
endif1275:
  br label %else1255
else1255:
  br label %endif1256
else1254:
  ; void
  br label %endif1257
endif1257:
  br label %endif1256
endif1256:
  br label %leave1250
leave1250:
  ret void
}
define void @Enemy_move2(%.struct5* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct5*
  store %.struct5* %this.v, %.struct5** %this
  %r = alloca double
  ; EId r
  %..1290 = load %.struct5** %this
  %..1289 = call double @Enemy_moveBody(%.struct5* %..1290) nounwind ssp
  store double %..1289, double* %r
  %rr = alloca i32
  ; EId rr
  %..1294 = call double @random() nounwind ssp
  %..1293 = fmul double %..1294, 0x4014000000000000
  %..1292 = fadd double %..1293, 0x3ff0000000000000
  %..1291 = fptosi double %..1292 to i32
  store i32 %..1291, i32* %rr
  %..1298 = load %.struct5** %this
  %..1299 = getelementptr inbounds %.struct5* %..1298, i32 0, i32 0
  %..1300 = load double* %..1299
  %..1301 = load %.struct5** %this
  %..1302 = getelementptr inbounds %.struct5* %..1301, i32 0, i32 1
  %..1303 = load double* %..1302
  %..1305 = load double* %r
  %..1306 = load %.struct5** %this
  %..1307 = getelementptr inbounds %.struct5* %..1306, i32 0, i32 9
  %..1308 = load double* %..1307
  %..1304 = fadd double %..1305, %..1308
  %..1309 = load i32* %rr
  call void @addBulletN(double %..1300, double %..1303, double %..1304, i32 %..1309, double 0x3fb999999999999a) nounwind ssp
  ; EField EField(   Td,   Tp(TDef(Enemy)),   EId(     Tp(TDef(Enemy)),     this   ),   r2 )
  %..1311 = load %.struct5** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td, r -> Td, move -> TFun(Tv,List(Tp(TDef(Enemy)))), nextMove -> TFun(Tv,List(Tp(TDef(Enemy)))), time -> Ti(32), r2 -> Td))),..1311)
  %..1313 = load %.struct5** %this
  %..1314 = getelementptr inbounds %.struct5* %..1313, i32 0, i32 9
  %..1315 = load double* %..1314
  %..1318 = load i32* %rr
  %..1319 = fptosi double 0x3fb999999999999a to i32
  %..1317 = mul i32 %..1318, %..1319
  %..1316 = sitofp i32 %..1317 to double
  %..1312 = fadd double %..1315, %..1316
  ; b2 RL(Td,..1312)
  %..1321 = getelementptr inbounds %.struct5* %..1311, i32 0, i32 9
  store double %..1312, double* %..1321
  %..1329 = call double @random() nounwind ssp
  %..1779 = fcmp olt double %..1329, 0x3f9eb851eb851eb8
  %..1328 = zext i1 %..1779 to i64
  %..1327 = bitcast i64 %..1328 to i64
  %reg_1780 = icmp ne i64 %..1327, 0
  br i1 %reg_1780, label %ok1322, label %else1323
ok1322:
  %..1332 = load %.struct5** %this
  call void @Enemy_wait(%.struct5* %..1332, i32 60, void(%.struct5*)* @Enemy_move1) nounwind ssp
  br label %else1324
else1324:
  br label %endif1325
else1323:
  ; void
  br label %endif1326
endif1326:
  br label %endif1325
endif1325:
  br label %leave1288
leave1288:
  ret void
}
@PI= global double 0x400921fafc8b007a
define double @normalRad(double %v.v) nounwind ssp {
entry:
  %..retVal = alloca double
  %v = alloca double
  store double %v.v, double* %v
  %..1336 = load double* %v
  %..1340 = load double* @PI
  %..1338 = fmul double 0x4000000000000000, %..1340
  %..1349 = load double* %v
  %..1350 = load double* @PI
  %..1781 = fcmp ogt double %..1349, %..1350
  %..1348 = zext i1 %..1781 to i64
  %..1347 = bitcast i64 %..1348 to i64
  %reg_1782 = icmp ne i64 %..1347, 0
  br i1 %reg_1782, label %ok1342, label %else1343
ok1342:
  br label %else1344
else1344:
  br label %endif1345
else1343:
  %..1359 = load double* %v
  %..1361 = load double* @PI
  %..1360 = fsub double 0.0, %..1361
  %..1783 = fcmp olt double %..1359, %..1360
  %..1358 = zext i1 %..1783 to i64
  %..1357 = bitcast i64 %..1358 to i64
  %reg_1784 = icmp ne i64 %..1357, 0
  br i1 %reg_1784, label %ok1352, label %else1353
ok1352:
  br label %else1354
else1354:
  br label %endif1355
else1353:
  br label %endif1356
endif1356:
  br label %endif1355
endif1355:
  %..1364 = phi i64 [1, %else1354], [0, %endif1356]
  br label %endif1346
endif1346:
  br label %endif1345
endif1345:
  %..1365 = phi i64 [-1, %else1344], [%..1364, %endif1346]
  %..1341 = sitofp i64 %..1365 to double
  %..1337 = fmul double %..1338, %..1341
  %..1335 = fadd double %..1336, %..1337
  br label %leave1334
leave1334:
  store double %..1335, double* %..retVal
  br label %..leave
..leave:
  %..1785 = load double* %..retVal
  ret double %..1785
}
define %.struct9* @newParticle() nounwind ssp {
entry:
  %..retVal = alloca %.struct9*
  %this = alloca %.struct9*
  ; EId this
  %..1367 = call i8* @malloc(i64 36) nounwind ssp
  %..1368 = bitcast i8* %..1367 to %.struct9*
  %..1369 = bitcast %.struct9* %..1368 to %.struct9*
  store %.struct9* %..1369, %.struct9** %this
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   speed )
  %..1370 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1370)
  %..1371 = sitofp i64 5 to double
  ; b2 RL(Td,..1371)
  %..1373 = getelementptr inbounds %.struct9* %..1370, i32 0, i32 3
  store double %..1371, double* %..1373
  ; EField EField(   TDef(bool),   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   visible )
  %..1374 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1374)
  %..1375 = load i32* @false
  ; b2 RL(Ti(32),..1375)
  %..1376 = getelementptr inbounds %.struct9* %..1374, i32 0, i32 2
  store i32 %..1375, i32* %..1376
  %..1377 = load %.struct9** %this
  br label %leave1366
leave1366:
  store %.struct9* %..1377, %.struct9** %..retVal
  br label %..leave
..leave:
  %..1786 = load %.struct9** %..retVal
  ret %.struct9* %..1786
}
define void @Particle_init(%.struct9* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   x )
  %..1379 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1379)
  %..1380 = load double* %x
  ; b2 RL(Td,..1380)
  %..1381 = getelementptr inbounds %.struct9* %..1379, i32 0, i32 0
  store double %..1380, double* %..1381
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   y )
  %..1382 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1382)
  %..1383 = load double* %y
  ; b2 RL(Td,..1383)
  %..1384 = getelementptr inbounds %.struct9* %..1382, i32 0, i32 1
  store double %..1383, double* %..1384
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   rad )
  %..1385 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1385)
  %..1386 = load double* %rad
  ; b2 RL(Td,..1386)
  %..1387 = getelementptr inbounds %.struct9* %..1385, i32 0, i32 4
  store double %..1386, double* %..1387
  ; EField EField(   TDef(bool),   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   visible )
  %..1388 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1388)
  %..1389 = load i32* @true
  ; b2 RL(Ti(32),..1389)
  %..1390 = getelementptr inbounds %.struct9* %..1388, i32 0, i32 2
  store i32 %..1389, i32* %..1390
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   speed )
  %..1391 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1391)
  %..1394 = call double @random() nounwind ssp
  %..1395 = sitofp i64 50 to double
  %..1393 = fmul double %..1394, %..1395
  %..1397 = sitofp i64 10 to double
  %..1392 = fadd double %..1393, %..1397
  ; b2 RL(Td,..1392)
  %..1399 = getelementptr inbounds %.struct9* %..1391, i32 0, i32 3
  store double %..1392, double* %..1399
  br label %leave1378
leave1378:
  ret void
}
define void @Particle_draw(%.struct9* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  ; void
  br label %leave1400
leave1400:
  ret void
}
define i32 @Particle_move(%.struct9* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   x )
  %..1402 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1402)
  %..1404 = load %.struct9** %this
  %..1405 = getelementptr inbounds %.struct9* %..1404, i32 0, i32 0
  %..1406 = load double* %..1405
  %..1409 = load %.struct9** %this
  %..1410 = getelementptr inbounds %.struct9* %..1409, i32 0, i32 4
  %..1411 = load double* %..1410
  %..1408 = call double @cos(double %..1411) nounwind ssp
  %..1412 = load %.struct9** %this
  %..1413 = getelementptr inbounds %.struct9* %..1412, i32 0, i32 3
  %..1414 = load double* %..1413
  %..1407 = fmul double %..1408, %..1414
  %..1403 = fadd double %..1406, %..1407
  ; b2 RL(Td,..1403)
  %..1415 = getelementptr inbounds %.struct9* %..1402, i32 0, i32 0
  store double %..1403, double* %..1415
  ; EField EField(   Td,   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   y )
  %..1416 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1416)
  %..1418 = load %.struct9** %this
  %..1419 = getelementptr inbounds %.struct9* %..1418, i32 0, i32 1
  %..1420 = load double* %..1419
  %..1423 = load %.struct9** %this
  %..1424 = getelementptr inbounds %.struct9* %..1423, i32 0, i32 4
  %..1425 = load double* %..1424
  %..1422 = call double @sin(double %..1425) nounwind ssp
  %..1426 = load %.struct9** %this
  %..1427 = getelementptr inbounds %.struct9* %..1426, i32 0, i32 3
  %..1428 = load double* %..1427
  %..1421 = fmul double %..1422, %..1428
  %..1417 = fadd double %..1420, %..1421
  ; b2 RL(Td,..1417)
  %..1429 = getelementptr inbounds %.struct9* %..1416, i32 0, i32 1
  store double %..1417, double* %..1429
  %..1440 = load %.struct9** %this
  %..1441 = getelementptr inbounds %.struct9* %..1440, i32 0, i32 0
  %..1442 = load double* %..1441
  %..1443 = sitofp i64 0 to double
  %..1787 = fcmp olt double %..1442, %..1443
  %..1439 = zext i1 %..1787 to i64
  %..1446 = sitofp i64 465 to double
  %..1448 = load %.struct9** %this
  %..1449 = getelementptr inbounds %.struct9* %..1448, i32 0, i32 0
  %..1450 = load double* %..1449
  %..1788 = fcmp olt double %..1446, %..1450
  %..1445 = zext i1 %..1788 to i64
  %..1438 = or i64 %..1439, %..1445
  %..1452 = load %.struct9** %this
  %..1453 = getelementptr inbounds %.struct9* %..1452, i32 0, i32 1
  %..1454 = load double* %..1453
  %..1455 = sitofp i64 0 to double
  %..1789 = fcmp olt double %..1454, %..1455
  %..1451 = zext i1 %..1789 to i64
  %..1437 = or i64 %..1438, %..1451
  %..1458 = sitofp i64 465 to double
  %..1460 = load %.struct9** %this
  %..1461 = getelementptr inbounds %.struct9* %..1460, i32 0, i32 1
  %..1462 = load double* %..1461
  %..1790 = fcmp olt double %..1458, %..1462
  %..1457 = zext i1 %..1790 to i64
  %..1436 = or i64 %..1437, %..1457
  %..1435 = bitcast i64 %..1436 to i64
  %reg_1791 = icmp ne i64 %..1435, 0
  br i1 %reg_1791, label %ok1430, label %else1431
ok1430:
  ; EField EField(   TDef(bool),   Tp(TDef(Particle)),   EId(     Tp(TDef(Particle)),     this   ),   visible )
  %..1463 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1463)
  %..1464 = load i32* @false
  ; b2 RL(Ti(32),..1464)
  %..1465 = getelementptr inbounds %.struct9* %..1463, i32 0, i32 2
  store i32 %..1464, i32* %..1465
  br label %else1432
else1432:
  br label %endif1433
else1431:
  ; void
  br label %endif1434
endif1434:
  br label %endif1433
endif1433:
  %..1466 = load %.struct9** %this
  %..1467 = getelementptr inbounds %.struct9* %..1466, i32 0, i32 2
  %..1468 = load i32* %..1467
  br label %leave1401
leave1401:
  store i32 %..1468, i32* %..retVal
  br label %..leave
..leave:
  %..1792 = load i32* %..retVal
  ret i32 %..1792
}
define %.struct9* @newBullet() nounwind ssp {
entry:
  %..retVal = alloca %.struct9*
  %this = alloca %.struct9*
  ; EId this
  %..1470 = call i8* @malloc(i64 36) nounwind ssp
  %..1471 = bitcast i8* %..1470 to %.struct9*
  %..1472 = bitcast %.struct9* %..1471 to %.struct9*
  store %.struct9* %..1472, %.struct9** %this
  ; EField EField(   TDef(bool),   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   visible )
  %..1473 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1473)
  %..1474 = load i32* @false
  ; b2 RL(Ti(32),..1474)
  %..1475 = getelementptr inbounds %.struct9* %..1473, i32 0, i32 2
  store i32 %..1474, i32* %..1475
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   speed )
  %..1476 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1476)
  %..1477 = sitofp i64 10 to double
  ; b2 RL(Td,..1477)
  %..1479 = getelementptr inbounds %.struct9* %..1476, i32 0, i32 3
  store double %..1477, double* %..1479
  %..1480 = load %.struct9** %this
  br label %leave1469
leave1469:
  store %.struct9* %..1480, %.struct9** %..retVal
  br label %..leave
..leave:
  %..1793 = load %.struct9** %..retVal
  ret %.struct9* %..1793
}
define void @Bullet_init(%.struct9* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   x )
  %..1482 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1482)
  %..1483 = load double* %x
  ; b2 RL(Td,..1483)
  %..1484 = getelementptr inbounds %.struct9* %..1482, i32 0, i32 0
  store double %..1483, double* %..1484
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   y )
  %..1485 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1485)
  %..1486 = load double* %y
  ; b2 RL(Td,..1486)
  %..1487 = getelementptr inbounds %.struct9* %..1485, i32 0, i32 1
  store double %..1486, double* %..1487
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   rad )
  %..1488 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1488)
  %..1489 = load double* %rad
  ; b2 RL(Td,..1489)
  %..1490 = getelementptr inbounds %.struct9* %..1488, i32 0, i32 4
  store double %..1489, double* %..1490
  ; EField EField(   TDef(bool),   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   visible )
  %..1491 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1491)
  %..1492 = load i32* @true
  ; b2 RL(Ti(32),..1492)
  %..1493 = getelementptr inbounds %.struct9* %..1491, i32 0, i32 2
  store i32 %..1492, i32* %..1493
  br label %leave1481
leave1481:
  ret void
}
define void @Bullet_draw(%.struct9* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  ; void
  br label %leave1494
leave1494:
  ret void
}
define i32 @Bullet_move(%.struct9* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   x )
  %..1496 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1496)
  %..1498 = load %.struct9** %this
  %..1499 = getelementptr inbounds %.struct9* %..1498, i32 0, i32 0
  %..1500 = load double* %..1499
  %..1503 = load %.struct9** %this
  %..1504 = getelementptr inbounds %.struct9* %..1503, i32 0, i32 4
  %..1505 = load double* %..1504
  %..1502 = call double @cos(double %..1505) nounwind ssp
  %..1506 = load %.struct9** %this
  %..1507 = getelementptr inbounds %.struct9* %..1506, i32 0, i32 3
  %..1508 = load double* %..1507
  %..1501 = fmul double %..1502, %..1508
  %..1497 = fadd double %..1500, %..1501
  ; b2 RL(Td,..1497)
  %..1509 = getelementptr inbounds %.struct9* %..1496, i32 0, i32 0
  store double %..1497, double* %..1509
  ; EField EField(   Td,   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   y )
  %..1510 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1510)
  %..1512 = load %.struct9** %this
  %..1513 = getelementptr inbounds %.struct9* %..1512, i32 0, i32 1
  %..1514 = load double* %..1513
  %..1517 = load %.struct9** %this
  %..1518 = getelementptr inbounds %.struct9* %..1517, i32 0, i32 4
  %..1519 = load double* %..1518
  %..1516 = call double @sin(double %..1519) nounwind ssp
  %..1520 = load %.struct9** %this
  %..1521 = getelementptr inbounds %.struct9* %..1520, i32 0, i32 3
  %..1522 = load double* %..1521
  %..1515 = fmul double %..1516, %..1522
  %..1511 = fadd double %..1514, %..1515
  ; b2 RL(Td,..1511)
  %..1523 = getelementptr inbounds %.struct9* %..1510, i32 0, i32 1
  store double %..1511, double* %..1523
  %..1534 = load %.struct9** %this
  %..1535 = getelementptr inbounds %.struct9* %..1534, i32 0, i32 0
  %..1536 = load double* %..1535
  %..1537 = sitofp i64 0 to double
  %..1794 = fcmp olt double %..1536, %..1537
  %..1533 = zext i1 %..1794 to i64
  %..1540 = sitofp i64 465 to double
  %..1542 = load %.struct9** %this
  %..1543 = getelementptr inbounds %.struct9* %..1542, i32 0, i32 0
  %..1544 = load double* %..1543
  %..1795 = fcmp olt double %..1540, %..1544
  %..1539 = zext i1 %..1795 to i64
  %..1532 = or i64 %..1533, %..1539
  %..1546 = load %.struct9** %this
  %..1547 = getelementptr inbounds %.struct9* %..1546, i32 0, i32 1
  %..1548 = load double* %..1547
  %..1549 = sitofp i64 0 to double
  %..1796 = fcmp olt double %..1548, %..1549
  %..1545 = zext i1 %..1796 to i64
  %..1531 = or i64 %..1532, %..1545
  %..1552 = sitofp i64 465 to double
  %..1554 = load %.struct9** %this
  %..1555 = getelementptr inbounds %.struct9* %..1554, i32 0, i32 1
  %..1556 = load double* %..1555
  %..1797 = fcmp olt double %..1552, %..1556
  %..1551 = zext i1 %..1797 to i64
  %..1530 = or i64 %..1531, %..1551
  %..1529 = bitcast i64 %..1530 to i64
  %reg_1798 = icmp ne i64 %..1529, 0
  br i1 %reg_1798, label %ok1524, label %else1525
ok1524:
  ; EField EField(   TDef(bool),   Tp(TDef(Bullet)),   EId(     Tp(TDef(Bullet)),     this   ),   visible )
  %..1557 = load %.struct9** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), speed -> Td, rad -> Td))),..1557)
  %..1558 = load i32* @false
  ; b2 RL(Ti(32),..1558)
  %..1559 = getelementptr inbounds %.struct9* %..1557, i32 0, i32 2
  store i32 %..1558, i32* %..1559
  br label %else1526
else1526:
  br label %endif1527
else1525:
  ; void
  br label %endif1528
endif1528:
  br label %endif1527
endif1527:
  %..1560 = load %.struct9** %this
  %..1561 = getelementptr inbounds %.struct9* %..1560, i32 0, i32 2
  %..1562 = load i32* %..1561
  br label %leave1495
leave1495:
  store i32 %..1562, i32* %..retVal
  br label %..leave
..leave:
  %..1799 = load i32* %..retVal
  ret i32 %..1799
}
define %.struct10* @newShot() nounwind ssp {
entry:
  %..retVal = alloca %.struct10*
  %this = alloca %.struct10*
  ; EId this
  %..1564 = call i8* @malloc(i64 44) nounwind ssp
  %..1565 = bitcast i8* %..1564 to %.struct10*
  %..1566 = bitcast %.struct10* %..1565 to %.struct10*
  store %.struct10* %..1566, %.struct10** %this
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   speed )
  %..1567 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1567)
  %..1568 = sitofp i64 25 to double
  ; b2 RL(Td,..1568)
  %..1570 = getelementptr inbounds %.struct10* %..1567, i32 0, i32 4
  store double %..1568, double* %..1570
  ; EField EField(   TDef(bool),   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   visible )
  %..1571 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1571)
  %..1572 = load i32* @false
  ; b2 RL(Ti(32),..1572)
  %..1573 = getelementptr inbounds %.struct10* %..1571, i32 0, i32 2
  store i32 %..1572, i32* %..1573
  %..1574 = load %.struct10** %this
  br label %leave1563
leave1563:
  store %.struct10* %..1574, %.struct10** %..retVal
  br label %..leave
..leave:
  %..1800 = load %.struct10** %..retVal
  ret %.struct10* %..1800
}
define void @Shot_init(%.struct10* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct10*
  store %.struct10* %this.v, %.struct10** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   x )
  %..1576 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1576)
  %..1577 = load %.struct10** %this
  %..1578 = getelementptr inbounds %.struct10* %..1577, i32 0, i32 0
  %..1579 = load double* %..1578
  ; b2 RL(Td,..1579)
  %..1580 = getelementptr inbounds %.struct10* %..1576, i32 0, i32 0
  store double %..1579, double* %..1580
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   y )
  %..1581 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1581)
  %..1582 = load %.struct10** %this
  %..1583 = getelementptr inbounds %.struct10* %..1582, i32 0, i32 1
  %..1584 = load double* %..1583
  ; b2 RL(Td,..1584)
  %..1585 = getelementptr inbounds %.struct10* %..1581, i32 0, i32 1
  store double %..1584, double* %..1585
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   rad )
  %..1586 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1586)
  %..1587 = load %.struct10** %this
  %..1588 = getelementptr inbounds %.struct10* %..1587, i32 0, i32 5
  %..1589 = load double* %..1588
  ; b2 RL(Td,..1589)
  %..1590 = getelementptr inbounds %.struct10* %..1586, i32 0, i32 5
  store double %..1589, double* %..1590
  ; EField EField(   TDef(bool),   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   visible )
  %..1591 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1591)
  %..1592 = load i32* @true
  ; b2 RL(Ti(32),..1592)
  %..1593 = getelementptr inbounds %.struct10* %..1591, i32 0, i32 2
  store i32 %..1592, i32* %..1593
  br label %leave1575
leave1575:
  ret void
}
define void @Shot_draw(%.struct10* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct10*
  store %.struct10* %this.v, %.struct10** %this
  ; void
  br label %leave1594
leave1594:
  ret void
}
define i32 @Shot_move(%.struct10* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct10*
  store %.struct10* %this.v, %.struct10** %this
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   x )
  %..1596 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1596)
  %..1598 = load %.struct10** %this
  %..1599 = getelementptr inbounds %.struct10* %..1598, i32 0, i32 0
  %..1600 = load double* %..1599
  %..1603 = load %.struct10** %this
  %..1604 = getelementptr inbounds %.struct10* %..1603, i32 0, i32 5
  %..1605 = load double* %..1604
  %..1602 = call double @cos(double %..1605) nounwind ssp
  %..1606 = load %.struct10** %this
  %..1607 = getelementptr inbounds %.struct10* %..1606, i32 0, i32 4
  %..1608 = load double* %..1607
  %..1601 = fmul double %..1602, %..1608
  %..1597 = fadd double %..1600, %..1601
  ; b2 RL(Td,..1597)
  %..1609 = getelementptr inbounds %.struct10* %..1596, i32 0, i32 0
  store double %..1597, double* %..1609
  ; EField EField(   Td,   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   y )
  %..1610 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1610)
  %..1612 = load %.struct10** %this
  %..1613 = getelementptr inbounds %.struct10* %..1612, i32 0, i32 1
  %..1614 = load double* %..1613
  %..1617 = load %.struct10** %this
  %..1618 = getelementptr inbounds %.struct10* %..1617, i32 0, i32 5
  %..1619 = load double* %..1618
  %..1616 = call double @sin(double %..1619) nounwind ssp
  %..1620 = load %.struct10** %this
  %..1621 = getelementptr inbounds %.struct10* %..1620, i32 0, i32 4
  %..1622 = load double* %..1621
  %..1615 = fmul double %..1616, %..1622
  %..1611 = fadd double %..1614, %..1615
  ; b2 RL(Td,..1611)
  %..1623 = getelementptr inbounds %.struct10* %..1610, i32 0, i32 1
  store double %..1611, double* %..1623
  %..1634 = load %.struct10** %this
  %..1635 = getelementptr inbounds %.struct10* %..1634, i32 0, i32 0
  %..1636 = load double* %..1635
  %..1637 = sitofp i64 0 to double
  %..1801 = fcmp olt double %..1636, %..1637
  %..1633 = zext i1 %..1801 to i64
  %..1640 = sitofp i64 465 to double
  %..1642 = load %.struct10** %this
  %..1643 = getelementptr inbounds %.struct10* %..1642, i32 0, i32 0
  %..1644 = load double* %..1643
  %..1802 = fcmp olt double %..1640, %..1644
  %..1639 = zext i1 %..1802 to i64
  %..1632 = or i64 %..1633, %..1639
  %..1646 = load %.struct10** %this
  %..1647 = getelementptr inbounds %.struct10* %..1646, i32 0, i32 1
  %..1648 = load double* %..1647
  %..1649 = sitofp i64 0 to double
  %..1803 = fcmp olt double %..1648, %..1649
  %..1645 = zext i1 %..1803 to i64
  %..1631 = or i64 %..1632, %..1645
  %..1652 = sitofp i64 465 to double
  %..1654 = load %.struct10** %this
  %..1655 = getelementptr inbounds %.struct10* %..1654, i32 0, i32 1
  %..1656 = load double* %..1655
  %..1804 = fcmp olt double %..1652, %..1656
  %..1651 = zext i1 %..1804 to i64
  %..1630 = or i64 %..1631, %..1651
  %..1629 = bitcast i64 %..1630 to i64
  %reg_1805 = icmp ne i64 %..1629, 0
  br i1 %reg_1805, label %ok1624, label %else1625
ok1624:
  ; EField EField(   TDef(bool),   Tp(TDef(Shot)),   EId(     Tp(TDef(Shot)),     this   ),   visible )
  %..1657 = load %.struct10** %this
  ; e2 RL(Tp(TStr(Map(x -> Td, y -> Td, visible -> Ti(32), angle -> Td, speed -> Td, rad -> Td))),..1657)
  %..1658 = load i32* @false
  ; b2 RL(Ti(32),..1658)
  %..1659 = getelementptr inbounds %.struct10* %..1657, i32 0, i32 2
  store i32 %..1658, i32* %..1659
  br label %else1626
else1626:
  br label %endif1627
else1625:
  ; void
  br label %endif1628
endif1628:
  br label %endif1627
endif1627:
  %..1660 = load %.struct10** %this
  %..1661 = getelementptr inbounds %.struct10* %..1660, i32 0, i32 2
  %..1662 = load i32* %..1661
  br label %leave1595
leave1595:
  store i32 %..1662, i32* %..retVal
  br label %..leave
..leave:
  %..1806 = load i32* %..retVal
  ret i32 %..1806
}
declare void @glutKeyboardFunc(void(i8, i32, i32)*) nounwind
@Shot = external global %.struct7
declare void @print_f(float) nounwind
declare void @glColor3d(double, double, double) nounwind
declare void @print_b(i8) nounwind
declare void @glutSwapBuffers() nounwind
declare void @glutLeaveGameMode() nounwind
declare void @glTranslated(double, double, double) nounwind
@float = external global float
declare void @glMatrixMode(i32) nounwind
declare void @glutFullScreen() nounwind
declare void @glMaterialfv(i32, i32, float*) nounwind
declare void @glutInitDisplayMode(i32) nounwind
@Bullet = external global %.struct6
declare void @glDisable(i32) nounwind
@short = external global i16
declare i8* @malloc(i64) nounwind
declare void @glViewport(i32, i32, i32, i32) nounwind
declare void @glutInitWindowSize(i32, i32) nounwind
declare void @glutSpecialUpFunc(void(i8, i32, i32)*) nounwind
declare void @glLoadIdentity() nounwind
declare void @print_d(double) nounwind
@char = external global i8
declare double @cos(double) nounwind
declare void @glutDisplayFunc(void()*) nounwind
declare void @println(i8*) nounwind
declare void @glFlush() nounwind
declare void @glPushMatrix() nounwind
declare double @atan(double) nounwind
declare void @glutMainLoop() nounwind
declare void @glutEnterGameMode() nounwind
@double = external global double
declare void @gluPerspective(double, double, double, double) nounwind
declare void @glRotated(double, double, double, double) nounwind
@long = external global i64
declare void @glutGameModeString(i8*) nounwind
@Enemy = external global %.struct4
declare void @gluLookAt(double, double, double, double, double, double, double, double, double) nounwind
declare double @atan2(double, double) nounwind
@bool = external global i32
declare void @glutInit(i32*, i8**) nounwind
declare void @glutReshapeWindow(i32, i32) nounwind
@Ship = external global %.struct3
declare void @glutCreateWindow(i8*) nounwind
@int = external global i32
declare void @glNormal3d(double, double, double) nounwind
declare void @glBegin(i32) nounwind
declare void @glPopMatrix() nounwind
declare void @exit(i32) nounwind
declare void @glLightfv(i32, i32, float*) nounwind
declare void @glVertex2d(double, double) nounwind
declare void @glColor4d(double, double, double, double) nounwind
declare void @print_l(i64) nounwind
declare void @glVertex3d(double, double, double) nounwind
declare void @glBlendFunc(i32, i32) nounwind
declare double @abs(double) nounwind
@Particle = external global %.struct6
declare double @sin(double) nounwind
declare void @glutSpecialFunc(void(i8, i32, i32)*) nounwind
@byte = external global i8
declare void @print_s(i16) nounwind
declare void @print_i(i32) nounwind
declare void @glEnable(i32) nounwind
declare void @glutTimerFunc(i32, void(i32)*, i32) nounwind
declare void @glClear(i32) nounwind
declare void @glEnd() nounwind
declare void @glutPostRedisplay() nounwind
declare void @glScaled(double, double, double) nounwind
@Key = external global %.struct2
