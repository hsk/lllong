%.struct1 = type { i32, i32, i32, i32, void(%.struct1*)*, void()*, i32 }
%.struct2 = type { i32, i32, i32, i32, i32 }
%.struct3 = type { double, double }
%.struct4 = type { void(%.struct4*)*, i32 }
declare i32 @printf(i8*, ...) nounwind
@GLUT_RGBA= global i32 0
@GLUT_DOUBLE= global i32 2
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
define i32 @main(i32 %argc.v, i8** %argv.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %argc = alloca i32
  store i32 %argc.v, i32* %argc
  %argv = alloca i8**
  store i8** %argv.v, i8*** %argv
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   x )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  ; b2 RL(Td,..6)
  %..7 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double 0x0, double* %..7
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   y )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  ; b2 RL(Td,..8)
  %..9 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double 0x0, double* %..9
  %..11 = load i8*** %argv
  call void @glutInit(i32* %argc, i8** %..11) nounwind ssp
  call void @glutInitWindowSize(i32 640, i32 480) nounwind ssp
  %..20 = bitcast i64 0 to i64
  %reg_1847 = icmp ne i64 %..20, 0
  br i1 %reg_1847, label %ok15, label %else16
ok15:
  %..23 = bitcast [14 x i8]* @.str1848 to i8*
  call void @glutGameModeString(i8* %..23) nounwind ssp
  call void @glutEnterGameMode() nounwind ssp
  br label %else17
else17:
  br label %endif18
else16:
  %..26 = load i8*** %argv
  %..28 = bitcast i8** %..26 to i8**
  %..29 = getelementptr inbounds i8** %..28, i64 0
  %..30 = load i8** %..29
  call void @glutCreateWindow(i8* %..30) nounwind ssp
  br label %endif19
endif19:
  br label %endif18
endif18:
  %..32 = load i32* @GLUT_RGBA
  call void @glutInitDisplayMode(i32 %..32) nounwind ssp
  %..34 = load i32* @GL_BLEND
  call void @glEnable(i32 %..34) nounwind ssp
  %..36 = load i32* @GL_LIGHTING
  call void @glEnable(i32 %..36) nounwind ssp
  %..38 = load i32* @GL_LIGHT0
  call void @glEnable(i32 %..38) nounwind ssp
  call void @glutDisplayFunc(void()* @main_display) nounwind ssp
  call void @glutTimerFunc(i32 20, void(i32)* @main_loop, i32 0) nounwind ssp
  call void @glutSpecialFunc(void(i8, i32, i32)* @downKey) nounwind ssp
  call void @glutSpecialUpFunc(void(i8, i32, i32)* @upKey) nounwind ssp
  call void @Game_new(%.struct1* @game) nounwind ssp
  call void @glutMainLoop() nounwind ssp
  call void @print_i(i32 33) nounwind ssp
  br label %leave5
