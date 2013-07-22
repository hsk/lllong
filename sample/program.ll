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
  %..7 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double 0x0, double* %..7
  %..9 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double 0x0, double* %..9
  %..11 = load i8*** %argv
  call void @glutInit(i32* %argc, i8** %..11) nounwind ssp
  call void @glutInitWindowSize(i32 640, i32 480) nounwind ssp
  %..20 = bitcast i64 0 to i64
  %reg_1766 = icmp ne i64 %..20, 0
  br i1 %reg_1766, label %ok15, label %else16
ok15:
  %..23 = bitcast [14 x i8]* @.str1767 to i8*
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
  call void @glutInitDisplayMode(i32 0) nounwind ssp
  call void @glEnable(i32 3042) nounwind ssp
  call void @glEnable(i32 2896) nounwind ssp
  call void @glEnable(i32 16384) nounwind ssp
  call void @glutDisplayFunc(void()* @main_display) nounwind ssp
  call void @glutTimerFunc(i32 20, void(i32)* @main_loop, i32 0) nounwind ssp
  call void @glutSpecialFunc(void(i8, i32, i32)* @downKey) nounwind ssp
  call void @glutSpecialUpFunc(void(i8, i32, i32)* @upKey) nounwind ssp
  call void @Game_new(%.struct1* @game) nounwind ssp
  call void @glutMainLoop() nounwind ssp
  call void @print_i(i32 33) nounwind ssp
  %..49 = call i32 @aaa() nounwind ssp
  br label %leave5
