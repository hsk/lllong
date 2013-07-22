%.struct1 = type { i32, i32, i32, i32, void(%.struct1*)*, void()*, i32 }
%.struct2 = type { void(%.struct2*)*, i32 }
%.struct1054 = type { i32, i32, i32, i32, i32 }
%.struct1116 = type { double, double }
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
  %..5 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  store double 0x0, double* %..5
  %..7 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
  store double 0x0, double* %..7
  %..9 = load i8*** %argv
  call void @glutInit(i32* %argc, i8** %..9) nounwind ssp
  call void @glutInitWindowSize(i32 640, i32 480) nounwind ssp
  %..18 = bitcast i64 0 to i64
  %reg_1766 = icmp ne i64 %..18, 0
  br i1 %reg_1766, label %ok13, label %else14
ok13:
  %..21 = bitcast [14 x i8]* @.str1767 to i8*
  call void @glutGameModeString(i8* %..21) nounwind ssp
  call void @glutEnterGameMode() nounwind ssp
  br label %else15
else15:
  br label %endif16
else14:
  %..24 = load i8*** %argv
  %..26 = bitcast i8** %..24 to i8**
  %..27 = getelementptr inbounds i8** %..26, i64 0
  %..28 = load i8** %..27
  call void @glutCreateWindow(i8* %..28) nounwind ssp
  br label %endif17
endif17:
  br label %endif16
endif16:
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
  %..47 = call i32 @aaa() nounwind ssp
  br label %leave3
leave3:
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
  %..49 = getelementptr inbounds %.struct1* @game, i32 0, i32 4
  %..1769 = load void(%.struct1*)** %..49
  call void %..1769(%.struct1* @game) nounwind ssp
  call void @glutPostRedisplay() nounwind ssp
  %..53 = sdiv i32 1000, 50
  call void @glutTimerFunc(i32 %..53, void(i32)* @main_loop, i32 0) nounwind ssp
  br label %leave48
