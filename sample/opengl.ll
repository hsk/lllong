%.struct1 = type { i32, i32, i32, i32, void(%.struct1*)*, void()*, i32 }
%.struct2 = type { i32, i32, i32, i32, i32 }
%.struct3 = type { double, double }
%.struct4 = type { void(%.struct4*)*, i32 }
declare i32 @printf(i8*, ...) nounwind
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
  %..1792 = bitcast [4 x float]* %col to float*
  %..1794 = load float* %r
  %..1795 = bitcast float* %..1792 to float*
  %..1796 = getelementptr inbounds float* %..1795, i32 0
  store float %..1794, float* %..1796
  %..1797 = bitcast [4 x float]* %col to float*
  %..1799 = load float* %g
  %..1800 = bitcast float* %..1797 to float*
  %..1801 = getelementptr inbounds float* %..1800, i32 1
  store float %..1799, float* %..1801
  %..1802 = bitcast [4 x float]* %col to float*
  %..1804 = load float* %b
  %..1805 = bitcast float* %..1802 to float*
  %..1806 = getelementptr inbounds float* %..1805, i32 2
  store float %..1804, float* %..1806
  %..1807 = bitcast [4 x float]* %col to float*
  %..1809 = load float* %a
  %..1810 = bitcast float* %..1807 to float*
  %..1811 = getelementptr inbounds float* %..1810, i32 3
  store float %..1809, float* %..1811
  %..1813 = load i32* @GL_FRONT_AND_BACK
  %..1814 = load i32* @GL_DIFFUSE
  %..1815 = bitcast [4 x float]* %col to float*
  call void @glMaterialfv(i32 %..1813, i32 %..1814, float* %..1815) nounwind ssp
  br label %leave1791