leave5:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..1768 = load i32* %..retVal
  ret i32 %..1768
}
@.str1767= private constant [14 x i8] c"640x480:32@60\00"
define void @main_loop(i32 %a.v) nounwind ssp {
entry:
  %a = alloca i32
  store i32 %a.v, i32* %a
  %..51 = getelementptr inbounds %.struct1* @game, i32 0, i32 4
  %..1769 = load void(%.struct1*)** %..51
  call void %..1769(%.struct1* @game) nounwind ssp
  call void @glutPostRedisplay() nounwind ssp
  %..55 = sdiv i32 1000, 50
  call void @glutTimerFunc(i32 %..55, void(i32)* @main_loop, i32 0) nounwind ssp
  br label %leave50
leave50:
  ret void
}
define void @main_display() nounwind ssp {
entry:
  %WIDTH = alloca i32
  store i32 640, i32* %WIDTH
  %HEIGHT = alloca i32
  store i32 480, i32* %HEIGHT
  %..63 = or i32 16384, 256
  call void @glClear(i32 %..63) nounwind ssp
  call void @glViewport(i32 0, i32 0, i32 640, i32 480) nounwind ssp
  call void @glMatrixMode(i32 5889) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..78 = load i32* %WIDTH
  %..81 = load i32* %HEIGHT
  %..80 = sitofp i32 %..81 to double
  %..79 = fptosi double %..80 to i32
  %..77 = sdiv i32 %..78, %..79
  %..76 = sitofp i32 %..77 to double
  call void @gluPerspective(double 0x4056800000000000, double %..76, double 0x3ff0000000000000, double 0x40c3880000000000) nounwind ssp
  %n = alloca float
  store float 0x4024000000000000, float* %n
  %lightpos = alloca [4 x float]
  %..85 = bitcast [4 x float]* %lightpos to float*
  %..91 = load float* %n
  %..90 = fpext float %..91 to double
  %..88 = fmul double 0x407f400000000000, %..90
  %..87 = fptrunc double %..88 to float
  %..92 = bitcast float* %..85 to float*
  %..93 = getelementptr inbounds float* %..92, i64 0
  store float %..87, float* %..93
  %..94 = bitcast [4 x float]* %lightpos to float*
  %..100 = load float* %n
  %..99 = fpext float %..100 to double
  %..97 = fmul double 0x4089100000000000, %..99
  %..96 = fptrunc double %..97 to float
  %..101 = bitcast float* %..94 to float*
  %..102 = getelementptr inbounds float* %..101, i64 1
  store float %..96, float* %..102
  %..103 = bitcast [4 x float]* %lightpos to float*
  %..109 = load float* %n
  %..108 = fpext float %..109 to double
  %..106 = fmul double 0x407f900000000000, %..108
  %..105 = fptrunc double %..106 to float
  %..110 = bitcast float* %..103 to float*
  %..111 = getelementptr inbounds float* %..110, i64 2
  store float %..105, float* %..111
  %..112 = bitcast [4 x float]* %lightpos to float*
  %..114 = fptrunc double 0x3ff0000000000000 to float
  %..116 = bitcast float* %..112 to float*
  %..117 = getelementptr inbounds float* %..116, i64 3
  store float %..114, float* %..117
  %..122 = bitcast [4 x float]* %lightpos to float*
  %..121 = bitcast float* %..122 to float*
  call void @glLightfv(i32 16384, i32 4611, float* %..121) nounwind ssp
  call void @glMatrixMode(i32 5888) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  call void @glBlendFunc(i32 770, i32 1) nounwind ssp
  call void @gluLookAt(double 0x0, double 0x0, double 0x4074000000000000, double 0x0, double 0x0, double 0x0, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..139 = getelementptr inbounds %.struct1* @game, i32 0, i32 5
  %..1770 = load void()** %..139
  call void %..1770() nounwind ssp
  call void @glFlush() nounwind ssp
  br label %leave59
leave59:
  ret void
}
@game= common global %.struct1 zeroinitializer
define void @Game_new(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..143 = load %.struct1** %game
  %..144 = bitcast %.struct1* %..143 to %.struct1*
  %..145 = getelementptr inbounds %.struct1* %..144, i64 0
  %..146 = trunc i64 0 to i32
  %..148 = getelementptr inbounds %.struct1* %..145, i32 0, i32 6
  store i32 %..146, i32* %..148
  %..149 = load %.struct1** %game
  %..150 = bitcast %.struct1* %..149 to %.struct1*
  %..151 = getelementptr inbounds %.struct1* %..150, i64 0
  %..152 = trunc i64 3 to i32
  %..154 = getelementptr inbounds %.struct1* %..151, i32 0, i32 1
  store i32 %..152, i32* %..154
  %..155 = load %.struct1** %game
  %..156 = bitcast %.struct1* %..155 to %.struct1*
  %..157 = getelementptr inbounds %.struct1* %..156, i64 0
  %..158 = trunc i64 1 to i32
  %..160 = getelementptr inbounds %.struct1* %..157, i32 0, i32 0
  store i32 %..158, i32* %..160
  %..161 = load %.struct1** %game
  %..162 = bitcast %.struct1* %..161 to %.struct1*
  %..163 = getelementptr inbounds %.struct1* %..162, i64 0
  %..164 = trunc i64 0 to i32
  %..166 = getelementptr inbounds %.struct1* %..163, i32 0, i32 3
  store i32 %..164, i32* %..166
  %..167 = load %.struct1** %game
  %..168 = bitcast %.struct1* %..167 to %.struct1*
  %..169 = getelementptr inbounds %.struct1* %..168, i64 0
  %..170 = getelementptr inbounds %.struct1* %..169, i32 0, i32 4
  store void(%.struct1*)* @Game_title, void(%.struct1*)** %..170
  %..171 = load %.struct1** %game
  %..172 = bitcast %.struct1* %..171 to %.struct1*
  %..173 = getelementptr inbounds %.struct1* %..172, i64 0
  %..174 = getelementptr inbounds %.struct1* %..173, i32 0, i32 5
  store void()* @Game_title_draw, void()** %..174
  br label %leave142
leave142:
  ret void
}
define void @Game_title(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..176 = load %.struct1** %game
  %..177 = bitcast %.struct1* %..176 to %.struct1*
  %..178 = getelementptr inbounds %.struct1* %..177, i64 0
  %..182 = load %.struct1** %game
  %..183 = bitcast %.struct1* %..182 to %.struct1*
  %..184 = getelementptr inbounds %.struct1* %..183, i64 0
  %..185 = getelementptr inbounds %.struct1* %..184, i32 0, i32 3
  %..186 = load i32* %..185
  %..181 = zext i32 %..186 to i64
  %..180 = add i64 %..181, 1
  %..179 = trunc i64 %..180 to i32
  %..188 = getelementptr inbounds %.struct1* %..178, i32 0, i32 3
  store i32 %..179, i32* %..188
  %..195 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  %..196 = load i32* %..195
  %..194 = zext i32 %..196 to i64
  %reg_1771 = icmp ne i64 %..194, 0
  br i1 %reg_1771, label %ok189, label %else190
ok189:
  %..197 = load %.struct1** %game
  %..198 = bitcast %.struct1* %..197 to %.struct1*
  %..199 = getelementptr inbounds %.struct1* %..198, i64 0
  %..200 = trunc i64 0 to i32
  %..202 = getelementptr inbounds %.struct1* %..199, i32 0, i32 3
  store i32 %..200, i32* %..202
  %..203 = load %.struct1** %game
  %..204 = bitcast %.struct1* %..203 to %.struct1*
  %..205 = getelementptr inbounds %.struct1* %..204, i64 0
  %..206 = getelementptr inbounds %.struct1* %..205, i32 0, i32 4
  store void(%.struct1*)* @Game_title_end, void(%.struct1*)** %..206
  br label %else191
else191:
  br label %endif192
else190:
  ; void
  br label %endif193
endif193:
  br label %endif192
endif192:
  br label %leave175
leave175:
  ret void
}
define void @Game_title_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..210 = fsub double 0.0, 0x4056800000000000
  call void @glRotated(double %..210, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..217 = getelementptr inbounds %.struct1* @game, i32 0, i32 3
  %..218 = load i32* %..217
  %..216 = sitofp i32 %..218 to double
  call void @glRotated(double %..216, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403ab4bc6a7ef9db, double 0x407ad85810624dd3) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double 0x407a9120c49ba5e3) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double 0x407a9120c49ba5e3) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..279 = fsub double 0.0, 0x0
  %..281 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..279, double %..281) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..309 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..309, double 0x40475e24dd2f1aa0) nounwind ssp
  %..314 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..314, double 0x4069df16872b020c) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..343 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..343, double 0x40475e24dd2f1aa0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..360 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..360, double 0x40475e24dd2f1aa0) nounwind ssp
  %..365 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..365, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..370 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..370, double 0x4069df16872b020c) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..383 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..383, double 0x0) nounwind ssp
  %..388 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..388, double 0x40687b020c49ba5e) nounwind ssp
  %..393 = fsub double 0.0, 0x405bd1999999999a
  call void @glVertex3d(double 0x0, double %..393, double 0x407ad85810624dd3) nounwind ssp
  %..398 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..398, double 0x407b1f8f5c28f5c3) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..412 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..412) nounwind ssp
  %..416 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..416, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..421 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..421, double 0x40475e24dd2f1aa0) nounwind ssp
  %..426 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..426, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..443 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..443, double 0x40475e24dd2f1aa0) nounwind ssp
  %..448 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..448, double 0x4068c2395810624e) nounwind ssp
  %..453 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..453, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..470 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..470, double 0x407a6d851eb851ec) nounwind ssp
  %..475 = fsub double 0.0, 0x40687b020c49ba5e
  call void @glVertex3d(double 0x0, double %..475, double 0x407a6d851eb851ec) nounwind ssp
  %..480 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..480, double 0x4068c2395810624e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..494 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..494) nounwind ssp
  %..498 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..498, double 0x4068c2395810624e) nounwind ssp
  %..503 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..503, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..508 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..508, double 0x407a6d851eb851ec) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..525 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..525, double 0x4068c2395810624e) nounwind ssp
  %..530 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..530, double 0x40475e24dd2f1aa0) nounwind ssp
  %..535 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..535, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..553 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..553) nounwind ssp
  %..557 = fsub double 0.0, 0x4070d4916872b021
  %..559 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..557, double %..559) nounwind ssp
  %..564 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..564) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..576 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..576, double 0x0) nounwind ssp
  %..582 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..582) nounwind ssp
  %..587 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..587) nounwind ssp
  %..592 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..592) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..609 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..609) nounwind ssp
  %..614 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..614) nounwind ssp
  %..619 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..619) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..632 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..632) nounwind ssp
  %..637 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..637) nounwind ssp
  %..642 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..642) nounwind ssp
  %..647 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..647) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..659 = fsub double 0.0, 0x0
  %..661 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..659, double %..661) nounwind ssp
  %..666 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..666) nounwind ssp
  %..670 = fsub double 0.0, 0x406331e76c8b4396
  %..672 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..670, double %..672) nounwind ssp
  %..676 = fsub double 0.0, 0x4070d4916872b021
  %..678 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..676, double %..678) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..691 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..691) nounwind ssp
  %..695 = fsub double 0.0, 0x406331e76c8b4396
  %..697 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..695, double %..697) nounwind ssp
  %..701 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..703 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..701, double %..703) nounwind ssp
  %..707 = fsub double 0.0, 0x4070d4916872b021
  %..709 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..707, double %..709) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..725 = fsub double 0.0, 0x406331e76c8b4396
  %..727 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..725, double %..727) nounwind ssp
  %..731 = fsub double 0.0, 0x4062150a3d70a3d7
  %..733 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..731, double %..733) nounwind ssp
  %..737 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..739 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..737, double %..739) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..755 = fsub double 0.0, 0x4062150a3d70a3d7
  %..757 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..755, double %..757) nounwind ssp
  %..761 = fsub double 0.0, 0x40613f645a1cac08
  %..763 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..761, double %..763) nounwind ssp
  %..767 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..769 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..767, double %..769) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..785 = fsub double 0.0, 0x4062150a3d70a3d7
  %..787 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..785, double %..787) nounwind ssp
  %..791 = fsub double 0.0, 0x4045246a7ef9db23
  %..793 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..791, double %..793) nounwind ssp
  %..797 = fsub double 0.0, 0x40613f645a1cac08
  %..799 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..797, double %..799) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..815 = fsub double 0.0, 0x4045246a7ef9db23
  %..817 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..815, double %..817) nounwind ssp
  %..822 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..822) nounwind ssp
  %..827 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..827) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..840 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..840) nounwind ssp
  %..845 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..845) nounwind ssp
  %..849 = fsub double 0.0, 0x4044078d4fdf3b64
  %..851 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..849, double %..851) nounwind ssp
  %..855 = fsub double 0.0, 0x4045246a7ef9db23
  %..857 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..855, double %..857) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..873 = fsub double 0.0, 0x4045246a7ef9db23
  %..875 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..873, double %..875) nounwind ssp
  %..879 = fsub double 0.0, 0x4044078d4fdf3b64
  %..881 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..879, double %..881) nounwind ssp
  %..885 = fsub double 0.0, 0x40613f645a1cac08
  %..887 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..885, double %..887) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave207