leave48:
  ret void
}
define void @main_display() nounwind ssp {
entry:
  %WIDTH = alloca i32
  store i32 640, i32* %WIDTH
  %HEIGHT = alloca i32
  store i32 480, i32* %HEIGHT
  %..61 = or i32 16384, 256
  call void @glClear(i32 %..61) nounwind ssp
  call void @glViewport(i32 0, i32 0, i32 640, i32 480) nounwind ssp
  call void @glMatrixMode(i32 5889) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..76 = load i32* %WIDTH
  %..79 = load i32* %HEIGHT
  %..78 = sitofp i32 %..79 to double
  %..77 = fptosi double %..78 to i32
  %..75 = sdiv i32 %..76, %..77
  %..74 = sitofp i32 %..75 to double
  call void @gluPerspective(double 0x4056800000000000, double %..74, double 0x3ff0000000000000, double 0x40c3880000000000) nounwind ssp
  %n = alloca float
  store float 0x4024000000000000, float* %n
  %lightpos = alloca [4 x float]
  %..83 = bitcast [4 x float]* %lightpos to float*
  %..89 = load float* %n
  %..88 = fpext float %..89 to double
  %..86 = fmul double 0x407f400000000000, %..88
  %..85 = fptrunc double %..86 to float
  %..90 = bitcast float* %..83 to float*
  %..91 = getelementptr inbounds float* %..90, i64 0
  store float %..85, float* %..91
  %..92 = bitcast [4 x float]* %lightpos to float*
  %..98 = load float* %n
  %..97 = fpext float %..98 to double
  %..95 = fmul double 0x4089100000000000, %..97
  %..94 = fptrunc double %..95 to float
  %..99 = bitcast float* %..92 to float*
  %..100 = getelementptr inbounds float* %..99, i64 1
  store float %..94, float* %..100
  %..101 = bitcast [4 x float]* %lightpos to float*
  %..107 = load float* %n
  %..106 = fpext float %..107 to double
  %..104 = fmul double 0x407f900000000000, %..106
  %..103 = fptrunc double %..104 to float
  %..108 = bitcast float* %..101 to float*
  %..109 = getelementptr inbounds float* %..108, i64 2
  store float %..103, float* %..109
  %..110 = bitcast [4 x float]* %lightpos to float*
  %..112 = fptrunc double 0x3ff0000000000000 to float
  %..114 = bitcast float* %..110 to float*
  %..115 = getelementptr inbounds float* %..114, i64 3
  store float %..112, float* %..115
  %..120 = bitcast [4 x float]* %lightpos to float*
  %..119 = bitcast float* %..120 to float*
  call void @glLightfv(i32 16384, i32 4611, float* %..119) nounwind ssp
  call void @glMatrixMode(i32 5888) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  call void @glBlendFunc(i32 770, i32 1) nounwind ssp
  call void @gluLookAt(double 0x0, double 0x0, double 0x4074000000000000, double 0x0, double 0x0, double 0x0, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..137 = getelementptr inbounds %.struct1* @game, i32 0, i32 5
  %..1770 = load void()** %..137
  call void %..1770() nounwind ssp
  call void @glFlush() nounwind ssp
  br label %leave57
leave57:
  ret void
}
@game= common global %.struct1 zeroinitializer
define void @Game_new(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..141 = load %.struct1** %game
  %..142 = bitcast %.struct1* %..141 to %.struct1*
  %..143 = getelementptr inbounds %.struct1* %..142, i64 0
  %..144 = trunc i64 0 to i32
  %..146 = getelementptr inbounds %.struct1* %..143, i32 0, i32 6
  store i32 %..144, i32* %..146
  %..147 = load %.struct1** %game
  %..148 = bitcast %.struct1* %..147 to %.struct1*
  %..149 = getelementptr inbounds %.struct1* %..148, i64 0
  %..150 = trunc i64 3 to i32
  %..152 = getelementptr inbounds %.struct1* %..149, i32 0, i32 1
  store i32 %..150, i32* %..152
  %..153 = load %.struct1** %game
  %..154 = bitcast %.struct1* %..153 to %.struct1*
  %..155 = getelementptr inbounds %.struct1* %..154, i64 0
  %..156 = trunc i64 1 to i32
  %..158 = getelementptr inbounds %.struct1* %..155, i32 0, i32 0
  store i32 %..156, i32* %..158
  %..159 = load %.struct1** %game
  %..160 = bitcast %.struct1* %..159 to %.struct1*
  %..161 = getelementptr inbounds %.struct1* %..160, i64 0
  %..162 = trunc i64 0 to i32
  %..164 = getelementptr inbounds %.struct1* %..161, i32 0, i32 3
  store i32 %..162, i32* %..164
  %..165 = load %.struct1** %game
  %..166 = bitcast %.struct1* %..165 to %.struct1*
  %..167 = getelementptr inbounds %.struct1* %..166, i64 0
  %..168 = getelementptr inbounds %.struct1* %..167, i32 0, i32 4
  store void(%.struct1*)* @Game_title, void(%.struct1*)** %..168
  %..169 = load %.struct1** %game
  %..170 = bitcast %.struct1* %..169 to %.struct1*
  %..171 = getelementptr inbounds %.struct1* %..170, i64 0
  %..172 = getelementptr inbounds %.struct1* %..171, i32 0, i32 5
  store void()* @Game_title_draw, void()** %..172
  br label %leave140
leave140:
  ret void
}
define void @Game_title(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..174 = load %.struct1** %game
  %..175 = bitcast %.struct1* %..174 to %.struct1*
  %..176 = getelementptr inbounds %.struct1* %..175, i64 0
  %..180 = load %.struct1** %game
  %..181 = bitcast %.struct1* %..180 to %.struct1*
  %..182 = getelementptr inbounds %.struct1* %..181, i64 0
  %..183 = getelementptr inbounds %.struct1* %..182, i32 0, i32 3
  %..184 = load i32* %..183
  %..179 = zext i32 %..184 to i64
  %..178 = add i64 %..179, 1
  %..177 = trunc i64 %..178 to i32
  %..186 = getelementptr inbounds %.struct1* %..176, i32 0, i32 3
  store i32 %..177, i32* %..186
  %..193 = getelementptr inbounds %.struct1054* @key, i32 0, i32 4
  %..194 = load i32* %..193
  %..192 = zext i32 %..194 to i64
  %reg_1771 = icmp ne i64 %..192, 0
  br i1 %reg_1771, label %ok187, label %else188
ok187:
  %..195 = load %.struct1** %game
  %..196 = bitcast %.struct1* %..195 to %.struct1*
  %..197 = getelementptr inbounds %.struct1* %..196, i64 0
  %..198 = trunc i64 0 to i32
  %..200 = getelementptr inbounds %.struct1* %..197, i32 0, i32 3
  store i32 %..198, i32* %..200
  %..201 = load %.struct1** %game
  %..202 = bitcast %.struct1* %..201 to %.struct1*
  %..203 = getelementptr inbounds %.struct1* %..202, i64 0
  %..204 = getelementptr inbounds %.struct1* %..203, i32 0, i32 4
  store void(%.struct1*)* @Game_title_end, void(%.struct1*)** %..204
  br label %else189
else189:
  br label %endif190
else188:
  ; void
  br label %endif191
endif191:
  br label %endif190
endif190:
  br label %leave173
leave173:
  ret void
}
define void @Game_title_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..208 = fsub double 0.0, 0x4056800000000000
  call void @glRotated(double %..208, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..215 = getelementptr inbounds %.struct1* @game, i32 0, i32 3
  %..216 = load i32* %..215
  %..214 = sitofp i32 %..216 to double
  call void @glRotated(double %..214, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
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
  %..277 = fsub double 0.0, 0x0
  %..279 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..277, double %..279) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..307 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..307, double 0x40475e24dd2f1aa0) nounwind ssp
  %..312 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..312, double 0x4069df16872b020c) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..341 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..341, double 0x40475e24dd2f1aa0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..358 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..358, double 0x40475e24dd2f1aa0) nounwind ssp
  %..363 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..363, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..368 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..368, double 0x4069df16872b020c) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..381 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..381, double 0x0) nounwind ssp
  %..386 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..386, double 0x40687b020c49ba5e) nounwind ssp
  %..391 = fsub double 0.0, 0x405bd1999999999a
  call void @glVertex3d(double 0x0, double %..391, double 0x407ad85810624dd3) nounwind ssp
  %..396 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..396, double 0x407b1f8f5c28f5c3) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..410 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..410) nounwind ssp
  %..414 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..414, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..419 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..419, double 0x40475e24dd2f1aa0) nounwind ssp
  %..424 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..424, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..441 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..441, double 0x40475e24dd2f1aa0) nounwind ssp
  %..446 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..446, double 0x4068c2395810624e) nounwind ssp
  %..451 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..451, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..468 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..468, double 0x407a6d851eb851ec) nounwind ssp
  %..473 = fsub double 0.0, 0x40687b020c49ba5e
  call void @glVertex3d(double 0x0, double %..473, double 0x407a6d851eb851ec) nounwind ssp
  %..478 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..478, double 0x4068c2395810624e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..492 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..492) nounwind ssp
  %..496 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..496, double 0x4068c2395810624e) nounwind ssp
  %..501 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..501, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..506 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..506, double 0x407a6d851eb851ec) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..523 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..523, double 0x4068c2395810624e) nounwind ssp
  %..528 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..528, double 0x40475e24dd2f1aa0) nounwind ssp
  %..533 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..533, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..551 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..551) nounwind ssp
  %..555 = fsub double 0.0, 0x4070d4916872b021
  %..557 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..555, double %..557) nounwind ssp
  %..562 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..562) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..574 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..574, double 0x0) nounwind ssp
  %..580 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..580) nounwind ssp
  %..585 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..585) nounwind ssp
  %..590 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..590) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..607 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..607) nounwind ssp
  %..612 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..612) nounwind ssp
  %..617 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..617) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..630 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..630) nounwind ssp
  %..635 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..635) nounwind ssp
  %..640 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..640) nounwind ssp
  %..645 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..645) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..657 = fsub double 0.0, 0x0
  %..659 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..657, double %..659) nounwind ssp
  %..664 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..664) nounwind ssp
  %..668 = fsub double 0.0, 0x406331e76c8b4396
  %..670 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..668, double %..670) nounwind ssp
  %..674 = fsub double 0.0, 0x4070d4916872b021
  %..676 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..674, double %..676) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..689 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..689) nounwind ssp
  %..693 = fsub double 0.0, 0x406331e76c8b4396
  %..695 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..693, double %..695) nounwind ssp
  %..699 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..701 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..699, double %..701) nounwind ssp
  %..705 = fsub double 0.0, 0x4070d4916872b021
  %..707 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..705, double %..707) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..723 = fsub double 0.0, 0x406331e76c8b4396
  %..725 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..723, double %..725) nounwind ssp
  %..729 = fsub double 0.0, 0x4062150a3d70a3d7
  %..731 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..729, double %..731) nounwind ssp
  %..735 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..737 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..735, double %..737) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..753 = fsub double 0.0, 0x4062150a3d70a3d7
  %..755 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..753, double %..755) nounwind ssp
  %..759 = fsub double 0.0, 0x40613f645a1cac08
  %..761 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..759, double %..761) nounwind ssp
  %..765 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..767 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..765, double %..767) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..783 = fsub double 0.0, 0x4062150a3d70a3d7
  %..785 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..783, double %..785) nounwind ssp
  %..789 = fsub double 0.0, 0x4045246a7ef9db23
  %..791 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..789, double %..791) nounwind ssp
  %..795 = fsub double 0.0, 0x40613f645a1cac08
  %..797 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..795, double %..797) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..813 = fsub double 0.0, 0x4045246a7ef9db23
  %..815 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..813, double %..815) nounwind ssp
  %..820 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..820) nounwind ssp
  %..825 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..825) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..838 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..838) nounwind ssp
  %..843 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..843) nounwind ssp
  %..847 = fsub double 0.0, 0x4044078d4fdf3b64
  %..849 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..847, double %..849) nounwind ssp
  %..853 = fsub double 0.0, 0x4045246a7ef9db23
  %..855 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..853, double %..855) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..871 = fsub double 0.0, 0x4045246a7ef9db23
  %..873 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..871, double %..873) nounwind ssp
  %..877 = fsub double 0.0, 0x4044078d4fdf3b64
  %..879 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..877, double %..879) nounwind ssp
  %..883 = fsub double 0.0, 0x40613f645a1cac08
  %..885 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..883, double %..885) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave205
