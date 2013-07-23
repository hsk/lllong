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
  %reg_1790 = icmp ne i64 %..20, 0
  br i1 %reg_1790, label %ok15, label %else16
ok15:
  %..23 = bitcast [14 x i8]* @.str1791 to i8*
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
  br label %leave5
leave5:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..1792 = load i32* %..retVal
  ret i32 %..1792
}
@.str1791= private constant [14 x i8] c"640x480:32@60\00"
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
  %..73 = bitcast [4 x float]* %col to float*
  call void @glMaterialfv(i32 1032, i32 4609, float* %..73) nounwind ssp
  br label %leave49
leave49:
  ret void
}
define void @main_loop(i32 %a.v) nounwind ssp {
entry:
  %a = alloca i32
  store i32 %a.v, i32* %a
  %..75 = getelementptr inbounds %.struct1* @game, i32 0, i32 4
  %..1793 = load void(%.struct1*)** %..75
  call void %..1793(%.struct1* @game) nounwind ssp
  call void @glutPostRedisplay() nounwind ssp
  %..79 = sdiv i32 1000, 50
  call void @glutTimerFunc(i32 %..79, void(i32)* @main_loop, i32 0) nounwind ssp
  br label %leave74
leave74:
  ret void
}
define void @main_display() nounwind ssp {
entry:
  %WIDTH = alloca i32
  store i32 640, i32* %WIDTH
  %HEIGHT = alloca i32
  store i32 480, i32* %HEIGHT
  %..87 = or i32 16384, 256
  call void @glClear(i32 %..87) nounwind ssp
  call void @glViewport(i32 0, i32 0, i32 640, i32 480) nounwind ssp
  call void @glMatrixMode(i32 5889) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  %..102 = load i32* %WIDTH
  %..105 = load i32* %HEIGHT
  %..104 = sitofp i32 %..105 to double
  %..103 = fptosi double %..104 to i32
  %..101 = sdiv i32 %..102, %..103
  %..100 = sitofp i32 %..101 to double
  call void @gluPerspective(double 0x4056800000000000, double %..100, double 0x3ff0000000000000, double 0x40c3880000000000) nounwind ssp
  %n = alloca float
  store float 0x4024000000000000, float* %n
  %lightpos = alloca [4 x float]
  %..109 = bitcast [4 x float]* %lightpos to float*
  %..115 = load float* %n
  %..114 = fpext float %..115 to double
  %..112 = fmul double 0x407f400000000000, %..114
  %..111 = fptrunc double %..112 to float
  %..116 = bitcast float* %..109 to float*
  %..117 = getelementptr inbounds float* %..116, i64 0
  store float %..111, float* %..117
  %..118 = bitcast [4 x float]* %lightpos to float*
  %..124 = load float* %n
  %..123 = fpext float %..124 to double
  %..121 = fmul double 0x4089100000000000, %..123
  %..120 = fptrunc double %..121 to float
  %..125 = bitcast float* %..118 to float*
  %..126 = getelementptr inbounds float* %..125, i64 1
  store float %..120, float* %..126
  %..127 = bitcast [4 x float]* %lightpos to float*
  %..133 = load float* %n
  %..132 = fpext float %..133 to double
  %..130 = fmul double 0x407f900000000000, %..132
  %..129 = fptrunc double %..130 to float
  %..134 = bitcast float* %..127 to float*
  %..135 = getelementptr inbounds float* %..134, i64 2
  store float %..129, float* %..135
  %..136 = bitcast [4 x float]* %lightpos to float*
  %..138 = fptrunc double 0x3ff0000000000000 to float
  %..140 = bitcast float* %..136 to float*
  %..141 = getelementptr inbounds float* %..140, i64 3
  store float %..138, float* %..141
  %..146 = bitcast [4 x float]* %lightpos to float*
  %..145 = bitcast float* %..146 to float*
  call void @glLightfv(i32 16384, i32 4611, float* %..145) nounwind ssp
  call void @glMatrixMode(i32 5888) nounwind ssp
  call void @glLoadIdentity() nounwind ssp
  call void @glBlendFunc(i32 770, i32 1) nounwind ssp
  call void @gluLookAt(double 0x0, double 0x0, double 0x4074000000000000, double 0x0, double 0x0, double 0x0, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..163 = getelementptr inbounds %.struct1* @game, i32 0, i32 5
  %..1794 = load void()** %..163
  call void %..1794() nounwind ssp
  call void @glFlush() nounwind ssp
  br label %leave83
leave83:
  ret void
}
@game= common global %.struct1 zeroinitializer
define void @Game_new(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..167 = load %.struct1** %game
  %..168 = bitcast %.struct1* %..167 to %.struct1*
  %..169 = getelementptr inbounds %.struct1* %..168, i64 0
  %..170 = trunc i64 0 to i32
  %..172 = getelementptr inbounds %.struct1* %..169, i32 0, i32 6
  store i32 %..170, i32* %..172
  %..173 = load %.struct1** %game
  %..174 = bitcast %.struct1* %..173 to %.struct1*
  %..175 = getelementptr inbounds %.struct1* %..174, i64 0
  %..176 = trunc i64 3 to i32
  %..178 = getelementptr inbounds %.struct1* %..175, i32 0, i32 1
  store i32 %..176, i32* %..178
  %..179 = load %.struct1** %game
  %..180 = bitcast %.struct1* %..179 to %.struct1*
  %..181 = getelementptr inbounds %.struct1* %..180, i64 0
  %..182 = trunc i64 1 to i32
  %..184 = getelementptr inbounds %.struct1* %..181, i32 0, i32 0
  store i32 %..182, i32* %..184
  %..185 = load %.struct1** %game
  %..186 = bitcast %.struct1* %..185 to %.struct1*
  %..187 = getelementptr inbounds %.struct1* %..186, i64 0
  %..188 = trunc i64 0 to i32
  %..190 = getelementptr inbounds %.struct1* %..187, i32 0, i32 3
  store i32 %..188, i32* %..190
  %..191 = load %.struct1** %game
  %..192 = bitcast %.struct1* %..191 to %.struct1*
  %..193 = getelementptr inbounds %.struct1* %..192, i64 0
  %..194 = getelementptr inbounds %.struct1* %..193, i32 0, i32 4
  store void(%.struct1*)* @Game_title, void(%.struct1*)** %..194
  %..195 = load %.struct1** %game
  %..196 = bitcast %.struct1* %..195 to %.struct1*
  %..197 = getelementptr inbounds %.struct1* %..196, i64 0
  %..198 = getelementptr inbounds %.struct1* %..197, i32 0, i32 5
  store void()* @Game_title_draw, void()** %..198
  br label %leave166
leave166:
  ret void
}
define void @Game_title(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..200 = load %.struct1** %game
  %..201 = bitcast %.struct1* %..200 to %.struct1*
  %..202 = getelementptr inbounds %.struct1* %..201, i64 0
  %..206 = load %.struct1** %game
  %..207 = bitcast %.struct1* %..206 to %.struct1*
  %..208 = getelementptr inbounds %.struct1* %..207, i64 0
  %..209 = getelementptr inbounds %.struct1* %..208, i32 0, i32 3
  %..210 = load i32* %..209
  %..205 = zext i32 %..210 to i64
  %..204 = add i64 %..205, 1
  %..203 = trunc i64 %..204 to i32
  %..212 = getelementptr inbounds %.struct1* %..202, i32 0, i32 3
  store i32 %..203, i32* %..212
  %..219 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  %..220 = load i32* %..219
  %..218 = zext i32 %..220 to i64
  %reg_1795 = icmp ne i64 %..218, 0
  br i1 %reg_1795, label %ok213, label %else214
ok213:
  %..221 = load %.struct1** %game
  %..222 = bitcast %.struct1* %..221 to %.struct1*
  %..223 = getelementptr inbounds %.struct1* %..222, i64 0
  %..224 = trunc i64 0 to i32
  %..226 = getelementptr inbounds %.struct1* %..223, i32 0, i32 3
  store i32 %..224, i32* %..226
  %..227 = load %.struct1** %game
  %..228 = bitcast %.struct1* %..227 to %.struct1*
  %..229 = getelementptr inbounds %.struct1* %..228, i64 0
  %..230 = getelementptr inbounds %.struct1* %..229, i32 0, i32 4
  store void(%.struct1*)* @Game_title_end, void(%.struct1*)** %..230
  br label %else215
else215:
  br label %endif216
else214:
  ; void
  br label %endif217
endif217:
  br label %endif216
endif216:
  br label %leave199
leave199:
  ret void
}
define void @Game_title_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..234 = fsub double 0.0, 0x4056800000000000
  call void @glRotated(double %..234, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
  %..241 = getelementptr inbounds %.struct1* @game, i32 0, i32 3
  %..242 = load i32* %..241
  %..240 = sitofp i32 %..242 to double
  call void @glRotated(double %..240, double 0x0, double 0x3ff0000000000000, double 0x0) nounwind ssp
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
  %..303 = fsub double 0.0, 0x0
  %..305 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..303, double %..305) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x403f283126e978d5, double 0x4072eab020c49ba6) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..333 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..333, double 0x40475e24dd2f1aa0) nounwind ssp
  %..338 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..338, double 0x4069df16872b020c) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x4040b0f5c28f5c29, double 0x406997df3b645a1d) nounwind ssp
  call void @glVertex3d(double 0x0, double 0x40613f645a1cac08, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..367 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..367, double 0x40475e24dd2f1aa0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..384 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..384, double 0x40475e24dd2f1aa0) nounwind ssp
  %..389 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..389, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..394 = fsub double 0.0, 0x4042eab020c49ba6
  call void @glVertex3d(double 0x0, double %..394, double 0x4069df16872b020c) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..407 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..407, double 0x0) nounwind ssp
  %..412 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..412, double 0x40687b020c49ba5e) nounwind ssp
  %..417 = fsub double 0.0, 0x405bd1999999999a
  call void @glVertex3d(double 0x0, double %..417, double 0x407ad85810624dd3) nounwind ssp
  %..422 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..422, double 0x407b1f8f5c28f5c3) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..436 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..436) nounwind ssp
  %..440 = fsub double 0.0, 0x4044078d4fdf3b64
  call void @glVertex3d(double 0x0, double %..440, double 0x407b1f8f5c28f5c3) nounwind ssp
  %..445 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..445, double 0x40475e24dd2f1aa0) nounwind ssp
  %..450 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..450, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..467 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..467, double 0x40475e24dd2f1aa0) nounwind ssp
  %..472 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..472, double 0x4068c2395810624e) nounwind ssp
  %..477 = fsub double 0.0, 0x405cee76c8b43958
  call void @glVertex3d(double 0x0, double %..477, double 0x40687b020c49ba5e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..494 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..494, double 0x407a6d851eb851ec) nounwind ssp
  %..499 = fsub double 0.0, 0x40687b020c49ba5e
  call void @glVertex3d(double 0x0, double %..499, double 0x407a6d851eb851ec) nounwind ssp
  %..504 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..504, double 0x4068c2395810624e) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..518 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..518) nounwind ssp
  %..522 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..522, double 0x4068c2395810624e) nounwind ssp
  %..527 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..527, double 0x404ab4bc6a7ef9db) nounwind ssp
  %..532 = fsub double 0.0, 0x4072150a3d70a3d7
  call void @glVertex3d(double 0x0, double %..532, double 0x407a6d851eb851ec) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..549 = fsub double 0.0, 0x406833cac083126f
  call void @glVertex3d(double 0x0, double %..549, double 0x4068c2395810624e) nounwind ssp
  %..554 = fsub double 0.0, 0x40564147ae147ae1
  call void @glVertex3d(double 0x0, double %..554, double 0x40475e24dd2f1aa0) nounwind ssp
  %..559 = fsub double 0.0, 0x40713f645a1cac08
  call void @glVertex3d(double 0x0, double %..559, double 0x404ab4bc6a7ef9db) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..577 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..577) nounwind ssp
  %..581 = fsub double 0.0, 0x4070d4916872b021
  %..583 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..581, double %..583) nounwind ssp
  %..588 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..588) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..600 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..600, double 0x0) nounwind ssp
  %..606 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..606) nounwind ssp
  %..611 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..611) nounwind ssp
  %..616 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..616) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..633 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..633) nounwind ssp
  %..638 = fsub double 0.0, 0x404f283126e978d5
  call void @glVertex3d(double 0x0, double 0x4060f82d0e560419, double %..638) nounwind ssp
  %..643 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..643) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..656 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..656) nounwind ssp
  %..661 = fsub double 0.0, 0x4076ac1a9fbe76c9
  call void @glVertex3d(double 0x0, double 0x406331e76c8b4396, double %..661) nounwind ssp
  %..666 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..666) nounwind ssp
  %..671 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..671) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..683 = fsub double 0.0, 0x0
  %..685 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double %..683, double %..685) nounwind ssp
  %..690 = fsub double 0.0, 0x4067a55c28f5c28f
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..690) nounwind ssp
  %..694 = fsub double 0.0, 0x406331e76c8b4396
  %..696 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..694, double %..696) nounwind ssp
  %..700 = fsub double 0.0, 0x4070d4916872b021
  %..702 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..700, double %..702) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..715 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..715) nounwind ssp
  %..719 = fsub double 0.0, 0x406331e76c8b4396
  %..721 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..719, double %..721) nounwind ssp
  %..725 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..727 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..725, double %..727) nounwind ssp
  %..731 = fsub double 0.0, 0x4070d4916872b021
  %..733 = fsub double 0.0, 0x40487b020c49ba5e
  call void @glVertex3d(double 0x0, double %..731, double %..733) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..749 = fsub double 0.0, 0x406331e76c8b4396
  %..751 = fsub double 0.0, 0x4066cfb645a1cac1
  call void @glVertex3d(double 0x0, double %..749, double %..751) nounwind ssp
  %..755 = fsub double 0.0, 0x4062150a3d70a3d7
  %..757 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..755, double %..757) nounwind ssp
  %..761 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..763 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..761, double %..763) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..779 = fsub double 0.0, 0x4062150a3d70a3d7
  %..781 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..779, double %..781) nounwind ssp
  %..785 = fsub double 0.0, 0x40613f645a1cac08
  %..787 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..785, double %..787) nounwind ssp
  %..791 = fsub double 0.0, 0x406ee0f9db22d0e5
  %..793 = fsub double 0.0, 0x4074dd3333333333
  call void @glVertex3d(double 0x0, double %..791, double %..793) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..809 = fsub double 0.0, 0x4062150a3d70a3d7
  %..811 = fsub double 0.0, 0x4072eab020c49ba6
  call void @glVertex3d(double 0x0, double %..809, double %..811) nounwind ssp
  %..815 = fsub double 0.0, 0x4045246a7ef9db23
  %..817 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..815, double %..817) nounwind ssp
  %..821 = fsub double 0.0, 0x40613f645a1cac08
  %..823 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..821, double %..823) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..839 = fsub double 0.0, 0x4045246a7ef9db23
  %..841 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..839, double %..841) nounwind ssp
  %..846 = fsub double 0.0, 0x4073791eb851eb85
  call void @glVertex3d(double 0x0, double 0x4045246a7ef9db23, double %..846) nounwind ssp
  %..851 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..851) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  %..864 = fsub double 0.0, 0x0
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double %..864) nounwind ssp
  %..869 = fsub double 0.0, 0x407c18d0e5604189
  call void @glVertex3d(double 0x0, double 0x40475e24dd2f1aa0, double %..869) nounwind ssp
  %..873 = fsub double 0.0, 0x4044078d4fdf3b64
  %..875 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..873, double %..875) nounwind ssp
  %..879 = fsub double 0.0, 0x4045246a7ef9db23
  %..881 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..879, double %..881) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x3ff0000000000000, double 0x0, double 0x0) nounwind ssp
  %..897 = fsub double 0.0, 0x4045246a7ef9db23
  %..899 = fsub double 0.0, 0x407664e353f7ced9
  call void @glVertex3d(double 0x0, double %..897, double %..899) nounwind ssp
  %..903 = fsub double 0.0, 0x4044078d4fdf3b64
  %..905 = fsub double 0.0, 0x407da0810624dd2f
  call void @glVertex3d(double 0x0, double %..903, double %..905) nounwind ssp
  %..909 = fsub double 0.0, 0x40613f645a1cac08
  %..911 = fsub double 0.0, 0x407badfdf3b645a2
  call void @glVertex3d(double 0x0, double %..909, double %..911) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave231