leave5:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..1849 = load i32* %..retVal
  ret i32 %..1849
}
@.str1848= private constant [14 x i8] c"640x480:32@60\00"
define void @color(float %r.v, float %g.v, float %b.v, float %a.v) nounwind ssp {
entry:
  %r = alloca float
  store float %r.v, float* %r
  %g = alloca float
  store float %g.v, float* %g
  %b = alloca float
  store float %b.v, float* %b
  %a = alloca float
  store float %a.v, float* %a
  %col = alloca [4 x float]
  %..50 = bitcast [4 x float]* %col to float*
  %..52 = load float* %r
  %..53 = bitcast float* %..50 to float*
  %..54 = getelementptr inbounds float* %..53, i32 0
  store float %..52, float* %..54
  %..55 = bitcast [4 x float]* %col to float*
  %..57 = load float* %g
  %..58 = bitcast float* %..55 to float*
  %..59 = getelementptr inbounds float* %..58, i32 1
  store float %..57, float* %..59
  %..60 = bitcast [4 x float]* %col to float*
  %..62 = load float* %b
  %..63 = bitcast float* %..60 to float*
  %..64 = getelementptr inbounds float* %..63, i32 2
  store float %..62, float* %..64
  %..65 = bitcast [4 x float]* %col to float*
  %..67 = load float* %a
  %..68 = bitcast float* %..65 to float*
  %..69 = getelementptr inbounds float* %..68, i32 3
  store float %..67, float* %..69
  %..71 = load i32* @GL_FRONT_AND_BACK
  %..72 = load i32* @GL_DIFFUSE
  %..73 = bitcast [4 x float]* %col to float*
  call void @glMaterialfv(i32 %..71, i32 %..72, float* %..73) nounwind ssp
  br label %leave49
leave49:
  ret void
}
define void @main_loop(i32 %a.v) nounwind ssp {
entry:
  %a = alloca i32
  store i32 %a.v, i32* %a
  %..75 = getelementptr inbounds %.struct1* @game, i32 0, i32 4
  %..76 = load void(%.struct1*)** %..75
  call void %..76(%.struct1* @game) nounwind ssp
  call void @glutPostRedisplay() nounwind ssp
  %..80 = sdiv i32 1000, 50
  call void @glutTimerFunc(i32 %..80, void(i32)* @main_loop, i32 0) nounwind ssp
  br label %leave74
leave74:
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
  %..89 = load i32* @GL_COLOR_BUFFER_BIT
  %..90 = load i32* @GL_DEPTH_BUFFER_BIT
  %..88 = or i32 %..89, %..90
  call void @glClear(i32 %..88) nounwind ssp
  call void @glViewport(i32 0, i32 0, i32 640, i32 480) nounwind ssp
  %..97 = load i32* @GL_PROJECTION
  call void @glMatrixMode(i32 %..97) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..103 = load i32* %WIDTH
  %..106 = load i32* %HEIGHT
  %..105 = sitofp i32 %..106 to double
  %..104 = fptosi double %..105 to i32
  %..102 = sdiv i32 %..103, %..104
  %..101 = sitofp i32 %..102 to double
  call void @gluPerspective(double 0x4056800000000000, double %..101, double 0x3ff0000000000000, double 0x40c3880000000000) nounwind ssp
  %n = alloca float
  ; EId n
  store float 0x4024000000000000, float* %n
  %lightpos = alloca [4 x float]
  %..110 = bitcast [4 x float]* %lightpos to float*
  %..116 = load float* %n
  %..115 = fpext float %..116 to double
  %..113 = fmul double 0x407f400000000000, %..115
  %..112 = fptrunc double %..113 to float
  %..117 = bitcast float* %..110 to float*
  %..118 = getelementptr inbounds float* %..117, i64 0
  store float %..112, float* %..118
  %..119 = bitcast [4 x float]* %lightpos to float*
  %..125 = load float* %n
  %..124 = fpext float %..125 to double
  %..122 = fmul double 0x4089100000000000, %..124
  %..121 = fptrunc double %..122 to float
  %..126 = bitcast float* %..119 to float*
  %..127 = getelementptr inbounds float* %..126, i64 1
  store float %..121, float* %..127
  %..128 = bitcast [4 x float]* %lightpos to float*
  %..134 = load float* %n
  %..133 = fpext float %..134 to double
  %..131 = fmul double 0x407f900000000000, %..133
  %..130 = fptrunc double %..131 to float
  %..135 = bitcast float* %..128 to float*
  %..136 = getelementptr inbounds float* %..135, i64 2
  store float %..130, float* %..136
  %..137 = bitcast [4 x float]* %lightpos to float*
  %..139 = fptrunc double 0x3ff0000000000000 to float
  %..141 = bitcast float* %..137 to float*
  %..142 = getelementptr inbounds float* %..141, i64 3
  store float %..139, float* %..142
  %..144 = load i32* @GL_LIGHT0
  %..145 = load i32* @GL_POSITION
  %..147 = bitcast [4 x float]* %lightpos to float*
  %..146 = bitcast float* %..147 to float*
  call void @glLightfv(i32 %..144, i32 %..145, float* %..146) nounwind ssp
  %..149 = load i32* @GL_MODELVIEW
  call void @glMatrixMode(i32 %..149) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..152 = load i32* @GL_SRC_ALPHA
  %..153 = load i32* @GL_ONE
  call void @glBlendFunc(i32 %..152, i32 %..153) nounwind ssp
  call void @gluLookAt(double 0x0, double 0x0, double 0x4074000000000000, double 0x0, double 0x0, double 0x0, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..164 = getelementptr inbounds %.struct1* @game, i32 0, i32 5
  %..165 = load void()** %..164
  call void %..165() nounwind ssp
  call void @glFlush() nounwind ssp
  br label %leave84
leave84:
  ret void
}
@game= common global %.struct1 zeroinitializer
define void @Game_new(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..169 = load %.struct1** %game
  %..170 = bitcast %.struct1* %..169 to %.struct1*
  %..171 = getelementptr inbounds %.struct1* %..170, i64 0
  %..172 = trunc i64 0 to i32
  %..174 = getelementptr inbounds %.struct1* %..171, i32 0, i32 6
  store i32 %..172, i32* %..174
  %..175 = load %.struct1** %game
  %..176 = bitcast %.struct1* %..175 to %.struct1*
  %..177 = getelementptr inbounds %.struct1* %..176, i64 0
  %..178 = trunc i64 3 to i32
  %..180 = getelementptr inbounds %.struct1* %..177, i32 0, i32 1
  store i32 %..178, i32* %..180
  %..181 = load %.struct1** %game
  %..182 = bitcast %.struct1* %..181 to %.struct1*
  %..183 = getelementptr inbounds %.struct1* %..182, i64 0
  %..184 = trunc i64 1 to i32
  %..186 = getelementptr inbounds %.struct1* %..183, i32 0, i32 0
  store i32 %..184, i32* %..186
  %..187 = load %.struct1** %game
  %..188 = bitcast %.struct1* %..187 to %.struct1*
  %..189 = getelementptr inbounds %.struct1* %..188, i64 0
  %..190 = trunc i64 0 to i32
  %..192 = getelementptr inbounds %.struct1* %..189, i32 0, i32 3
  store i32 %..190, i32* %..192
  %..193 = load %.struct1** %game
  %..194 = bitcast %.struct1* %..193 to %.struct1*
  %..195 = getelementptr inbounds %.struct1* %..194, i64 0
  %..196 = getelementptr inbounds %.struct1* %..195, i32 0, i32 4
  store void(%.struct1*)* @Game_title, void(%.struct1*)** %..196
  %..197 = load %.struct1** %game
  %..198 = bitcast %.struct1* %..197 to %.struct1*
  %..199 = getelementptr inbounds %.struct1* %..198, i64 0
  %..200 = getelementptr inbounds %.struct1* %..199, i32 0, i32 5
  store void()* @Game_title_draw, void()** %..200
  br label %leave168
leave168:
  ret void
}
define void @Game_title(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..202 = load %.struct1** %game
  %..203 = bitcast %.struct1* %..202 to %.struct1*
  %..204 = getelementptr inbounds %.struct1* %..203, i64 0
  %..208 = load %.struct1** %game
  %..209 = bitcast %.struct1* %..208 to %.struct1*
  %..210 = getelementptr inbounds %.struct1* %..209, i64 0
  %..211 = getelementptr inbounds %.struct1* %..210, i32 0, i32 3
  %..212 = load i32* %..211
  %..207 = zext i32 %..212 to i64
  %..206 = add i64 %..207, 1
  %..205 = trunc i64 %..206 to i32
  %..214 = getelementptr inbounds %.struct1* %..204, i32 0, i32 3
  store i32 %..205, i32* %..214
  %..221 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  %..222 = load i32* %..221
  %..220 = zext i32 %..222 to i64
  %reg_1850 = icmp ne i64 %..220, 0
  br i1 %reg_1850, label %ok215, label %else216
ok215:
  %..223 = load %.struct1** %game
  %..224 = bitcast %.struct1* %..223 to %.struct1*
  %..225 = getelementptr inbounds %.struct1* %..224, i64 0
  %..226 = trunc i64 0 to i32
  %..228 = getelementptr inbounds %.struct1* %..225, i32 0, i32 3
  store i32 %..226, i32* %..228
  %..229 = load %.struct1** %game
  %..230 = bitcast %.struct1* %..229 to %.struct1*
  %..231 = getelementptr inbounds %.struct1* %..230, i64 0
  %..232 = getelementptr inbounds %.struct1* %..231, i32 0, i32 4
  store void(%.struct1*)* @Game_title_end, void(%.struct1*)** %..232
  br label %else217
else217:
  br label %endif218
else216:
  ; void
  br label %endif219
endif219:
  br label %endif218
endif218:
  br label %leave201
leave201:
  ret void
}
define void @Game_title_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..236 = fsub double 0.0, 0x4056800000000000
  call void @glRotated(double %..236, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..243 = getelementptr inbounds %.struct1* @game, i32 0, i32 3
  %..244 = load i32* %..243
  %..242 = sitofp i32 %..244 to double
  call void @glRotated(double %..242, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..249 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..249) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403ab4bc6a7ef9db, double 0x407ad85810624dd3) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double 0x407a9120c49ba5e3) nounwind ssp
  call void @glEnd() nounwind ssp
  %..273 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..273) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double 0x407a9120c49ba5e3) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  %..297 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..297) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..305 = fsub double 0.0, 0x0
  %..307 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..305, double %..307) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  %..323 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..323) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..335 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..335, double 0x40475e24dd2f1aa0) nounwind ssp
  %..340 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..340, double 0x4069df16872b020c) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glEnd() nounwind ssp
  %..349 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..349) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..369 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..369, double 0x40475e24dd2f1aa0) nounwind ssp
  call void @glEnd() nounwind ssp
  %..374 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..374) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..386 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..386, double 0x40475e24dd2f1aa0) nounwind ssp
  %..391 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..391, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..396 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..396, double 0x4069df16872b020c) nounwind ssp
  call void @glEnd() nounwind ssp
  %..401 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..401) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..409 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..409, double 0x0) nounwind ssp
  %..414 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..414, double 0x40687b020c49ba5e) nounwind ssp
  %..419 = fsub double 0.0, 0x405bd1999999999a
  call void @glVertex3d(double 0x0, double %..419, double 0x407ad85810624dd3) nounwind ssp
  %..424 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..424, double 0x407b1f8f5c28f5c3) nounwind ssp
  call void @glEnd() nounwind ssp
  %..429 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..429) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..438 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..438) nounwind ssp
  %..442 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..442, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..447 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..447, double 0x40475e24dd2f1aa0) nounwind ssp
  %..452 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..452, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  %..457 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..457) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..469 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..469, double 0x40475e24dd2f1aa0) nounwind ssp
  %..474 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..474, double 0x4068c2395810624e) nounwind ssp
  %..479 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..479, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  %..484 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..484) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..496 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..496, double 0x407a6d851eb851ec) nounwind ssp
  %..501 = fsub double 0.0, 0x40687b020c49ba5e
  call void @glVertex3d(double 0x0, double %..501, double 0x407a6d851eb851ec) nounwind ssp
  %..506 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..506, double 0x4068c2395810624e) nounwind ssp
  call void @glEnd() nounwind ssp
  %..511 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..511) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..520 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..520) nounwind ssp
  %..524 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..524, double 0x4068c2395810624e) nounwind ssp
  %..529 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..529, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..534 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..534, double 0x407a6d851eb851ec) nounwind ssp
  call void @glEnd() nounwind ssp
  %..539 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..539) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..551 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..551, double 0x4068c2395810624e) nounwind ssp
  %..556 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..556, double 0x40475e24dd2f1aa0) nounwind ssp
  %..561 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..561, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glEnd() nounwind ssp
  %..566 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..566) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..579 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..579) nounwind ssp
  %..583 = fsub double 0.0, 0x4070d4916872b021
  %..585 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..583, double %..585) nounwind ssp
  %..590 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..590) nounwind ssp
  call void @glEnd() nounwind ssp
  %..594 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..594) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..602 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..602, double 0x0) nounwind ssp
  %..608 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..608) nounwind ssp
  %..613 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..613) nounwind ssp
  %..618 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..618) nounwind ssp
  call void @glEnd() nounwind ssp
  %..622 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..622) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..635 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..635) nounwind ssp
  %..640 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..640) nounwind ssp
  %..645 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..645) nounwind ssp
  call void @glEnd() nounwind ssp
  %..649 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..649) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..658 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..658) nounwind ssp
  %..663 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..663) nounwind ssp
  %..668 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..668) nounwind ssp
  %..673 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..673) nounwind ssp
  call void @glEnd() nounwind ssp
  %..677 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..677) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..685 = fsub double 0.0, 0x0
  %..687 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..685, double %..687) nounwind ssp
  %..692 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..692) nounwind ssp
  %..696 = fsub double 0.0, 0x406331e76c8b4396
  %..698 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..696, double %..698) nounwind ssp
  %..702 = fsub double 0.0, 0x4070d4916872b021
  %..704 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..702, double %..704) nounwind ssp
  call void @glEnd() nounwind ssp
  %..708 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..708) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..717 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..717) nounwind ssp
  %..721 = fsub double 0.0, 0x406331e76c8b4396
  %..723 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..721, double %..723) nounwind ssp
  %..727 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..729 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..727, double %..729) nounwind ssp
  %..733 = fsub double 0.0, 0x4070d4916872b021
  %..735 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..733, double %..735) nounwind ssp
  call void @glEnd() nounwind ssp
  %..739 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..739) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..751 = fsub double 0.0, 0x406331e76c8b4396
  %..753 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..751, double %..753) nounwind ssp
  %..757 = fsub double 0.0, 0x4062150a3d70a3d7
  %..759 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..757, double %..759) nounwind ssp
  %..763 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..765 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..763, double %..765) nounwind ssp
  call void @glEnd() nounwind ssp
  %..769 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..769) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..781 = fsub double 0.0, 0x4062150a3d70a3d7
  %..783 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..781, double %..783) nounwind ssp
  %..787 = fsub double 0.0, 0x40613f645a1cac08
  %..789 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..787, double %..789) nounwind ssp
  %..793 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..795 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..793, double %..795) nounwind ssp
  call void @glEnd() nounwind ssp
  %..799 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..799) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..811 = fsub double 0.0, 0x4062150a3d70a3d7
  %..813 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..811, double %..813) nounwind ssp
  %..817 = fsub double 0.0, 0x4045246a7ef9db23
  %..819 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..817, double %..819) nounwind ssp
  %..823 = fsub double 0.0, 0x40613f645a1cac08
  %..825 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..823, double %..825) nounwind ssp
  call void @glEnd() nounwind ssp
  %..829 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..829) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..841 = fsub double 0.0, 0x4045246a7ef9db23
  %..843 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..841, double %..843) nounwind ssp
  %..848 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..848) nounwind ssp
  %..853 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..853) nounwind ssp
  call void @glEnd() nounwind ssp
  %..857 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..857) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..866 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..866) nounwind ssp
  %..871 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..871) nounwind ssp
  %..875 = fsub double 0.0, 0x4044078d4fdf3b64
  %..877 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..875, double %..877) nounwind ssp
  %..881 = fsub double 0.0, 0x4045246a7ef9db23
  %..883 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..881, double %..883) nounwind ssp
  call void @glEnd() nounwind ssp
  %..887 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..887) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..899 = fsub double 0.0, 0x4045246a7ef9db23
  %..901 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..899, double %..901) nounwind ssp
  %..905 = fsub double 0.0, 0x4044078d4fdf3b64
  %..907 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..905, double %..907) nounwind ssp
  %..911 = fsub double 0.0, 0x40613f645a1cac08
  %..913 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..911, double %..913) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave233