leave205:
  ret void
}
define void @Game_title_end(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..890 = load %.struct1** %game
  %..891 = bitcast %.struct1* %..890 to %.struct1*
  %..892 = getelementptr inbounds %.struct1* %..891, i64 0
  %..896 = load %.struct1** %game
  %..897 = bitcast %.struct1* %..896 to %.struct1*
  %..898 = getelementptr inbounds %.struct1* %..897, i64 0
  %..899 = getelementptr inbounds %.struct1* %..898, i32 0, i32 3
  %..900 = load i32* %..899
  %..895 = zext i32 %..900 to i64
  %..894 = add i64 %..895, 1
  %..893 = trunc i64 %..894 to i32
  %..902 = getelementptr inbounds %.struct1* %..892, i32 0, i32 3
  store i32 %..893, i32* %..902
  %..911 = load %.struct1** %game
  %..912 = bitcast %.struct1* %..911 to %.struct1*
  %..913 = getelementptr inbounds %.struct1* %..912, i64 0
  %..914 = getelementptr inbounds %.struct1* %..913, i32 0, i32 3
  %..915 = load i32* %..914
  %..910 = zext i32 %..915 to i64
  %..1772 = icmp sgt i64 %..910, 60
  %..909 = zext i1 %..1772 to i64
  %..908 = bitcast i64 %..909 to i64
  %reg_1773 = icmp ne i64 %..908, 0
  br i1 %reg_1773, label %ok903, label %else904
ok903:
  %..917 = load %.struct1** %game
  %..918 = bitcast %.struct1* %..917 to %.struct1*
  %..919 = getelementptr inbounds %.struct1* %..918, i64 0
  %..920 = getelementptr inbounds %.struct1* %..919, i32 0, i32 4
  store void(%.struct1*)* @Game_init, void(%.struct1*)** %..920
  br label %else905
else905:
  br label %endif906
else904:
  ; void
  br label %endif907
endif907:
  br label %endif906
endif906:
  br label %leave889
leave889:
  ret void
}
define void @Game_demo(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave921
leave921:
  ret void
}
define void @Game_ranking(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave922
leave922:
  ret void
}
define void @Game_init(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..924 = load %.struct1** %game
  %..925 = bitcast %.struct1* %..924 to %.struct1*
  %..926 = getelementptr inbounds %.struct1* %..925, i64 0
  %..927 = trunc i64 0 to i32
  %..929 = getelementptr inbounds %.struct1* %..926, i32 0, i32 6
  store i32 %..927, i32* %..929
  %..930 = load %.struct1** %game
  %..931 = bitcast %.struct1* %..930 to %.struct1*
  %..932 = getelementptr inbounds %.struct1* %..931, i64 0
  %..933 = trunc i64 3 to i32
  %..935 = getelementptr inbounds %.struct1* %..932, i32 0, i32 1
  store i32 %..933, i32* %..935
  %..936 = load %.struct1** %game
  %..937 = bitcast %.struct1* %..936 to %.struct1*
  %..938 = getelementptr inbounds %.struct1* %..937, i64 0
  %..939 = trunc i64 1 to i32
  %..941 = getelementptr inbounds %.struct1* %..938, i32 0, i32 0
  store i32 %..939, i32* %..941
  %..942 = load %.struct1** %game
  %..943 = bitcast %.struct1* %..942 to %.struct1*
  %..944 = getelementptr inbounds %.struct1* %..943, i64 0
  %..945 = trunc i64 0 to i32
  %..947 = getelementptr inbounds %.struct1* %..944, i32 0, i32 3
  store i32 %..945, i32* %..947
  %..948 = load %.struct1** %game
  %..949 = bitcast %.struct1* %..948 to %.struct1*
  %..950 = getelementptr inbounds %.struct1* %..949, i64 0
  %..951 = getelementptr inbounds %.struct1* %..950, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..951
  %..952 = load %.struct1** %game
  %..953 = bitcast %.struct1* %..952 to %.struct1*
  %..954 = getelementptr inbounds %.struct1* %..953, i64 0
  %..955 = getelementptr inbounds %.struct1* %..954, i32 0, i32 5
  store void()* @Game_game_draw, void()** %..955
  %..956 = load %.struct1** %game
  %..957 = load %.struct1** %game
  %..958 = bitcast %.struct1* %..957 to %.struct1*
  %..959 = getelementptr inbounds %.struct1* %..958, i64 0
  %..960 = getelementptr inbounds %.struct1* %..959, i32 0, i32 4
  %..1774 = load void(%.struct1*)** %..960
  call void %..1774(%.struct1* %..956) nounwind ssp
  br label %leave923
leave923:
  ret void
}
define void @Game_stageStart(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..971 = load %.struct1** %game
  %..972 = bitcast %.struct1* %..971 to %.struct1*
  %..973 = getelementptr inbounds %.struct1* %..972, i64 0
  %..974 = getelementptr inbounds %.struct1* %..973, i32 0, i32 3
  %..975 = load i32* %..974
  %..970 = zext i32 %..975 to i64
  %..1775 = icmp sgt i64 %..970, 240
  %..969 = zext i1 %..1775 to i64
  %..968 = bitcast i64 %..969 to i64
  %reg_1776 = icmp ne i64 %..968, 0
  br i1 %reg_1776, label %ok963, label %else964
ok963:
  %..979 = load %.struct1** %game
  %..980 = bitcast %.struct1* %..979 to %.struct1*
  %..981 = getelementptr inbounds %.struct1* %..980, i64 0
  %..982 = getelementptr inbounds %.struct1* %..981, i32 0, i32 4
  store void(%.struct1*)* @Game_game, void(%.struct1*)** %..982
  br label %else965
else965:
  br label %endif966
else964:
  ; void
  br label %endif967
endif967:
  br label %endif966
endif966:
  %..984 = load %.struct1** %game
  call void @Game_game(%.struct1* %..984) nounwind ssp
  br label %leave962
leave962:
  ret void
}
define void @Game_game(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..995 = load %.struct1** %game
  %..996 = bitcast %.struct1* %..995 to %.struct1*
  %..997 = getelementptr inbounds %.struct1* %..996, i64 0
  %..998 = getelementptr inbounds %.struct1* %..997, i32 0, i32 3
  %..999 = load i32* %..998
  %..994 = zext i32 %..999 to i64
  %..993 = srem i64 %..994, 4
  %..1777 = icmp eq i64 %..993, 3
  %..992 = zext i1 %..1777 to i64
  %..991 = bitcast i64 %..992 to i64
  %reg_1778 = icmp ne i64 %..991, 0
  br i1 %reg_1778, label %ok986, label %else987
ok986:
  %..1002 = load %.struct1** %game
  %..1003 = bitcast %.struct1* %..1002 to %.struct1*
  %..1004 = getelementptr inbounds %.struct1* %..1003, i64 0
  %..1008 = load %.struct1** %game
  %..1009 = bitcast %.struct1* %..1008 to %.struct1*
  %..1010 = getelementptr inbounds %.struct1* %..1009, i64 0
  %..1011 = getelementptr inbounds %.struct1* %..1010, i32 0, i32 6
  %..1012 = load i32* %..1011
  %..1007 = zext i32 %..1012 to i64
  %..1006 = add i64 %..1007, 10
  %..1005 = trunc i64 %..1006 to i32
  %..1014 = getelementptr inbounds %.struct1* %..1004, i32 0, i32 6
  store i32 %..1005, i32* %..1014
  br label %else988
else988:
  br label %endif989
else987:
  ; void
  br label %endif990
endif990:
  br label %endif989
endif989:
  %..1015 = load %.struct1** %game
  %..1016 = bitcast %.struct1* %..1015 to %.struct1*
  %..1017 = getelementptr inbounds %.struct1* %..1016, i64 0
  %..1021 = load %.struct1** %game
  %..1022 = bitcast %.struct1* %..1021 to %.struct1*
  %..1023 = getelementptr inbounds %.struct1* %..1022, i64 0
  %..1024 = getelementptr inbounds %.struct1* %..1023, i32 0, i32 3
  %..1025 = load i32* %..1024
  %..1020 = zext i32 %..1025 to i64
  %..1019 = add i64 %..1020, 1
  %..1018 = trunc i64 %..1019 to i32
  %..1027 = getelementptr inbounds %.struct1* %..1017, i32 0, i32 3
  store i32 %..1018, i32* %..1027
  call void @Ship_move() nounwind ssp
  br label %leave985
leave985:
  ret void
}
define void @Game_game_draw() nounwind ssp {
entry:
  call void @Ship_draw() nounwind ssp
  br label %leave1029
leave1029:
  ret void
}
define void @Game_damage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1031
leave1031:
  ret void
}
define void @Game_boss(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1032
leave1032:
  ret void
}
define void @Game_nextStage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1034 = load %.struct1** %game
  %..1035 = bitcast %.struct1* %..1034 to %.struct1*
  %..1036 = getelementptr inbounds %.struct1* %..1035, i64 0
  %..1040 = load %.struct1** %game
  %..1041 = bitcast %.struct1* %..1040 to %.struct1*
  %..1042 = getelementptr inbounds %.struct1* %..1041, i64 0
  %..1043 = getelementptr inbounds %.struct1* %..1042, i32 0, i32 0
  %..1044 = load i32* %..1043
  %..1039 = zext i32 %..1044 to i64
  %..1038 = add i64 %..1039, 1
  %..1037 = trunc i64 %..1038 to i32
  %..1046 = getelementptr inbounds %.struct1* %..1036, i32 0, i32 0
  store i32 %..1037, i32* %..1046
  %..1047 = load %.struct1** %game
  %..1048 = bitcast %.struct1* %..1047 to %.struct1*
  %..1049 = getelementptr inbounds %.struct1* %..1048, i64 0
  %..1050 = getelementptr inbounds %.struct1* %..1049, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..1050
  br label %leave1033