leave231:
  ret void
}
define void @Game_title_end(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..916 = load %.struct1** %game
  %..917 = bitcast %.struct1* %..916 to %.struct1*
  %..918 = getelementptr inbounds %.struct1* %..917, i64 0
  %..922 = load %.struct1** %game
  %..923 = bitcast %.struct1* %..922 to %.struct1*
  %..924 = getelementptr inbounds %.struct1* %..923, i64 0
  %..925 = getelementptr inbounds %.struct1* %..924, i32 0, i32 3
  %..926 = load i32* %..925
  %..921 = zext i32 %..926 to i64
  %..920 = add i64 %..921, 1
  %..919 = trunc i64 %..920 to i32
  %..928 = getelementptr inbounds %.struct1* %..918, i32 0, i32 3
  store i32 %..919, i32* %..928
  %..937 = load %.struct1** %game
  %..938 = bitcast %.struct1* %..937 to %.struct1*
  %..939 = getelementptr inbounds %.struct1* %..938, i64 0
  %..940 = getelementptr inbounds %.struct1* %..939, i32 0, i32 3
  %..941 = load i32* %..940
  %..936 = zext i32 %..941 to i64
  %..1796 = icmp sgt i64 %..936, 60
  %..935 = zext i1 %..1796 to i64
  %..934 = bitcast i64 %..935 to i64
  %reg_1797 = icmp ne i64 %..934, 0
  br i1 %reg_1797, label %ok929, label %else930
ok929:
  %..943 = load %.struct1** %game
  %..944 = bitcast %.struct1* %..943 to %.struct1*
  %..945 = getelementptr inbounds %.struct1* %..944, i64 0
  %..946 = getelementptr inbounds %.struct1* %..945, i32 0, i32 4
  store void(%.struct1*)* @Game_init, void(%.struct1*)** %..946
  br label %else931
else931:
  br label %endif932
else930:
  ; void
  br label %endif933
endif933:
  br label %endif932
endif932:
  br label %leave915
leave915:
  ret void
}
define void @Game_demo(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave947
leave947:
  ret void
}
define void @Game_ranking(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave948
leave948:
  ret void
}
define void @Game_init(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..950 = load %.struct1** %game
  %..951 = bitcast %.struct1* %..950 to %.struct1*
  %..952 = getelementptr inbounds %.struct1* %..951, i64 0
  %..953 = trunc i64 0 to i32
  %..955 = getelementptr inbounds %.struct1* %..952, i32 0, i32 6
  store i32 %..953, i32* %..955
  %..956 = load %.struct1** %game
  %..957 = bitcast %.struct1* %..956 to %.struct1*
  %..958 = getelementptr inbounds %.struct1* %..957, i64 0
  %..959 = trunc i64 3 to i32
  %..961 = getelementptr inbounds %.struct1* %..958, i32 0, i32 1
  store i32 %..959, i32* %..961
  %..962 = load %.struct1** %game
  %..963 = bitcast %.struct1* %..962 to %.struct1*
  %..964 = getelementptr inbounds %.struct1* %..963, i64 0
  %..965 = trunc i64 1 to i32
  %..967 = getelementptr inbounds %.struct1* %..964, i32 0, i32 0
  store i32 %..965, i32* %..967
  %..968 = load %.struct1** %game
  %..969 = bitcast %.struct1* %..968 to %.struct1*
  %..970 = getelementptr inbounds %.struct1* %..969, i64 0
  %..971 = trunc i64 0 to i32
  %..973 = getelementptr inbounds %.struct1* %..970, i32 0, i32 3
  store i32 %..971, i32* %..973
  %..974 = load %.struct1** %game
  %..975 = bitcast %.struct1* %..974 to %.struct1*
  %..976 = getelementptr inbounds %.struct1* %..975, i64 0
  %..977 = getelementptr inbounds %.struct1* %..976, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..977
  %..978 = load %.struct1** %game
  %..979 = bitcast %.struct1* %..978 to %.struct1*
  %..980 = getelementptr inbounds %.struct1* %..979, i64 0
  %..981 = getelementptr inbounds %.struct1* %..980, i32 0, i32 5
  store void()* @Game_game_draw, void()** %..981
  %..982 = load %.struct1** %game
  %..983 = load %.struct1** %game
  %..984 = bitcast %.struct1* %..983 to %.struct1*
  %..985 = getelementptr inbounds %.struct1* %..984, i64 0
  %..986 = getelementptr inbounds %.struct1* %..985, i32 0, i32 4
  %..1798 = load void(%.struct1*)** %..986
  call void %..1798(%.struct1* %..982) nounwind ssp
  br label %leave949
leave949:
  ret void
}
define void @Game_stageStart(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..997 = load %.struct1** %game
  %..998 = bitcast %.struct1* %..997 to %.struct1*
  %..999 = getelementptr inbounds %.struct1* %..998, i64 0
  %..1000 = getelementptr inbounds %.struct1* %..999, i32 0, i32 3
  %..1001 = load i32* %..1000
  %..996 = zext i32 %..1001 to i64
  %..1799 = icmp sgt i64 %..996, 240
  %..995 = zext i1 %..1799 to i64
  %..994 = bitcast i64 %..995 to i64
  %reg_1800 = icmp ne i64 %..994, 0
  br i1 %reg_1800, label %ok989, label %else990
ok989:
  %..1005 = load %.struct1** %game
  %..1006 = bitcast %.struct1* %..1005 to %.struct1*
  %..1007 = getelementptr inbounds %.struct1* %..1006, i64 0
  %..1008 = getelementptr inbounds %.struct1* %..1007, i32 0, i32 4
  store void(%.struct1*)* @Game_game, void(%.struct1*)** %..1008
  br label %else991
else991:
  br label %endif992
else990:
  ; void
  br label %endif993
endif993:
  br label %endif992
endif992:
  %..1010 = load %.struct1** %game
  call void @Game_game(%.struct1* %..1010) nounwind ssp
  br label %leave988
leave988:
  ret void
}
define void @Game_game(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1021 = load %.struct1** %game
  %..1022 = bitcast %.struct1* %..1021 to %.struct1*
  %..1023 = getelementptr inbounds %.struct1* %..1022, i64 0
  %..1024 = getelementptr inbounds %.struct1* %..1023, i32 0, i32 3
  %..1025 = load i32* %..1024
  %..1020 = zext i32 %..1025 to i64
  %..1019 = srem i64 %..1020, 4
  %..1801 = icmp eq i64 %..1019, 3
  %..1018 = zext i1 %..1801 to i64
  %..1017 = bitcast i64 %..1018 to i64
  %reg_1802 = icmp ne i64 %..1017, 0
  br i1 %reg_1802, label %ok1012, label %else1013
ok1012:
  %..1028 = load %.struct1** %game
  %..1029 = bitcast %.struct1* %..1028 to %.struct1*
  %..1030 = getelementptr inbounds %.struct1* %..1029, i64 0
  %..1034 = load %.struct1** %game
  %..1035 = bitcast %.struct1* %..1034 to %.struct1*
  %..1036 = getelementptr inbounds %.struct1* %..1035, i64 0
  %..1037 = getelementptr inbounds %.struct1* %..1036, i32 0, i32 6
  %..1038 = load i32* %..1037
  %..1033 = zext i32 %..1038 to i64
  %..1032 = add i64 %..1033, 10
  %..1031 = trunc i64 %..1032 to i32
  %..1040 = getelementptr inbounds %.struct1* %..1030, i32 0, i32 6
  store i32 %..1031, i32* %..1040
  br label %else1014
else1014:
  br label %endif1015
else1013:
  ; void
  br label %endif1016
endif1016:
  br label %endif1015
endif1015:
  %..1041 = load %.struct1** %game
  %..1042 = bitcast %.struct1* %..1041 to %.struct1*
  %..1043 = getelementptr inbounds %.struct1* %..1042, i64 0
  %..1047 = load %.struct1** %game
  %..1048 = bitcast %.struct1* %..1047 to %.struct1*
  %..1049 = getelementptr inbounds %.struct1* %..1048, i64 0
  %..1050 = getelementptr inbounds %.struct1* %..1049, i32 0, i32 3
  %..1051 = load i32* %..1050
  %..1046 = zext i32 %..1051 to i64
  %..1045 = add i64 %..1046, 1
  %..1044 = trunc i64 %..1045 to i32
  %..1053 = getelementptr inbounds %.struct1* %..1043, i32 0, i32 3
  store i32 %..1044, i32* %..1053
  call void @Ship_move() nounwind ssp
  br label %leave1011
leave1011:
  ret void
}
define void @Game_game_draw() nounwind ssp {
entry:
  call void @Ship_draw() nounwind ssp
  br label %leave1055
leave1055:
  ret void
}
define void @Game_damage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1057
leave1057:
  ret void
}
define void @Game_boss(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1058
leave1058:
  ret void
}
define void @Game_nextStage(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  %..1060 = load %.struct1** %game
  %..1061 = bitcast %.struct1* %..1060 to %.struct1*
  %..1062 = getelementptr inbounds %.struct1* %..1061, i64 0
  %..1066 = load %.struct1** %game
  %..1067 = bitcast %.struct1* %..1066 to %.struct1*
  %..1068 = getelementptr inbounds %.struct1* %..1067, i64 0
  %..1069 = getelementptr inbounds %.struct1* %..1068, i32 0, i32 0
  %..1070 = load i32* %..1069
  %..1065 = zext i32 %..1070 to i64
  %..1064 = add i64 %..1065, 1
  %..1063 = trunc i64 %..1064 to i32
  %..1072 = getelementptr inbounds %.struct1* %..1062, i32 0, i32 0
  store i32 %..1063, i32* %..1072
  %..1073 = load %.struct1** %game
  %..1074 = bitcast %.struct1* %..1073 to %.struct1*
  %..1075 = getelementptr inbounds %.struct1* %..1074, i64 0
  %..1076 = getelementptr inbounds %.struct1* %..1075, i32 0, i32 4
  store void(%.struct1*)* @Game_stageStart, void(%.struct1*)** %..1076
  br label %leave1059
leave1059:
  ret void
}
define void @Game_continue(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1077
leave1077:
  ret void
}
define void @Game_nameEntry(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1078
leave1078:
  ret void
}
define void @Game_ending(%.struct1* %game.v) nounwind ssp {
entry:
  %game = alloca %.struct1*
  store %.struct1* %game.v, %.struct1** %game
  ; void
  br label %leave1079
leave1079:
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
  %..1081 = load i8* %k
  switch i8 %..1081, label %switch10825 [
    i8 101, label %switch10820
    i8 103, label %switch10821
    i8 100, label %switch10822
    i8 102, label %switch10823
    i8 32, label %switch10824
  ]
switch10820:
  ; 
  %..1088 = trunc i64 1 to i32
  %..1090 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1088, i32* %..1090
  br label %switch10825
break1091:
  br label %switch10821
switch10821:
  ; 
  %..1092 = trunc i64 1 to i32
  %..1094 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1092, i32* %..1094
  br label %switch10825
break1095:
  br label %switch10822
switch10822:
  ; 
  %..1096 = trunc i64 1 to i32
  %..1098 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1096, i32* %..1098
  br label %switch10825
break1099:
  br label %switch10823
switch10823:
  ; 
  %..1100 = trunc i64 1 to i32
  %..1102 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1100, i32* %..1102
  br label %switch10825
break1103:
  br label %switch10824
switch10824:
  ; 
  %..1104 = trunc i64 1 to i32
  %..1106 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1104, i32* %..1106
  br label %switch10825
break1107:
  br label %switch10825
switch10825:
  br label %leave1080
leave1080:
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
  %..1109 = load i8* %k
  switch i8 %..1109, label %switch11106 [
    i8 101, label %switch11100
    i8 103, label %switch11101
    i8 100, label %switch11102
    i8 102, label %switch11103
    i8 32, label %switch11104
    i8 27, label %switch11105
  ]
switch11100:
  ; 
  %..1117 = trunc i64 0 to i32
  %..1119 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  store i32 %..1117, i32* %..1119
  br label %switch11106
break1120:
  br label %switch11101
switch11101:
  ; 
  %..1121 = trunc i64 0 to i32
  %..1123 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  store i32 %..1121, i32* %..1123
  br label %switch11106
break1124:
  br label %switch11102
switch11102:
  ; 
  %..1125 = trunc i64 0 to i32
  %..1127 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  store i32 %..1125, i32* %..1127
  br label %switch11106
break1128:
  br label %switch11103
switch11103:
  ; 
  %..1129 = trunc i64 0 to i32
  %..1131 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  store i32 %..1129, i32* %..1131
  br label %switch11106
break1132:
  br label %switch11104
switch11104:
  ; 
  %..1133 = trunc i64 0 to i32
  %..1135 = getelementptr inbounds %.struct2* @key, i32 0, i32 4
  store i32 %..1133, i32* %..1135
  br label %switch11106
break1136:
  br label %switch11105
switch11105:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch11106
break1140:
  br label %switch11106
switch11106:
  br label %leave1108
leave1108:
  ret void
}
@ship= common global %.struct3 zeroinitializer
define void @Ship_move() nounwind ssp {
entry:
  %speed = alloca double
  store double 0x4024000000000000, double* %speed
  %..1149 = getelementptr inbounds %.struct2* @key, i32 0, i32 2
  %..1150 = load i32* %..1149
  %..1148 = zext i32 %..1150 to i64
  %reg_1803 = icmp ne i64 %..1148, 0
  br i1 %reg_1803, label %ok1143, label %else1144
ok1143:
  %..1152 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1153 = load double* %..1152
  %..1154 = load double* %speed
  %..1151 = fsub double %..1153, %..1154
  %..1155 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1151, double* %..1155
  br label %else1145
else1145:
  br label %endif1146
else1144:
  ; void
  br label %endif1147
endif1147:
  br label %endif1146
endif1146:
  %..1162 = getelementptr inbounds %.struct2* @key, i32 0, i32 3
  %..1163 = load i32* %..1162
  %..1161 = zext i32 %..1163 to i64
  %reg_1804 = icmp ne i64 %..1161, 0
  br i1 %reg_1804, label %ok1156, label %else1157
ok1156:
  %..1165 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1166 = load double* %..1165
  %..1167 = load double* %speed
  %..1164 = fadd double %..1166, %..1167
  %..1168 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1164, double* %..1168
  br label %else1158
else1158:
  br label %endif1159
else1157:
  ; void
  br label %endif1160
endif1160:
  br label %endif1159
endif1159:
  %..1175 = getelementptr inbounds %.struct2* @key, i32 0, i32 0
  %..1176 = load i32* %..1175
  %..1174 = zext i32 %..1176 to i64
  %reg_1805 = icmp ne i64 %..1174, 0
  br i1 %reg_1805, label %ok1169, label %else1170
ok1169:
  %..1178 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1179 = load double* %..1178
  %..1180 = load double* %speed
  %..1177 = fadd double %..1179, %..1180
  %..1181 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1177, double* %..1181
  br label %else1171
else1171:
  br label %endif1172
else1170:
  ; void
  br label %endif1173
endif1173:
  br label %endif1172
endif1172:
  %..1188 = getelementptr inbounds %.struct2* @key, i32 0, i32 1
  %..1189 = load i32* %..1188
  %..1187 = zext i32 %..1189 to i64
  %reg_1806 = icmp ne i64 %..1187, 0
  br i1 %reg_1806, label %ok1182, label %else1183
ok1182:
  %..1191 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1192 = load double* %..1191
  %..1193 = load double* %speed
  %..1190 = fsub double %..1192, %..1193
  %..1194 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1190, double* %..1194
  br label %else1184
else1184:
  br label %endif1185
else1183:
  ; void
  br label %endif1186
endif1186:
  br label %endif1185
endif1185:
  %b = alloca double
  store double 0x4072c00000000000, double* %b
  %c = alloca double
  store double 0x406e000000000000, double* %c
  %..1204 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1205 = load double* %..1204
  %..1206 = sitofp i64 300 to double
  %..1807 = fcmp ogt double %..1205, %..1206
  %..1203 = zext i1 %..1807 to i64
  %..1202 = bitcast i64 %..1203 to i64
  %reg_1808 = icmp ne i64 %..1202, 0
  br i1 %reg_1808, label %ok1197, label %else1198
ok1197:
  %..1209 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double 0x4072c00000000000, double* %..1209
  br label %else1199
else1199:
  br label %endif1200
else1198:
  ; void
  br label %endif1201
endif1201:
  br label %endif1200
endif1200:
  %..1217 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1218 = load double* %..1217
  %..1219 = sitofp i64 -300 to double
  %..1809 = fcmp olt double %..1218, %..1219
  %..1216 = zext i1 %..1809 to i64
  %..1215 = bitcast i64 %..1216 to i64
  %reg_1810 = icmp ne i64 %..1215, 0
  br i1 %reg_1810, label %ok1210, label %else1211
ok1210:
  %..1221 = fsub double 0.0, 0x4072c00000000000
  %..1223 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  store double %..1221, double* %..1223
  br label %else1212
else1212:
  br label %endif1213
else1211:
  ; void
  br label %endif1214
endif1214:
  br label %endif1213
endif1213:
  %..1231 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1232 = load double* %..1231
  %..1233 = sitofp i64 240 to double
  %..1811 = fcmp ogt double %..1232, %..1233
  %..1230 = zext i1 %..1811 to i64
  %..1229 = bitcast i64 %..1230 to i64
  %reg_1812 = icmp ne i64 %..1229, 0
  br i1 %reg_1812, label %ok1224, label %else1225
ok1224:
  %..1236 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double 0x406e000000000000, double* %..1236
  br label %else1226
else1226:
  br label %endif1227
else1225:
  ; void
  br label %endif1228
endif1228:
  br label %endif1227
endif1227:
  %..1244 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1245 = load double* %..1244
  %..1246 = fsub double 0.0, 0x406e000000000000
  %..1813 = fcmp olt double %..1245, %..1246
  %..1243 = zext i1 %..1813 to i64
  %..1242 = bitcast i64 %..1243 to i64
  %reg_1814 = icmp ne i64 %..1242, 0
  br i1 %reg_1814, label %ok1237, label %else1238
ok1237:
  %..1248 = fsub double 0.0, 0x406e000000000000
  %..1250 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  store double %..1248, double* %..1250
  br label %else1239
else1239:
  br label %endif1240
else1238:
  ; void
  br label %endif1241
endif1241:
  br label %endif1240
endif1240:
  br label %leave1141
leave1141:
  ret void
}
define void @Ship_draw() nounwind ssp {
entry:
  call void @glPushMatrix() nounwind ssp
  %..1254 = getelementptr inbounds %.struct3* @ship, i32 0, i32 0
  %..1255 = load double* %..1254
  %..1256 = getelementptr inbounds %.struct3* @ship, i32 0, i32 1
  %..1257 = load double* %..1256
  call void @glTranslated(double %..1255, double %..1257, double 0x0) nounwind ssp
  %x = alloca double
  store double 0x402e000000000000, double* %x
  %y = alloca double
  store double 0x403e000000000000, double* %y
  call void @glBegin(i32 9) nounwind ssp
  call void @color(float 0x3ff0000000000000, float 0x3fd19999a0000000, float 0x3fd19999a0000000, float 0x3ff0000000000000) nounwind ssp
  call void @glNormal3d(double 0x0, double 0x0, double 0x3ff0000000000000) nounwind ssp
  %..1274 = load double* %x
  %..1273 = fsub double 0.0, %..1274
  %..1275 = load double* %y
  call void @glVertex3d(double %..1273, double %..1275, double 0x0) nounwind ssp
  %..1278 = load double* %x
  %..1279 = load double* %y
  call void @glVertex3d(double %..1278, double %..1279, double 0x0) nounwind ssp
  %..1282 = load double* %x
  %..1284 = load double* %y
  %..1283 = fsub double 0.0, %..1284
  call void @glVertex3d(double %..1282, double %..1283, double 0x0) nounwind ssp
  %..1288 = load double* %x
  %..1287 = fsub double 0.0, %..1288
  %..1290 = load double* %y
  %..1289 = fsub double 0.0, %..1290
  call void @glVertex3d(double %..1287, double %..1289, double 0x0) nounwind ssp
  call void @glEnd() nounwind ssp
  call void @glPopMatrix() nounwind ssp
  br label %leave1251
leave1251:
  ret void
}
define void @Stage_init(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1295 = getelementptr inbounds %.struct1* @game, i32 0, i32 0
  %..1296 = load i32* %..1295
  switch i32 %..1296, label %switch129719 [
    i32 1, label %switch12970
    i32 2, label %switch12971
    i32 3, label %switch12972
    i32 4, label %switch12973
    i32 5, label %switch12974
    i32 6, label %switch12975
    i32 7, label %switch12976
    i32 8, label %switch12977
    i32 9, label %switch12978
    i32 10, label %switch12979
    i32 11, label %switch129710
    i32 12, label %switch129711
    i32 13, label %switch129712
    i32 14, label %switch129713
    i32 15, label %switch129714
    i32 16, label %switch129715
    i32 17, label %switch129716
    i32 18, label %switch129717
    i32 19, label %switch129718
  ]
switch12970:
  ; 
  %..1317 = load %.struct4** %stg
  %..1318 = bitcast %.struct4* %..1317 to %.struct4*
  %..1319 = getelementptr inbounds %.struct4* %..1318, i64 0
  %..1320 = getelementptr inbounds %.struct4* %..1319, i32 0, i32 0
  store void(%.struct4*)* @Stage_1, void(%.struct4*)** %..1320
  br label %switch129719
break1321:
  br label %switch12971
switch12971:
  ; 
  %..1322 = load %.struct4** %stg
  %..1323 = bitcast %.struct4* %..1322 to %.struct4*
  %..1324 = getelementptr inbounds %.struct4* %..1323, i64 0
  %..1325 = getelementptr inbounds %.struct4* %..1324, i32 0, i32 0
  store void(%.struct4*)* @Stage_2, void(%.struct4*)** %..1325
  br label %switch129719
break1326:
  br label %switch12972
switch12972:
  ; 
  %..1327 = load %.struct4** %stg
  %..1328 = bitcast %.struct4* %..1327 to %.struct4*
  %..1329 = getelementptr inbounds %.struct4* %..1328, i64 0
  %..1330 = getelementptr inbounds %.struct4* %..1329, i32 0, i32 0
  store void(%.struct4*)* @Stage_3, void(%.struct4*)** %..1330
  br label %switch129719
break1331:
  br label %switch12973
switch12973:
  ; 
  %..1332 = load %.struct4** %stg
  %..1333 = bitcast %.struct4* %..1332 to %.struct4*
  %..1334 = getelementptr inbounds %.struct4* %..1333, i64 0
  %..1335 = getelementptr inbounds %.struct4* %..1334, i32 0, i32 0
  store void(%.struct4*)* @Stage_4, void(%.struct4*)** %..1335
  br label %switch129719
break1336:
  br label %switch12974
switch12974:
  ; 
  %..1337 = load %.struct4** %stg
  %..1338 = bitcast %.struct4* %..1337 to %.struct4*
  %..1339 = getelementptr inbounds %.struct4* %..1338, i64 0
  %..1340 = getelementptr inbounds %.struct4* %..1339, i32 0, i32 0
  store void(%.struct4*)* @Stage_5, void(%.struct4*)** %..1340
  br label %switch129719
break1341:
  br label %switch12975
switch12975:
  ; 
  %..1342 = load %.struct4** %stg
  %..1343 = bitcast %.struct4* %..1342 to %.struct4*
  %..1344 = getelementptr inbounds %.struct4* %..1343, i64 0
  %..1345 = getelementptr inbounds %.struct4* %..1344, i32 0, i32 0
  store void(%.struct4*)* @Stage_6, void(%.struct4*)** %..1345
  br label %switch129719
break1346:
  br label %switch12976
switch12976:
  ; 
  %..1347 = load %.struct4** %stg
  %..1348 = bitcast %.struct4* %..1347 to %.struct4*
  %..1349 = getelementptr inbounds %.struct4* %..1348, i64 0
  %..1350 = getelementptr inbounds %.struct4* %..1349, i32 0, i32 0
  store void(%.struct4*)* @Stage_7, void(%.struct4*)** %..1350
  br label %switch129719
break1351:
  br label %switch12977
switch12977:
  ; 
  %..1352 = load %.struct4** %stg
  %..1353 = bitcast %.struct4* %..1352 to %.struct4*
  %..1354 = getelementptr inbounds %.struct4* %..1353, i64 0
  %..1355 = getelementptr inbounds %.struct4* %..1354, i32 0, i32 0
  store void(%.struct4*)* @Stage_8, void(%.struct4*)** %..1355
  br label %switch129719
break1356:
  br label %switch12978
switch12978:
  ; 
  %..1357 = load %.struct4** %stg
  %..1358 = bitcast %.struct4* %..1357 to %.struct4*
  %..1359 = getelementptr inbounds %.struct4* %..1358, i64 0
  %..1360 = getelementptr inbounds %.struct4* %..1359, i32 0, i32 0
  store void(%.struct4*)* @Stage_9, void(%.struct4*)** %..1360
  br label %switch129719
break1361:
  br label %switch12979
switch12979:
  ; 
  %..1362 = load %.struct4** %stg
  %..1363 = bitcast %.struct4* %..1362 to %.struct4*
  %..1364 = getelementptr inbounds %.struct4* %..1363, i64 0
  %..1365 = getelementptr inbounds %.struct4* %..1364, i32 0, i32 0
  store void(%.struct4*)* @Stage_10, void(%.struct4*)** %..1365
  br label %switch129719
break1366:
  br label %switch129710
switch129710:
  ; 
  %..1367 = load %.struct4** %stg
  %..1368 = bitcast %.struct4* %..1367 to %.struct4*
  %..1369 = getelementptr inbounds %.struct4* %..1368, i64 0
  %..1370 = getelementptr inbounds %.struct4* %..1369, i32 0, i32 0
  store void(%.struct4*)* @Stage_11, void(%.struct4*)** %..1370
  br label %switch129719
break1371:
  br label %switch129711
switch129711:
  ; 
  %..1372 = load %.struct4** %stg
  %..1373 = bitcast %.struct4* %..1372 to %.struct4*
  %..1374 = getelementptr inbounds %.struct4* %..1373, i64 0
  %..1375 = getelementptr inbounds %.struct4* %..1374, i32 0, i32 0
  store void(%.struct4*)* @Stage_12, void(%.struct4*)** %..1375
  br label %switch129719
break1376:
  br label %switch129712
switch129712:
  ; 
  %..1377 = load %.struct4** %stg
  %..1378 = bitcast %.struct4* %..1377 to %.struct4*
  %..1379 = getelementptr inbounds %.struct4* %..1378, i64 0
  %..1380 = getelementptr inbounds %.struct4* %..1379, i32 0, i32 0
  store void(%.struct4*)* @Stage_13, void(%.struct4*)** %..1380
  br label %switch129719
break1381:
  br label %switch129713
switch129713:
  ; 
  %..1382 = load %.struct4** %stg
  %..1383 = bitcast %.struct4* %..1382 to %.struct4*
  %..1384 = getelementptr inbounds %.struct4* %..1383, i64 0
  %..1385 = getelementptr inbounds %.struct4* %..1384, i32 0, i32 0
  store void(%.struct4*)* @Stage_14, void(%.struct4*)** %..1385
  br label %switch129719
break1386:
  br label %switch129714
switch129714:
  ; 
  %..1387 = load %.struct4** %stg
  %..1388 = bitcast %.struct4* %..1387 to %.struct4*
  %..1389 = getelementptr inbounds %.struct4* %..1388, i64 0
  %..1390 = getelementptr inbounds %.struct4* %..1389, i32 0, i32 0
  store void(%.struct4*)* @Stage_15, void(%.struct4*)** %..1390
  br label %switch129719
break1391:
  br label %switch129715
switch129715:
  ; 
  %..1392 = load %.struct4** %stg
  %..1393 = bitcast %.struct4* %..1392 to %.struct4*
  %..1394 = getelementptr inbounds %.struct4* %..1393, i64 0
  %..1395 = getelementptr inbounds %.struct4* %..1394, i32 0, i32 0
  store void(%.struct4*)* @Stage_16, void(%.struct4*)** %..1395
  br label %switch129719
break1396:
  br label %switch129716
switch129716:
  ; 
  %..1397 = load %.struct4** %stg
  %..1398 = bitcast %.struct4* %..1397 to %.struct4*
  %..1399 = getelementptr inbounds %.struct4* %..1398, i64 0
  %..1400 = getelementptr inbounds %.struct4* %..1399, i32 0, i32 0
  store void(%.struct4*)* @Stage_17, void(%.struct4*)** %..1400
  br label %switch129719
break1401:
  br label %switch129717
switch129717:
  ; 
  %..1402 = load %.struct4** %stg
  %..1403 = bitcast %.struct4* %..1402 to %.struct4*
  %..1404 = getelementptr inbounds %.struct4* %..1403, i64 0
  %..1405 = getelementptr inbounds %.struct4* %..1404, i32 0, i32 0
  store void(%.struct4*)* @Stage_18, void(%.struct4*)** %..1405
  br label %switch129719
break1406:
  br label %switch129718
switch129718:
  ; 
  %..1407 = load %.struct4** %stg
  %..1408 = bitcast %.struct4* %..1407 to %.struct4*
  %..1409 = getelementptr inbounds %.struct4* %..1408, i64 0
  %..1410 = getelementptr inbounds %.struct4* %..1409, i32 0, i32 0
  store void(%.struct4*)* @Stage_ending, void(%.struct4*)** %..1410
  br label %switch129719
break1411:
  br label %switch129719
switch129719:
  br label %leave1294
leave1294:
  ret void
}
define void @ptn7() nounwind ssp {
entry:
  ; void
  br label %leave1412
leave1412:
  ret void
}
define void @ptn1() nounwind ssp {
entry:
  ; void
  br label %leave1413
leave1413:
  ret void
}
define void @ptn2r() nounwind ssp {
entry:
  ; void
  br label %leave1414
leave1414:
  ret void
}
define void @ptn2c() nounwind ssp {
entry:
  ; void
  br label %leave1415
leave1415:
  ret void
}
define void @ptn2l() nounwind ssp {
entry:
  ; void
  br label %leave1416
leave1416:
  ret void
}
define void @ptn3r() nounwind ssp {
entry:
  ; void
  br label %leave1417
leave1417:
  ret void
}
define void @ptn3l() nounwind ssp {
entry:
  ; void
  br label %leave1418
leave1418:
  ret void
}
define void @tmsu() nounwind ssp {
entry:
  ; void
  br label %leave1419
leave1419:
  ret void
}
define void @tmsl() nounwind ssp {
entry:
  ; void
  br label %leave1420
leave1420:
  ret void
}
define void @tmsr() nounwind ssp {
entry:
  ; void
  br label %leave1421
leave1421:
  ret void
}
define void @boss1() nounwind ssp {
entry:
  ; void
  br label %leave1422
leave1422:
  ret void
}
define void @ptn_hatena() nounwind ssp {
entry:
  ; void
  br label %leave1423
leave1423:
  ret void
}
define void @ptn4l() nounwind ssp {
entry:
  ; void
  br label %leave1424
leave1424:
  ret void
}
define void @ptn4r() nounwind ssp {
entry:
  ; void
  br label %leave1425
leave1425:
  ret void
}
define void @Stage_1(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1427 = load %.struct4** %stg
  %..1428 = bitcast %.struct4* %..1427 to %.struct4*
  %..1429 = getelementptr inbounds %.struct4* %..1428, i64 0
  %..1430 = getelementptr inbounds %.struct4* %..1429, i32 0, i32 1
  %..1431 = load i32* %..1430
  switch i32 %..1431, label %switch143224 [
    i32 300, label %switch14320
    i32 304, label %switch14321
    i32 308, label %switch14322
    i32 312, label %switch14323
    i32 316, label %switch14324
    i32 320, label %switch14325
    i32 660, label %switch14326
    i32 665, label %switch14327
    i32 670, label %switch14328
    i32 1080, label %switch14329
    i32 1084, label %switch143210
    i32 1088, label %switch143211
    i32 1092, label %switch143212
    i32 1200, label %switch143213
    i32 1204, label %switch143214
    i32 1208, label %switch143215
    i32 1212, label %switch143216
    i32 1530, label %switch143217
    i32 2100, label %switch143218
    i32 2520, label %switch143219
    i32 2525, label %switch143220
    i32 2530, label %switch143221
    i32 2940, label %switch143222
    i32 3540, label %switch143223
  ]
switch14320:
  ; 
  call void @ptn7() nounwind ssp
  br label %switch143224
break1610:
  br label %switch14321
switch14321:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch143224
break1612:
  br label %switch14322
switch14322:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch143224
break1614:
  br label %switch14323
switch14323:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch143224
break1616:
  br label %switch14324
switch14324:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch143224
break1618:
  br label %switch14325
switch14325:
  ; 
  call void @ptn1() nounwind ssp
  br label %switch143224
break1620:
  br label %switch14326
switch14326:
  ; 
  call void @ptn2r() nounwind ssp
  br label %switch143224
break1622:
  br label %switch14327
switch14327:
  ; 
  call void @ptn2c() nounwind ssp
  br label %switch143224
break1624:
  br label %switch14328
switch14328:
  ; 
  call void @ptn2l() nounwind ssp
  br label %switch143224
break1626:
  br label %switch14329
switch14329:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch143224
break1628:
  br label %switch143210
switch143210:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch143224
break1630:
  br label %switch143211
switch143211:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch143224
break1632:
  br label %switch143212
switch143212:
  ; 
  call void @ptn3r() nounwind ssp
  br label %switch143224
break1634:
  br label %switch143213
switch143213:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch143224
break1636:
  br label %switch143214
switch143214:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch143224
break1638:
  br label %switch143215
switch143215:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch143224
break1640:
  br label %switch143216
switch143216:
  ; 
  call void @ptn3l() nounwind ssp
  br label %switch143224
break1642:
  br label %switch143217
switch143217:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch143224
break1646:
  br label %switch143218
switch143218:
  ; 
  call void @ptn_hatena() nounwind ssp
  br label %switch143224
break1648:
  br label %switch143219
switch143219:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch143224
break1651:
  br label %switch143220
switch143220:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch143224
break1654:
  br label %switch143221
switch143221:
  ; 
  call void @ptn4l() nounwind ssp
  call void @ptn4r() nounwind ssp
  br label %switch143224
break1657:
  br label %switch143222
switch143222:
  ; 
  call void @tmsu() nounwind ssp
  call void @tmsl() nounwind ssp
  call void @tmsr() nounwind ssp
  br label %switch143224
break1661:
  br label %switch143223
switch143223:
  ; 
  call void @boss1() nounwind ssp
  br label %switch143224
break1663:
  br label %switch143224
switch143224:
  br label %leave1426
leave1426:
  ret void
}
define void @Stage_2(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1665 = load %.struct4** %stg
  %..1666 = bitcast %.struct4* %..1665 to %.struct4*
  %..1667 = getelementptr inbounds %.struct4* %..1666, i64 0
  %..1668 = getelementptr inbounds %.struct4* %..1667, i32 0, i32 1
  %..1669 = load i32* %..1668
  switch i32 %..1669, label %switch16700 [
  ]
switch16700:
  br label %leave1664
leave1664:
  ret void
}
define void @Stage_3(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1672 = load %.struct4** %stg
  %..1673 = bitcast %.struct4* %..1672 to %.struct4*
  %..1674 = getelementptr inbounds %.struct4* %..1673, i64 0
  %..1675 = getelementptr inbounds %.struct4* %..1674, i32 0, i32 1
  %..1676 = load i32* %..1675
  switch i32 %..1676, label %switch16770 [
  ]
switch16770:
  br label %leave1671
leave1671:
  ret void
}
define void @Stage_4(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1679 = load %.struct4** %stg
  %..1680 = bitcast %.struct4* %..1679 to %.struct4*
  %..1681 = getelementptr inbounds %.struct4* %..1680, i64 0
  %..1682 = getelementptr inbounds %.struct4* %..1681, i32 0, i32 1
  %..1683 = load i32* %..1682
  switch i32 %..1683, label %switch16840 [
  ]
switch16840:
  br label %leave1678
leave1678:
  ret void
}
define void @Stage_5(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1686 = load %.struct4** %stg
  %..1687 = bitcast %.struct4* %..1686 to %.struct4*
  %..1688 = getelementptr inbounds %.struct4* %..1687, i64 0
  %..1689 = getelementptr inbounds %.struct4* %..1688, i32 0, i32 1
  %..1690 = load i32* %..1689
  switch i32 %..1690, label %switch16910 [
  ]
switch16910:
  br label %leave1685
leave1685:
  ret void
}
define void @Stage_6(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1693 = load %.struct4** %stg
  %..1694 = bitcast %.struct4* %..1693 to %.struct4*
  %..1695 = getelementptr inbounds %.struct4* %..1694, i64 0
  %..1696 = getelementptr inbounds %.struct4* %..1695, i32 0, i32 1
  %..1697 = load i32* %..1696
  switch i32 %..1697, label %switch16980 [
  ]
switch16980:
  br label %leave1692
leave1692:
  ret void
}
define void @Stage_7(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1700 = load %.struct4** %stg
  %..1701 = bitcast %.struct4* %..1700 to %.struct4*
  %..1702 = getelementptr inbounds %.struct4* %..1701, i64 0
  %..1703 = getelementptr inbounds %.struct4* %..1702, i32 0, i32 1
  %..1704 = load i32* %..1703
  switch i32 %..1704, label %switch17050 [
  ]
switch17050:
  br label %leave1699
leave1699:
  ret void
}
define void @Stage_8(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1707 = load %.struct4** %stg
  %..1708 = bitcast %.struct4* %..1707 to %.struct4*
  %..1709 = getelementptr inbounds %.struct4* %..1708, i64 0
  %..1710 = getelementptr inbounds %.struct4* %..1709, i32 0, i32 1
  %..1711 = load i32* %..1710
  switch i32 %..1711, label %switch17120 [
  ]
switch17120:
  br label %leave1706
leave1706:
  ret void
}
define void @Stage_9(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1714 = load %.struct4** %stg
  %..1715 = bitcast %.struct4* %..1714 to %.struct4*
  %..1716 = getelementptr inbounds %.struct4* %..1715, i64 0
  %..1717 = getelementptr inbounds %.struct4* %..1716, i32 0, i32 1
  %..1718 = load i32* %..1717
  switch i32 %..1718, label %switch17190 [
  ]
switch17190:
  br label %leave1713
leave1713:
  ret void
}
define void @Stage_10(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1721 = load %.struct4** %stg
  %..1722 = bitcast %.struct4* %..1721 to %.struct4*
  %..1723 = getelementptr inbounds %.struct4* %..1722, i64 0
  %..1724 = getelementptr inbounds %.struct4* %..1723, i32 0, i32 1
  %..1725 = load i32* %..1724
  switch i32 %..1725, label %switch17260 [
  ]
switch17260:
  br label %leave1720
leave1720:
  ret void
}
define void @Stage_11(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1728 = load %.struct4** %stg
  %..1729 = bitcast %.struct4* %..1728 to %.struct4*
  %..1730 = getelementptr inbounds %.struct4* %..1729, i64 0
  %..1731 = getelementptr inbounds %.struct4* %..1730, i32 0, i32 1
  %..1732 = load i32* %..1731
  switch i32 %..1732, label %switch17330 [
  ]
switch17330:
  br label %leave1727
leave1727:
  ret void
}
define void @Stage_12(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1735 = load %.struct4** %stg
  %..1736 = bitcast %.struct4* %..1735 to %.struct4*
  %..1737 = getelementptr inbounds %.struct4* %..1736, i64 0
  %..1738 = getelementptr inbounds %.struct4* %..1737, i32 0, i32 1
  %..1739 = load i32* %..1738
  switch i32 %..1739, label %switch17400 [
  ]
switch17400:
  br label %leave1734
leave1734:
  ret void
}
define void @Stage_13(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1742 = load %.struct4** %stg
  %..1743 = bitcast %.struct4* %..1742 to %.struct4*
  %..1744 = getelementptr inbounds %.struct4* %..1743, i64 0
  %..1745 = getelementptr inbounds %.struct4* %..1744, i32 0, i32 1
  %..1746 = load i32* %..1745
  switch i32 %..1746, label %switch17470 [
  ]
switch17470:
  br label %leave1741
leave1741:
  ret void
}
define void @Stage_14(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1749 = load %.struct4** %stg
  %..1750 = bitcast %.struct4* %..1749 to %.struct4*
  %..1751 = getelementptr inbounds %.struct4* %..1750, i64 0
  %..1752 = getelementptr inbounds %.struct4* %..1751, i32 0, i32 1
  %..1753 = load i32* %..1752
  switch i32 %..1753, label %switch17540 [
  ]
switch17540:
  br label %leave1748
leave1748:
  ret void
}
define void @Stage_15(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1756 = load %.struct4** %stg
  %..1757 = bitcast %.struct4* %..1756 to %.struct4*
  %..1758 = getelementptr inbounds %.struct4* %..1757, i64 0
  %..1759 = getelementptr inbounds %.struct4* %..1758, i32 0, i32 1
  %..1760 = load i32* %..1759
  switch i32 %..1760, label %switch17610 [
  ]
switch17610:
  br label %leave1755
leave1755:
  ret void
}
define void @Stage_16(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1763 = load %.struct4** %stg
  %..1764 = bitcast %.struct4* %..1763 to %.struct4*
  %..1765 = getelementptr inbounds %.struct4* %..1764, i64 0
  %..1766 = getelementptr inbounds %.struct4* %..1765, i32 0, i32 1
  %..1767 = load i32* %..1766
  switch i32 %..1767, label %switch17680 [
  ]
switch17680:
  br label %leave1762
leave1762:
  ret void
}
define void @Stage_17(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1770 = load %.struct4** %stg
  %..1771 = bitcast %.struct4* %..1770 to %.struct4*
  %..1772 = getelementptr inbounds %.struct4* %..1771, i64 0
  %..1773 = getelementptr inbounds %.struct4* %..1772, i32 0, i32 1
  %..1774 = load i32* %..1773
  switch i32 %..1774, label %switch17750 [
  ]
switch17750:
  br label %leave1769
leave1769:
  ret void
}
define void @Stage_18(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1777 = load %.struct4** %stg
  %..1778 = bitcast %.struct4* %..1777 to %.struct4*
  %..1779 = getelementptr inbounds %.struct4* %..1778, i64 0
  %..1780 = getelementptr inbounds %.struct4* %..1779, i32 0, i32 1
  %..1781 = load i32* %..1780
  switch i32 %..1781, label %switch17820 [
  ]
switch17820:
  br label %leave1776
leave1776:
  ret void
}
define void @Stage_ending(%.struct4* %stg.v) nounwind ssp {
entry:
  %stg = alloca %.struct4*
  store %.struct4* %stg.v, %.struct4** %stg
  %..1784 = load %.struct4** %stg
  %..1785 = bitcast %.struct4* %..1784 to %.struct4*
  %..1786 = getelementptr inbounds %.struct4* %..1785, i64 0
  %..1787 = getelementptr inbounds %.struct4* %..1786, i32 0, i32 1
  %..1788 = load i32* %..1787
  switch i32 %..1788, label %switch17890 [
  ]
switch17890:
  br label %leave1783
leave1783:
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