leave233:
  ret void
}
define void @Game_title_end(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..918 = load %.struct1** %game
  %..919 = bitcast %.struct1* %..918 to %.struct1*
  %..920 = getelementptr inbounds %.struct1* %..919, i64 0
  %..924 = load %.struct1** %game
  %..925 = bitcast %.struct1* %..924 to %.struct1*
  %..926 = getelementptr inbounds %.struct1* %..925, i64 0
  %..927 = getelementptr inbounds %.struct1* %..926, i32 0, i32 3
  %..928 = load i32* %..927
  %..923 = zext i32 %..928 to i64
  %..922 = add i64 %..923, 1
  %..921 = trunc i64 %..922 to i32
  %..930 = getelementptr inbounds %.struct1* %..920, i32 0, i32 3
  store i32 %..921, i32* %..930
  %..939 = load %.struct1** %game
  %..940 = bitcast %.struct1* %..939 to %.struct1*
  %..941 = getelementptr inbounds %.struct1* %..940, i64 0
  %..942 = getelementptr inbounds %.struct1* %..941, i32 0, i32 3
  %..943 = load i32* %..942
  %..938 = zext i32 %..943 to i64
  %..1851 = icmp sgt i64 %..938, 60
  %..937 = zext i1 %..1851 to i64
  %..936 = bitcast i64 %..937 to i64
  %reg_1852 = icmp ne i64 %..936, 0
  br i1 %reg_1852, label %ok931, label %else932
ok931:
  %..945 = load %.struct1** %game
  %..946 = bitcast %.struct1* %..945 to %.struct1*
  %..947 = getelementptr inbounds %.struct1* %..946, i64 0
  %..948 = getelementptr inbounds %.struct1* %..947, i32 0, i32 4
  store void(%.struct1*)* @Game_init, void(%.struct1*)** %..948
  br label %else933
else933:
  br label %endif934
else932:
  ; void
  br label %endif935
endif935:
  br label %endif934
endif934:
  br label %leave917
leave917:
  ret void
}
define void @Game_demo(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave949
leave949:
  ret void
}
define void @Game_ranking(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave950
leave950:
  ret void
}
define void @Game_init(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..952 = load %.struct1** %game
  %..953 = bitcast %.struct1* %..952 to %.struct1*
  %..954 = getelementptr inbounds %.struct1* %..953, i64 0
  %..955 = trunc i64 0 to i32
  %..957 = getelementptr inbounds %.struct1* %..954, i32 0, i32 6
  store i32 %..955, i32* %..957
  %..958 = load %.struct1** %game
  %..959 = bitcast %.struct1* %..958 to %.struct1*
  %..960 = getelementptr inbounds %.struct1* %..959, i64 0
  %..961 = trunc i64 3 to i32
  %..963 = getelementptr inbounds %.struct1* %..960, i32 0, i32 1
  store i32 %..961, i32* %..963
  %..964 = load %.struct1** %game
  %..965 = bitcast %.struct1* %..964 to %.struct1*
  %..966 = getelementptr inbounds %.struct1* %..965, i64 0
  %..967 = trunc i64 1 to i32
  %..969 = getelementptr inbounds %.struct1* %..966, i32 0, i32 0
  store i32 %..967, i32* %..969
  %..970 = load %.struct1** %game
  %..971 = bitcast %.struct1* %..970 to %.struct1*
  %..972 = getelementptr inbounds %.struct1* %..971, i64 0
  %..973 = trunc i64 0 to i32
  %..975 = getelementptr inbounds %.struct1* %..972, i32 0, i32 3
  store i32 %..973, i32* %..975
  %..976 = load %.struct1** %game
  %..977 = bitcast %.struct1* %..976 to %.struct1*
  %..978 = getelementptr inbounds %.struct1* %..977, i64 0
  %..979 = getelementptr inbounds %.struct1* %..978, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..979
  %..980 = load %.struct1** %game
  %..981 = bitcast %.struct1* %..980 to %.struct1*
  %..982 = getelementptr inbounds %.struct1* %..981, i64 0
  %..983 = getelementptr inbounds %.struct1* %..982, i32 0, i32 5
  store void()* @Game_game_draw, void()** %..983
  %..984 = load %.struct1** %game
  %..985 = load %.struct1** %game
  %..986 = bitcast %.struct1* %..985 to %.struct1*
  %..987 = getelementptr inbounds %.struct1* %..986, i64 0
  %..988 = getelementptr inbounds %.struct1* %..987, i32 0, i32 4
  %..989 = load void(%.struct1*)** %..988
  call void %..989(%.struct1* %..984) nounwind ssp
  br label %leave951
leave951:
  ret void
}
define void @Game_stageStart(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1000 = load %.struct1** %game
  %..1001 = bitcast %.struct1* %..1000 to %.struct1*
  %..1002 = getelementptr inbounds %.struct1* %..1001, i64 0
  %..1003 = getelementptr inbounds %.struct1* %..1002, i32 0, i32 3
  %..1004 = load i32* %..1003
  %..999 = zext i32 %..1004 to i64
  %..1853 = icmp sgt i64 %..999, 240
  %..998 = zext i1 %..1853 to i64
  %..997 = bitcast i64 %..998 to i64
  %reg_1854 = icmp ne i64 %..997, 0
  br i1 %reg_1854, label %ok992, label %else993
ok992:
  %..1008 = load %.struct1** %game
  %..1009 = bitcast %.struct1* %..1008 to %.struct1*
  %..1010 = getelementptr inbounds %.struct1* %..1009, i64 0
  %..1011 = getelementptr inbounds %.struct1* %..1010, i32 0, i32 4
  store void(%.struct1*)* @Game_game, void(%.struct1*)** %..1011
  br label %else994
else994:
  br label %endif995
else993:
  ; void
  br label %endif996
endif996:
  br label %endif995
endif995:
  %..1013 = load %.struct1** %game
  call void @Game_game(%.struct1* %..1013) nounwind ssp
  br label %leave991
leave991:
  ret void
}
define void @Game_game(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1024 = load %.struct1** %game
  %..1025 = bitcast %.struct1* %..1024 to %.struct1*
  %..1026 = getelementptr inbounds %.struct1* %..1025, i64 0
  %..1027 = getelementptr inbounds %.struct1* %..1026, i32 0, i32 3
  %..1028 = load i32* %..1027
  %..1023 = zext i32 %..1028 to i64
  %..1022 = srem i64 %..1023, 4
  %..1855 = icmp eq i64 %..1022, 3
  %..1021 = zext i1 %..1855 to i64
  %..1020 = bitcast i64 %..1021 to i64
  %reg_1856 = icmp ne i64 %..1020, 0
  br i1 %reg_1856, label %ok1015, label %else1016
ok1015:
  %..1031 = load %.struct1** %game
  %..1032 = bitcast %.struct1* %..1031 to %.struct1*
  %..1033 = getelementptr inbounds %.struct1* %..1032, i64 0
  %..1037 = load %.struct1** %game
  %..1038 = bitcast %.struct1* %..1037 to %.struct1*
  %..1039 = getelementptr inbounds %.struct1* %..1038, i64 0
  %..1040 = getelementptr inbounds %.struct1* %..1039, i32 0, i32 6
  %..1041 = load i32* %..1040
  %..1036 = zext i32 %..1041 to i64
  %..1035 = add i64 %..1036, 10
  %..1034 = trunc i64 %..1035 to i32
  %..1043 = getelementptr inbounds %.struct1* %..1033, i32 0, i32 6
  store i32 %..1034, i32* %..1043
  br label %else1017
else1017:
  br label %endif1018
else1016:
  ; void
  br label %endif1019
endif1019:
  br label %endif1018
endif1018:
  %..1044 = load %.struct1** %game
  %..1045 = bitcast %.struct1* %..1044 to %.struct1*
  %..1046 = getelementptr inbounds %.struct1* %..1045, i64 0
  %..1050 = load %.struct1** %game
  %..1051 = bitcast %.struct1* %..1050 to %.struct1*
  %..1052 = getelementptr inbounds %.struct1* %..1051, i64 0
  %..1053 = getelementptr inbounds %.struct1* %..1052, i32 0, i32 3
  %..1054 = load i32* %..1053
  %..1049 = zext i32 %..1054 to i64
  %..1048 = add i64 %..1049, 1
  %..1047 = trunc i64 %..1048 to i32
  %..1056 = getelementptr inbounds %.struct1* %..1046, i32 0, i32 3
  store i32 %..1047, i32* %..1056
  call void @Ship_move() nounwind ssp
  br label %leave1014
leave1014:
  ret void
}
define void @Game_game_draw() nounwind ssp {
entry:
  call void @Ship_draw() nounwind ssp
  br label %leave1058
leave1058:
  ret void
}
define void @Game_damage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1060
leave1060:
  ret void
}
define void @Game_boss(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1061
leave1061:
  ret void
}
define void @Game_nextStage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1063 = load %.struct1** %game
  %..1064 = bitcast %.struct1* %..1063 to %.struct1*
  %..1065 = getelementptr inbounds %.struct1* %..1064, i64 0
  %..1069 = load %.struct1** %game
  %..1070 = bitcast %.struct1* %..1069 to %.struct1*
  %..1071 = getelementptr inbounds %.struct1* %..1070, i64 0
  %..1072 = getelementptr inbounds %.struct1* %..1071, i32 0, i32 0
  %..1073 = load i32* %..1072
  %..1068 = zext i32 %..1073 to i64
  %..1067 = add i64 %..1068, 1
  %..1066 = trunc i64 %..1067 to i32
  %..1075 = getelementptr inbounds %.struct1* %..1065, i32 0, i32 0
  store i32 %..1066, i32* %..1075
  %..1076 = load %.struct1** %game
  %..1077 = bitcast %.struct1* %..1076 to %.struct1*
  %..1078 = getelementptr inbounds %.struct1* %..1077, i64 0
  %..1079 = getelementptr inbounds %.struct1* %..1078, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..1079
  br label %leave1062