leave207:
  ret void
}
define void @Game_title_end(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..892 = load %.struct1** %game
  %..893 = bitcast %.struct1* %..892 to %.struct1*
  %..894 = getelementptr inbounds %.struct1* %..893, i64 0
  %..898 = load %.struct1** %game
  %..899 = bitcast %.struct1* %..898 to %.struct1*
  %..900 = getelementptr inbounds %.struct1* %..899, i64 0
  %..901 = getelementptr inbounds %.struct1* %..900, i32 0, i32 3
  %..902 = load i32* %..901
  %..897 = zext i32 %..902 to i64
  %..896 = add i64 %..897, 1
  %..895 = trunc i64 %..896 to i32
  %..904 = getelementptr inbounds %.struct1* %..894, i32 0, i32 3
  store i32 %..895, i32* %..904
  %..913 = load %.struct1** %game
  %..914 = bitcast %.struct1* %..913 to %.struct1*
  %..915 = getelementptr inbounds %.struct1* %..914, i64 0
  %..916 = getelementptr inbounds %.struct1* %..915, i32 0, i32 3
  %..917 = load i32* %..916
  %..912 = zext i32 %..917 to i64
  %..1772 = icmp sgt i64 %..912, 60
  %..911 = zext i1 %..1772 to i64
  %..910 = bitcast i64 %..911 to i64
  %reg_1773 = icmp ne i64 %..910, 0
  br i1 %reg_1773, label %ok905, label %else906
ok905:
  %..919 = load %.struct1** %game
  %..920 = bitcast %.struct1* %..919 to %.struct1*
  %..921 = getelementptr inbounds %.struct1* %..920, i64 0
  %..922 = getelementptr inbounds %.struct1* %..921, i32 0, i32 4
  store void(%.struct1*)* @Game_init, void(%.struct1*)** %..922
  br label %else907
else907:
  br label %endif908
else906:
  ; void
  br label %endif909
endif909:
  br label %endif908
endif908:
  br label %leave891
leave891:
  ret void
}
define void @Game_demo(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave923
leave923:
  ret void
}
define void @Game_ranking(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave924
leave924:
  ret void
}
define void @Game_init(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..926 = load %.struct1** %game
  %..927 = bitcast %.struct1* %..926 to %.struct1*
  %..928 = getelementptr inbounds %.struct1* %..927, i64 0
  %..929 = trunc i64 0 to i32
  %..931 = getelementptr inbounds %.struct1* %..928, i32 0, i32 6
  store i32 %..929, i32* %..931
  %..932 = load %.struct1** %game
  %..933 = bitcast %.struct1* %..932 to %.struct1*
  %..934 = getelementptr inbounds %.struct1* %..933, i64 0
  %..935 = trunc i64 3 to i32
  %..937 = getelementptr inbounds %.struct1* %..934, i32 0, i32 1
  store i32 %..935, i32* %..937
  %..938 = load %.struct1** %game
  %..939 = bitcast %.struct1* %..938 to %.struct1*
  %..940 = getelementptr inbounds %.struct1* %..939, i64 0
  %..941 = trunc i64 1 to i32
  %..943 = getelementptr inbounds %.struct1* %..940, i32 0, i32 0
  store i32 %..941, i32* %..943
  %..944 = load %.struct1** %game
  %..945 = bitcast %.struct1* %..944 to %.struct1*
  %..946 = getelementptr inbounds %.struct1* %..945, i64 0
  %..947 = trunc i64 0 to i32
  %..949 = getelementptr inbounds %.struct1* %..946, i32 0, i32 3
  store i32 %..947, i32* %..949
  %..950 = load %.struct1** %game
  %..951 = bitcast %.struct1* %..950 to %.struct1*
  %..952 = getelementptr inbounds %.struct1* %..951, i64 0
  %..953 = getelementptr inbounds %.struct1* %..952, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..953
  %..954 = load %.struct1** %game
  %..955 = bitcast %.struct1* %..954 to %.struct1*
  %..956 = getelementptr inbounds %.struct1* %..955, i64 0
  %..957 = getelementptr inbounds %.struct1* %..956, i32 0, i32 5
  store void()* @Game_game_draw, void()** %..957
  %..958 = load %.struct1** %game
  %..959 = load %.struct1** %game
  %..960 = bitcast %.struct1* %..959 to %.struct1*
  %..961 = getelementptr inbounds %.struct1* %..960, i64 0
  %..962 = getelementptr inbounds %.struct1* %..961, i32 0, i32 4
  %..1774 = load void(%.struct1*)** %..962
  call void %..1774(%.struct1* %..958) nounwind ssp
  br label %leave925
leave925:
  ret void
}
define void @Game_stageStart(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..973 = load %.struct1** %game
  %..974 = bitcast %.struct1* %..973 to %.struct1*
  %..975 = getelementptr inbounds %.struct1* %..974, i64 0
  %..976 = getelementptr inbounds %.struct1* %..975, i32 0, i32 3
  %..977 = load i32* %..976
  %..972 = zext i32 %..977 to i64
  %..1775 = icmp sgt i64 %..972, 240
  %..971 = zext i1 %..1775 to i64
  %..970 = bitcast i64 %..971 to i64
  %reg_1776 = icmp ne i64 %..970, 0
  br i1 %reg_1776, label %ok965, label %else966
ok965:
  %..981 = load %.struct1** %game
  %..982 = bitcast %.struct1* %..981 to %.struct1*
  %..983 = getelementptr inbounds %.struct1* %..982, i64 0
  %..984 = getelementptr inbounds %.struct1* %..983, i32 0, i32 4
  store void(%.struct1*)* @Game_game, void(%.struct1*)** %..984
  br label %else967
else967:
  br label %endif968
else966:
  ; void
  br label %endif969
endif969:
  br label %endif968
endif968:
  %..986 = load %.struct1** %game
  call void @Game_game(%.struct1* %..986) nounwind ssp
  br label %leave964
leave964:
  ret void
}
define void @Game_game(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..997 = load %.struct1** %game
  %..998 = bitcast %.struct1* %..997 to %.struct1*
  %..999 = getelementptr inbounds %.struct1* %..998, i64 0
  %..1000 = getelementptr inbounds %.struct1* %..999, i32 0, i32 3
  %..1001 = load i32* %..1000
  %..996 = zext i32 %..1001 to i64
  %..995 = srem i64 %..996, 4
  %..1777 = icmp eq i64 %..995, 3
  %..994 = zext i1 %..1777 to i64
  %..993 = bitcast i64 %..994 to i64
  %reg_1778 = icmp ne i64 %..993, 0
  br i1 %reg_1778, label %ok988, label %else989
ok988:
  %..1004 = load %.struct1** %game
  %..1005 = bitcast %.struct1* %..1004 to %.struct1*
  %..1006 = getelementptr inbounds %.struct1* %..1005, i64 0
  %..1010 = load %.struct1** %game
  %..1011 = bitcast %.struct1* %..1010 to %.struct1*
  %..1012 = getelementptr inbounds %.struct1* %..1011, i64 0
  %..1013 = getelementptr inbounds %.struct1* %..1012, i32 0, i32 6
  %..1014 = load i32* %..1013
  %..1009 = zext i32 %..1014 to i64
  %..1008 = add i64 %..1009, 10
  %..1007 = trunc i64 %..1008 to i32
  %..1016 = getelementptr inbounds %.struct1* %..1006, i32 0, i32 6
  store i32 %..1007, i32* %..1016
  br label %else990
else990:
  br label %endif991
else989:
  ; void
  br label %endif992
endif992:
  br label %endif991
endif991:
  %..1017 = load %.struct1** %game
  %..1018 = bitcast %.struct1* %..1017 to %.struct1*
  %..1019 = getelementptr inbounds %.struct1* %..1018, i64 0
  %..1023 = load %.struct1** %game
  %..1024 = bitcast %.struct1* %..1023 to %.struct1*
  %..1025 = getelementptr inbounds %.struct1* %..1024, i64 0
  %..1026 = getelementptr inbounds %.struct1* %..1025, i32 0, i32 3
  %..1027 = load i32* %..1026
  %..1022 = zext i32 %..1027 to i64
  %..1021 = add i64 %..1022, 1
  %..1020 = trunc i64 %..1021 to i32
  %..1029 = getelementptr inbounds %.struct1* %..1019, i32 0, i32 3
  store i32 %..1020, i32* %..1029
  call void @Ship_move() nounwind ssp
  br label %leave987
leave987:
  ret void
}
define void @Game_game_draw() nounwind ssp {
entry:
  call void @Ship_draw() nounwind ssp
  br label %leave1031
leave1031:
  ret void
}
define void @Game_damage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1033
leave1033:
  ret void
}
define void @Game_boss(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1034
leave1034:
  ret void
}
define void @Game_nextStage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1036 = load %.struct1** %game
  %..1037 = bitcast %.struct1* %..1036 to %.struct1*
  %..1038 = getelementptr inbounds %.struct1* %..1037, i64 0
  %..1042 = load %.struct1** %game
  %..1043 = bitcast %.struct1* %..1042 to %.struct1*
  %..1044 = getelementptr inbounds %.struct1* %..1043, i64 0
  %..1045 = getelementptr inbounds %.struct1* %..1044, i32 0, i32 0
  %..1046 = load i32* %..1045
  %..1041 = zext i32 %..1046 to i64
  %..1040 = add i64 %..1041, 1
  %..1039 = trunc i64 %..1040 to i32
  %..1048 = getelementptr inbounds %.struct1* %..1038, i32 0, i32 0
  store i32 %..1039, i32* %..1048
  %..1049 = load %.struct1** %game
  %..1050 = bitcast %.struct1* %..1049 to %.struct1*
  %..1051 = getelementptr inbounds %.struct1* %..1050, i64 0
  %..1052 = getelementptr inbounds %.struct1* %..1051, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..1052
  br label %leave1035