leave1033:
  ret void
}
define void @Game_continue(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1051
leave1051:
  ret void
}
define void @Game_nameEntry(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1052
leave1052:
  ret void
}
define void @Game_ending(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1053
leave1053:
  ret void
}
@key= common global %.struct1054 zeroinitializer
define void @downKey(i8 %k.v, i32 %x.v, i32 %y.v) nounwind ssp {
entry:
  %k = alloca i8
  store i8 %k.v, i8* %k
  %x = alloca i32
  store i32 %x.v, i32* %x
  %y = alloca i32
  store i32 %y.v, i32* %y
  %..1056 = load i8* %k
  switch i8 %..1056, label %switch10575 [
    i8 101, label %switch10570
    i8 103, label %switch10571
    i8 100, label %switch10572
    i8 102, label %switch10573
    i8 32, label %switch10574
  ]
switch10570:
  ; 
  %..1063 = trunc i64 1 to i32
  %..1065 = getelementptr inbounds %.struct1054* @key, i32 0, i32 0
  store i32 %..1063, i32* %..1065
  br label %switch10575
break1066:
  br label %switch10571
switch10571:
  ; 
  %..1067 = trunc i64 1 to i32
  %..1069 = getelementptr inbounds %.struct1054* @key, i32 0, i32 1
  store i32 %..1067, i32* %..1069
  br label %switch10575
break1070:
  br label %switch10572
switch10572:
  ; 
  %..1071 = trunc i64 1 to i32
  %..1073 = getelementptr inbounds %.struct1054* @key, i32 0, i32 2
  store i32 %..1071, i32* %..1073
  br label %switch10575
break1074:
  br label %switch10573
switch10573:
  ; 
  %..1075 = trunc i64 1 to i32
  %..1077 = getelementptr inbounds %.struct1054* @key, i32 0, i32 3
  store i32 %..1075, i32* %..1077
  br label %switch10575
break1078:
  br label %switch10574
switch10574:
  ; 
  %..1079 = trunc i64 1 to i32
  %..1081 = getelementptr inbounds %.struct1054* @key, i32 0, i32 4
  store i32 %..1079, i32* %..1081
  br label %switch10575
break1082:
  br label %switch10575
switch10575:
  br label %leave1055
leave1055:
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
  %..1084 = load i8* %k
  switch i8 %..1084, label %switch10856 [
    i8 101, label %switch10850
    i8 103, label %switch10851
    i8 100, label %switch10852
    i8 102, label %switch10853
    i8 32, label %switch10854
    i8 27, label %switch10855
  ]
switch10850:
  ; 
  %..1092 = trunc i64 0 to i32
  %..1094 = getelementptr inbounds %.struct1054* @key, i32 0, i32 0
  store i32 %..1092, i32* %..1094
  br label %switch10856
break1095:
  br label %switch10851
switch10851:
  ; 
  %..1096 = trunc i64 0 to i32
  %..1098 = getelementptr inbounds %.struct1054* @key, i32 0, i32 1
  store i32 %..1096, i32* %..1098
  br label %switch10856
break1099:
  br label %switch10852
switch10852:
  ; 
  %..1100 = trunc i64 0 to i32
  %..1102 = getelementptr inbounds %.struct1054* @key, i32 0, i32 2
  store i32 %..1100, i32* %..1102
  br label %switch10856
break1103:
  br label %switch10853
switch10853:
  ; 
  %..1104 = trunc i64 0 to i32
  %..1106 = getelementptr inbounds %.struct1054* @key, i32 0, i32 3
  store i32 %..1104, i32* %..1106
  br label %switch10856
break1107:
  br label %switch10854
switch10854:
  ; 
  %..1108 = trunc i64 0 to i32
  %..1110 = getelementptr inbounds %.struct1054* @key, i32 0, i32 4
  store i32 %..1108, i32* %..1110
  br label %switch10856
break1111:
  br label %switch10855
switch10855:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch10856
break1115:
  br label %switch10856
switch10856:
  br label %leave1083
leave1083:
  ret void
}
@ship= common global %.struct1116 zeroinitializer
define void @Ship_move() nounwind ssp {
entry:
  %speed = alloca double
  store double 0x4024000000000000, double* %speed
  %..1125 = getelementptr inbounds %.struct1054* @key, i32 0, i32 2
  %..1126 = load i32* %..1125
  %..1124 = zext i32 %..1126 to i64
  %reg_1779 = icmp ne i64 %..1124, 0
  br i1 %reg_1779, label %ok1119, label %else1120
ok1119:
  %..1128 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  %..1129 = load double* %..1128
  %..1130 = load double* %speed
  %..1127 = fsub double %..1129, %..1130
  %..1131 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
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
  %..1138 = getelementptr inbounds %.struct1054* @key, i32 0, i32 3
  %..1139 = load i32* %..1138
  %..1137 = zext i32 %..1139 to i64
  %reg_1780 = icmp ne i64 %..1137, 0
  br i1 %reg_1780, label %ok1132, label %else1133
ok1132:
  %..1141 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  %..1142 = load double* %..1141
  %..1143 = load double* %speed
  %..1140 = fadd double %..1142, %..1143
  %..1144 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
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
  %..1151 = getelementptr inbounds %.struct1054* @key, i32 0, i32 0
  %..1152 = load i32* %..1151
  %..1150 = zext i32 %..1152 to i64
  %reg_1781 = icmp ne i64 %..1150, 0
  br i1 %reg_1781, label %ok1145, label %else1146
ok1145:
  %..1154 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
  %..1155 = load double* %..1154
  %..1156 = load double* %speed
  %..1153 = fadd double %..1155, %..1156
  %..1157 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
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
  %..1164 = getelementptr inbounds %.struct1054* @key, i32 0, i32 1
  %..1165 = load i32* %..1164
  %..1163 = zext i32 %..1165 to i64
  %reg_1782 = icmp ne i64 %..1163, 0
  br i1 %reg_1782, label %ok1158, label %else1159
ok1158:
  %..1167 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
  %..1168 = load double* %..1167
  %..1169 = load double* %speed
  %..1166 = fsub double %..1168, %..1169
  %..1170 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
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
  %..1180 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  %..1181 = load double* %..1180
  %..1182 = sitofp i64 300 to double
  %..1783 = fcmp ogt double %..1181, %..1182
  %..1179 = zext i1 %..1783 to i64
  %..1178 = bitcast i64 %..1179 to i64
  %reg_1784 = icmp ne i64 %..1178, 0
  br i1 %reg_1784, label %ok1173, label %else1174
ok1173:
  %..1185 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
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
  %..1193 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  %..1194 = load double* %..1193
  %..1195 = sitofp i64 -300 to double
  %..1785 = fcmp olt double %..1194, %..1195
  %..1192 = zext i1 %..1785 to i64
  %..1191 = bitcast i64 %..1192 to i64
  %reg_1786 = icmp ne i64 %..1191, 0
  br i1 %reg_1786, label %ok1186, label %else1187
ok1186:
  %..1197 = fsub double 0.0, 0x4072c00000000000
  %..1199 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
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
  %..1207 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
  %..1208 = load double* %..1207
  %..1209 = sitofp i64 240 to double
  %..1787 = fcmp ogt double %..1208, %..1209
  %..1206 = zext i1 %..1787 to i64
  %..1205 = bitcast i64 %..1206 to i64
  %reg_1788 = icmp ne i64 %..1205, 0
  br i1 %reg_1788, label %ok1200, label %else1201
ok1200:
  %..1212 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
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
  %..1220 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
  %..1221 = load double* %..1220
  %..1222 = fsub double 0.0, 0x406e000000000000
  %..1789 = fcmp olt double %..1221, %..1222
  %..1219 = zext i1 %..1789 to i64
  %..1218 = bitcast i64 %..1219 to i64
  %reg_1790 = icmp ne i64 %..1218, 0
  br i1 %reg_1790, label %ok1213, label %else1214
ok1213:
  %..1224 = fsub double 0.0, 0x406e000000000000
  %..1226 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
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
  %..1230 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 0
  %..1231 = load double* %..1230
  %..1232 = getelementptr inbounds %.struct1116* @ship, i32 0, i32 1
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
define void @Stage_init(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
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
  %..1293 = load %.struct2** %stg
  %..1294 = bitcast %.struct2* %..1293 to %.struct2*
  %..1295 = getelementptr inbounds %.struct2* %..1294, i64 0
  %..1296 = getelementptr inbounds %.struct2* %..1295, i32 0, i32 0
  store void(%.struct2*)* @Stage_1, void(%.struct2*)** %..1296
  br label %switch127319
break1297:
  br label %switch12731
switch12731:
  ; 
  %..1298 = load %.struct2** %stg
  %..1299 = bitcast %.struct2* %..1298 to %.struct2*
  %..1300 = getelementptr inbounds %.struct2* %..1299, i64 0
  %..1301 = getelementptr inbounds %.struct2* %..1300, i32 0, i32 0
  store void(%.struct2*)* @Stage_2, void(%.struct2*)** %..1301
  br label %switch127319
break1302:
  br label %switch12732
switch12732:
  ; 
  %..1303 = load %.struct2** %stg
  %..1304 = bitcast %.struct2* %..1303 to %.struct2*
  %..1305 = getelementptr inbounds %.struct2* %..1304, i64 0
  %..1306 = getelementptr inbounds %.struct2* %..1305, i32 0, i32 0
  store void(%.struct2*)* @Stage_3, void(%.struct2*)** %..1306
  br label %switch127319
break1307:
  br label %switch12733
switch12733:
  ; 
  %..1308 = load %.struct2** %stg
  %..1309 = bitcast %.struct2* %..1308 to %.struct2*
  %..1310 = getelementptr inbounds %.struct2* %..1309, i64 0
  %..1311 = getelementptr inbounds %.struct2* %..1310, i32 0, i32 0
  store void(%.struct2*)* @Stage_4, void(%.struct2*)** %..1311
  br label %switch127319
break1312:
  br label %switch12734
switch12734:
  ; 
  %..1313 = load %.struct2** %stg
  %..1314 = bitcast %.struct2* %..1313 to %.struct2*
  %..1315 = getelementptr inbounds %.struct2* %..1314, i64 0
  %..1316 = getelementptr inbounds %.struct2* %..1315, i32 0, i32 0
  store void(%.struct2*)* @Stage_5, void(%.struct2*)** %..1316
  br label %switch127319
break1317:
  br label %switch12735
switch12735:
  ; 
  %..1318 = load %.struct2** %stg
  %..1319 = bitcast %.struct2* %..1318 to %.struct2*
  %..1320 = getelementptr inbounds %.struct2* %..1319, i64 0
  %..1321 = getelementptr inbounds %.struct2* %..1320, i32 0, i32 0
  store void(%.struct2*)* @Stage_6, void(%.struct2*)** %..1321
  br label %switch127319
break1322:
  br label %switch12736
switch12736:
  ; 
  %..1323 = load %.struct2** %stg
  %..1324 = bitcast %.struct2* %..1323 to %.struct2*
  %..1325 = getelementptr inbounds %.struct2* %..1324, i64 0
  %..1326 = getelementptr inbounds %.struct2* %..1325, i32 0, i32 0
  store void(%.struct2*)* @Stage_7, void(%.struct2*)** %..1326
  br label %switch127319
break1327:
  br label %switch12737
switch12737:
  ; 
  %..1328 = load %.struct2** %stg
  %..1329 = bitcast %.struct2* %..1328 to %.struct2*
  %..1330 = getelementptr inbounds %.struct2* %..1329, i64 0
  %..1331 = getelementptr inbounds %.struct2* %..1330, i32 0, i32 0
  store void(%.struct2*)* @Stage_8, void(%.struct2*)** %..1331
  br label %switch127319
break1332:
  br label %switch12738
switch12738:
  ; 
  %..1333 = load %.struct2** %stg
  %..1334 = bitcast %.struct2* %..1333 to %.struct2*
  %..1335 = getelementptr inbounds %.struct2* %..1334, i64 0
  %..1336 = getelementptr inbounds %.struct2* %..1335, i32 0, i32 0
  store void(%.struct2*)* @Stage_9, void(%.struct2*)** %..1336
  br label %switch127319
break1337:
  br label %switch12739
switch12739:
  ; 
  %..1338 = load %.struct2** %stg
  %..1339 = bitcast %.struct2* %..1338 to %.struct2*
  %..1340 = getelementptr inbounds %.struct2* %..1339, i64 0
  %..1341 = getelementptr inbounds %.struct2* %..1340, i32 0, i32 0
  store void(%.struct2*)* @Stage_10, void(%.struct2*)** %..1341
  br label %switch127319
break1342:
  br label %switch127310
switch127310:
  ; 
  %..1343 = load %.struct2** %stg
  %..1344 = bitcast %.struct2* %..1343 to %.struct2*
  %..1345 = getelementptr inbounds %.struct2* %..1344, i64 0
  %..1346 = getelementptr inbounds %.struct2* %..1345, i32 0, i32 0
  store void(%.struct2*)* @Stage_11, void(%.struct2*)** %..1346
  br label %switch127319
break1347:
  br label %switch127311
switch127311:
  ; 
  %..1348 = load %.struct2** %stg
  %..1349 = bitcast %.struct2* %..1348 to %.struct2*
  %..1350 = getelementptr inbounds %.struct2* %..1349, i64 0
  %..1351 = getelementptr inbounds %.struct2* %..1350, i32 0, i32 0
  store void(%.struct2*)* @Stage_12, void(%.struct2*)** %..1351
  br label %switch127319
break1352:
  br label %switch127312
switch127312:
  ; 
  %..1353 = load %.struct2** %stg
  %..1354 = bitcast %.struct2* %..1353 to %.struct2*
  %..1355 = getelementptr inbounds %.struct2* %..1354, i64 0
  %..1356 = getelementptr inbounds %.struct2* %..1355, i32 0, i32 0
  store void(%.struct2*)* @Stage_13, void(%.struct2*)** %..1356
  br label %switch127319
break1357:
  br label %switch127313
switch127313:
  ; 
  %..1358 = load %.struct2** %stg
  %..1359 = bitcast %.struct2* %..1358 to %.struct2*
  %..1360 = getelementptr inbounds %.struct2* %..1359, i64 0
  %..1361 = getelementptr inbounds %.struct2* %..1360, i32 0, i32 0
  store void(%.struct2*)* @Stage_14, void(%.struct2*)** %..1361
  br label %switch127319
break1362:
  br label %switch127314
switch127314:
  ; 
  %..1363 = load %.struct2** %stg
  %..1364 = bitcast %.struct2* %..1363 to %.struct2*
  %..1365 = getelementptr inbounds %.struct2* %..1364, i64 0
  %..1366 = getelementptr inbounds %.struct2* %..1365, i32 0, i32 0
  store void(%.struct2*)* @Stage_15, void(%.struct2*)** %..1366
  br label %switch127319
break1367:
  br label %switch127315
switch127315:
  ; 
  %..1368 = load %.struct2** %stg
  %..1369 = bitcast %.struct2* %..1368 to %.struct2*
  %..1370 = getelementptr inbounds %.struct2* %..1369, i64 0
  %..1371 = getelementptr inbounds %.struct2* %..1370, i32 0, i32 0
  store void(%.struct2*)* @Stage_16, void(%.struct2*)** %..1371
  br label %switch127319
break1372:
  br label %switch127316
switch127316:
  ; 
  %..1373 = load %.struct2** %stg
  %..1374 = bitcast %.struct2* %..1373 to %.struct2*
  %..1375 = getelementptr inbounds %.struct2* %..1374, i64 0
  %..1376 = getelementptr inbounds %.struct2* %..1375, i32 0, i32 0
  store void(%.struct2*)* @Stage_17, void(%.struct2*)** %..1376
  br label %switch127319
break1377:
  br label %switch127317
switch127317:
  ; 
  %..1378 = load %.struct2** %stg
  %..1379 = bitcast %.struct2* %..1378 to %.struct2*
  %..1380 = getelementptr inbounds %.struct2* %..1379, i64 0
  %..1381 = getelementptr inbounds %.struct2* %..1380, i32 0, i32 0
  store void(%.struct2*)* @Stage_18, void(%.struct2*)** %..1381
  br label %switch127319
break1382:
  br label %switch127318
switch127318:
  ; 
  %..1383 = load %.struct2** %stg
  %..1384 = bitcast %.struct2* %..1383 to %.struct2*
  %..1385 = getelementptr inbounds %.struct2* %..1384, i64 0
  %..1386 = getelementptr inbounds %.struct2* %..1385, i32 0, i32 0
  store void(%.struct2*)* @Stage_ending, void(%.struct2*)** %..1386
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
define void @Stage_1(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1403 = load %.struct2** %stg
  %..1404 = bitcast %.struct2* %..1403 to %.struct2*
  %..1405 = getelementptr inbounds %.struct2* %..1404, i64 0
  %..1406 = getelementptr inbounds %.struct2* %..1405, i32 0, i32 1
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
define void @Stage_2(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1641 = load %.struct2** %stg
  %..1642 = bitcast %.struct2* %..1641 to %.struct2*
  %..1643 = getelementptr inbounds %.struct2* %..1642, i64 0
  %..1644 = getelementptr inbounds %.struct2* %..1643, i32 0, i32 1
  %..1645 = load i32* %..1644
  switch i32 %..1645, label %switch16460 [
  ]
switch16460:
  br label %leave1640
leave1640:
  ret void
}
define void @Stage_3(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1648 = load %.struct2** %stg
  %..1649 = bitcast %.struct2* %..1648 to %.struct2*
  %..1650 = getelementptr inbounds %.struct2* %..1649, i64 0
  %..1651 = getelementptr inbounds %.struct2* %..1650, i32 0, i32 1
  %..1652 = load i32* %..1651
  switch i32 %..1652, label %switch16530 [
  ]
switch16530:
  br label %leave1647
leave1647:
  ret void
}
define void @Stage_4(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1655 = load %.struct2** %stg
  %..1656 = bitcast %.struct2* %..1655 to %.struct2*
  %..1657 = getelementptr inbounds %.struct2* %..1656, i64 0
  %..1658 = getelementptr inbounds %.struct2* %..1657, i32 0, i32 1
  %..1659 = load i32* %..1658
  switch i32 %..1659, label %switch16600 [
  ]
switch16600:
  br label %leave1654
leave1654:
  ret void
}
define void @Stage_5(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1662 = load %.struct2** %stg
  %..1663 = bitcast %.struct2* %..1662 to %.struct2*
  %..1664 = getelementptr inbounds %.struct2* %..1663, i64 0
  %..1665 = getelementptr inbounds %.struct2* %..1664, i32 0, i32 1
  %..1666 = load i32* %..1665
  switch i32 %..1666, label %switch16670 [
  ]
switch16670:
  br label %leave1661
leave1661:
  ret void
}
define void @Stage_6(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1669 = load %.struct2** %stg
  %..1670 = bitcast %.struct2* %..1669 to %.struct2*
  %..1671 = getelementptr inbounds %.struct2* %..1670, i64 0
  %..1672 = getelementptr inbounds %.struct2* %..1671, i32 0, i32 1
  %..1673 = load i32* %..1672
  switch i32 %..1673, label %switch16740 [
  ]
switch16740:
  br label %leave1668
leave1668:
  ret void
}
define void @Stage_7(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1676 = load %.struct2** %stg
  %..1677 = bitcast %.struct2* %..1676 to %.struct2*
  %..1678 = getelementptr inbounds %.struct2* %..1677, i64 0
  %..1679 = getelementptr inbounds %.struct2* %..1678, i32 0, i32 1
  %..1680 = load i32* %..1679
  switch i32 %..1680, label %switch16810 [
  ]
switch16810:
  br label %leave1675
leave1675:
  ret void
}
define void @Stage_8(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1683 = load %.struct2** %stg
  %..1684 = bitcast %.struct2* %..1683 to %.struct2*
  %..1685 = getelementptr inbounds %.struct2* %..1684, i64 0
  %..1686 = getelementptr inbounds %.struct2* %..1685, i32 0, i32 1
  %..1687 = load i32* %..1686
  switch i32 %..1687, label %switch16880 [
  ]
switch16880:
  br label %leave1682
leave1682:
  ret void
}
define void @Stage_9(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1690 = load %.struct2** %stg
  %..1691 = bitcast %.struct2* %..1690 to %.struct2*
  %..1692 = getelementptr inbounds %.struct2* %..1691, i64 0
  %..1693 = getelementptr inbounds %.struct2* %..1692, i32 0, i32 1
  %..1694 = load i32* %..1693
  switch i32 %..1694, label %switch16950 [
  ]
switch16950:
  br label %leave1689
leave1689:
  ret void
}
define void @Stage_10(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1697 = load %.struct2** %stg
  %..1698 = bitcast %.struct2* %..1697 to %.struct2*
  %..1699 = getelementptr inbounds %.struct2* %..1698, i64 0
  %..1700 = getelementptr inbounds %.struct2* %..1699, i32 0, i32 1
  %..1701 = load i32* %..1700
  switch i32 %..1701, label %switch17020 [
  ]
switch17020:
  br label %leave1696
leave1696:
  ret void
}
define void @Stage_11(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1704 = load %.struct2** %stg
  %..1705 = bitcast %.struct2* %..1704 to %.struct2*
  %..1706 = getelementptr inbounds %.struct2* %..1705, i64 0
  %..1707 = getelementptr inbounds %.struct2* %..1706, i32 0, i32 1
  %..1708 = load i32* %..1707
  switch i32 %..1708, label %switch17090 [
  ]
switch17090:
  br label %leave1703
leave1703:
  ret void
}
define void @Stage_12(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1711 = load %.struct2** %stg
  %..1712 = bitcast %.struct2* %..1711 to %.struct2*
  %..1713 = getelementptr inbounds %.struct2* %..1712, i64 0
  %..1714 = getelementptr inbounds %.struct2* %..1713, i32 0, i32 1
  %..1715 = load i32* %..1714
  switch i32 %..1715, label %switch17160 [
  ]
switch17160:
  br label %leave1710
leave1710:
  ret void
}
define void @Stage_13(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1718 = load %.struct2** %stg
  %..1719 = bitcast %.struct2* %..1718 to %.struct2*
  %..1720 = getelementptr inbounds %.struct2* %..1719, i64 0
  %..1721 = getelementptr inbounds %.struct2* %..1720, i32 0, i32 1
  %..1722 = load i32* %..1721
  switch i32 %..1722, label %switch17230 [
  ]
switch17230:
  br label %leave1717
leave1717:
  ret void
}
define void @Stage_14(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1725 = load %.struct2** %stg
  %..1726 = bitcast %.struct2* %..1725 to %.struct2*
  %..1727 = getelementptr inbounds %.struct2* %..1726, i64 0
  %..1728 = getelementptr inbounds %.struct2* %..1727, i32 0, i32 1
  %..1729 = load i32* %..1728
  switch i32 %..1729, label %switch17300 [
  ]
switch17300:
  br label %leave1724
leave1724:
  ret void
}
define void @Stage_15(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1732 = load %.struct2** %stg
  %..1733 = bitcast %.struct2* %..1732 to %.struct2*
  %..1734 = getelementptr inbounds %.struct2* %..1733, i64 0
  %..1735 = getelementptr inbounds %.struct2* %..1734, i32 0, i32 1
  %..1736 = load i32* %..1735
  switch i32 %..1736, label %switch17370 [
  ]
switch17370:
  br label %leave1731
leave1731:
  ret void
}
define void @Stage_16(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1739 = load %.struct2** %stg
  %..1740 = bitcast %.struct2* %..1739 to %.struct2*
  %..1741 = getelementptr inbounds %.struct2* %..1740, i64 0
  %..1742 = getelementptr inbounds %.struct2* %..1741, i32 0, i32 1
  %..1743 = load i32* %..1742
  switch i32 %..1743, label %switch17440 [
  ]
switch17440:
  br label %leave1738
leave1738:
  ret void
}
define void @Stage_17(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1746 = load %.struct2** %stg
  %..1747 = bitcast %.struct2* %..1746 to %.struct2*
  %..1748 = getelementptr inbounds %.struct2* %..1747, i64 0
  %..1749 = getelementptr inbounds %.struct2* %..1748, i32 0, i32 1
  %..1750 = load i32* %..1749
  switch i32 %..1750, label %switch17510 [
  ]
switch17510:
  br label %leave1745
leave1745:
  ret void
}
define void @Stage_18(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1753 = load %.struct2** %stg
  %..1754 = bitcast %.struct2* %..1753 to %.struct2*
  %..1755 = getelementptr inbounds %.struct2* %..1754, i64 0
  %..1756 = getelementptr inbounds %.struct2* %..1755, i32 0, i32 1
  %..1757 = load i32* %..1756
  switch i32 %..1757, label %switch17580 [
  ]
switch17580:
  br label %leave1752
leave1752:
  ret void
}
define void @Stage_ending(%.struct2* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct2*
  store %.struct2* %stg.v, %.struct2** %stg
  %..1760 = load %.struct2** %stg
  %..1761 = bitcast %.struct2* %..1760 to %.struct2*
  %..1762 = getelementptr inbounds %.struct2* %..1761, i64 0
  %..1763 = getelementptr inbounds %.struct2* %..1762, i32 0, i32 1
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
@Ship = external global %.struct1116
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
@Stage = external global %.struct2
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
@Key = external global %.struct1054
