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
declare void @glutKeyboardFunc(void(i8, i32, i32)*) nounwind
declare double @Enemy_moveBody(%.struct5*) nounwind
@GLUT_NUMBER = external global i32
declare void @Ship_move(%.struct8*) nounwind
@false = external global i32
declare i32 @Shot_move(%.struct10*) nounwind
@Shot = external global %.struct7
declare void @print_f(float) nounwind
declare double @random() nounwind
@GL_ONE_MINUS_SRC_ALPHA = external global i32
@GL_LIGHT0 = external global i32
@GL_DIFFUSE = external global i32
declare void @Enemy_moveWait(%.struct5*) nounwind
declare void @glColor3d(double, double, double) nounwind
@enemiesCnt = external global i32
declare void @addParticle(double, double, double) nounwind
declare void @print_b(i8) nounwind
@bullets = external global [50 x %.struct9*]
@GLUT_DEPTH = external global i32
declare void @addEnemy(double, double, double) nounwind
declare void @Shot_draw(%.struct10*) nounwind
declare void @glutSwapBuffers() nounwind
@GLUT_RGBA = external global i32
@GL_PROJECTION = external global i32
@GLUT_KEY_SPACE = external global i8
declare void @Enemy_move2(%.struct5*) nounwind
declare void @glutLeaveGameMode() nounwind
declare void @glTranslated(double, double, double) nounwind
declare %.struct8* @newShip(double, double) nounwind
declare void @addShot(double, double, double) nounwind
@randomValue = external global i32
@float = external global float
@bulletsCnt = external global i32
@GL_LIGHTING = external global i32
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
@GL_COLOR_BUFFER_BIT = external global i32
declare void @glutSpecialUpFunc(void(i8, i32, i32)*) nounwind
declare void @Enemy_wait(%.struct5*, i32, void(%.struct5*)*) nounwind
@rank = external global i32
@score = external global i32
declare %.struct9* @newParticle() nounwind
declare void @addParticles(double, double, i32) nounwind
@GLUT_KEY_RIGHT = external global i8
declare void @glLoadIdentity() nounwind
declare void @main_display() nounwind
declare i32 @Particle_move(%.struct9*) nounwind
@GLUT_KEY_DOWN = external global i8
@fullscreen = external global i32
@GL_QUADS = external global i32
@particles = external global [50 x %.struct9*]
@GL_MODELVIEW = external global i32
@GL_BLEND = external global i32
declare %.struct10* @newShot() nounwind
declare void @print_d(double) nounwind
declare void @main(i32, i8**) nounwind
@char = external global i8
declare double @cos(double) nounwind
@shotsCnt = external global i32
declare void @glutDisplayFunc(void()*) nounwind
declare i32 @Bullet_move(%.struct9*) nounwind
declare void @println(i8*) nounwind
@GL_FRONT_AND_BACK = external global i32
declare void @glFlush() nounwind
declare void @glPushMatrix() nounwind
declare double @atan(double) nounwind
declare void @glutMainLoop() nounwind
@key = external global %.struct2
@GLUT_KEY_LEFT = external global i8
declare void @glutEnterGameMode() nounwind
@double = external global double
@GL_POSITION = external global i32
declare void @gluPerspective(double, double, double, double) nounwind
@GL_DEPTH_TEST = external global i32
declare void @glRotated(double, double, double, double) nounwind
@long = external global i64
declare void @Shot_init(%.struct10*, double, double, double) nounwind
declare void @glutGameModeString(i8*) nounwind
declare double @normalRad(double) nounwind
declare void @Enemy_init(%.struct5*, double, double, double) nounwind
declare void @Ship_init(%.struct8*) nounwind
@Enemy = external global %.struct4
declare void @gluLookAt(double, double, double, double, double, double, double, double, double) nounwind
declare void @upKey(i8, i32, i32) nounwind
declare double @atan2(double, double) nounwind
@bool = external global i32
@ship = external global %.struct8*
declare void @glutInit(i32*, i8**) nounwind
declare void @glutReshapeWindow(i32, i32) nounwind
declare void @downKey(i8, i32, i32) nounwind
@PI = external global double
@GL_POLYGON = external global i32
@shots = external global [10 x %.struct10*]
@enemies = external global [10 x %.struct5*]
@Ship = external global %.struct3
@GL_SRC_ALPHA = external global i32
declare void @onEnter() nounwind
declare void @Particle_draw(%.struct9*) nounwind
declare void @glutCreateWindow(i8*) nounwind
@int = external global i32
declare void @Enemy_draw(%.struct5*) nounwind
declare void @glNormal3d(double, double, double) nounwind
declare %.struct5* @newEnemy() nounwind
declare void @glBegin(i32) nounwind
declare void @glPopMatrix() nounwind
declare void @Bullet_draw(%.struct9*) nounwind
@true = external global i32
declare void @exit(i32) nounwind
declare void @glLightfv(i32, i32, float*) nounwind
declare void @glVertex2d(double, double) nounwind
declare void @glColor4d(double, double, double, double) nounwind
declare void @print_l(i64) nounwind
declare void @addBullet(double, double, double) nounwind
declare void @glVertex3d(double, double, double) nounwind
declare void @glBlendFunc(i32, i32) nounwind
@GL_LINE_LOOP = external global i32
declare void @main_loop(i32) nounwind
declare double @abs(double) nounwind
@Particle = external global %.struct6
declare void @Bullet_init(%.struct9*, double, double, double) nounwind
declare void @Enemy_move1(%.struct5*) nounwind
@GLUT_KEY_UP = external global i8
@particlesCnt = external global i32
declare double @sin(double) nounwind
declare void @addBulletN(double, double, double, i32, double) nounwind
declare void @glutSpecialFunc(void(i8, i32, i32)*) nounwind
@byte = external global i8
declare void @print_s(i16) nounwind
declare void @print_i(i32) nounwind
declare void @glEnable(i32) nounwind
declare void @Ship_draw(%.struct8*) nounwind
@GL_ONE = external global i32
declare void @glutTimerFunc(i32, void(i32)*, i32) nounwind
declare void @glClear(i32) nounwind
declare %.struct9* @newBullet() nounwind
declare void @Particle_init(%.struct9*, double, double, double) nounwind
declare void @glEnd() nounwind
@GL_DEPTH_BUFFER_BIT = external global i32
declare void @glutPostRedisplay() nounwind
declare void @glScaled(double, double, double) nounwind
@Key = external global %.struct2