leave1062:
  ret void
}
define void @Game_continue(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1080
leave1080:
  ret void
}
define void @Game_nameEntry(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1081
leave1081:
  ret void
}
define void @Game_ending(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1082
leave1082:
  ret void
}
@key= common global %.struct2 zeroinitializer
define void @downKey(i8 %k.v, i32 %x.v, i32 %y.v) nounwind ssp {
entry:
  %k = alloca i8
  store i8 %k.v, i8* %k
  %x = alloca i32
  store i32 %x.v, i32* %x
  %y = alloca i32
  store i32 %y.v, i32* %y
  %..1084 = load i8* %k
  %..1086 = load i8* @GLUT_KEY_UP
  %..1857 = icmp eq i8 %..1086, %..1084
  %..1087 = zext i1 %..1857 to i64
  %reg_1858 = icmp ne i64 %..1087, 0
  br i1 %reg_1858, label %switch1085_0, label %switch1085_case1
switch1085_case1:
  %..1088 = load i8* @GLUT_KEY_DOWN
  %..1859 = icmp eq i8 %..1088, %..1084
  %..1089 = zext i1 %..1859 to i64
  %reg_1860 = icmp ne i64 %..1089, 0
  br i1 %reg_1860, label %switch1085_1, label %switch1085_case2
switch1085_case2:
  %..1090 = load i8* @GLUT_KEY_LEFT
  %..1861 = icmp eq i8 %..1090, %..1084
  %..1091 = zext i1 %..1861 to i64
  %reg_1862 = icmp ne i64 %..1091, 0
  br i1 %reg_1862, label %switch1085_2, label %switch1085_case3
switch1085_case3:
  %..1092 = load i8* @GLUT_KEY_RIGHT
  %..1863 = icmp eq i8 %..1092, %..1084
  %..1093 = zext i1 %..1863 to i64
  %reg_1864 = icmp ne i64 %..1093, 0
  br i1 %reg_1864, label %switch1085_3, label %switch1085_case4
switch1085_case4:
  %..1094 = load i8* @GLUT_KEY_SPACE
  %..1865 = icmp eq i8 %..1094, %..1084
  %..1095 = zext i1 %..1865 to i64
  %reg_1866 = icmp ne i64 %..1095, 0
  br i1 %reg_1866, label %switch1085_4, label %switch1085_case5
switch1085_case5:
  br label %switch1085_end
switch1085__block:
  br label %switch1085_0
switch1085_0:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   up )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1096 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..1096)
  %..1098 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1096, i32* %..1098
  br label %switch1085_end
break1099:
  br label %switch1085_1
switch1085_1:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   down )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1100 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..1100)
  %..1102 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1100, i32* %..1102
  br label %switch1085_end
break1103:
  br label %switch1085_2
switch1085_2:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   left )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1104 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..1104)
  %..1106 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1104, i32* %..1106
  br label %switch1085_end
break1107:
  br label %switch1085_3
switch1085_3:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   right )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1108 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..1108)
  %..1110 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1108, i32* %..1110
  br label %switch1085_end
break1111:
  br label %switch1085_4
switch1085_4:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   space )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1112 = trunc i64 1 to i32
  ; b2 RL(Ti(32),..1112)
  %..1114 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1112, i32* %..1114
  br label %switch1085_end
break1115:
  br label %switch1085_end
switch1085_end:
  br label %leave1083
leave1083:
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
  %..1117 = load i8* %k
  %..1119 = load i8* @GLUT_KEY_UP
  %..1867 = icmp eq i8 %..1119, %..1117
  %..1120 = zext i1 %..1867 to i64
  %reg_1868 = icmp ne i64 %..1120, 0
  br i1 %reg_1868, label %switch1118_0, label %switch1118_case1
switch1118_case1:
  %..1121 = load i8* @GLUT_KEY_DOWN
  %..1869 = icmp eq i8 %..1121, %..1117
  %..1122 = zext i1 %..1869 to i64
  %reg_1870 = icmp ne i64 %..1122, 0
  br i1 %reg_1870, label %switch1118_1, label %switch1118_case2
switch1118_case2:
  %..1123 = load i8* @GLUT_KEY_LEFT
  %..1871 = icmp eq i8 %..1123, %..1117
  %..1124 = zext i1 %..1871 to i64
  %reg_1872 = icmp ne i64 %..1124, 0
  br i1 %reg_1872, label %switch1118_2, label %switch1118_case3
switch1118_case3:
  %..1125 = load i8* @GLUT_KEY_RIGHT
  %..1873 = icmp eq i8 %..1125, %..1117
  %..1126 = zext i1 %..1873 to i64
  %reg_1874 = icmp ne i64 %..1126, 0
  br i1 %reg_1874, label %switch1118_3, label %switch1118_case4
switch1118_case4:
  %..1127 = load i8* @GLUT_KEY_SPACE
  %..1875 = icmp eq i8 %..1127, %..1117
  %..1128 = zext i1 %..1875 to i64
  %reg_1876 = icmp ne i64 %..1128, 0
  br i1 %reg_1876, label %switch1118_4, label %switch1118_case5
switch1118_case5:
  %..1877 = icmp eq i8 27, %..1117
  %..1130 = zext i1 %..1877 to i64
  %reg_1878 = icmp ne i64 %..1130, 0
  br i1 %reg_1878, label %switch1118_5, label %switch1118_case6
switch1118_case6:
  br label %switch1118_end
switch1118__block:
  br label %switch1118_0
switch1118_0:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   up )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1131 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..1131)
  %..1133 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1131, i32* %..1133
  br label %switch1118_end
break1134:
  br label %switch1118_1
switch1118_1:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   down )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1135 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..1135)
  %..1137 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1135, i32* %..1137
  br label %switch1118_end
break1138:
  br label %switch1118_2
switch1118_2:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   left )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1139 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..1139)
  %..1141 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1139, i32* %..1141
  br label %switch1118_end
break1142:
  br label %switch1118_3
switch1118_3:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   right )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1143 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..1143)
  %..1145 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1143, i32* %..1145
  br label %switch1118_end
break1146:
  br label %switch1118_4
switch1118_4:
  ; 
  ; EField EField(   Ti(32),   TDef(Key),   EId(     TDef(Key),     key   ),   space )
  ; e2 RG(Tp(TStr(Map(up -> Ti(32), down -> Ti(32), left -> Ti(32), right -> Ti(32), space -> Ti(32)))),key)
  %..1147 = trunc i64 0 to i32
  ; b2 RL(Ti(32),..1147)
  %..1149 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1147, i32* %..1149
  br label %switch1118_end
break1150:
  br label %switch1118_5
switch1118_5:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch1118_end
break1154:
  br label %switch1118_end
switch1118_end:
  br label %leave1116
leave1116:
  ret void
}
@ship= common global %.struct3 zeroinitializer
define void @Ship_move() nounwind ssp {
entry:
  %speed = alloca double
  ; EId speed
  store double 0x4024000000000000, double* %speed
  %..1163 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  %..1164 = load i32* %..1163
  %..1162 = zext i32 %..1164 to i64
  %reg_1879 = icmp ne i64 %..1162, 0
  br i1 %reg_1879, label %ok1157, label %else1158
ok1157:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   x )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1166 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1167 = load double* %..1166
  %..1168 = load double* %speed
  %..1165 = fsub double %..1167, %..1168
  ; b2 RL(Td,..1165)
  %..1169 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1165, double* %..1169
  br label %else1159
else1159:
  br label %endif1160
else1158:
  ; void
  br label %endif1161
endif1161:
  br label %endif1160
endif1160:
  %..1176 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  %..1177 = load i32* %..1176
  %..1175 = zext i32 %..1177 to i64
  %reg_1880 = icmp ne i64 %..1175, 0
  br i1 %reg_1880, label %ok1170, label %else1171
ok1170:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   x )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1179 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1180 = load double* %..1179
  %..1181 = load double* %speed
  %..1178 = fadd double %..1180, %..1181
  ; b2 RL(Td,..1178)
  %..1182 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1178, double* %..1182
  br label %else1172
else1172:
  br label %endif1173
else1171:
  ; void
  br label %endif1174
endif1174:
  br label %endif1173
endif1173:
  %..1189 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  %..1190 = load i32* %..1189
  %..1188 = zext i32 %..1190 to i64
  %reg_1881 = icmp ne i64 %..1188, 0
  br i1 %reg_1881, label %ok1183, label %else1184
ok1183:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   y )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1192 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1193 = load double* %..1192
  %..1194 = load double* %speed
  %..1191 = fadd double %..1193, %..1194
  ; b2 RL(Td,..1191)
  %..1195 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1191, double* %..1195
  br label %else1185
else1185:
  br label %endif1186
else1184:
  ; void
  br label %endif1187
endif1187:
  br label %endif1186
endif1186:
  %..1202 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  %..1203 = load i32* %..1202
  %..1201 = zext i32 %..1203 to i64
  %reg_1882 = icmp ne i64 %..1201, 0
  br i1 %reg_1882, label %ok1196, label %else1197
ok1196:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   y )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1205 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1206 = load double* %..1205
  %..1207 = load double* %speed
  %..1204 = fsub double %..1206, %..1207
  ; b2 RL(Td,..1204)
  %..1208 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1204, double* %..1208
  br label %else1198
else1198:
  br label %endif1199
else1197:
  ; void
  br label %endif1200
endif1200:
  br label %endif1199
endif1199:
  %b = alloca double
  ; EId b
  store double 0x4072c00000000000, double* %b
  %c = alloca double
  ; EId c
  store double 0x406e000000000000, double* %c
  %..1218 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1219 = load double* %..1218
  %..1220 = sitofp i64 300 to double
  %..1883 = fcmp ogt double %..1219, %..1220
  %..1217 = zext i1 %..1883 to i64
  %..1216 = bitcast i64 %..1217 to i64
  %reg_1884 = icmp ne i64 %..1216, 0
  br i1 %reg_1884, label %ok1211, label %else1212