leave1035:
  ret void
}
define void @Game_continue(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1053
leave1053:
  ret void
}
define void @Game_nameEntry(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1054
leave1054:
  ret void
}
define void @Game_ending(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1055
leave1055:
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
  %..1057 = load i8* %k
  switch i8 %..1057, label %switch10585 [
    i8 101, label %switch10580
    i8 103, label %switch10581
    i8 100, label %switch10582
    i8 102, label %switch10583
    i8 32, label %switch10584
  ]
switch10580:
  ; 
  %..1064 = trunc i64 1 to i32
  %..1066 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1064, i32* %..1066
  br label %switch10585
break1067:
  br label %switch10581
switch10581:
  ; 
  %..1068 = trunc i64 1 to i32
  %..1070 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1068, i32* %..1070
  br label %switch10585
break1071:
  br label %switch10582
switch10582:
  ; 
  %..1072 = trunc i64 1 to i32
  %..1074 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1072, i32* %..1074
  br label %switch10585
break1075:
  br label %switch10583
switch10583:
  ; 
  %..1076 = trunc i64 1 to i32
  %..1078 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1076, i32* %..1078
  br label %switch10585
break1079:
  br label %switch10584
switch10584:
  ; 
  %..1080 = trunc i64 1 to i32
  %..1082 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1080, i32* %..1082
  br label %switch10585
break1083:
  br label %switch10585
switch10585:
  br label %leave1056
leave1056:
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
  %..1085 = load i8* %k
  switch i8 %..1085, label %switch10866 [
    i8 101, label %switch10860
    i8 103, label %switch10861
    i8 100, label %switch10862
    i8 102, label %switch10863
    i8 32, label %switch10864
    i8 27, label %switch10865
  ]
switch10860:
  ; 
  %..1093 = trunc i64 0 to i32
  %..1095 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1093, i32* %..1095
  br label %switch10866
break1096:
  br label %switch10861
switch10861:
  ; 
  %..1097 = trunc i64 0 to i32
  %..1099 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1097, i32* %..1099
  br label %switch10866
break1100:
  br label %switch10862
switch10862:
  ; 
  %..1101 = trunc i64 0 to i32
  %..1103 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1101, i32* %..1103
  br label %switch10866
break1104:
  br label %switch10863
switch10863:
  ; 
  %..1105 = trunc i64 0 to i32
  %..1107 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1105, i32* %..1107
  br label %switch10866
break1108:
  br label %switch10864
switch10864:
  ; 
  %..1109 = trunc i64 0 to i32
  %..1111 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1109, i32* %..1111
  br label %switch10866
break1112:
  br label %switch10865
switch10865:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch10866
break1116:
  br label %switch10866
switch10866:
  br label %leave1084
leave1084:
  ret void
}
@ship= common global %.struct3 zeroinitializer
define void @Ship_move() nounwind ssp {
entry:
  %speed = alloca double
  store double 0x4024000000000000, double* %speed
  %..1125 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  %..1126 = load i32* %..1125
  %..1124 = zext i32 %..1126 to i64
  %reg_1779 = icmp ne i64 %..1124, 0
  br i1 %reg_1779, label %ok1119, label %else1120
ok1119:
  %..1128 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1129 = load double* %..1128
  %..1130 = load double* %speed
  %..1127 = fsub double %..1129, %..1130
  %..1131 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1127, double* %..1131
  br label %else1121
else1121:
  br label %endif1122
else1120:
  ; void
  br label %endif1123
endif1123:
  br label %endif1122
endif1122:
  %..1138 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  %..1139 = load i32* %..1138
  %..1137 = zext i32 %..1139 to i64
  %reg_1780 = icmp ne i64 %..1137, 0
  br i1 %reg_1780, label %ok1132, label %else1133
ok1132:
  %..1141 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1142 = load double* %..1141
  %..1143 = load double* %speed
  %..1140 = fadd double %..1142, %..1143
  %..1144 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1140, double* %..1144
  br label %else1134
else1134:
  br label %endif1135
else1133:
  ; void
  br label %endif1136
endif1136:
  br label %endif1135
endif1135:
  %..1151 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  %..1152 = load i32* %..1151
  %..1150 = zext i32 %..1152 to i64
  %reg_1781 = icmp ne i64 %..1150, 0
  br i1 %reg_1781, label %ok1145, label %else1146
ok1145:
  %..1154 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1155 = load double* %..1154
  %..1156 = load double* %speed
  %..1153 = fadd double %..1155, %..1156
  %..1157 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1153, double* %..1157
  br label %else1147
else1147:
  br label %endif1148
else1146:
  ; void
  br label %endif1149
endif1149:
  br label %endif1148
endif1148:
  %..1164 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  %..1165 = load i32* %..1164
  %..1163 = zext i32 %..1165 to i64
  %reg_1782 = icmp ne i64 %..1163, 0
  br i1 %reg_1782, label %ok1158, label %else1159
ok1158:
  %..1167 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1168 = load double* %..1167
  %..1169 = load double* %speed
  %..1166 = fsub double %..1168, %..1169
  %..1170 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1166, double* %..1170
  br label %else1160
else1160:
  br label %endif1161
else1159:
  ; void
  br label %endif1162
endif1162:
  br label %endif1161
endif1161:
  %b = alloca double
  store double 0x4072c00000000000, double* %b
  %c = alloca double
  store double 0x406e000000000000, double* %c
  %..1180 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1181 = load double* %..1180
  %..1182 = sitofp i64 300 to double
  %..1783 = fcmp ogt double %..1181, %..1182
  %..1179 = zext i1 %..1783 to i64
  %..1178 = bitcast i64 %..1179 to i64
  %reg_1784 = icmp ne i64 %..1178, 0
  br i1 %reg_1784, label %ok1173, label %else1174
ok1173:
  %..1185 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double 0x4072c00000000000, double* %..1185
  br label %else1175
else1175:
  br label %endif1176
else1174:
  ; void
  br label %endif1177
endif1177:
  br label %endif1176
endif1176:
  %..1193 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1194 = load double* %..1193
  %..1195 = sitofp i64 -300 to double
  %..1785 = fcmp olt double %..1194, %..1195
  %..1192 = zext i1 %..1785 to i64
  %..1191 = bitcast i64 %..1192 to i64
  %reg_1786 = icmp ne i64 %..1191, 0
  br i1 %reg_1786, label %ok1186, label %else1187
ok1186:
  %..1197 = fsub double 0.0, 0x4072c00000000000
  %..1199 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1197, double* %..1199
  br label %else1188
else1188:
  br label %endif1189
else1187:
  ; void
  br label %endif1190
endif1190:
  br label %endif1189
endif1189:
  %..1207 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1208 = load double* %..1207
  %..1209 = sitofp i64 240 to double
  %..1787 = fcmp ogt double %..1208, %..1209
  %..1206 = zext i1 %..1787 to i64
  %..1205 = bitcast i64 %..1206 to i64
  %reg_1788 = icmp ne i64 %..1205, 0
  br i1 %reg_1788, label %ok1200, label %else1201
ok1200:
  %..1212 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double 0x406e000000000000, double* %..1212
  br label %else1202
else1202:
  br label %endif1203
else1201:
  ; void
  br label %endif1204
endif1204:
  br label %endif1203
endif1203:
  %..1220 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1221 = load double* %..1220
  %..1222 = fsub double 0.0, 0x406e000000000000
  %..1789 = fcmp olt double %..1221, %..1222
  %..1219 = zext i1 %..1789 to i64
  %..1218 = bitcast i64 %..1219 to i64
  %reg_1790 = icmp ne i64 %..1218, 0
  br i1 %reg_1790, label %ok1213, label %else1214
ok1213:
  %..1224 = fsub double 0.0, 0x406e000000000000
  %..1226 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1224, double* %..1226
  br label %else1215
else1215:
  br label %endif1216
else1214:
  ; void
  br label %endif1217
endif1217:
  br label %endif1216
endif1216:
  br label %leave1117
leave1117:
  ret void
}
define void @Ship_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..1230 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1231 = load double* %..1230
  %..1232 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1233 = load double* %..1232
  call void @glTranslated(double %..1231, double %..1233, double 0x0) nounwind ssp
  %x = alloca double
  store double 0x402e000000000000, double* %x
  %y = alloca double
  store double 0x403e000000000000, double* %y
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3ff0000000000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x0, double 0x0, double 0x3ff0000000000000) nounwind ssp
  %..1250 = load double* %x
  %..1249 = fsub double 0.0, %..1250
  %..1251 = load double* %y
  call void @glVertex3d(double %..1249, double %..1251, double 0x0) nounwind ssp
  %..1254 = load double* %x
  %..1255 = load double* %y
  call void @glVertex3d(double %..1254, double %..1255, double 0x0) nounwind ssp
  %..1258 = load double* %x
  %..1260 = load double* %y
  %..1259 = fsub double 0.0, %..1260
  call void @glVertex3d(double %..1258, double %..1259, double 0x0) nounwind ssp
  %..1264 = load double* %x
  %..1263 = fsub double 0.0, %..1264
  %..1266 = load double* %y
  %..1265 = fsub double 0.0, %..1266
  call void @glVertex3d(double %..1263, double %..1265, double 0x0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave1227
leave1227:
  ret void
}
define void @Stage_init(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1271 = getelementptr inbounds %.struct1* @game, i32 0, i32 0
  %..1272 = load i32* %..1271
  switch i32 %..1272, label %switch127319 [
    i32 1, label %switch12730
    i32 2, label %switch12731
    i32 3, label %switch12732
    i32 4, label %switch12733
    i32 5, label %switch12734
    i32 6, label %switch12735
    i32 7, label %switch12736
    i32 8, label %switch12737
    i32 9, label %switch12738
    i32 10, label %switch12739
    i32 11, label %switch127310
    i32 12, label %switch127311
    i32 13, label %switch127312
    i32 14, label %switch127313
    i32 15, label %switch127314
    i32 16, label %switch127315
    i32 17, label %switch127316
    i32 18, label %switch127317
    i32 19, label %switch127318
  ]
switch12730:
  ; 
  %..1293 = load %.struct4** %stg
  %..1294 = bitcast %.struct4* %..1293 to %.struct4*
  %..1295 = getelementptr inbounds %.struct4* %..1294, i64 0
  %..1296 = getelementptr inbounds %.struct4* %..1295, i32 0, i32 0
  store void(%.struct4*)* @Stage_1, void(%.struct4*)** %..1296
  br label %switch127319
break1297:
  br label %switch12731
switch12731:
  ; 
  %..1298 = load %.struct4** %stg
  %..1299 = bitcast %.struct4* %..1298 to %.struct4*
  %..1300 = getelementptr inbounds %.struct4* %..1299, i64 0
  %..1301 = getelementptr inbounds %.struct4* %..1300, i32 0, i32 0
  store void(%.struct4*)* @Stage_2, void(%.struct4*)** %..1301
  br label %switch127319
break1302:
  br label %switch12732
switch12732:
  ; 
  %..1303 = load %.struct4** %stg
  %..1304 = bitcast %.struct4* %..1303 to %.struct4*
  %..1305 = getelementptr inbounds %.struct4* %..1304, i64 0
  %..1306 = getelementptr inbounds %.struct4* %..1305, i32 0, i32 0
  store void(%.struct4*)* @Stage_3, void(%.struct4*)** %..1306
  br label %switch127319
break1307:
  br label %switch12733
switch12733:
  ; 
  %..1308 = load %.struct4** %stg
  %..1309 = bitcast %.struct4* %..1308 to %.struct4*
  %..1310 = getelementptr inbounds %.struct4* %..1309, i64 0
  %..1311 = getelementptr inbounds %.struct4* %..1310, i32 0, i32 0
  store void(%.struct4*)* @Stage_4, void(%.struct4*)** %..1311
  br label %switch127319
break1312:
  br label %switch12734
switch12734:
  ; 
  %..1313 = load %.struct4** %stg
  %..1314 = bitcast %.struct4* %..1313 to %.struct4*
  %..1315 = getelementptr inbounds %.struct4* %..1314, i64 0
  %..1316 = getelementptr inbounds %.struct4* %..1315, i32 0, i32 0
  store void(%.struct4*)* @Stage_5, void(%.struct4*)** %..1316
  br label %switch127319
break1317:
  br label %switch12735
switch12735:
  ; 
  %..1318 = load %.struct4** %stg
  %..1319 = bitcast %.struct4* %..1318 to %.struct4*
  %..1320 = getelementptr inbounds %.struct4* %..1319, i64 0
  %..1321 = getelementptr inbounds %.struct4* %..1320, i32 0, i32 0
  store void(%.struct4*)* @Stage_6, void(%.struct4*)** %..1321
  br label %switch127319
break1322:
  br label %switch12736
switch12736:
  ; 
  %..1323 = load %.struct4** %stg
  %..1324 = bitcast %.struct4* %..1323 to %.struct4*
  %..1325 = getelementptr inbounds %.struct4* %..1324, i64 0
  %..1326 = getelementptr inbounds %.struct4* %..1325, i32 0, i32 0
  store void(%.struct4*)* @Stage_7, void(%.struct4*)** %..1326
  br label %switch127319
break1327:
  br label %switch12737
switch12737:
  ; 
  %..1328 = load %.struct4** %stg
  %..1329 = bitcast %.struct4* %..1328 to %.struct4*
  %..1330 = getelementptr inbounds %.struct4* %..1329, i64 0
  %..1331 = getelementptr inbounds %.struct4* %..1330, i32 0, i32 0
  store void(%.struct4*)* @Stage_8, void(%.struct4*)** %..1331
  br label %switch127319
break1332:
  br label %switch12738
switch12738:
  ; 
  %..1333 = load %.struct4** %stg
  %..1334 = bitcast %.struct4* %..1333 to %.struct4*
  %..1335 = getelementptr inbounds %.struct4* %..1334, i64 0
  %..1336 = getelementptr inbounds %.struct4* %..1335, i32 0, i32 0
  store void(%.struct4*)* @Stage_9, void(%.struct4*)** %..1336
  br label %switch127319
break1337:
  br label %switch12739
switch12739:
  ; 
  %..1338 = load %.struct4** %stg
  %..1339 = bitcast %.struct4* %..1338 to %.struct4*
  %..1340 = getelementptr inbounds %.struct4* %..1339, i64 0
  %..1341 = getelementptr inbounds %.struct4* %..1340, i32 0, i32 0
  store void(%.struct4*)* @Stage_10, void(%.struct4*)** %..1341
  br label %switch127319
break1342:
  br label %switch127310
switch127310:
  ; 
  %..1343 = load %.struct4** %stg
  %..1344 = bitcast %.struct4* %..1343 to %.struct4*
  %..1345 = getelementptr inbounds %.struct4* %..1344, i64 0
  %..1346 = getelementptr inbounds %.struct4* %..1345, i32 0, i32 0
  store void(%.struct4*)* @Stage_11, void(%.struct4*)** %..1346
  br label %switch127319
break1347:
  br label %switch127311
switch127311:
  ; 
  %..1348 = load %.struct4** %stg
  %..1349 = bitcast %.struct4* %..1348 to %.struct4*
  %..1350 = getelementptr inbounds %.struct4* %..1349, i64 0
  %..1351 = getelementptr inbounds %.struct4* %..1350, i32 0, i32 0
  store void(%.struct4*)* @Stage_12, void(%.struct4*)** %..1351
  br label %switch127319
break1352:
  br label %switch127312
switch127312:
  ; 
  %..1353 = load %.struct4** %stg
  %..1354 = bitcast %.struct4* %..1353 to %.struct4*
  %..1355 = getelementptr inbounds %.struct4* %..1354, i64 0
  %..1356 = getelementptr inbounds %.struct4* %..1355, i32 0, i32 0
  store void(%.struct4*)* @Stage_13, void(%.struct4*)** %..1356
  br label %switch127319
break1357:
  br label %switch127313
switch127313:
  ; 
  %..1358 = load %.struct4** %stg
  %..1359 = bitcast %.struct4* %..1358 to %.struct4*
  %..1360 = getelementptr inbounds %.struct4* %..1359, i64 0
  %..1361 = getelementptr inbounds %.struct4* %..1360, i32 0, i32 0
  store void(%.struct4*)* @Stage_14, void(%.struct4*)** %..1361
  br label %switch127319
break1362:
  br label %switch127314
switch127314:
  ; 
  %..1363 = load %.struct4** %stg
  %..1364 = bitcast %.struct4* %..1363 to %.struct4*
  %..1365 = getelementptr inbounds %.struct4* %..1364, i64 0
  %..1366 = getelementptr inbounds %.struct4* %..1365, i32 0, i32 0
  store void(%.struct4*)* @Stage_15, void(%.struct4*)** %..1366
  br label %switch127319
break1367:
  br label %switch127315
switch127315:
  ; 
  %..1368 = load %.struct4** %stg
  %..1369 = bitcast %.struct4* %..1368 to %.struct4*
  %..1370 = getelementptr inbounds %.struct4* %..1369, i64 0
  %..1371 = getelementptr inbounds %.struct4* %..1370, i32 0, i32 0
  store void(%.struct4*)* @Stage_16, void(%.struct4*)** %..1371
  br label %switch127319
break1372:
  br label %switch127316
switch127316:
  ; 
  %..1373 = load %.struct4** %stg
  %..1374 = bitcast %.struct4* %..1373 to %.struct4*
  %..1375 = getelementptr inbounds %.struct4* %..1374, i64 0
  %..1376 = getelementptr inbounds %.struct4* %..1375, i32 0, i32 0
  store void(%.struct4*)* @Stage_17, void(%.struct4*)** %..1376
  br label %switch127319
break1377:
  br label %switch127317
switch127317:
  ; 
  %..1378 = load %.struct4** %stg
  %..1379 = bitcast %.struct4* %..1378 to %.struct4*
  %..1380 = getelementptr inbounds %.struct4* %..1379, i64 0
  %..1381 = getelementptr inbounds %.struct4* %..1380, i32 0, i32 0
  store void(%.struct4*)* @Stage_18, void(%.struct4*)** %..1381
  br label %switch127319
break1382:
  br label %switch127318
switch127318:
  ; 
  %..1383 = load %.struct4** %stg
  %..1384 = bitcast %.struct4* %..1383 to %.struct4*
  %..1385 = getelementptr inbounds %.struct4* %..1384, i64 0
  %..1386 = getelementptr inbounds %.struct4* %..1385, i32 0, i32 0
  store void(%.struct4*)* @Stage_ending, void(%.struct4*)** %..1386
  br label %switch127319
break1387:
  br label %switch127319
switch127319:
  br label %leave1270
leave1270:
  ret void
}
define void @ptn7() nounwind ssp {
entry:
  ; void
  br label %leave1388
leave1388:
  ret void
}
define void @ptn1() nounwind ssp {
entry:
  ; void
  br label %leave1389
leave1389:
  ret void
}
define void @ptn2r() nounwind ssp {
entry:
  ; void
  br label %leave1390
leave1390:
  ret void
}
define void @ptn2c() nounwind ssp {
entry:
  ; void
  br label %leave1391
leave1391:
  ret void
}
define void @ptn2l() nounwind ssp {
entry:
  ; void
  br label %leave1392
leave1392:
  ret void
}
define void @ptn3r() nounwind ssp {
entry:
  ; void
  br label %leave1393
leave1393:
  ret void
}
define void @ptn3l() nounwind ssp {
entry:
  ; void
  br label %leave1394
leave1394:
  ret void
}
define void @tmsu() nounwind ssp {
entry:
  ; void
  br label %leave1395
leave1395:
  ret void
}
define void @tmsl() nounwind ssp {
entry:
  ; void
  br label %leave1396
leave1396:
  ret void
}
define void @tmsr() nounwind ssp {
entry:
  ; void
  br label %leave1397
leave1397:
  ret void
}
define void @boss1() nounwind ssp {
entry:
  ; void
  br label %leave1398
leave1398:
  ret void
}
define void @ptn_hatena() nounwind ssp {
entry:
  ; void
  br label %leave1399
leave1399:
  ret void
}
define void @ptn4l() nounwind ssp {
entry:
  ; void
  br label %leave1400
leave1400:
  ret void
}
define void @ptn4r() nounwind ssp {
entry:
  ; void
  br label %leave1401
leave1401:
  ret void
}
define void @Stage_1(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1403 = load %.struct4** %stg
  %..1404 = bitcast %.struct4* %..1403 to %.struct4*
  %..1405 = getelementptr inbounds %.struct4* %..1404, i64 0
  %..1406 = getelementptr inbounds %.struct4* %..1405, i32 0, i32 1
  %..1407 = load i32* %..1406
  switch i32 %..1407, label %switch140824 [
    i32 300, label %switch14080
    i32 304, label %switch14081
    i32 308, label %switch14082
    i32 312, label %switch14083
    i32 316, label %switch14084
    i32 320, label %switch14085
    i32 660, label %switch14086
    i32 665, label %switch14087
    i32 670, label %switch14088
    i32 1080, label %switch14089
    i32 1084, label %switch140810
    i32 1088, label %switch140811
    i32 1092, label %switch140812
    i32 1200, label %switch140813
    i32 1204, label %switch140814
    i32 1208, label %switch140815
    i32 1212, label %switch140816
    i32 1530, label %switch140817
    i32 2100, label %switch140818
    i32 2520, label %switch140819
    i32 2525, label %switch140820
    i32 2530, label %switch140821
    i32 2940, label %switch140822
    i32 3540, label %switch140823
  ]
switch14080:
  ; 
  call void @ptn7() nounwind ssp
  br label %switch140824
break1586:
  br label %switch14081
switch14081:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch140824
break1588:
  br label %switch14082
switch14082:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch140824
break1590:
  br label %switch14083
switch14083:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch140824
break1592:
  br label %switch14084
switch14084:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch140824
break1594:
  br label %switch14085
switch14085:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch140824
break1596:
  br label %switch14086
switch14086:
  ; 
  call void @ptn2r() nounwind ssp
  br label %switch140824
break1598:
  br label %switch14087
switch14087:
  ; 
  call void @ptn2c() nounwind ssp
  br label %switch140824
break1600:
  br label %switch14088
switch14088:
  ; 
  call void @ptn2l() nounwind ssp
  br label %switch140824
break1602:
  br label %switch14089
switch14089:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch140824
break1604:
  br label %switch140810
switch140810:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch140824
break1606:
  br label %switch140811
switch140811:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch140824
break1608:
  br label %switch140812
switch140812:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch140824
break1610:
  br label %switch140813
switch140813:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch140824
break1612:
  br label %switch140814
switch140814:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch140824
break1614:
  br label %switch140815
switch140815:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch140824
break1616:
  br label %switch140816
switch140816:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch140824
break1618:
  br label %switch140817
switch140817:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch140824
break1622:
  br label %switch140818
switch140818:
  ; 
  call void @ptn_hatena() nounwind ssp
  br label %switch140824
break1624:
  br label %switch140819
switch140819:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch140824
break1627:
  br label %switch140820
switch140820:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch140824
break1630:
  br label %switch140821
switch140821:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch140824
break1633:
  br label %switch140822
switch140822:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch140824
break1637:
  br label %switch140823
switch140823:
  ; 
  call void @boss1() nounwind ssp
  br label %switch140824
break1639:
  br label %switch140824
switch140824:
  br label %leave1402
leave1402:
  ret void
}
define void @Stage_2(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1641 = load %.struct4** %stg
  %..1642 = bitcast %.struct4* %..1641 to %.struct4*
  %..1643 = getelementptr inbounds %.struct4* %..1642, i64 0
  %..1644 = getelementptr inbounds %.struct4* %..1643, i32 0, i32 1
  %..1645 = load i32* %..1644
  switch i32 %..1645, label %switch16460 [
  ]
switch16460:
  br label %leave1640
leave1640:
  ret void
}
define void @Stage_3(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1648 = load %.struct4** %stg
  %..1649 = bitcast %.struct4* %..1648 to %.struct4*
  %..1650 = getelementptr inbounds %.struct4* %..1649, i64 0
  %..1651 = getelementptr inbounds %.struct4* %..1650, i32 0, i32 1
  %..1652 = load i32* %..1651
  switch i32 %..1652, label %switch16530 [
  ]
switch16530:
  br label %leave1647
leave1647:
  ret void
}
define void @Stage_4(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1655 = load %.struct4** %stg
  %..1656 = bitcast %.struct4* %..1655 to %.struct4*
  %..1657 = getelementptr inbounds %.struct4* %..1656, i64 0
  %..1658 = getelementptr inbounds %.struct4* %..1657, i32 0, i32 1
  %..1659 = load i32* %..1658
  switch i32 %..1659, label %switch16600 [
  ]
switch16600:
  br label %leave1654
leave1654:
  ret void
}
define void @Stage_5(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1662 = load %.struct4** %stg
  %..1663 = bitcast %.struct4* %..1662 to %.struct4*
  %..1664 = getelementptr inbounds %.struct4* %..1663, i64 0
  %..1665 = getelementptr inbounds %.struct4* %..1664, i32 0, i32 1
  %..1666 = load i32* %..1665
  switch i32 %..1666, label %switch16670 [
  ]
switch16670:
  br label %leave1661
leave1661:
  ret void
}
define void @Stage_6(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1669 = load %.struct4** %stg
  %..1670 = bitcast %.struct4* %..1669 to %.struct4*
  %..1671 = getelementptr inbounds %.struct4* %..1670, i64 0
  %..1672 = getelementptr inbounds %.struct4* %..1671, i32 0, i32 1
  %..1673 = load i32* %..1672
  switch i32 %..1673, label %switch16740 [
  ]
switch16740:
  br label %leave1668
leave1668:
  ret void
}
define void @Stage_7(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1676 = load %.struct4** %stg
  %..1677 = bitcast %.struct4* %..1676 to %.struct4*
  %..1678 = getelementptr inbounds %.struct4* %..1677, i64 0
  %..1679 = getelementptr inbounds %.struct4* %..1678, i32 0, i32 1
  %..1680 = load i32* %..1679
  switch i32 %..1680, label %switch16810 [
  ]
switch16810:
  br label %leave1675
leave1675:
  ret void
}
define void @Stage_8(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1683 = load %.struct4** %stg
  %..1684 = bitcast %.struct4* %..1683 to %.struct4*
  %..1685 = getelementptr inbounds %.struct4* %..1684, i64 0
  %..1686 = getelementptr inbounds %.struct4* %..1685, i32 0, i32 1
  %..1687 = load i32* %..1686
  switch i32 %..1687, label %switch16880 [
  ]
switch16880:
  br label %leave1682
leave1682:
  ret void
}
define void @Stage_9(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1690 = load %.struct4** %stg
  %..1691 = bitcast %.struct4* %..1690 to %.struct4*
  %..1692 = getelementptr inbounds %.struct4* %..1691, i64 0
  %..1693 = getelementptr inbounds %.struct4* %..1692, i32 0, i32 1
  %..1694 = load i32* %..1693
  switch i32 %..1694, label %switch16950 [
  ]
switch16950:
  br label %leave1689
leave1689:
  ret void
}
define void @Stage_10(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1697 = load %.struct4** %stg
  %..1698 = bitcast %.struct4* %..1697 to %.struct4*
  %..1699 = getelementptr inbounds %.struct4* %..1698, i64 0
  %..1700 = getelementptr inbounds %.struct4* %..1699, i32 0, i32 1
  %..1701 = load i32* %..1700
  switch i32 %..1701, label %switch17020 [
  ]
switch17020:
  br label %leave1696
leave1696:
  ret void
}
define void @Stage_11(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1704 = load %.struct4** %stg
  %..1705 = bitcast %.struct4* %..1704 to %.struct4*
  %..1706 = getelementptr inbounds %.struct4* %..1705, i64 0
  %..1707 = getelementptr inbounds %.struct4* %..1706, i32 0, i32 1
  %..1708 = load i32* %..1707
  switch i32 %..1708, label %switch17090 [
  ]
switch17090:
  br label %leave1703
leave1703:
  ret void
}
define void @Stage_12(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1711 = load %.struct4** %stg
  %..1712 = bitcast %.struct4* %..1711 to %.struct4*
  %..1713 = getelementptr inbounds %.struct4* %..1712, i64 0
  %..1714 = getelementptr inbounds %.struct4* %..1713, i32 0, i32 1
  %..1715 = load i32* %..1714
  switch i32 %..1715, label %switch17160 [
  ]
switch17160:
  br label %leave1710
leave1710:
  ret void
}
define void @Stage_13(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1718 = load %.struct4** %stg
  %..1719 = bitcast %.struct4* %..1718 to %.struct4*
  %..1720 = getelementptr inbounds %.struct4* %..1719, i64 0
  %..1721 = getelementptr inbounds %.struct4* %..1720, i32 0, i32 1
  %..1722 = load i32* %..1721
  switch i32 %..1722, label %switch17230 [
  ]
switch17230:
  br label %leave1717
leave1717:
  ret void
}
define void @Stage_14(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1725 = load %.struct4** %stg
  %..1726 = bitcast %.struct4* %..1725 to %.struct4*
  %..1727 = getelementptr inbounds %.struct4* %..1726, i64 0
  %..1728 = getelementptr inbounds %.struct4* %..1727, i32 0, i32 1
  %..1729 = load i32* %..1728
  switch i32 %..1729, label %switch17300 [
  ]
switch17300:
  br label %leave1724
leave1724:
  ret void
}
define void @Stage_15(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1732 = load %.struct4** %stg
  %..1733 = bitcast %.struct4* %..1732 to %.struct4*
  %..1734 = getelementptr inbounds %.struct4* %..1733, i64 0
  %..1735 = getelementptr inbounds %.struct4* %..1734, i32 0, i32 1
  %..1736 = load i32* %..1735
  switch i32 %..1736, label %switch17370 [
  ]
switch17370:
  br label %leave1731
leave1731:
  ret void
}
define void @Stage_16(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1739 = load %.struct4** %stg
  %..1740 = bitcast %.struct4* %..1739 to %.struct4*
  %..1741 = getelementptr inbounds %.struct4* %..1740, i64 0
  %..1742 = getelementptr inbounds %.struct4* %..1741, i32 0, i32 1
  %..1743 = load i32* %..1742
  switch i32 %..1743, label %switch17440 [
  ]
switch17440:
  br label %leave1738
leave1738:
  ret void
}
define void @Stage_17(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1746 = load %.struct4** %stg
  %..1747 = bitcast %.struct4* %..1746 to %.struct4*
  %..1748 = getelementptr inbounds %.struct4* %..1747, i64 0
  %..1749 = getelementptr inbounds %.struct4* %..1748, i32 0, i32 1
  %..1750 = load i32* %..1749
  switch i32 %..1750, label %switch17510 [
  ]
switch17510:
  br label %leave1745
leave1745:
  ret void
}
define void @Stage_18(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1753 = load %.struct4** %stg
  %..1754 = bitcast %.struct4* %..1753 to %.struct4*
  %..1755 = getelementptr inbounds %.struct4* %..1754, i64 0
  %..1756 = getelementptr inbounds %.struct4* %..1755, i32 0, i32 1
  %..1757 = load i32* %..1756
  switch i32 %..1757, label %switch17580 [
  ]
switch17580:
  br label %leave1752
leave1752:
  ret void
}
define void @Stage_ending(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1760 = load %.struct4** %stg
  %..1761 = bitcast %.struct4* %..1760 to %.struct4*
  %..1762 = getelementptr inbounds %.struct4* %..1761, i64 0
  %..1763 = getelementptr inbounds %.struct4* %..1762, i32 0, i32 1
  %..1764 = load i32* %..1763
  switch i32 %..1764, label %switch17650 [
  ]
switch17650:
  br label %leave1759
leave1759:
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
declare void @color(float, float, float, float) nounwind
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
declare i32 @aaa() nounwind
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