leave1791:
  ret void
}
define i32 @aaa() nounwind ssp {
entry:
  %..retVal = alloca i32
  br label %leave1816
leave1816:
  store i32 3, i32* %..retVal
  br label %..leave
..leave:
  %..1818 = load i32* %..retVal
  ret i32 %..1818
}
declare void @glutKeyboardFunc(void(i8, i32, i32)*) nounwind
declare void @Stage_14(%.struct4*) nounwind
declare void @Stage_15(%.struct4*) nounwind
declare void @Ship_move() nounwind
declare void @Stage_11(%.struct4*) nounwind
declare void @print_f(float) nounwind
@GL_ONE_MINUS_SRC_ALPHA = external global i32
@GL_LIGHT0 = external global i32
@GL_DIFFUSE = external global i32
declare void @glColor3d(double, double, double) nounwind
declare void @tmsu() nounwind
declare void @print_b(i8) nounwind
declare void @Game_boss(%.struct1*) nounwind
declare void @Game_new(%.struct1*) nounwind
@GLUT_DEPTH = external global i32
declare void @Stage_2(%.struct4*) nounwind
declare void @glutSwapBuffers() nounwind
@GLUT_RGBA = external global i32
@GL_PROJECTION = external global i32
@GLUT_KEY_SPACE = external global i8
declare void @glutLeaveGameMode() nounwind
declare void @glTranslated(double, double, double) nounwind
declare void @Stage_18(%.struct4*) nounwind
declare void @Stage_6(%.struct4*) nounwind
@float = external global float
@GL_LIGHTING = external global i32
declare void @glMatrixMode(i32) nounwind
declare void @glutFullScreen() nounwind
declare void @glMaterialfv(i32, i32, float*) nounwind
declare void @glutInitDisplayMode(i32) nounwind
declare void @glDisable(i32) nounwind
@short = external global i16
declare void @ptn3r() nounwind
declare void @Game_stageStart(%.struct1*) nounwind
declare void @Stage_init(%.struct4*) nounwind
declare void @glViewport(i32, i32, i32, i32) nounwind
declare void @glutInitWindowSize(i32, i32) nounwind
@GL_COLOR_BUFFER_BIT = external global i32
declare void @Game_title(%.struct1*) nounwind
declare void @glutSpecialUpFunc(void(i8, i32, i32)*) nounwind
declare void @Game_ending(%.struct1*) nounwind
declare void @ptn1() nounwind
declare void @Stage_5(%.struct4*) nounwind
declare void @Game_ranking(%.struct1*) nounwind
declare void @ptn2c() nounwind
@GLUT_KEY_RIGHT = external global i8
declare void @ptn3l() nounwind
declare void @Game_title_draw() nounwind
declare void @glLoadIdentity() nounwind
declare void @main_display() nounwind
@GLUT_KEY_DOWN = external global i8
@fullscreen = external global i32
@GL_QUADS = external global i32
declare void @Game_continue(%.struct1*) nounwind
@GL_MODELVIEW = external global i32
@GL_BLEND = external global i32
declare void @print_d(double) nounwind
declare void @main(i32, i8**) nounwind
@char = external global i8
declare void @glutDisplayFunc(void()*) nounwind
declare void @Stage_17(%.struct4*) nounwind
declare void @println(i8*) nounwind
@GL_FRONT_AND_BACK = external global i32
declare void @ptn2r() nounwind
declare void @glFlush() nounwind
declare void @glPushMatrix() nounwind
declare void @glutMainLoop() nounwind
declare void @tmsl() nounwind
@key = external global %.struct2
@GLUT_KEY_LEFT = external global i8
declare void @glutEnterGameMode() nounwind
@double = external global double
@GL_POSITION = external global i32
declare void @gluPerspective(double, double, double, double) nounwind
@GL_DEPTH_TEST = external global i32
declare void @ptn7() nounwind
declare void @glRotated(double, double, double, double) nounwind
declare void @ptn4r() nounwind
@long = external global i64
declare void @glutGameModeString(i8*) nounwind
@Game = external global %.struct1
declare void @gluLookAt(double, double, double, double, double, double, double, double, double) nounwind
declare void @upKey(i8, i32, i32) nounwind
@ship = external global %.struct3
declare void @glutInit(i32*, i8**) nounwind
declare void @Stage_1(%.struct4*) nounwind
declare void @glutReshapeWindow(i32, i32) nounwind
declare void @downKey(i8, i32, i32) nounwind
declare void @ptn4l() nounwind
@GL_POLYGON = external global i32
@Ship = external global %.struct3
@GL_SRC_ALPHA = external global i32
declare void @Stage_8(%.struct4*) nounwind
declare void @Game_game(%.struct1*) nounwind
declare void @glutCreateWindow(i8*) nounwind
declare void @Stage_10(%.struct4*) nounwind
@int = external global i32
declare void @ptn2l() nounwind
declare void @Game_damage(%.struct1*) nounwind
declare void @glNormal3d(double, double, double) nounwind
@GLUT_DOUBLE = external global i32
declare void @glBegin(i32) nounwind
declare void @glPopMatrix() nounwind
declare void @boss1() nounwind
declare void @Stage_16(%.struct4*) nounwind
declare void @Stage_4(%.struct4*) nounwind
declare void @exit(i32) nounwind
declare void @Stage_9(%.struct4*) nounwind
declare void @glLightfv(i32, i32, float*) nounwind
declare void @glVertex2d(double, double) nounwind
declare void @Stage_13(%.struct4*) nounwind
declare void @glColor4d(double, double, double, double) nounwind
declare void @print_l(i64) nounwind
declare void @Stage_ending(%.struct4*) nounwind
declare void @Game_nameEntry(%.struct1*) nounwind
declare void @glVertex3d(double, double, double) nounwind
declare void @glBlendFunc(i32, i32) nounwind
@GL_LINE_LOOP = external global i32
declare void @main_loop(i32) nounwind
declare void @Game_title_end(%.struct1*) nounwind
declare void @Game_init(%.struct1*) nounwind
declare void @Game_game_draw() nounwind
declare void @Game_nextStage(%.struct1*) nounwind
@GLUT_KEY_UP = external global i8
@Stage = external global %.struct4
@game = external global %.struct1
declare void @ptn_hatena() nounwind
declare void @glutSpecialFunc(void(i8, i32, i32)*) nounwind
declare void @Stage_3(%.struct4*) nounwind
@byte = external global i8
declare void @print_s(i16) nounwind
declare void @print_i(i32) nounwind
declare void @Stage_12(%.struct4*) nounwind
declare void @glEnable(i32) nounwind
declare void @Ship_draw() nounwind
@GL_ONE = external global i32
declare void @glutTimerFunc(i32, void(i32)*, i32) nounwind
declare void @glClear(i32) nounwind
declare void @glEnd() nounwind
declare void @tmsr() nounwind
declare void @Stage_7(%.struct4*) nounwind
@GL_DEPTH_BUFFER_BIT = external global i32
declare void @Game_demo(%.struct1*) nounwind
declare void @glutPostRedisplay() nounwind
declare void @glScaled(double, double, double) nounwind
@Key = external global %.struct2