ok1211:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   x )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  ; b2 RL(Td,..1222)
  %..1223 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double 0x4072c00000000000, double* %..1223
  br label %else1213
else1213:
  br label %endif1214
else1212:
  ; void
  br label %endif1215
endif1215:
  br label %endif1214
endif1214:
  %..1231 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1232 = load double* %..1231
  %..1233 = sitofp i64 -300 to double
  %..1885 = fcmp olt double %..1232, %..1233
  %..1230 = zext i1 %..1885 to i64
  %..1229 = bitcast i64 %..1230 to i64
  %reg_1886 = icmp ne i64 %..1229, 0
  br i1 %reg_1886, label %ok1224, label %else1225
ok1224:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   x )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1235 = fsub double 0.0, 0x4072c00000000000
  ; b2 RL(Td,..1235)
  %..1237 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1235, double* %..1237
  br label %else1226
else1226:
  br label %endif1227
else1225:
  ; void
  br label %endif1228
endif1228:
  br label %endif1227
endif1227:
  %..1245 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1246 = load double* %..1245
  %..1247 = sitofp i64 240 to double
  %..1887 = fcmp ogt double %..1246, %..1247
  %..1244 = zext i1 %..1887 to i64
  %..1243 = bitcast i64 %..1244 to i64
  %reg_1888 = icmp ne i64 %..1243, 0
  br i1 %reg_1888, label %ok1238, label %else1239
ok1238:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   y )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  ; b2 RL(Td,..1249)
  %..1250 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double 0x406e000000000000, double* %..1250
  br label %else1240
else1240:
  br label %endif1241
else1239:
  ; void
  br label %endif1242
endif1242:
  br label %endif1241
endif1241:
  %..1258 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1259 = load double* %..1258
  %..1260 = fsub double 0.0, 0x406e000000000000
  %..1889 = fcmp olt double %..1259, %..1260
  %..1257 = zext i1 %..1889 to i64
  %..1256 = bitcast i64 %..1257 to i64
  %reg_1890 = icmp ne i64 %..1256, 0
  br i1 %reg_1890, label %ok1251, label %else1252
ok1251:
  ; EField EField(   Td,   TDef(Ship),   EId(     TDef(Ship),     ship   ),   y )
  ; e2 RG(Tp(TStr(Map(x -> Td, y -> Td))),ship)
  %..1262 = fsub double 0.0, 0x406e000000000000
  ; b2 RL(Td,..1262)
  %..1264 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1262, double* %..1264
  br label %else1253
else1253:
  br label %endif1254
else1252:
  ; void
  br label %endif1255
endif1255:
  br label %endif1254
endif1254:
  br label %leave1155
leave1155:
  ret void
}
define void @Ship_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..1268 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1269 = load double* %..1268
  %..1270 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1271 = load double* %..1270
  call void @glTranslated(double %..1269, double %..1271, double 0x0) nounwind ssp
  %x = alloca double
  ; EId x
  store double 0x402e000000000000, double* %x
  %y = alloca double
  ; EId y
  store double 0x403e000000000000, double* %y
  %..1276 = load i32* @GL_POLYGON
  call void @glBegin(i32 %..1276) nounwind ssp
  call void @color(float 0x3ff0000000000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x0, double 0x0, double 0x3ff0000000000000) nounwind ssp
  %..1288 = load double* %x
  %..1287 = fsub double 0.0, %..1288
  %..1289 = load double* %y
  call void @glVertex3d(double %..1287, double %..1289, double 0x0) nounwind ssp
  %..1292 = load double* %x
  %..1293 = load double* %y
  call void @glVertex3d(double %..1292, double %..1293, double 0x0) nounwind ssp
  %..1296 = load double* %x
  %..1298 = load double* %y
  %..1297 = fsub double 0.0, %..1298
  call void @glVertex3d(double %..1296, double %..1297, double 0x0) nounwind ssp
  %..1302 = load double* %x
  %..1301 = fsub double 0.0, %..1302
  %..1304 = load double* %y
  %..1303 = fsub double 0.0, %..1304
  call void @glVertex3d(double %..1301, double %..1303, double 0x0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave1265
leave1265:
  ret void
}
define void @Stage_init(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1309 = getelementptr inbounds %.struct1* @game, i32 0, i32 0
  %..1310 = load i32* %..1309
  %..1891 = icmp eq i32 1, %..1310
  %..1313 = zext i1 %..1891 to i64
  %reg_1892 = icmp ne i64 %..1313, 0
  br i1 %reg_1892, label %switch1311_0, label %switch1311_case1
switch1311_case1:
  %..1893 = icmp eq i32 2, %..1310
  %..1315 = zext i1 %..1893 to i64
  %reg_1894 = icmp ne i64 %..1315, 0
  br i1 %reg_1894, label %switch1311_1, label %switch1311_case2
switch1311_case2:
  %..1895 = icmp eq i32 3, %..1310
  %..1317 = zext i1 %..1895 to i64
  %reg_1896 = icmp ne i64 %..1317, 0
  br i1 %reg_1896, label %switch1311_2, label %switch1311_case3
switch1311_case3:
  %..1897 = icmp eq i32 4, %..1310
  %..1319 = zext i1 %..1897 to i64
  %reg_1898 = icmp ne i64 %..1319, 0
  br i1 %reg_1898, label %switch1311_3, label %switch1311_case4
switch1311_case4:
  %..1899 = icmp eq i32 5, %..1310
  %..1321 = zext i1 %..1899 to i64
  %reg_1900 = icmp ne i64 %..1321, 0
  br i1 %reg_1900, label %switch1311_4, label %switch1311_case5
switch1311_case5:
  %..1901 = icmp eq i32 6, %..1310
  %..1323 = zext i1 %..1901 to i64
  %reg_1902 = icmp ne i64 %..1323, 0
  br i1 %reg_1902, label %switch1311_5, label %switch1311_case6
switch1311_case6:
  %..1903 = icmp eq i32 7, %..1310
  %..1325 = zext i1 %..1903 to i64
  %reg_1904 = icmp ne i64 %..1325, 0
  br i1 %reg_1904, label %switch1311_6, label %switch1311_case7
switch1311_case7:
  %..1905 = icmp eq i32 8, %..1310
  %..1327 = zext i1 %..1905 to i64
  %reg_1906 = icmp ne i64 %..1327, 0
  br i1 %reg_1906, label %switch1311_7, label %switch1311_case8
switch1311_case8:
  %..1907 = icmp eq i32 9, %..1310
  %..1329 = zext i1 %..1907 to i64
  %reg_1908 = icmp ne i64 %..1329, 0
  br i1 %reg_1908, label %switch1311_8, label %switch1311_case9
switch1311_case9:
  %..1909 = icmp eq i32 10, %..1310
  %..1331 = zext i1 %..1909 to i64
  %reg_1910 = icmp ne i64 %..1331, 0
  br i1 %reg_1910, label %switch1311_9, label %switch1311_case10
switch1311_case10:
  %..1911 = icmp eq i32 11, %..1310
  %..1333 = zext i1 %..1911 to i64
  %reg_1912 = icmp ne i64 %..1333, 0
  br i1 %reg_1912, label %switch1311_10, label %switch1311_case11
switch1311_case11:
  %..1913 = icmp eq i32 12, %..1310
  %..1335 = zext i1 %..1913 to i64
  %reg_1914 = icmp ne i64 %..1335, 0
  br i1 %reg_1914, label %switch1311_11, label %switch1311_case12
switch1311_case12:
  %..1915 = icmp eq i32 13, %..1310
  %..1337 = zext i1 %..1915 to i64
  %reg_1916 = icmp ne i64 %..1337, 0
  br i1 %reg_1916, label %switch1311_12, label %switch1311_case13
switch1311_case13:
  %..1917 = icmp eq i32 14, %..1310
  %..1339 = zext i1 %..1917 to i64
  %reg_1918 = icmp ne i64 %..1339, 0
  br i1 %reg_1918, label %switch1311_13, label %switch1311_case14
switch1311_case14:
  %..1919 = icmp eq i32 15, %..1310
  %..1341 = zext i1 %..1919 to i64
  %reg_1920 = icmp ne i64 %..1341, 0
  br i1 %reg_1920, label %switch1311_14, label %switch1311_case15
switch1311_case15:
  %..1921 = icmp eq i32 16, %..1310
  %..1343 = zext i1 %..1921 to i64
  %reg_1922 = icmp ne i64 %..1343, 0
  br i1 %reg_1922, label %switch1311_15, label %switch1311_case16
switch1311_case16:
  %..1923 = icmp eq i32 17, %..1310
  %..1345 = zext i1 %..1923 to i64
  %reg_1924 = icmp ne i64 %..1345, 0
  br i1 %reg_1924, label %switch1311_16, label %switch1311_case17
switch1311_case17:
  %..1925 = icmp eq i32 18, %..1310
  %..1347 = zext i1 %..1925 to i64
  %reg_1926 = icmp ne i64 %..1347, 0
  br i1 %reg_1926, label %switch1311_17, label %switch1311_case18
switch1311_case18:
  %..1927 = icmp eq i32 19, %..1310
  %..1349 = zext i1 %..1927 to i64
  %reg_1928 = icmp ne i64 %..1349, 0
  br i1 %reg_1928, label %switch1311_18, label %switch1311_case19
switch1311_case19:
  br label %switch1311_end
switch1311__block:
  br label %switch1311_0
switch1311_0:
  ; 
  %..1350 = load %.struct4** %stg
  %..1351 = bitcast %.struct4* %..1350 to %.struct4*
  %..1352 = getelementptr inbounds %.struct4* %..1351, i64 0
  %..1353 = getelementptr inbounds %.struct4* %..1352, i32 0, i32 0
  store void(%.struct4*)* @Stage_1, void(%.struct4*)** %..1353
  br label %switch1311_end
break1354:
  br label %switch1311_1
switch1311_1:
  ; 
  %..1355 = load %.struct4** %stg
  %..1356 = bitcast %.struct4* %..1355 to %.struct4*
  %..1357 = getelementptr inbounds %.struct4* %..1356, i64 0
  %..1358 = getelementptr inbounds %.struct4* %..1357, i32 0, i32 0
  store void(%.struct4*)* @Stage_2, void(%.struct4*)** %..1358
  br label %switch1311_end
break1359:
  br label %switch1311_2
switch1311_2:
  ; 
  %..1360 = load %.struct4** %stg
  %..1361 = bitcast %.struct4* %..1360 to %.struct4*
  %..1362 = getelementptr inbounds %.struct4* %..1361, i64 0
  %..1363 = getelementptr inbounds %.struct4* %..1362, i32 0, i32 0
  store void(%.struct4*)* @Stage_3, void(%.struct4*)** %..1363
  br label %switch1311_end
break1364:
  br label %switch1311_3
switch1311_3:
  ; 
  %..1365 = load %.struct4** %stg
  %..1366 = bitcast %.struct4* %..1365 to %.struct4*
  %..1367 = getelementptr inbounds %.struct4* %..1366, i64 0
  %..1368 = getelementptr inbounds %.struct4* %..1367, i32 0, i32 0
  store void(%.struct4*)* @Stage_4, void(%.struct4*)** %..1368
  br label %switch1311_end
break1369:
  br label %switch1311_4
switch1311_4:
  ; 
  %..1370 = load %.struct4** %stg
  %..1371 = bitcast %.struct4* %..1370 to %.struct4*
  %..1372 = getelementptr inbounds %.struct4* %..1371, i64 0
  %..1373 = getelementptr inbounds %.struct4* %..1372, i32 0, i32 0
  store void(%.struct4*)* @Stage_5, void(%.struct4*)** %..1373
  br label %switch1311_end
break1374:
  br label %switch1311_5
switch1311_5:
  ; 
  %..1375 = load %.struct4** %stg
  %..1376 = bitcast %.struct4* %..1375 to %.struct4*
  %..1377 = getelementptr inbounds %.struct4* %..1376, i64 0
  %..1378 = getelementptr inbounds %.struct4* %..1377, i32 0, i32 0
  store void(%.struct4*)* @Stage_6, void(%.struct4*)** %..1378
  br label %switch1311_end
break1379:
  br label %switch1311_6
switch1311_6:
  ; 
  %..1380 = load %.struct4** %stg
  %..1381 = bitcast %.struct4* %..1380 to %.struct4*
  %..1382 = getelementptr inbounds %.struct4* %..1381, i64 0
  %..1383 = getelementptr inbounds %.struct4* %..1382, i32 0, i32 0
  store void(%.struct4*)* @Stage_7, void(%.struct4*)** %..1383
  br label %switch1311_end
break1384:
  br label %switch1311_7
switch1311_7:
  ; 
  %..1385 = load %.struct4** %stg
  %..1386 = bitcast %.struct4* %..1385 to %.struct4*
  %..1387 = getelementptr inbounds %.struct4* %..1386, i64 0
  %..1388 = getelementptr inbounds %.struct4* %..1387, i32 0, i32 0
  store void(%.struct4*)* @Stage_8, void(%.struct4*)** %..1388
  br label %switch1311_end
break1389:
  br label %switch1311_8
switch1311_8:
  ; 
  %..1390 = load %.struct4** %stg
  %..1391 = bitcast %.struct4* %..1390 to %.struct4*
  %..1392 = getelementptr inbounds %.struct4* %..1391, i64 0
  %..1393 = getelementptr inbounds %.struct4* %..1392, i32 0, i32 0
  store void(%.struct4*)* @Stage_9, void(%.struct4*)** %..1393
  br label %switch1311_end
break1394:
  br label %switch1311_9
switch1311_9:
  ; 
  %..1395 = load %.struct4** %stg
  %..1396 = bitcast %.struct4* %..1395 to %.struct4*
  %..1397 = getelementptr inbounds %.struct4* %..1396, i64 0
  %..1398 = getelementptr inbounds %.struct4* %..1397, i32 0, i32 0
  store void(%.struct4*)* @Stage_10, void(%.struct4*)** %..1398
  br label %switch1311_end
break1399:
  br label %switch1311_10
switch1311_10:
  ; 
  %..1400 = load %.struct4** %stg
  %..1401 = bitcast %.struct4* %..1400 to %.struct4*
  %..1402 = getelementptr inbounds %.struct4* %..1401, i64 0
  %..1403 = getelementptr inbounds %.struct4* %..1402, i32 0, i32 0
  store void(%.struct4*)* @Stage_11, void(%.struct4*)** %..1403
  br label %switch1311_end
break1404:
  br label %switch1311_11
switch1311_11:
  ; 
  %..1405 = load %.struct4** %stg
  %..1406 = bitcast %.struct4* %..1405 to %.struct4*
  %..1407 = getelementptr inbounds %.struct4* %..1406, i64 0
  %..1408 = getelementptr inbounds %.struct4* %..1407, i32 0, i32 0
  store void(%.struct4*)* @Stage_12, void(%.struct4*)** %..1408
  br label %switch1311_end
break1409:
  br label %switch1311_12
switch1311_12:
  ; 
  %..1410 = load %.struct4** %stg
  %..1411 = bitcast %.struct4* %..1410 to %.struct4*
  %..1412 = getelementptr inbounds %.struct4* %..1411, i64 0
  %..1413 = getelementptr inbounds %.struct4* %..1412, i32 0, i32 0
  store void(%.struct4*)* @Stage_13, void(%.struct4*)** %..1413
  br label %switch1311_end
break1414:
  br label %switch1311_13
switch1311_13:
  ; 
  %..1415 = load %.struct4** %stg
  %..1416 = bitcast %.struct4* %..1415 to %.struct4*
  %..1417 = getelementptr inbounds %.struct4* %..1416, i64 0
  %..1418 = getelementptr inbounds %.struct4* %..1417, i32 0, i32 0
  store void(%.struct4*)* @Stage_14, void(%.struct4*)** %..1418
  br label %switch1311_end
break1419:
  br label %switch1311_14
switch1311_14:
  ; 
  %..1420 = load %.struct4** %stg
  %..1421 = bitcast %.struct4* %..1420 to %.struct4*
  %..1422 = getelementptr inbounds %.struct4* %..1421, i64 0
  %..1423 = getelementptr inbounds %.struct4* %..1422, i32 0, i32 0
  store void(%.struct4*)* @Stage_15, void(%.struct4*)** %..1423
  br label %switch1311_end
break1424:
  br label %switch1311_15
switch1311_15:
  ; 
  %..1425 = load %.struct4** %stg
  %..1426 = bitcast %.struct4* %..1425 to %.struct4*
  %..1427 = getelementptr inbounds %.struct4* %..1426, i64 0
  %..1428 = getelementptr inbounds %.struct4* %..1427, i32 0, i32 0
  store void(%.struct4*)* @Stage_16, void(%.struct4*)** %..1428
  br label %switch1311_end
break1429:
  br label %switch1311_16
switch1311_16:
  ; 
  %..1430 = load %.struct4** %stg
  %..1431 = bitcast %.struct4* %..1430 to %.struct4*
  %..1432 = getelementptr inbounds %.struct4* %..1431, i64 0
  %..1433 = getelementptr inbounds %.struct4* %..1432, i32 0, i32 0
  store void(%.struct4*)* @Stage_17, void(%.struct4*)** %..1433
  br label %switch1311_end
break1434:
  br label %switch1311_17
switch1311_17:
  ; 
  %..1435 = load %.struct4** %stg
  %..1436 = bitcast %.struct4* %..1435 to %.struct4*
  %..1437 = getelementptr inbounds %.struct4* %..1436, i64 0
  %..1438 = getelementptr inbounds %.struct4* %..1437, i32 0, i32 0
  store void(%.struct4*)* @Stage_18, void(%.struct4*)** %..1438
  br label %switch1311_end
break1439:
  br label %switch1311_18
switch1311_18:
  ; 
  %..1440 = load %.struct4** %stg
  %..1441 = bitcast %.struct4* %..1440 to %.struct4*
  %..1442 = getelementptr inbounds %.struct4* %..1441, i64 0
  %..1443 = getelementptr inbounds %.struct4* %..1442, i32 0, i32 0
  store void(%.struct4*)* @Stage_ending, void(%.struct4*)** %..1443
  br label %switch1311_end
break1444:
  br label %switch1311_end
switch1311_end:
  br label %leave1308
leave1308:
  ret void
}
define void @ptn7() nounwind ssp {
entry:
  ; void
  br label %leave1445
leave1445:
  ret void
}
define void @ptn1() nounwind ssp {
entry:
  ; void
  br label %leave1446
leave1446:
  ret void
}
define void @ptn2r() nounwind ssp {
entry:
  ; void
  br label %leave1447
leave1447:
  ret void
}
define void @ptn2c() nounwind ssp {
entry:
  ; void
  br label %leave1448
leave1448:
  ret void
}
define void @ptn2l() nounwind ssp {
entry:
  ; void
  br label %leave1449
leave1449:
  ret void
}
define void @ptn3r() nounwind ssp {
entry:
  ; void
  br label %leave1450
leave1450:
  ret void
}
define void @ptn3l() nounwind ssp {
entry:
  ; void
  br label %leave1451
leave1451:
  ret void
}
define void @tmsu() nounwind ssp {
entry:
  ; void
  br label %leave1452
leave1452:
  ret void
}
define void @tmsl() nounwind ssp {
entry:
  ; void
  br label %leave1453
leave1453:
  ret void
}
define void @tmsr() nounwind ssp {
entry:
  ; void
  br label %leave1454
leave1454:
  ret void
}
define void @boss1() nounwind ssp {
entry:
  ; void
  br label %leave1455
leave1455:
  ret void
}
define void @ptn_hatena() nounwind ssp {
entry:
  ; void
  br label %leave1456
leave1456:
  ret void
}
define void @ptn4l() nounwind ssp {
entry:
  ; void
  br label %leave1457
leave1457:
  ret void
}
define void @ptn4r() nounwind ssp {
entry:
  ; void
  br label %leave1458
leave1458:
  ret void
}
define void @Stage_1(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1460 = load %.struct4** %stg
  %..1461 = bitcast %.struct4* %..1460 to %.struct4*
  %..1462 = getelementptr inbounds %.struct4* %..1461, i64 0
  %..1463 = getelementptr inbounds %.struct4* %..1462, i32 0, i32 1
  %..1464 = load i32* %..1463
  %..1929 = icmp eq i32 300, %..1464
  %..1471 = zext i1 %..1929 to i64
  %reg_1930 = icmp ne i64 %..1471, 0
  br i1 %reg_1930, label %switch1465_0, label %switch1465_case1
switch1465_case1:
  %..1931 = icmp eq i32 304, %..1464
  %..1477 = zext i1 %..1931 to i64
  %reg_1932 = icmp ne i64 %..1477, 0
  br i1 %reg_1932, label %switch1465_1, label %switch1465_case2
switch1465_case2:
  %..1933 = icmp eq i32 308, %..1464
  %..1487 = zext i1 %..1933 to i64
  %reg_1934 = icmp ne i64 %..1487, 0
  br i1 %reg_1934, label %switch1465_2, label %switch1465_case3
switch1465_case3:
  %..1935 = icmp eq i32 312, %..1464
  %..1497 = zext i1 %..1935 to i64
  %reg_1936 = icmp ne i64 %..1497, 0
  br i1 %reg_1936, label %switch1465_3, label %switch1465_case4
switch1465_case4:
  %..1937 = icmp eq i32 316, %..1464
  %..1507 = zext i1 %..1937 to i64
  %reg_1938 = icmp ne i64 %..1507, 0
  br i1 %reg_1938, label %switch1465_4, label %switch1465_case5
switch1465_case5:
  %..1939 = icmp eq i32 320, %..1464
  %..1517 = zext i1 %..1939 to i64
  %reg_1940 = icmp ne i64 %..1517, 0
  br i1 %reg_1940, label %switch1465_5, label %switch1465_case6
switch1465_case6:
  %..1941 = icmp eq i32 660, %..1464
  %..1523 = zext i1 %..1941 to i64
  %reg_1942 = icmp ne i64 %..1523, 0
  br i1 %reg_1942, label %switch1465_6, label %switch1465_case7
switch1465_case7:
  %..1943 = icmp eq i32 665, %..1464
  %..1533 = zext i1 %..1943 to i64
  %reg_1944 = icmp ne i64 %..1533, 0
  br i1 %reg_1944, label %switch1465_7, label %switch1465_case8
switch1465_case8:
  %..1945 = icmp eq i32 670, %..1464
  %..1543 = zext i1 %..1945 to i64
  %reg_1946 = icmp ne i64 %..1543, 0
  br i1 %reg_1946, label %switch1465_8, label %switch1465_case9
switch1465_case9:
  %..1947 = icmp eq i32 1080, %..1464
  %..1549 = zext i1 %..1947 to i64
  %reg_1948 = icmp ne i64 %..1549, 0
  br i1 %reg_1948, label %switch1465_9, label %switch1465_case10
switch1465_case10:
  %..1949 = icmp eq i32 1084, %..1464
  %..1559 = zext i1 %..1949 to i64
  %reg_1950 = icmp ne i64 %..1559, 0
  br i1 %reg_1950, label %switch1465_10, label %switch1465_case11
switch1465_case11:
  %..1951 = icmp eq i32 1088, %..1464
  %..1569 = zext i1 %..1951 to i64
  %reg_1952 = icmp ne i64 %..1569, 0
  br i1 %reg_1952, label %switch1465_11, label %switch1465_case12
switch1465_case12:
  %..1953 = icmp eq i32 1092, %..1464
  %..1579 = zext i1 %..1953 to i64
  %reg_1954 = icmp ne i64 %..1579, 0
  br i1 %reg_1954, label %switch1465_12, label %switch1465_case13
switch1465_case13:
  %..1955 = icmp eq i32 1200, %..1464
  %..1585 = zext i1 %..1955 to i64
  %reg_1956 = icmp ne i64 %..1585, 0
  br i1 %reg_1956, label %switch1465_13, label %switch1465_case14
switch1465_case14:
  %..1957 = icmp eq i32 1204, %..1464
  %..1595 = zext i1 %..1957 to i64
  %reg_1958 = icmp ne i64 %..1595, 0
  br i1 %reg_1958, label %switch1465_14, label %switch1465_case15
switch1465_case15:
  %..1959 = icmp eq i32 1208, %..1464
  %..1605 = zext i1 %..1959 to i64
  %reg_1960 = icmp ne i64 %..1605, 0
  br i1 %reg_1960, label %switch1465_15, label %switch1465_case16
switch1465_case16:
  %..1961 = icmp eq i32 1212, %..1464
  %..1615 = zext i1 %..1961 to i64
  %reg_1962 = icmp ne i64 %..1615, 0
  br i1 %reg_1962, label %switch1465_16, label %switch1465_case17
switch1465_case17:
  %..1963 = icmp eq i32 1530, %..1464
  %..1621 = zext i1 %..1963 to i64
  %reg_1964 = icmp ne i64 %..1621, 0
  br i1 %reg_1964, label %switch1465_17, label %switch1465_case18
switch1465_case18:
  %..1965 = icmp eq i32 2100, %..1464
  %..1627 = zext i1 %..1965 to i64
  %reg_1966 = icmp ne i64 %..1627, 0
  br i1 %reg_1966, label %switch1465_18, label %switch1465_case19
switch1465_case19:
  %..1967 = icmp eq i32 2520, %..1464
  %..1633 = zext i1 %..1967 to i64
  %reg_1968 = icmp ne i64 %..1633, 0
  br i1 %reg_1968, label %switch1465_19, label %switch1465_case20
switch1465_case20:
  %..1969 = icmp eq i32 2525, %..1464
  %..1643 = zext i1 %..1969 to i64
  %reg_1970 = icmp ne i64 %..1643, 0
  br i1 %reg_1970, label %switch1465_20, label %switch1465_case21
switch1465_case21:
  %..1971 = icmp eq i32 2530, %..1464
  %..1653 = zext i1 %..1971 to i64
  %reg_1972 = icmp ne i64 %..1653, 0
  br i1 %reg_1972, label %switch1465_21, label %switch1465_case22
switch1465_case22:
  %..1973 = icmp eq i32 2940, %..1464
  %..1659 = zext i1 %..1973 to i64
  %reg_1974 = icmp ne i64 %..1659, 0
  br i1 %reg_1974, label %switch1465_22, label %switch1465_case23
switch1465_case23:
  %..1975 = icmp eq i32 3540, %..1464
  %..1665 = zext i1 %..1975 to i64
  %reg_1976 = icmp ne i64 %..1665, 0
  br i1 %reg_1976, label %switch1465_23, label %switch1465_case24
switch1465_case24:
  br label %switch1465_end
switch1465__block:
  br label %switch1465_0
switch1465_0:
  ; 
  call void @ptn7() nounwind ssp
  br label %switch1465_end
break1667:
  br label %switch1465_1
switch1465_1:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch1465_end
break1669:
  br label %switch1465_2
switch1465_2:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch1465_end
break1671:
  br label %switch1465_3
switch1465_3:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch1465_end
break1673:
  br label %switch1465_4
switch1465_4:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch1465_end
break1675:
  br label %switch1465_5
switch1465_5:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch1465_end
break1677:
  br label %switch1465_6
switch1465_6:
  ; 
  call void @ptn2r() nounwind ssp
  br label %switch1465_end
break1679:
  br label %switch1465_7
switch1465_7:
  ; 
  call void @ptn2c() nounwind ssp
  br label %switch1465_end
break1681:
  br label %switch1465_8
switch1465_8:
  ; 
  call void @ptn2l() nounwind ssp
  br label %switch1465_end
break1683:
  br label %switch1465_9
switch1465_9:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch1465_end
break1685:
  br label %switch1465_10
switch1465_10:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch1465_end
break1687:
  br label %switch1465_11
switch1465_11:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch1465_end
break1689:
  br label %switch1465_12
switch1465_12:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch1465_end
break1691:
  br label %switch1465_13
switch1465_13:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch1465_end
break1693:
  br label %switch1465_14
switch1465_14:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch1465_end
break1695:
  br label %switch1465_15
switch1465_15:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch1465_end
break1697:
  br label %switch1465_16
switch1465_16:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch1465_end
break1699:
  br label %switch1465_17
switch1465_17:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch1465_end
break1703:
  br label %switch1465_18
switch1465_18:
  ; 
  call void @ptn_hatena() nounwind ssp
  br label %switch1465_end
break1705:
  br label %switch1465_19
switch1465_19:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch1465_end
break1708:
  br label %switch1465_20
switch1465_20:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch1465_end
break1711:
  br label %switch1465_21
switch1465_21:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch1465_end
break1714:
  br label %switch1465_22
switch1465_22:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch1465_end
break1718:
  br label %switch1465_23
switch1465_23:
  ; 
  call void @boss1() nounwind ssp
  br label %switch1465_end
break1720:
  br label %switch1465_end
switch1465_end:
  br label %leave1459
leave1459:
  ret void
}
define void @Stage_2(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1722 = load %.struct4** %stg
  %..1723 = bitcast %.struct4* %..1722 to %.struct4*
  %..1724 = getelementptr inbounds %.struct4* %..1723, i64 0
  %..1725 = getelementptr inbounds %.struct4* %..1724, i32 0, i32 1
  %..1726 = load i32* %..1725
  br label %switch1727_end
switch1727__block:
  br label %switch1727_end
switch1727_end:
  br label %leave1721
leave1721:
  ret void
}
define void @Stage_3(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1729 = load %.struct4** %stg
  %..1730 = bitcast %.struct4* %..1729 to %.struct4*
  %..1731 = getelementptr inbounds %.struct4* %..1730, i64 0
  %..1732 = getelementptr inbounds %.struct4* %..1731, i32 0, i32 1
  %..1733 = load i32* %..1732
  br label %switch1734_end
switch1734__block:
  br label %switch1734_end
switch1734_end:
  br label %leave1728
leave1728:
  ret void
}
define void @Stage_4(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1736 = load %.struct4** %stg
  %..1737 = bitcast %.struct4* %..1736 to %.struct4*
  %..1738 = getelementptr inbounds %.struct4* %..1737, i64 0
  %..1739 = getelementptr inbounds %.struct4* %..1738, i32 0, i32 1
  %..1740 = load i32* %..1739
  br label %switch1741_end
switch1741__block:
  br label %switch1741_end
switch1741_end:
  br label %leave1735
leave1735:
  ret void
}
define void @Stage_5(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1743 = load %.struct4** %stg
  %..1744 = bitcast %.struct4* %..1743 to %.struct4*
  %..1745 = getelementptr inbounds %.struct4* %..1744, i64 0
  %..1746 = getelementptr inbounds %.struct4* %..1745, i32 0, i32 1
  %..1747 = load i32* %..1746
  br label %switch1748_end
switch1748__block:
  br label %switch1748_end
switch1748_end:
  br label %leave1742
leave1742:
  ret void
}
define void @Stage_6(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1750 = load %.struct4** %stg
  %..1751 = bitcast %.struct4* %..1750 to %.struct4*
  %..1752 = getelementptr inbounds %.struct4* %..1751, i64 0
  %..1753 = getelementptr inbounds %.struct4* %..1752, i32 0, i32 1
  %..1754 = load i32* %..1753
  br label %switch1755_end
switch1755__block:
  br label %switch1755_end
switch1755_end:
  br label %leave1749
leave1749:
  ret void
}
define void @Stage_7(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1757 = load %.struct4** %stg
  %..1758 = bitcast %.struct4* %..1757 to %.struct4*
  %..1759 = getelementptr inbounds %.struct4* %..1758, i64 0
  %..1760 = getelementptr inbounds %.struct4* %..1759, i32 0, i32 1
  %..1761 = load i32* %..1760
  br label %switch1762_end
switch1762__block:
  br label %switch1762_end
switch1762_end:
  br label %leave1756
leave1756:
  ret void
}
define void @Stage_8(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1764 = load %.struct4** %stg
  %..1765 = bitcast %.struct4* %..1764 to %.struct4*
  %..1766 = getelementptr inbounds %.struct4* %..1765, i64 0
  %..1767 = getelementptr inbounds %.struct4* %..1766, i32 0, i32 1
  %..1768 = load i32* %..1767
  br label %switch1769_end
switch1769__block:
  br label %switch1769_end
switch1769_end:
  br label %leave1763
leave1763:
  ret void
}
define void @Stage_9(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1771 = load %.struct4** %stg
  %..1772 = bitcast %.struct4* %..1771 to %.struct4*
  %..1773 = getelementptr inbounds %.struct4* %..1772, i64 0
  %..1774 = getelementptr inbounds %.struct4* %..1773, i32 0, i32 1
  %..1775 = load i32* %..1774
  br label %switch1776_end
switch1776__block:
  br label %switch1776_end
switch1776_end:
  br label %leave1770
leave1770:
  ret void
}
define void @Stage_10(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1778 = load %.struct4** %stg
  %..1779 = bitcast %.struct4* %..1778 to %.struct4*
  %..1780 = getelementptr inbounds %.struct4* %..1779, i64 0
  %..1781 = getelementptr inbounds %.struct4* %..1780, i32 0, i32 1
  %..1782 = load i32* %..1781
  br label %switch1783_end
switch1783__block:
  br label %switch1783_end
switch1783_end:
  br label %leave1777
leave1777:
  ret void
}
define void @Stage_11(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1785 = load %.struct4** %stg
  %..1786 = bitcast %.struct4* %..1785 to %.struct4*
  %..1787 = getelementptr inbounds %.struct4* %..1786, i64 0
  %..1788 = getelementptr inbounds %.struct4* %..1787, i32 0, i32 1
  %..1789 = load i32* %..1788
  br label %switch1790_end
switch1790__block:
  br label %switch1790_end
switch1790_end:
  br label %leave1784
leave1784:
  ret void
}
define void @Stage_12(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1792 = load %.struct4** %stg
  %..1793 = bitcast %.struct4* %..1792 to %.struct4*
  %..1794 = getelementptr inbounds %.struct4* %..1793, i64 0
  %..1795 = getelementptr inbounds %.struct4* %..1794, i32 0, i32 1
  %..1796 = load i32* %..1795
  br label %switch1797_end
switch1797__block:
  br label %switch1797_end
switch1797_end:
  br label %leave1791
leave1791:
  ret void
}
define void @Stage_13(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1799 = load %.struct4** %stg
  %..1800 = bitcast %.struct4* %..1799 to %.struct4*
  %..1801 = getelementptr inbounds %.struct4* %..1800, i64 0
  %..1802 = getelementptr inbounds %.struct4* %..1801, i32 0, i32 1
  %..1803 = load i32* %..1802
  br label %switch1804_end
switch1804__block:
  br label %switch1804_end
switch1804_end:
  br label %leave1798
leave1798:
  ret void
}
define void @Stage_14(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1806 = load %.struct4** %stg
  %..1807 = bitcast %.struct4* %..1806 to %.struct4*
  %..1808 = getelementptr inbounds %.struct4* %..1807, i64 0
  %..1809 = getelementptr inbounds %.struct4* %..1808, i32 0, i32 1
  %..1810 = load i32* %..1809
  br label %switch1811_end
switch1811__block:
  br label %switch1811_end
switch1811_end:
  br label %leave1805
leave1805:
  ret void
}
define void @Stage_15(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1813 = load %.struct4** %stg
  %..1814 = bitcast %.struct4* %..1813 to %.struct4*
  %..1815 = getelementptr inbounds %.struct4* %..1814, i64 0
  %..1816 = getelementptr inbounds %.struct4* %..1815, i32 0, i32 1
  %..1817 = load i32* %..1816
  br label %switch1818_end
switch1818__block:
  br label %switch1818_end
switch1818_end:
  br label %leave1812
leave1812:
  ret void
}
define void @Stage_16(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1820 = load %.struct4** %stg
  %..1821 = bitcast %.struct4* %..1820 to %.struct4*
  %..1822 = getelementptr inbounds %.struct4* %..1821, i64 0
  %..1823 = getelementptr inbounds %.struct4* %..1822, i32 0, i32 1
  %..1824 = load i32* %..1823
  br label %switch1825_end
switch1825__block:
  br label %switch1825_end
switch1825_end:
  br label %leave1819
leave1819:
  ret void
}
define void @Stage_17(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1827 = load %.struct4** %stg
  %..1828 = bitcast %.struct4* %..1827 to %.struct4*
  %..1829 = getelementptr inbounds %.struct4* %..1828, i64 0
  %..1830 = getelementptr inbounds %.struct4* %..1829, i32 0, i32 1
  %..1831 = load i32* %..1830
  br label %switch1832_end
switch1832__block:
  br label %switch1832_end
switch1832_end:
  br label %leave1826
leave1826:
  ret void
}
define void @Stage_18(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1834 = load %.struct4** %stg
  %..1835 = bitcast %.struct4* %..1834 to %.struct4*
  %..1836 = getelementptr inbounds %.struct4* %..1835, i64 0
  %..1837 = getelementptr inbounds %.struct4* %..1836, i32 0, i32 1
  %..1838 = load i32* %..1837
  br label %switch1839_end
switch1839__block:
  br label %switch1839_end
switch1839_end:
  br label %leave1833
leave1833:
  ret void
}
define void @Stage_ending(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1841 = load %.struct4** %stg
  %..1842 = bitcast %.struct4* %..1841 to %.struct4*
  %..1843 = getelementptr inbounds %.struct4* %..1842, i64 0
  %..1844 = getelementptr inbounds %.struct4* %..1843, i32 0, i32 1
  %..1845 = load i32* %..1844
  br label %switch1846_end
switch1846__block:
  br label %switch1846_end
switch1846_end:
  br label %leave1840
leave1840:
  ret void
}
declare void @glutKeyboardFunc(void(i8, i32, i32)*) nounwind
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
declare void @glDisable(i32) nounwind
@short = external global i16
declare void @glViewport(i32, i32, i32, i32) nounwind
declare void @glutInitWindowSize(i32, i32) nounwind
declare void @glutSpecialUpFunc(void(i8, i32, i32)*) nounwind
declare void @glLoadIdentity() nounwind
declare void @print_d(double) nounwind
@char = external global i8
declare void @glutDisplayFunc(void()*) nounwind
declare void @println(i8*) nounwind
declare void @glFlush() nounwind
declare void @glPushMatrix() nounwind
declare void @glutMainLoop() nounwind
declare void @glutEnterGameMode() nounwind
@double = external global double
declare void @gluPerspective(double, double, double, double) nounwind
declare void @glRotated(double, double, double, double) nounwind
@long = external global i64
declare void @glutGameModeString(i8*) nounwind
@Game = external global %.struct1
declare void @gluLookAt(double, double, double, double, double, double, double, double, double) nounwind
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
@Stage = external global %.struct4
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
