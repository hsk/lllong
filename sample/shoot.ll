%.struct3 = type { double, double, i32, double, double, double, void(%.struct4*)*, void(%.struct4*)*, i32, double }
%.struct4 = type { double, double, i32, double, double, double, void(%.struct4*)*, void(%.struct4*)*, i32, double }
%.struct9 = type { double, double, i32, double, double, double }
%.struct8 = type { double, double, i32, double, double }
%.struct6 = type { double, double, i32, double, double, double }
%.struct7 = type { double, double, i32, double, i32, i32 }
%.struct1 = type { i32, i32, i32, i32, i32, i32 }
%.struct2 = type { double, double, i32, double, i32, i32 }
%.struct5 = type { double, double, i32, double, double }
declare i32 @printf(i8*, ...) nounwind
@false= global i32 1
@true= global i32 0
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
@key= common global %.struct1 zeroinitializer
define void @downKey(i8 %k.v, i32 %x.v, i32 %y.v) nounwind ssp {
entry:
  %k = alloca i8
  store i8 %k.v, i8* %k
  %x = alloca i32
  store i32 %x.v, i32* %x
  %y = alloca i32
  store i32 %y.v, i32* %y
  %..11 = load i8* %k
  switch i8 %..11, label %switch125 [
    i8 101, label %switch120
    i8 103, label %switch121
    i8 100, label %switch122
    i8 102, label %switch123
    i8 32, label %switch124
  ]
switch120:
  ; 
  %..18 = trunc i64 1 to i32
  %..20 = getelementptr inbounds %.struct1* @key, i32 0, i32 0
  store i32 %..18, i32* %..20
  br label %switch125
break21:
  br label %switch121
switch121:
  ; 
  %..22 = trunc i64 1 to i32
  %..24 = getelementptr inbounds %.struct1* @key, i32 0, i32 1
  store i32 %..22, i32* %..24
  br label %switch125
break25:
  br label %switch122
switch122:
  ; 
  %..26 = trunc i64 1 to i32
  %..28 = getelementptr inbounds %.struct1* @key, i32 0, i32 2
  store i32 %..26, i32* %..28
  br label %switch125
break29:
  br label %switch123
switch123:
  ; 
  %..30 = trunc i64 1 to i32
  %..32 = getelementptr inbounds %.struct1* @key, i32 0, i32 3
  store i32 %..30, i32* %..32
  br label %switch125
break33:
  br label %switch124
switch124:
  ; 
  %..34 = trunc i64 1 to i32
  %..36 = getelementptr inbounds %.struct1* @key, i32 0, i32 4
  store i32 %..34, i32* %..36
  %..37 = getelementptr inbounds %.struct1* @key, i32 0, i32 5
  store i32 %..34, i32* %..37
  br label %switch125
break38:
  br label %switch125
switch125:
  br label %leave10
leave10:
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
  %..40 = load i8* %k
  switch i8 %..40, label %switch416 [
    i8 101, label %switch410
    i8 103, label %switch411
    i8 100, label %switch412
    i8 102, label %switch413
    i8 32, label %switch414
    i8 27, label %switch415
  ]
switch410:
  ; 
  %..48 = trunc i64 0 to i32
  %..50 = getelementptr inbounds %.struct1* @key, i32 0, i32 0
  store i32 %..48, i32* %..50
  br label %switch416
break51:
  br label %switch411
switch411:
  ; 
  %..52 = trunc i64 0 to i32
  %..54 = getelementptr inbounds %.struct1* @key, i32 0, i32 1
  store i32 %..52, i32* %..54
  br label %switch416
break55:
  br label %switch412
switch412:
  ; 
  %..56 = trunc i64 0 to i32
  %..58 = getelementptr inbounds %.struct1* @key, i32 0, i32 2
  store i32 %..56, i32* %..58
  br label %switch416
break59:
  br label %switch413
switch413:
  ; 
  %..60 = trunc i64 0 to i32
  %..62 = getelementptr inbounds %.struct1* @key, i32 0, i32 3
  store i32 %..60, i32* %..62
  br label %switch416
break63:
  br label %switch414
switch414:
  ; 
  %..64 = trunc i64 0 to i32
  %..66 = getelementptr inbounds %.struct1* @key, i32 0, i32 4
  store i32 %..64, i32* %..66
  %..67 = getelementptr inbounds %.struct1* @key, i32 0, i32 5
  store i32 %..64, i32* %..67
  br label %switch416
break68:
  br label %switch415
switch415:
  ; 
  call void @glutLeaveGameMode() nounwind ssp
  call void @exit(i32 0) nounwind ssp
  br label %switch416
break72:
  br label %switch416
switch416:
  br label %leave39
leave39:
  ret void
}
@ship= common global %.struct7* zeroinitializer
@enemies= common global [10 x %.struct4*] zeroinitializer
@enemiesCnt= global i32 10
@bullets= common global [500 x %.struct8*] zeroinitializer
@bulletsCnt= global i32 500
@particles= common global [500 x %.struct8*] zeroinitializer
@particlesCnt= global i32 500
@shots= common global [10 x %.struct9*] zeroinitializer
@shotsCnt= global i32 10
@score= global i32 0
@rank= global i32 0
@randomValue= global i32 1143241
define i32 @main() nounwind ssp {
entry:
  %..retVal = alloca i32
  %..74 = call %.struct7* @newShip(double 0x406cc00000000000, double 0x407c200000000000) nounwind ssp
  %..77 = bitcast %.struct7* %..74 to %.struct7*
  store %.struct7* %..77, %.struct7** @ship
  %i = alloca i32
  store i32 0, i32* %i
  br label %for79
for79:
  %..83 = load i32* %i
  %..1510 = icmp slt i32 %..83, 500
  %..82 = zext i1 %..1510 to i64
  %reg_1511 = icmp ne i64 %..82, 0
  br i1 %reg_1511, label %ok78, label %endfor80
ok78:
  %..85 = bitcast [500 x %.struct8*]* @bullets to %.struct8**
  %..86 = load i32* %i
  %..87 = call %.struct8* @newBullet() nounwind ssp
  %..88 = bitcast %.struct8** %..85 to %.struct8**
  %..89 = getelementptr inbounds %.struct8** %..88, i32 %..86
  store %.struct8* %..87, %.struct8** %..89
  %..93 = load i32* %i
  %..92 = zext i32 %..93 to i64
  %..91 = add i64 %..92, 1
  %..90 = trunc i64 %..91 to i32
  store i32 %..90, i32* %i
  br label %for79
endfor80:
  %..98 = trunc i64 0 to i32
  store i32 %..98, i32* %i
  br label %for96
for96:
  %..101 = load i32* %i
  %..1512 = icmp slt i32 %..101, 500
  %..100 = zext i1 %..1512 to i64
  %reg_1513 = icmp ne i64 %..100, 0
  br i1 %reg_1513, label %ok95, label %endfor97
ok95:
  %..103 = bitcast [500 x %.struct8*]* @particles to %.struct8**
  %..104 = load i32* %i
  %..105 = call %.struct8* @newParticle() nounwind ssp
  %..106 = bitcast %.struct8** %..103 to %.struct8**
  %..107 = getelementptr inbounds %.struct8** %..106, i32 %..104
  store %.struct8* %..105, %.struct8** %..107
  %..111 = load i32* %i
  %..110 = zext i32 %..111 to i64
  %..109 = add i64 %..110, 1
  %..108 = trunc i64 %..109 to i32
  store i32 %..108, i32* %i
  br label %for96
endfor97:
  %..116 = trunc i64 0 to i32
  store i32 %..116, i32* %i
  br label %for114
for114:
  %..119 = load i32* %i
  %..1514 = icmp slt i32 %..119, 10
  %..118 = zext i1 %..1514 to i64
  %reg_1515 = icmp ne i64 %..118, 0
  br i1 %reg_1515, label %ok113, label %endfor115
ok113:
  %..121 = bitcast [10 x %.struct9*]* @shots to %.struct9**
  %..122 = load i32* %i
  %..123 = call %.struct9* @newShot() nounwind ssp
  %..124 = bitcast %.struct9** %..121 to %.struct9**
  %..125 = getelementptr inbounds %.struct9** %..124, i32 %..122
  store %.struct9* %..123, %.struct9** %..125
  %..129 = load i32* %i
  %..128 = zext i32 %..129 to i64
  %..127 = add i64 %..128, 1
  %..126 = trunc i64 %..127 to i32
  store i32 %..126, i32* %i
  br label %for114
endfor115:
  %..134 = trunc i64 0 to i32
  store i32 %..134, i32* %i
  br label %for132
for132:
  %..137 = load i32* %i
  %..1516 = icmp slt i32 %..137, 10
  %..136 = zext i1 %..1516 to i64
  %reg_1517 = icmp ne i64 %..136, 0
  br i1 %reg_1517, label %ok131, label %endfor133
ok131:
  %..139 = bitcast [10 x %.struct4*]* @enemies to %.struct4**
  %..140 = load i32* %i
  %..141 = call %.struct4* @newEnemy() nounwind ssp
  %..142 = bitcast %.struct4** %..139 to %.struct4**
  %..143 = getelementptr inbounds %.struct4** %..142, i32 %..140
  store %.struct4* %..141, %.struct4** %..143
  %..147 = load i32* %i
  %..146 = zext i32 %..147 to i64
  %..145 = add i64 %..146, 1
  %..144 = trunc i64 %..145 to i32
  store i32 %..144, i32* %i
  br label %for132
endfor133:
  br label %leave73
leave73:
  store i32 0, i32* %..retVal
  br label %..leave
..leave:
  %..1518 = load i32* %..retVal
  ret i32 %..1518
}
define double @random() nounwind ssp {
entry:
  %..retVal = alloca double
  %..153 = zext i32 1143241 to i64
  %..152 = mul i64 %..153, 143242143
  %..151 = add i64 %..152, 432414321
  %..150 = trunc i64 %..151 to i32
  store i32 %..150, i32 1143241
  %a = alloca double
  store double 0x421ffffffffc0000, double* %a
  %..162 = load double* %a
  %..161 = fptosi double %..162 to i32
  %..159 = sdiv i32 1143241, %..161
  %..158 = sitofp i32 %..159 to double
  br label %leave149
leave149:
  store double %..158, double* %..retVal
  br label %..leave
..leave:
  %..1519 = load double* %..retVal
  ret double %..1519
}
define void @onEnter() nounwind ssp {
entry:
  %cnt = alloca i64
  store i64 0, i64* %cnt
  %i = alloca i64
  store i64 0, i64* %i
  br label %for166
for166:
  %..170 = load i64* %i
  %..171 = zext i32 10 to i64
  %..1520 = icmp slt i64 %..170, %..171
  %..169 = zext i1 %..1520 to i64
  %reg_1521 = icmp ne i64 %..169, 0
  br i1 %reg_1521, label %ok165, label %endfor167
ok165:
  %enemy = alloca %.struct4*
  %..173 = bitcast [10 x %.struct4*]* @enemies to %.struct4**
  %..174 = load i64* %i
  %..175 = bitcast %.struct4** %..173 to %.struct4**
  %..176 = getelementptr inbounds %.struct4** %..175, i64 %..174
  %..177 = load %.struct4** %..176
  %..178 = bitcast %.struct4* %..177 to %.struct4*
  store %.struct4* %..178, %.struct4** %enemy
  %..185 = load %.struct4** %enemy
  %..186 = getelementptr inbounds %.struct4* %..185, i32 0, i32 2
  %..187 = load i32* %..186
  %..184 = zext i32 %..187 to i64
  %reg_1522 = icmp ne i64 %..184, 0
  br i1 %reg_1522, label %ok179, label %else180
ok179:
  %..189 = load i64* %cnt
  %..188 = add i64 %..189, 1
  store i64 %..188, i64* %cnt
  %..191 = load %.struct4** %enemy
  %..192 = load %.struct4** %enemy
  %..193 = getelementptr inbounds %.struct4* %..192, i32 0, i32 6
  %..1523 = load void(%.struct4*)** %..193
  call void %..1523(%.struct4* %..191) nounwind ssp
  br label %else181
else181:
  br label %endif182
else180:
  ; void
  br label %endif183
endif183:
  br label %endif182
endif182:
  %..196 = load i64* %i
  %..195 = add i64 %..196, 1
  store i64 %..195, i64* %i
  br label %for166
endfor167:
  %..206 = load i64* %cnt
  %..1524 = icmp eq i64 %..206, 0
  %..205 = zext i1 %..1524 to i64
  %..211 = call double @random() nounwind ssp
  %..212 = sitofp i64 100 to double
  %..210 = fmul double %..211, %..212
  %..209 = fptosi double %..210 to i32
  %..1525 = icmp slt i32 %..209, 0
  %..208 = zext i1 %..1525 to i64
  %..204 = or i64 %..205, %..208
  %..203 = bitcast i64 %..204 to i64
  %reg_1526 = icmp ne i64 %..203, 0
  br i1 %reg_1526, label %ok198, label %else199
ok198:
  %..217 = call double @random() nounwind ssp
  %..218 = sitofp i64 3 to double
  %..216 = fmul double %..217, %..218
  %..215 = fptosi double %..216 to i32
  switch i32 %..215, label %switch2203 [
    i32 0, label %switch2200
    i32 1, label %switch2201
    i32 2, label %switch2202
  ]
switch2200:
  ; 
  %..227 = call double @random() nounwind ssp
  %..226 = fmul double %..227, 0x4069000000000000
  call void @addEnemy(double 0x0, double %..226, double 0x0) nounwind ssp
  br label %switch2203
break230:
  br label %switch2201
switch2201:
  ; 
  %..233 = call double @random() nounwind ssp
  %..232 = fmul double %..233, 0x407d100000000000
  %..237 = load double* @PI
  %..236 = fdiv double %..237, 0x4000000000000000
  call void @addEnemy(double %..232, double 0x0, double %..236) nounwind ssp
  br label %switch2203
break239:
  br label %switch2202
switch2202:
  ; 
  %..243 = call double @random() nounwind ssp
  %..242 = fmul double %..243, 0x4069000000000000
  %..245 = load double* @PI
  call void @addEnemy(double 0x407d100000000000, double %..242, double %..245) nounwind ssp
  br label %switch2203
break246:
  br label %switch2203
switch2203:
  br label %else200
else200:
  br label %endif201
else199:
  ; void
  br label %endif202
endif202:
  br label %endif201
endif201:
  %..253 = load %.struct7** @ship
  %..254 = getelementptr inbounds %.struct7* %..253, i32 0, i32 2
  %..255 = load i32* %..254
  %..252 = zext i32 %..255 to i64
  %reg_1527 = icmp ne i64 %..252, 0
  br i1 %reg_1527, label %ok247, label %else248
ok247:
  %..257 = load %.struct7** @ship
  call void @Ship_move(%.struct7* %..257) nounwind ssp
  br label %else249
else249:
  br label %endif250
else248:
  ; void
  br label %endif251
endif251:
  br label %endif250
endif250:
  store i64 0, i64* %i
  br label %for259
for259:
  %..263 = load i64* %i
  %..264 = zext i32 500 to i64
  %..1528 = icmp slt i64 %..263, %..264
  %..262 = zext i1 %..1528 to i64
  %reg_1529 = icmp ne i64 %..262, 0
  br i1 %reg_1529, label %ok258, label %endfor260
ok258:
  %b = alloca %.struct8*
  %..266 = bitcast [500 x %.struct8*]* @bullets to %.struct8**
  %..267 = load i64* %i
  %..268 = bitcast %.struct8** %..266 to %.struct8**
  %..269 = getelementptr inbounds %.struct8** %..268, i64 %..267
  %..270 = load %.struct8** %..269
  %..271 = bitcast %.struct8* %..270 to %.struct8*
  store %.struct8* %..271, %.struct8** %b
  %..278 = load %.struct8** %b
  %..279 = getelementptr inbounds %.struct8* %..278, i32 0, i32 2
  %..280 = load i32* %..279
  %..277 = zext i32 %..280 to i64
  %reg_1530 = icmp ne i64 %..277, 0
  br i1 %reg_1530, label %ok272, label %else273
ok272:
  %..282 = load %.struct8** %b
  %..281 = call i32 @Bullet_move(%.struct8* %..282) nounwind ssp
  %..292 = load %.struct7** @ship
  %..293 = getelementptr inbounds %.struct7* %..292, i32 0, i32 4
  %..294 = load i32* %..293
  %..291 = zext i32 %..294 to i64
  %..298 = load %.struct7** @ship
  %..299 = getelementptr inbounds %.struct7* %..298, i32 0, i32 0
  %..300 = load double* %..299
  %..301 = load %.struct8** %b
  %..302 = getelementptr inbounds %.struct8* %..301, i32 0, i32 0
  %..303 = load double* %..302
  %..297 = fsub double %..300, %..303
  %..296 = call double @abs(double %..297) nounwind ssp
  %..304 = sitofp i64 3 to double
  %..1531 = fcmp olt double %..296, %..304
  %..295 = zext i1 %..1531 to i64
  %..290 = and i64 %..291, %..295
  %..309 = load %.struct7** @ship
  %..310 = getelementptr inbounds %.struct7* %..309, i32 0, i32 1
  %..311 = load double* %..310
  %..312 = load %.struct8** %b
  %..313 = getelementptr inbounds %.struct8* %..312, i32 0, i32 1
  %..314 = load double* %..313
  %..308 = fsub double %..311, %..314
  %..307 = call double @abs(double %..308) nounwind ssp
  %..315 = sitofp i64 3 to double
  %..1532 = fcmp olt double %..307, %..315
  %..306 = zext i1 %..1532 to i64
  %..289 = and i64 %..290, %..306
  %..288 = bitcast i64 %..289 to i64
  %reg_1533 = icmp ne i64 %..288, 0
  br i1 %reg_1533, label %ok283, label %else284
ok283:
  %..318 = load %.struct7** @ship
  %..319 = getelementptr inbounds %.struct7* %..318, i32 0, i32 0
  %..320 = load double* %..319
  %..321 = load %.struct7** @ship
  %..322 = getelementptr inbounds %.struct7* %..321, i32 0, i32 1
  %..323 = load double* %..322
  call void @addParticles(double %..320, double %..323, i32 100) nounwind ssp
  %..325 = load %.struct7** @ship
  %..327 = getelementptr inbounds %.struct7* %..325, i32 0, i32 4
  store i32 1, i32* %..327
  %..328 = load %.struct7** @ship
  %..330 = getelementptr inbounds %.struct7* %..328, i32 0, i32 2
  store i32 1, i32* %..330
  br label %else285
else285:
  br label %endif286
else284:
  ; void
  br label %endif287
endif287:
  br label %endif286
endif286:
  br label %else274
else274:
  br label %endif275
else273:
  ; void
  br label %endif276
endif276:
  br label %endif275
endif275:
  %..332 = load i64* %i
  %..331 = add i64 %..332, 1
  store i64 %..331, i64* %i
  br label %for259
endfor260:
  store i64 0, i64* %i
  br label %for335
for335:
  %..339 = load i64* %i
  %..340 = zext i32 10 to i64
  %..1534 = icmp slt i64 %..339, %..340
  %..338 = zext i1 %..1534 to i64
  %reg_1535 = icmp ne i64 %..338, 0
  br i1 %reg_1535, label %ok334, label %endfor336
ok334:
  %s = alloca %.struct9*
  %..342 = bitcast [10 x %.struct9*]* @shots to %.struct9**
  %..343 = load i64* %i
  %..344 = bitcast %.struct9** %..342 to %.struct9**
  %..345 = getelementptr inbounds %.struct9** %..344, i64 %..343
  %..346 = load %.struct9** %..345
  %..347 = bitcast %.struct9* %..346 to %.struct9*
  store %.struct9* %..347, %.struct9** %s
  %..354 = load %.struct9** %s
  %..355 = getelementptr inbounds %.struct9* %..354, i32 0, i32 2
  %..356 = load i32* %..355
  %..353 = zext i32 %..356 to i64
  %reg_1536 = icmp ne i64 %..353, 0
  br i1 %reg_1536, label %ok348, label %else349
ok348:
  %j = alloca i64
  store i64 0, i64* %j
  br label %for358
for358:
  %..362 = load i64* %j
  %..363 = zext i32 10 to i64
  %..1537 = icmp slt i64 %..362, %..363
  %..361 = zext i1 %..1537 to i64
  %reg_1538 = icmp ne i64 %..361, 0
  br i1 %reg_1538, label %ok357, label %endfor359
ok357:
  %..365 = bitcast [10 x %.struct4*]* @enemies to %.struct4**
  %..366 = load i64* %j
  %..367 = bitcast %.struct4** %..365 to %.struct4**
  %..368 = getelementptr inbounds %.struct4** %..367, i64 %..366
  %..369 = load %.struct4** %..368
  %..370 = bitcast %.struct4* %..369 to %.struct4*
  store %.struct4* %..370, %.struct4** %enemy
  %..380 = load %.struct4** %enemy
  %..381 = getelementptr inbounds %.struct4* %..380, i32 0, i32 2
  %..382 = load i32* %..381
  %..379 = zext i32 %..382 to i64
  %..386 = load %.struct4** %enemy
  %..387 = getelementptr inbounds %.struct4* %..386, i32 0, i32 0
  %..388 = load double* %..387
  %..389 = load %.struct9** %s
  %..390 = getelementptr inbounds %.struct9* %..389, i32 0, i32 0
  %..391 = load double* %..390
  %..385 = fsub double %..388, %..391
  %..384 = call double @abs(double %..385) nounwind ssp
  %..392 = sitofp i64 30 to double
  %..1539 = fcmp olt double %..384, %..392
  %..383 = zext i1 %..1539 to i64
  %..378 = and i64 %..379, %..383
  %..397 = load %.struct4** %enemy
  %..398 = getelementptr inbounds %.struct4* %..397, i32 0, i32 1
  %..399 = load double* %..398
  %..400 = load %.struct9** %s
  %..401 = getelementptr inbounds %.struct9* %..400, i32 0, i32 1
  %..402 = load double* %..401
  %..396 = fsub double %..399, %..402
  %..395 = call double @abs(double %..396) nounwind ssp
  %..403 = sitofp i64 30 to double
  %..1540 = fcmp olt double %..395, %..403
  %..394 = zext i1 %..1540 to i64
  %..377 = and i64 %..378, %..394
  %..376 = bitcast i64 %..377 to i64
  %reg_1541 = icmp ne i64 %..376, 0
  br i1 %reg_1541, label %ok371, label %else372
ok371:
  %..407 = zext i32 0 to i64
  %..406 = add i64 %..407, 100
  %..405 = trunc i64 %..406 to i32
  store i32 %..405, i32 0
  %..412 = zext i32 0 to i64
  %..411 = sdiv i64 %..412, 1000
  %..410 = trunc i64 %..411 to i32
  store i32 %..410, i32 0
  %..416 = load %.struct4** %enemy
  %..417 = getelementptr inbounds %.struct4* %..416, i32 0, i32 0
  %..418 = load double* %..417
  %..419 = load %.struct4** %enemy
  %..420 = getelementptr inbounds %.struct4* %..419, i32 0, i32 1
  %..421 = load double* %..420
  call void @addParticles(double %..418, double %..421, i32 30) nounwind ssp
  %..423 = load %.struct4** %enemy
  %..425 = getelementptr inbounds %.struct4* %..423, i32 0, i32 2
  store i32 1, i32* %..425
  br label %else373
else373:
  br label %endif374
else372:
  ; void
  br label %endif375
endif375:
  br label %endif374
endif374:
  %..427 = load i64* %j
  %..426 = add i64 %..427, 1
  store i64 %..426, i64* %j
  br label %for358
endfor359:
  %..430 = load %.struct9** %s
  %..429 = call i32 @Shot_move(%.struct9* %..430) nounwind ssp
  br label %else350
else350:
  br label %endif351
else349:
  ; void
  br label %endif352
endif352:
  br label %endif351
endif351:
  %..432 = load i64* %i
  %..431 = add i64 %..432, 1
  store i64 %..431, i64* %i
  br label %for335
endfor336:
  store i64 0, i64* %i
  br label %for435
for435:
  %..439 = load i64* %i
  %..440 = zext i32 500 to i64
  %..1542 = icmp slt i64 %..439, %..440
  %..438 = zext i1 %..1542 to i64
  %reg_1543 = icmp ne i64 %..438, 0
  br i1 %reg_1543, label %ok434, label %endfor436
ok434:
  %p = alloca %.struct8*
  %..442 = bitcast [500 x %.struct8*]* @particles to %.struct8**
  %..443 = load i64* %i
  %..444 = bitcast %.struct8** %..442 to %.struct8**
  %..445 = getelementptr inbounds %.struct8** %..444, i64 %..443
  %..446 = load %.struct8** %..445
  %..447 = bitcast %.struct8* %..446 to %.struct8*
  store %.struct8* %..447, %.struct8** %p
  %..454 = load %.struct8** %p
  %..455 = getelementptr inbounds %.struct8* %..454, i32 0, i32 2
  %..456 = load i32* %..455
  %..453 = zext i32 %..456 to i64
  %reg_1544 = icmp ne i64 %..453, 0
  br i1 %reg_1544, label %ok448, label %else449
ok448:
  %..458 = load %.struct8** %p
  %..457 = call i32 @Particle_move(%.struct8* %..458) nounwind ssp
  br label %else450
else450:
  br label %endif451
else449:
  ; void
  br label %endif452
endif452:
  br label %endif451
endif451:
  %..460 = load i64* %i
  %..459 = add i64 %..460, 1
  store i64 %..459, i64* %i
  br label %for435
endfor436:
  br label %leave163
leave163:
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
  store i32 0, i32* %i
  br label %for464
for464:
  %..468 = load i32* %i
  %..469 = load i32* %n
  %..1545 = icmp slt i32 %..468, %..469
  %..467 = zext i1 %..1545 to i64
  %reg_1546 = icmp ne i64 %..467, 0
  br i1 %reg_1546, label %ok463, label %endfor465
ok463:
  %..471 = load double* %x
  %..472 = load double* %y
  %..474 = call double @random() nounwind ssp
  %..473 = fmul double %..474, 0x4059000000000000
  call void @addParticle(double %..471, double %..472, double %..473) nounwind ssp
  %..479 = load i32* %i
  %..478 = zext i32 %..479 to i64
  %..477 = add i64 %..478, 1
  %..476 = trunc i64 %..477 to i32
  store i32 %..476, i32* %i
  br label %for464
endfor465:
  br label %leave462
leave462:
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
  store i32 0, i32* %i
  br label %for483
for483:
  %..487 = load i32* %i
  %..488 = load i32* %n
  %..1547 = icmp slt i32 %..487, %..488
  %..486 = zext i1 %..1547 to i64
  %reg_1548 = icmp ne i64 %..486, 0
  br i1 %reg_1548, label %ok482, label %endfor484
ok482:
  %..490 = load double* %x
  %..491 = load double* %y
  %..493 = load double* %rad
  %..497 = load i32* %i
  %..501 = load i32* %n
  %..502 = fptosi double 0x4000000000000000 to i32
  %..500 = sdiv i32 %..501, %..502
  %..499 = sitofp i32 %..500 to double
  %..498 = fptosi double %..499 to i32
  %..496 = sub i32 %..497, %..498
  %..495 = sitofp i32 %..496 to double
  %..504 = load double* %r
  %..494 = fmul double %..495, %..504
  %..492 = fadd double %..493, %..494
  call void @addBullet(double %..490, double %..491, double %..492) nounwind ssp
  %..508 = load i32* %i
  %..507 = zext i32 %..508 to i64
  %..506 = add i64 %..507, 1
  %..505 = trunc i64 %..506 to i32
  store i32 %..505, i32* %i
  br label %for483
endfor484:
  br label %leave481
leave481:
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
  store i32 0, i32* %i
  br label %for512
for512:
  %..516 = load i32* %i
  %..1549 = icmp slt i32 %..516, 500
  %..515 = zext i1 %..1549 to i64
  %reg_1550 = icmp ne i64 %..515, 0
  br i1 %reg_1550, label %ok511, label %endfor513
ok511:
  %b = alloca %.struct8*
  %..518 = bitcast [500 x %.struct8*]* @bullets to %.struct8**
  %..519 = load i32* %i
  %..520 = bitcast %.struct8** %..518 to %.struct8**
  %..521 = getelementptr inbounds %.struct8** %..520, i32 %..519
  %..522 = load %.struct8** %..521
  %..523 = bitcast %.struct8* %..522 to %.struct8*
  store %.struct8* %..523, %.struct8** %b
  %..530 = load %.struct8** %b
  %..531 = getelementptr inbounds %.struct8* %..530, i32 0, i32 2
  %..532 = load i32* %..531
  %..529 = zext i32 %..532 to i64
  %reg_1551 = icmp ne i64 %..529, 0
  br i1 %reg_1551, label %ok524, label %else525
ok524:
  br label %for512
continue533:
  br label %else526
else526:
  br label %endif527
else525:
  ; void
  br label %endif528
endif528:
  br label %endif527
endif527:
  %..535 = load %.struct8** %b
  %..536 = load double* %x
  %..537 = load double* %y
  %..538 = load double* %rad
  call void @Bullet_init(%.struct8* %..535, double %..536, double %..537, double %..538) nounwind ssp
  ; void
  br label %leave510
ret539:
  %..543 = load i32* %i
  %..542 = zext i32 %..543 to i64
  %..541 = add i64 %..542, 1
  %..540 = trunc i64 %..541 to i32
  store i32 %..540, i32* %i
  br label %for512
endfor513:
  br label %leave510
leave510:
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
  store i32 0, i32* %i
  br label %for547
for547:
  %..551 = load i32* %i
  %..1552 = icmp slt i32 %..551, 10
  %..550 = zext i1 %..1552 to i64
  %reg_1553 = icmp ne i64 %..550, 0
  br i1 %reg_1553, label %ok546, label %endfor548
ok546:
  %b = alloca %.struct9*
  %..553 = bitcast [10 x %.struct9*]* @shots to %.struct9**
  %..554 = load i32* %i
  %..555 = bitcast %.struct9** %..553 to %.struct9**
  %..556 = getelementptr inbounds %.struct9** %..555, i32 %..554
  %..557 = load %.struct9** %..556
  %..558 = bitcast %.struct9* %..557 to %.struct9*
  store %.struct9* %..558, %.struct9** %b
  %..565 = load %.struct9** %b
  %..566 = getelementptr inbounds %.struct9* %..565, i32 0, i32 2
  %..567 = load i32* %..566
  %..564 = zext i32 %..567 to i64
  %reg_1554 = icmp ne i64 %..564, 0
  br i1 %reg_1554, label %ok559, label %else560
ok559:
  br label %for547
continue568:
  br label %else561
else561:
  br label %endif562
else560:
  ; void
  br label %endif563
endif563:
  br label %endif562
endif562:
  %..570 = load %.struct9** %b
  %..571 = load double* %x
  %..572 = load double* %y
  %..573 = load double* %rad
  call void @Shot_init(%.struct9* %..570, double %..571, double %..572, double %..573) nounwind ssp
  ; void
  br label %leave545
ret574:
  %..578 = load i32* %i
  %..577 = zext i32 %..578 to i64
  %..576 = add i64 %..577, 1
  %..575 = trunc i64 %..576 to i32
  store i32 %..575, i32* %i
  br label %for547
endfor548:
  br label %leave545
leave545:
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
  store i32 0, i32* %i
  br label %for582
for582:
  %..586 = load i32* %i
  %..1555 = icmp slt i32 %..586, 500
  %..585 = zext i1 %..1555 to i64
  %reg_1556 = icmp ne i64 %..585, 0
  br i1 %reg_1556, label %ok581, label %endfor583
ok581:
  %b = alloca %.struct8*
  %..588 = bitcast [500 x %.struct8*]* @particles to %.struct8**
  %..589 = load i32* %i
  %..590 = bitcast %.struct8** %..588 to %.struct8**
  %..591 = getelementptr inbounds %.struct8** %..590, i32 %..589
  %..592 = load %.struct8** %..591
  %..593 = bitcast %.struct8* %..592 to %.struct8*
  store %.struct8* %..593, %.struct8** %b
  %..600 = load %.struct8** %b
  %..601 = getelementptr inbounds %.struct8* %..600, i32 0, i32 2
  %..602 = load i32* %..601
  %..599 = zext i32 %..602 to i64
  %reg_1557 = icmp ne i64 %..599, 0
  br i1 %reg_1557, label %ok594, label %else595
ok594:
  br label %for582
continue603:
  br label %else596
else596:
  br label %endif597
else595:
  ; void
  br label %endif598
endif598:
  br label %endif597
endif597:
  %..605 = load %.struct8** %b
  %..606 = load double* %x
  %..607 = load double* %y
  %..608 = load double* %rad
  call void @Particle_init(%.struct8* %..605, double %..606, double %..607, double %..608) nounwind ssp
  ; void
  br label %leave580
ret609:
  %..613 = load i32* %i
  %..612 = zext i32 %..613 to i64
  %..611 = add i64 %..612, 1
  %..610 = trunc i64 %..611 to i32
  store i32 %..610, i32* %i
  br label %for582
endfor583:
  br label %leave580
leave580:
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
  store i32 0, i32* %i
  br label %for617
for617:
  %..621 = load i32* %i
  %..1558 = icmp slt i32 %..621, 10
  %..620 = zext i1 %..1558 to i64
  %reg_1559 = icmp ne i64 %..620, 0
  br i1 %reg_1559, label %ok616, label %endfor618
ok616:
  %b = alloca %.struct4*
  %..623 = bitcast [10 x %.struct4*]* @enemies to %.struct4**
  %..624 = load i32* %i
  %..625 = bitcast %.struct4** %..623 to %.struct4**
  %..626 = getelementptr inbounds %.struct4** %..625, i32 %..624
  %..627 = load %.struct4** %..626
  %..628 = bitcast %.struct4* %..627 to %.struct4*
  store %.struct4* %..628, %.struct4** %b
  %..635 = load %.struct4** %b
  %..636 = getelementptr inbounds %.struct4* %..635, i32 0, i32 2
  %..637 = load i32* %..636
  %..634 = zext i32 %..637 to i64
  %reg_1560 = icmp ne i64 %..634, 0
  br i1 %reg_1560, label %ok629, label %else630
ok629:
  br label %for617
continue638:
  br label %else631
else631:
  br label %endif632
else630:
  ; void
  br label %endif633
endif633:
  br label %endif632
endif632:
  %..640 = load %.struct4** %b
  %..641 = load double* %x
  %..642 = load double* %y
  %..643 = load double* %rad
  call void @Enemy_init(%.struct4* %..640, double %..641, double %..642, double %..643) nounwind ssp
  ; void
  br label %leave615
ret644:
  %..648 = load i32* %i
  %..647 = zext i32 %..648 to i64
  %..646 = add i64 %..647, 1
  %..645 = trunc i64 %..646 to i32
  store i32 %..645, i32* %i
  br label %for617
endfor618:
  br label %leave615
leave615:
  ret void
}
define %.struct7* @newShip(double %x.v, double %y.v) nounwind ssp {
entry:
  %..retVal = alloca %.struct7*
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %this = alloca %.struct7*
  %..651 = call i8* @malloc(i64 36) nounwind ssp
  %..652 = bitcast i8* %..651 to %.struct7*
  %..653 = bitcast %.struct7* %..652 to %.struct7*
  store %.struct7* %..653, %.struct7** %this
  %..654 = load %.struct7** %this
  %..655 = sitofp i64 5 to double
  %..657 = getelementptr inbounds %.struct7* %..654, i32 0, i32 3
  store double %..655, double* %..657
  %..658 = load %.struct7** %this
  %..659 = load double* %x
  %..660 = getelementptr inbounds %.struct7* %..658, i32 0, i32 0
  store double %..659, double* %..660
  %..661 = load %.struct7** %this
  %..662 = load double* %y
  %..663 = getelementptr inbounds %.struct7* %..661, i32 0, i32 1
  store double %..662, double* %..663
  %..664 = load %.struct7** %this
  br label %leave650
leave650:
  store %.struct7* %..664, %.struct7** %..retVal
  br label %..leave
..leave:
  %..1561 = load %.struct7** %..retVal
  ret %.struct7* %..1561
}
define void @Ship_draw(%.struct7* %ship.v) nounwind ssp {
entry:
  %ship = alloca %.struct7*
  store %.struct7* %ship.v, %.struct7** %ship
  ; void
  br label %leave665
leave665:
  ret void
}
define void @Ship_init(%.struct7* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct7*
  store %.struct7* %this.v, %.struct7** %this
  %..667 = load %.struct7** %this
  %..669 = getelementptr inbounds %.struct7* %..667, i32 0, i32 4
  store i32 1, i32* %..669
  %..670 = load %.struct7** %this
  %..671 = trunc i64 0 to i32
  %..673 = getelementptr inbounds %.struct7* %..670, i32 0, i32 5
  store i32 %..671, i32* %..673
  %..674 = load %.struct7** %this
  %..676 = getelementptr inbounds %.struct7* %..674, i32 0, i32 2
  store i32 0, i32* %..676
  br label %leave666
leave666:
  ret void
}
define void @Ship_move(%.struct7* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct7*
  store %.struct7* %this.v, %.struct7** %this
  %..678 = load %.struct7** %this
  %..682 = load %.struct7** %this
  %..683 = getelementptr inbounds %.struct7* %..682, i32 0, i32 5
  %..684 = load i32* %..683
  %..681 = zext i32 %..684 to i64
  %..680 = add i64 %..681, 1
  %..679 = trunc i64 %..680 to i32
  %..686 = getelementptr inbounds %.struct7* %..678, i32 0, i32 5
  store i32 %..679, i32* %..686
  %..695 = load %.struct7** %this
  %..696 = getelementptr inbounds %.struct7* %..695, i32 0, i32 5
  %..697 = load i32* %..696
  %..694 = zext i32 %..697 to i64
  %..1562 = icmp sgt i64 %..694, 300
  %..693 = zext i1 %..1562 to i64
  %..692 = bitcast i64 %..693 to i64
  %reg_1563 = icmp ne i64 %..692, 0
  br i1 %reg_1563, label %ok687, label %else688
ok687:
  %..699 = load %.struct7** %this
  %..701 = getelementptr inbounds %.struct7* %..699, i32 0, i32 4
  store i32 0, i32* %..701
  br label %else689
else689:
  br label %endif690
else688:
  ; void
  br label %endif691
endif691:
  br label %endif690
endif690:
  %..708 = getelementptr inbounds %.struct1* @key, i32 0, i32 5
  %..709 = load i32* %..708
  %..707 = zext i32 %..709 to i64
  %reg_1564 = icmp ne i64 %..707, 0
  br i1 %reg_1564, label %ok702, label %else703
ok702:
  %..711 = load %.struct7** %this
  %..712 = getelementptr inbounds %.struct7* %..711, i32 0, i32 0
  %..713 = load double* %..712
  %..714 = load %.struct7** %this
  %..715 = getelementptr inbounds %.struct7* %..714, i32 0, i32 1
  %..716 = load double* %..715
  %..719 = load double* @PI
  %..718 = fsub double 0.0, %..719
  %..717 = fdiv double %..718, 0x4000000000000000
  call void @addShot(double %..713, double %..716, double %..717) nounwind ssp
  br label %else704
else704:
  br label %endif705
else703:
  ; void
  br label %endif706
endif706:
  br label %endif705
endif705:
  %..727 = getelementptr inbounds %.struct1* @key, i32 0, i32 2
  %..728 = load i32* %..727
  %..726 = zext i32 %..728 to i64
  %reg_1565 = icmp ne i64 %..726, 0
  br i1 %reg_1565, label %ok721, label %else722
ok721:
  %..729 = load %.struct7** %this
  %..731 = load %.struct7** %this
  %..732 = getelementptr inbounds %.struct7* %..731, i32 0, i32 0
  %..733 = load double* %..732
  %..734 = load %.struct7** %this
  %..735 = getelementptr inbounds %.struct7* %..734, i32 0, i32 3
  %..736 = load double* %..735
  %..730 = fsub double %..733, %..736
  %..737 = getelementptr inbounds %.struct7* %..729, i32 0, i32 0
  store double %..730, double* %..737
  br label %else723
else723:
  br label %endif724
else722:
  ; void
  br label %endif725
endif725:
  br label %endif724
endif724:
  %..744 = getelementptr inbounds %.struct1* @key, i32 0, i32 3
  %..745 = load i32* %..744
  %..743 = zext i32 %..745 to i64
  %reg_1566 = icmp ne i64 %..743, 0
  br i1 %reg_1566, label %ok738, label %else739
ok738:
  %..746 = load %.struct7** %this
  %..748 = load %.struct7** %this
  %..749 = getelementptr inbounds %.struct7* %..748, i32 0, i32 0
  %..750 = load double* %..749
  %..751 = load %.struct7** %this
  %..752 = getelementptr inbounds %.struct7* %..751, i32 0, i32 3
  %..753 = load double* %..752
  %..747 = fadd double %..750, %..753
  %..754 = getelementptr inbounds %.struct7* %..746, i32 0, i32 0
  store double %..747, double* %..754
  br label %else740
else740:
  br label %endif741
else739:
  ; void
  br label %endif742
endif742:
  br label %endif741
endif741:
  %..761 = getelementptr inbounds %.struct1* @key, i32 0, i32 0
  %..762 = load i32* %..761
  %..760 = zext i32 %..762 to i64
  %reg_1567 = icmp ne i64 %..760, 0
  br i1 %reg_1567, label %ok755, label %else756
ok755:
  %..763 = load %.struct7** %this
  %..765 = load %.struct7** %this
  %..766 = getelementptr inbounds %.struct7* %..765, i32 0, i32 1
  %..767 = load double* %..766
  %..768 = load %.struct7** %this
  %..769 = getelementptr inbounds %.struct7* %..768, i32 0, i32 3
  %..770 = load double* %..769
  %..764 = fsub double %..767, %..770
  %..771 = getelementptr inbounds %.struct7* %..763, i32 0, i32 1
  store double %..764, double* %..771
  br label %else757
else757:
  br label %endif758
else756:
  ; void
  br label %endif759
endif759:
  br label %endif758
endif758:
  %..778 = getelementptr inbounds %.struct1* @key, i32 0, i32 1
  %..779 = load i32* %..778
  %..777 = zext i32 %..779 to i64
  %reg_1568 = icmp ne i64 %..777, 0
  br i1 %reg_1568, label %ok772, label %else773
ok772:
  %..780 = load %.struct7** %this
  %..782 = load %.struct7** %this
  %..783 = getelementptr inbounds %.struct7* %..782, i32 0, i32 1
  %..784 = load double* %..783
  %..785 = load %.struct7** %this
  %..786 = getelementptr inbounds %.struct7* %..785, i32 0, i32 3
  %..787 = load double* %..786
  %..781 = fadd double %..784, %..787
  %..788 = getelementptr inbounds %.struct7* %..780, i32 0, i32 1
  store double %..781, double* %..788
  br label %else774
else774:
  br label %endif775
else773:
  ; void
  br label %endif776
endif776:
  br label %endif775
endif775:
  %..796 = load %.struct7** %this
  %..797 = getelementptr inbounds %.struct7* %..796, i32 0, i32 0
  %..798 = load double* %..797
  %..799 = sitofp i64 0 to double
  %..1569 = fcmp olt double %..798, %..799
  %..795 = zext i1 %..1569 to i64
  %..794 = bitcast i64 %..795 to i64
  %reg_1570 = icmp ne i64 %..794, 0
  br i1 %reg_1570, label %ok789, label %else790
ok789:
  %..801 = load %.struct7** %this
  %..802 = sitofp i64 5 to double
  %..804 = getelementptr inbounds %.struct7* %..801, i32 0, i32 0
  store double %..802, double* %..804
  br label %else791
else791:
  br label %endif792
else790:
  %..812 = load %.struct7** %this
  %..813 = getelementptr inbounds %.struct7* %..812, i32 0, i32 0
  %..814 = load double* %..813
  %..815 = sitofp i64 465 to double
  %..1571 = fcmp ogt double %..814, %..815
  %..811 = zext i1 %..1571 to i64
  %..810 = bitcast i64 %..811 to i64
  %reg_1572 = icmp ne i64 %..810, 0
  br i1 %reg_1572, label %ok805, label %else806
ok805:
  %..817 = load %.struct7** %this
  %..818 = sitofp i64 460 to double
  %..822 = getelementptr inbounds %.struct7* %..817, i32 0, i32 0
  store double %..818, double* %..822
  br label %else807
else807:
  br label %endif808
else806:
  ; void
  br label %endif809
endif809:
  br label %endif808
endif808:
  br label %endif793
endif793:
  br label %endif792
endif792:
  %..830 = load %.struct7** %this
  %..831 = getelementptr inbounds %.struct7* %..830, i32 0, i32 1
  %..832 = load double* %..831
  %..833 = sitofp i64 0 to double
  %..1573 = fcmp olt double %..832, %..833
  %..829 = zext i1 %..1573 to i64
  %..828 = bitcast i64 %..829 to i64
  %reg_1574 = icmp ne i64 %..828, 0
  br i1 %reg_1574, label %ok823, label %else824
ok823:
  %..835 = load %.struct7** %this
  %..836 = sitofp i64 5 to double
  %..838 = getelementptr inbounds %.struct7* %..835, i32 0, i32 1
  store double %..836, double* %..838
  br label %else825
else825:
  br label %endif826
else824:
  %..846 = load %.struct7** %this
  %..847 = getelementptr inbounds %.struct7* %..846, i32 0, i32 1
  %..848 = load double* %..847
  %..849 = sitofp i64 465 to double
  %..1575 = fcmp ogt double %..848, %..849
  %..845 = zext i1 %..1575 to i64
  %..844 = bitcast i64 %..845 to i64
  %reg_1576 = icmp ne i64 %..844, 0
  br i1 %reg_1576, label %ok839, label %else840
ok839:
  %..851 = load %.struct7** %this
  %..852 = sitofp i64 460 to double
  %..856 = getelementptr inbounds %.struct7* %..851, i32 0, i32 1
  store double %..852, double* %..856
  br label %else841
else841:
  br label %endif842
else840:
  ; void
  br label %endif843
endif843:
  br label %endif842
endif842:
  br label %endif827
endif827:
  br label %endif826
endif826:
  br label %leave677
leave677:
  ret void
}
define %.struct4* @newEnemy() nounwind ssp {
entry:
  %..retVal = alloca %.struct4*
  %this = alloca %.struct4*
  %..858 = call i8* @malloc(i64 72) nounwind ssp
  %..859 = bitcast i8* %..858 to %.struct4*
  %..860 = bitcast %.struct4* %..859 to %.struct4*
  store %.struct4* %..860, %.struct4** %this
  %..861 = load %.struct4** %this
  %..862 = sitofp i64 5 to double
  %..864 = getelementptr inbounds %.struct4* %..861, i32 0, i32 3
  store double %..862, double* %..864
  %..865 = load %.struct4** %this
  %..866 = sitofp i64 0 to double
  %..868 = getelementptr inbounds %.struct4* %..865, i32 0, i32 4
  store double %..866, double* %..868
  %..869 = load %.struct4** %this
  %..871 = getelementptr inbounds %.struct4* %..869, i32 0, i32 5
  store double 0x3fa999999999999a, double* %..871
  %..872 = load %.struct4** %this
  %..873 = sitofp i64 0 to double
  %..875 = getelementptr inbounds %.struct4* %..872, i32 0, i32 9
  store double %..873, double* %..875
  %..876 = load %.struct4** %this
  %..878 = getelementptr inbounds %.struct4* %..876, i32 0, i32 2
  store i32 1, i32* %..878
  %..879 = load %.struct4** %this
  br label %leave857
leave857:
  store %.struct4* %..879, %.struct4** %..retVal
  br label %..leave
..leave:
  %..1577 = load %.struct4** %..retVal
  ret %.struct4* %..1577
}
define void @Enemy_draw(%.struct4* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  ; void
  br label %leave880
leave880:
  ret void
}
define void @Enemy_init(%.struct4* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %..882 = load %.struct4** %this
  %..883 = load double* %x
  %..884 = getelementptr inbounds %.struct4* %..882, i32 0, i32 0
  store double %..883, double* %..884
  %..885 = load %.struct4** %this
  %..886 = load double* %y
  %..887 = getelementptr inbounds %.struct4* %..885, i32 0, i32 1
  store double %..886, double* %..887
  %..888 = load %.struct4** %this
  %..892 = load double* %y
  %..893 = load %.struct7** @ship
  %..894 = getelementptr inbounds %.struct7* %..893, i32 0, i32 1
  %..895 = load double* %..894
  %..891 = fsub double %..892, %..895
  %..897 = load double* %x
  %..898 = load %.struct7** @ship
  %..899 = getelementptr inbounds %.struct7* %..898, i32 0, i32 0
  %..900 = load double* %..899
  %..896 = fsub double %..897, %..900
  %..890 = fdiv double %..891, %..896
  %..889 = call double @atan(double %..890) nounwind ssp
  %..901 = getelementptr inbounds %.struct4* %..888, i32 0, i32 4
  store double %..889, double* %..901
  %..902 = load %.struct4** %this
  %..904 = getelementptr inbounds %.struct4* %..902, i32 0, i32 2
  store i32 0, i32* %..904
  %..905 = load %.struct4** %this
  %..906 = getelementptr inbounds %.struct4* %..905, i32 0, i32 6
  store void(%.struct4*)* @Enemy_move1, void(%.struct4*)** %..906
  br label %leave881
leave881:
  ret void
}
define double @Enemy_moveBody(%.struct4* %this.v) nounwind ssp {
entry:
  %..retVal = alloca double
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %rad2 = alloca double
  %..910 = load %.struct7** @ship
  %..911 = getelementptr inbounds %.struct7* %..910, i32 0, i32 1
  %..912 = load double* %..911
  %..913 = load %.struct4** %this
  %..914 = getelementptr inbounds %.struct4* %..913, i32 0, i32 1
  %..915 = load double* %..914
  %..909 = fsub double %..912, %..915
  %..917 = load %.struct7** @ship
  %..918 = getelementptr inbounds %.struct7* %..917, i32 0, i32 0
  %..919 = load double* %..918
  %..920 = load %.struct4** %this
  %..921 = getelementptr inbounds %.struct4* %..920, i32 0, i32 0
  %..922 = load double* %..921
  %..916 = fsub double %..919, %..922
  %..908 = call double @atan2(double %..909, double %..916) nounwind ssp
  store double %..908, double* %rad2
  %..932 = load %.struct4** %this
  %..933 = getelementptr inbounds %.struct4* %..932, i32 0, i32 4
  %..934 = load double* %..933
  %..935 = load double* %rad2
  %..931 = fsub double %..934, %..935
  %..930 = call double @normalRad(double %..931) nounwind ssp
  %..936 = sitofp i64 0 to double
  %..1578 = fcmp olt double %..930, %..936
  %..929 = zext i1 %..1578 to i64
  %..928 = bitcast i64 %..929 to i64
  %reg_1579 = icmp ne i64 %..928, 0
  br i1 %reg_1579, label %ok923, label %else924
ok923:
  %..938 = load %.struct4** %this
  %..940 = load %.struct4** %this
  %..941 = getelementptr inbounds %.struct4* %..940, i32 0, i32 4
  %..942 = load double* %..941
  %..943 = load %.struct4** %this
  %..944 = getelementptr inbounds %.struct4* %..943, i32 0, i32 5
  %..945 = load double* %..944
  %..939 = fadd double %..942, %..945
  %..946 = getelementptr inbounds %.struct4* %..938, i32 0, i32 4
  store double %..939, double* %..946
  br label %else925
else925:
  br label %endif926
else924:
  %..947 = load %.struct4** %this
  %..949 = load %.struct4** %this
  %..950 = getelementptr inbounds %.struct4* %..949, i32 0, i32 4
  %..951 = load double* %..950
  %..952 = load %.struct4** %this
  %..953 = getelementptr inbounds %.struct4* %..952, i32 0, i32 5
  %..954 = load double* %..953
  %..948 = fsub double %..951, %..954
  %..955 = getelementptr inbounds %.struct4* %..947, i32 0, i32 4
  store double %..948, double* %..955
  br label %endif927
endif927:
  br label %endif926
endif926:
  %..956 = phi double [%..939, %else925], [%..948, %endif927]
  %..957 = load %.struct4** %this
  %..959 = load %.struct4** %this
  %..960 = getelementptr inbounds %.struct4* %..959, i32 0, i32 4
  %..961 = load double* %..960
  %..958 = call double @normalRad(double %..961) nounwind ssp
  %..962 = getelementptr inbounds %.struct4* %..957, i32 0, i32 4
  store double %..958, double* %..962
  %..963 = load %.struct4** %this
  %..965 = load %.struct4** %this
  %..966 = getelementptr inbounds %.struct4* %..965, i32 0, i32 0
  %..967 = load double* %..966
  %..970 = load %.struct4** %this
  %..971 = getelementptr inbounds %.struct4* %..970, i32 0, i32 4
  %..972 = load double* %..971
  %..969 = call double @cos(double %..972) nounwind ssp
  %..973 = load %.struct4** %this
  %..974 = getelementptr inbounds %.struct4* %..973, i32 0, i32 3
  %..975 = load double* %..974
  %..968 = fmul double %..969, %..975
  %..964 = fadd double %..967, %..968
  %..976 = getelementptr inbounds %.struct4* %..963, i32 0, i32 0
  store double %..964, double* %..976
  %..977 = load %.struct4** %this
  %..979 = load %.struct4** %this
  %..980 = getelementptr inbounds %.struct4* %..979, i32 0, i32 1
  %..981 = load double* %..980
  %..984 = load %.struct4** %this
  %..985 = getelementptr inbounds %.struct4* %..984, i32 0, i32 4
  %..986 = load double* %..985
  %..983 = call double @sin(double %..986) nounwind ssp
  %..987 = load %.struct4** %this
  %..988 = getelementptr inbounds %.struct4* %..987, i32 0, i32 3
  %..989 = load double* %..988
  %..982 = fmul double %..983, %..989
  %..978 = fadd double %..981, %..982
  %..990 = getelementptr inbounds %.struct4* %..977, i32 0, i32 1
  store double %..978, double* %..990
  %..998 = load %.struct4** %this
  %..999 = getelementptr inbounds %.struct4* %..998, i32 0, i32 0
  %..1000 = load double* %..999
  %..1001 = sitofp i64 0 to double
  %..1580 = fcmp olt double %..1000, %..1001
  %..997 = zext i1 %..1580 to i64
  %..996 = bitcast i64 %..997 to i64
  %reg_1581 = icmp ne i64 %..996, 0
  br i1 %reg_1581, label %ok991, label %else992
ok991:
  %..1003 = load %.struct4** %this
  %..1004 = sitofp i64 5 to double
  %..1006 = getelementptr inbounds %.struct4* %..1003, i32 0, i32 0
  store double %..1004, double* %..1006
  br label %else993
else993:
  br label %endif994
else992:
  %..1014 = load %.struct4** %this
  %..1015 = getelementptr inbounds %.struct4* %..1014, i32 0, i32 0
  %..1016 = load double* %..1015
  %..1017 = sitofp i64 465 to double
  %..1582 = fcmp ogt double %..1016, %..1017
  %..1013 = zext i1 %..1582 to i64
  %..1012 = bitcast i64 %..1013 to i64
  %reg_1583 = icmp ne i64 %..1012, 0
  br i1 %reg_1583, label %ok1007, label %else1008
ok1007:
  %..1019 = load %.struct4** %this
  %..1020 = sitofp i64 460 to double
  %..1024 = getelementptr inbounds %.struct4* %..1019, i32 0, i32 0
  store double %..1020, double* %..1024
  br label %else1009
else1009:
  br label %endif1010
else1008:
  ; void
  br label %endif1011
endif1011:
  br label %endif1010
endif1010:
  br label %endif995
endif995:
  br label %endif994
endif994:
  %..1032 = load %.struct4** %this
  %..1033 = getelementptr inbounds %.struct4* %..1032, i32 0, i32 1
  %..1034 = load double* %..1033
  %..1035 = sitofp i64 0 to double
  %..1584 = fcmp olt double %..1034, %..1035
  %..1031 = zext i1 %..1584 to i64
  %..1030 = bitcast i64 %..1031 to i64
  %reg_1585 = icmp ne i64 %..1030, 0
  br i1 %reg_1585, label %ok1025, label %else1026
ok1025:
  %..1037 = load %.struct4** %this
  %..1038 = sitofp i64 5 to double
  %..1040 = getelementptr inbounds %.struct4* %..1037, i32 0, i32 1
  store double %..1038, double* %..1040
  br label %else1027
else1027:
  br label %endif1028
else1026:
  %..1048 = load %.struct4** %this
  %..1049 = getelementptr inbounds %.struct4* %..1048, i32 0, i32 1
  %..1050 = load double* %..1049
  %..1051 = sitofp i64 465 to double
  %..1586 = fcmp ogt double %..1050, %..1051
  %..1047 = zext i1 %..1586 to i64
  %..1046 = bitcast i64 %..1047 to i64
  %reg_1587 = icmp ne i64 %..1046, 0
  br i1 %reg_1587, label %ok1041, label %else1042
ok1041:
  %..1053 = load %.struct4** %this
  %..1054 = sitofp i64 460 to double
  %..1058 = getelementptr inbounds %.struct4* %..1053, i32 0, i32 1
  store double %..1054, double* %..1058
  br label %else1043
else1043:
  br label %endif1044
else1042:
  ; void
  br label %endif1045
endif1045:
  br label %endif1044
endif1044:
  br label %endif1029
endif1029:
  br label %endif1028
endif1028:
  %..1059 = load double* %rad2
  store double %..1059, double* %..retVal
  br label %..leave
ret1060:
  br label %leave907
leave907:
  store double %..1059, double* %..retVal
  br label %..leave
..leave:
  %..1588 = load double* %..retVal
  ret double %..1588
}
define void @Enemy_wait(%.struct4* %this.v, i32 %w.v, void(%.struct4*)* %next.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %w = alloca i32
  store i32 %w.v, i32* %w
  %next = alloca void(%.struct4*)*
  store void(%.struct4*)* %next.v, void(%.struct4*)** %next
  %..1062 = load %.struct4** %this
  %..1063 = load i32* %w
  %..1064 = getelementptr inbounds %.struct4* %..1062, i32 0, i32 8
  store i32 %..1063, i32* %..1064
  %..1065 = load %.struct4** %this
  %..1066 = getelementptr inbounds %.struct4* %..1065, i32 0, i32 6
  store void(%.struct4*)* @Enemy_moveWait, void(%.struct4*)** %..1066
  %..1067 = load %.struct4** %this
  %..1068 = getelementptr inbounds %.struct4* %..1067, i32 0, i32 7
  store void(%.struct4*)* %next, void(%.struct4*)** %..1068
  br label %leave1061
leave1061:
  ret void
}
define void @Enemy_moveWait(%.struct4* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %..1071 = load %.struct4** %this
  %..1070 = call double @Enemy_moveBody(%.struct4* %..1071) nounwind ssp
  %..1072 = load %.struct4** %this
  %..1076 = load %.struct4** %this
  %..1077 = getelementptr inbounds %.struct4* %..1076, i32 0, i32 8
  %..1078 = load i32* %..1077
  %..1075 = zext i32 %..1078 to i64
  %..1074 = sub i64 %..1075, 1
  %..1073 = trunc i64 %..1074 to i32
  %..1080 = getelementptr inbounds %.struct4* %..1072, i32 0, i32 8
  store i32 %..1073, i32* %..1080
  %..1089 = load %.struct4** %this
  %..1090 = getelementptr inbounds %.struct4* %..1089, i32 0, i32 8
  %..1091 = load i32* %..1090
  %..1088 = zext i32 %..1091 to i64
  %..1589 = icmp sle i64 %..1088, 0
  %..1087 = zext i1 %..1589 to i64
  %..1086 = bitcast i64 %..1087 to i64
  %reg_1590 = icmp ne i64 %..1086, 0
  br i1 %reg_1590, label %ok1081, label %else1082
ok1081:
  %..1093 = load %.struct4** %this
  %..1094 = load %.struct4** %this
  %..1095 = getelementptr inbounds %.struct4* %..1094, i32 0, i32 7
  %..1096 = getelementptr inbounds %.struct4* %..1093, i32 0, i32 6
  store void(%.struct4*)** %..1095, void(%.struct4*)** %..1096
  br label %else1083
else1083:
  br label %endif1084
else1082:
  ; void
  br label %endif1085
endif1085:
  br label %endif1084
endif1084:
  br label %leave1069
leave1069:
  ret void
}
define void @Enemy_move1(%.struct4* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %r = alloca double
  %..1099 = load %.struct4** %this
  %..1098 = call double @Enemy_moveBody(%.struct4* %..1099) nounwind ssp
  store double %..1098, double* %r
  %..1107 = call double @random() nounwind ssp
  %..1591 = fcmp ogt double %..1107, 0x3fe999999999999a
  %..1106 = zext i1 %..1591 to i64
  %..1105 = bitcast i64 %..1106 to i64
  %reg_1592 = icmp ne i64 %..1105, 0
  br i1 %reg_1592, label %ok1100, label %else1101
ok1100:
  %..1110 = load %.struct4** %this
  %..1111 = getelementptr inbounds %.struct4* %..1110, i32 0, i32 0
  %..1112 = load double* %..1111
  %..1113 = load %.struct4** %this
  %..1114 = getelementptr inbounds %.struct4* %..1113, i32 0, i32 1
  %..1115 = load double* %..1114
  %..1116 = load %.struct4** %this
  %..1117 = getelementptr inbounds %.struct4* %..1116, i32 0, i32 5
  %..1118 = load double* %..1117
  call void @addBullet(double %..1112, double %..1115, double %..1118) nounwind ssp
  %..1126 = call double @random() nounwind ssp
  %..1593 = fcmp ogt double %..1126, 0x3fe999999999999a
  %..1125 = zext i1 %..1593 to i64
  %..1124 = bitcast i64 %..1125 to i64
  %reg_1594 = icmp ne i64 %..1124, 0
  br i1 %reg_1594, label %ok1119, label %else1120
ok1119:
  %..1128 = load %.struct4** %this
  %..1129 = sitofp i64 0 to double
  %..1131 = getelementptr inbounds %.struct4* %..1128, i32 0, i32 9
  store double %..1129, double* %..1131
  %..1133 = load %.struct4** %this
  call void @Enemy_wait(%.struct4* %..1133, i32 30, void(%.struct4*)* @Enemy_move2) nounwind ssp
  br label %else1121
else1121:
  br label %endif1122
else1120:
  ; void
  br label %endif1123
endif1123:
  br label %endif1122
endif1122:
  br label %else1102
else1102:
  br label %endif1103
else1101:
  ; void
  br label %endif1104
endif1104:
  br label %endif1103
endif1103:
  br label %leave1097
leave1097:
  ret void
}
define void @Enemy_move2(%.struct4* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct4*
  store %.struct4* %this.v, %.struct4** %this
  %r = alloca double
  %..1137 = load %.struct4** %this
  %..1136 = call double @Enemy_moveBody(%.struct4* %..1137) nounwind ssp
  store double %..1136, double* %r
  %rr = alloca i32
  %..1141 = call double @random() nounwind ssp
  %..1140 = fmul double %..1141, 0x4014000000000000
  %..1139 = fadd double %..1140, 0x3ff0000000000000
  %..1138 = fptosi double %..1139 to i32
  store i32 %..1138, i32* %rr
  %..1145 = load %.struct4** %this
  %..1146 = getelementptr inbounds %.struct4* %..1145, i32 0, i32 0
  %..1147 = load double* %..1146
  %..1148 = load %.struct4** %this
  %..1149 = getelementptr inbounds %.struct4* %..1148, i32 0, i32 1
  %..1150 = load double* %..1149
  %..1152 = load double* %r
  %..1153 = load %.struct4** %this
  %..1154 = getelementptr inbounds %.struct4* %..1153, i32 0, i32 9
  %..1155 = load double* %..1154
  %..1151 = fadd double %..1152, %..1155
  %..1156 = load i32* %rr
  call void @addBulletN(double %..1147, double %..1150, double %..1151, i32 %..1156, double 0x3fb999999999999a) nounwind ssp
  %..1158 = load %.struct4** %this
  %..1160 = load %.struct4** %this
  %..1161 = getelementptr inbounds %.struct4* %..1160, i32 0, i32 9
  %..1162 = load double* %..1161
  %..1165 = load i32* %rr
  %..1166 = fptosi double 0x3fb999999999999a to i32
  %..1164 = mul i32 %..1165, %..1166
  %..1163 = sitofp i32 %..1164 to double
  %..1159 = fadd double %..1162, %..1163
  %..1168 = getelementptr inbounds %.struct4* %..1158, i32 0, i32 9
  store double %..1159, double* %..1168
  %..1176 = call double @random() nounwind ssp
  %..1595 = fcmp olt double %..1176, 0x3f9eb851eb851eb8
  %..1175 = zext i1 %..1595 to i64
  %..1174 = bitcast i64 %..1175 to i64
  %reg_1596 = icmp ne i64 %..1174, 0
  br i1 %reg_1596, label %ok1169, label %else1170
ok1169:
  %..1179 = load %.struct4** %this
  call void @Enemy_wait(%.struct4* %..1179, i32 60, void(%.struct4*)* @Enemy_move1) nounwind ssp
  br label %else1171
else1171:
  br label %endif1172
else1170:
  ; void
  br label %endif1173
endif1173:
  br label %endif1172
endif1172:
  br label %leave1135
leave1135:
  ret void
}
@PI= global double 0x400921fafc8b007a
define double @normalRad(double %v.v) nounwind ssp {
entry:
  %..retVal = alloca double
  %v = alloca double
  store double %v.v, double* %v
  %..1183 = load double* %v
  %..1185 = fmul double 0x4000000000000000, 0x400921fafc8b007a
  %..1196 = load double* %v
  %..1597 = fcmp ogt double %..1196, 0x400921fafc8b007a
  %..1195 = zext i1 %..1597 to i64
  %..1194 = bitcast i64 %..1195 to i64
  %reg_1598 = icmp ne i64 %..1194, 0
  br i1 %reg_1598, label %ok1189, label %else1190
ok1189:
  br label %else1191
else1191:
  br label %endif1192
else1190:
  %..1206 = load double* %v
  %..1207 = fsub double 0.0, 0x400921fafc8b007a
  %..1599 = fcmp olt double %..1206, %..1207
  %..1205 = zext i1 %..1599 to i64
  %..1204 = bitcast i64 %..1205 to i64
  %reg_1600 = icmp ne i64 %..1204, 0
  br i1 %reg_1600, label %ok1199, label %else1200
ok1199:
  br label %else1201
else1201:
  br label %endif1202
else1200:
  br label %endif1203
endif1203:
  br label %endif1202
endif1202:
  %..1211 = phi i64 [1, %else1201], [0, %endif1203]
  br label %endif1193
endif1193:
  br label %endif1192
endif1192:
  %..1212 = phi i64 [-1, %else1191], [%..1211, %endif1193]
  %..1188 = sitofp i64 %..1212 to double
  %..1184 = fmul double %..1185, %..1188
  %..1182 = fadd double %..1183, %..1184
  br label %leave1181
leave1181:
  store double %..1182, double* %..retVal
  br label %..leave
..leave:
  %..1601 = load double* %..retVal
  ret double %..1601
}
define %.struct8* @newParticle() nounwind ssp {
entry:
  %..retVal = alloca %.struct8*
  %this = alloca %.struct8*
  %..1214 = call i8* @malloc(i64 36) nounwind ssp
  %..1215 = bitcast i8* %..1214 to %.struct8*
  %..1216 = bitcast %.struct8* %..1215 to %.struct8*
  store %.struct8* %..1216, %.struct8** %this
  %..1217 = load %.struct8** %this
  %..1218 = sitofp i64 5 to double
  %..1220 = getelementptr inbounds %.struct8* %..1217, i32 0, i32 3
  store double %..1218, double* %..1220
  %..1221 = load %.struct8** %this
  %..1223 = getelementptr inbounds %.struct8* %..1221, i32 0, i32 2
  store i32 1, i32* %..1223
  %..1224 = load %.struct8** %this
  br label %leave1213
leave1213:
  store %.struct8* %..1224, %.struct8** %..retVal
  br label %..leave
..leave:
  %..1602 = load %.struct8** %..retVal
  ret %.struct8* %..1602
}
define void @Particle_init(%.struct8* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %..1226 = load %.struct8** %this
  %..1227 = load double* %x
  %..1228 = getelementptr inbounds %.struct8* %..1226, i32 0, i32 0
  store double %..1227, double* %..1228
  %..1229 = load %.struct8** %this
  %..1230 = load double* %y
  %..1231 = getelementptr inbounds %.struct8* %..1229, i32 0, i32 1
  store double %..1230, double* %..1231
  %..1232 = load %.struct8** %this
  %..1233 = load double* %rad
  %..1234 = getelementptr inbounds %.struct8* %..1232, i32 0, i32 4
  store double %..1233, double* %..1234
  %..1235 = load %.struct8** %this
  %..1237 = getelementptr inbounds %.struct8* %..1235, i32 0, i32 2
  store i32 0, i32* %..1237
  %..1238 = load %.struct8** %this
  %..1241 = call double @random() nounwind ssp
  %..1242 = sitofp i64 50 to double
  %..1240 = fmul double %..1241, %..1242
  %..1244 = sitofp i64 10 to double
  %..1239 = fadd double %..1240, %..1244
  %..1246 = getelementptr inbounds %.struct8* %..1238, i32 0, i32 3
  store double %..1239, double* %..1246
  br label %leave1225
leave1225:
  ret void
}
define void @Particle_draw(%.struct8* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  ; void
  br label %leave1247
leave1247:
  ret void
}
define i32 @Particle_move(%.struct8* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  %..1249 = load %.struct8** %this
  %..1251 = load %.struct8** %this
  %..1252 = getelementptr inbounds %.struct8* %..1251, i32 0, i32 0
  %..1253 = load double* %..1252
  %..1256 = load %.struct8** %this
  %..1257 = getelementptr inbounds %.struct8* %..1256, i32 0, i32 4
  %..1258 = load double* %..1257
  %..1255 = call double @cos(double %..1258) nounwind ssp
  %..1259 = load %.struct8** %this
  %..1260 = getelementptr inbounds %.struct8* %..1259, i32 0, i32 3
  %..1261 = load double* %..1260
  %..1254 = fmul double %..1255, %..1261
  %..1250 = fadd double %..1253, %..1254
  %..1262 = getelementptr inbounds %.struct8* %..1249, i32 0, i32 0
  store double %..1250, double* %..1262
  %..1263 = load %.struct8** %this
  %..1265 = load %.struct8** %this
  %..1266 = getelementptr inbounds %.struct8* %..1265, i32 0, i32 1
  %..1267 = load double* %..1266
  %..1270 = load %.struct8** %this
  %..1271 = getelementptr inbounds %.struct8* %..1270, i32 0, i32 4
  %..1272 = load double* %..1271
  %..1269 = call double @sin(double %..1272) nounwind ssp
  %..1273 = load %.struct8** %this
  %..1274 = getelementptr inbounds %.struct8* %..1273, i32 0, i32 3
  %..1275 = load double* %..1274
  %..1268 = fmul double %..1269, %..1275
  %..1264 = fadd double %..1267, %..1268
  %..1276 = getelementptr inbounds %.struct8* %..1263, i32 0, i32 1
  store double %..1264, double* %..1276
  %..1287 = load %.struct8** %this
  %..1288 = getelementptr inbounds %.struct8* %..1287, i32 0, i32 0
  %..1289 = load double* %..1288
  %..1290 = sitofp i64 0 to double
  %..1603 = fcmp olt double %..1289, %..1290
  %..1286 = zext i1 %..1603 to i64
  %..1293 = sitofp i64 465 to double
  %..1295 = load %.struct8** %this
  %..1296 = getelementptr inbounds %.struct8* %..1295, i32 0, i32 0
  %..1297 = load double* %..1296
  %..1604 = fcmp olt double %..1293, %..1297
  %..1292 = zext i1 %..1604 to i64
  %..1285 = or i64 %..1286, %..1292
  %..1299 = load %.struct8** %this
  %..1300 = getelementptr inbounds %.struct8* %..1299, i32 0, i32 1
  %..1301 = load double* %..1300
  %..1302 = sitofp i64 0 to double
  %..1605 = fcmp olt double %..1301, %..1302
  %..1298 = zext i1 %..1605 to i64
  %..1284 = or i64 %..1285, %..1298
  %..1305 = sitofp i64 465 to double
  %..1307 = load %.struct8** %this
  %..1308 = getelementptr inbounds %.struct8* %..1307, i32 0, i32 1
  %..1309 = load double* %..1308
  %..1606 = fcmp olt double %..1305, %..1309
  %..1304 = zext i1 %..1606 to i64
  %..1283 = or i64 %..1284, %..1304
  %..1282 = bitcast i64 %..1283 to i64
  %reg_1607 = icmp ne i64 %..1282, 0
  br i1 %reg_1607, label %ok1277, label %else1278
ok1277:
  %..1310 = load %.struct8** %this
  %..1312 = getelementptr inbounds %.struct8* %..1310, i32 0, i32 2
  store i32 1, i32* %..1312
  br label %else1279
else1279:
  br label %endif1280
else1278:
  ; void
  br label %endif1281
endif1281:
  br label %endif1280
endif1280:
  %..1313 = load %.struct8** %this
  %..1314 = getelementptr inbounds %.struct8* %..1313, i32 0, i32 2
  %..1315 = load i32* %..1314
  br label %leave1248
leave1248:
  store i32 %..1315, i32* %..retVal
  br label %..leave
..leave:
  %..1608 = load i32* %..retVal
  ret i32 %..1608
}
define %.struct8* @newBullet() nounwind ssp {
entry:
  %..retVal = alloca %.struct8*
  %this = alloca %.struct8*
  %..1317 = call i8* @malloc(i64 36) nounwind ssp
  %..1318 = bitcast i8* %..1317 to %.struct8*
  %..1319 = bitcast %.struct8* %..1318 to %.struct8*
  store %.struct8* %..1319, %.struct8** %this
  %..1320 = load %.struct8** %this
  %..1322 = getelementptr inbounds %.struct8* %..1320, i32 0, i32 2
  store i32 1, i32* %..1322
  %..1323 = load %.struct8** %this
  %..1324 = sitofp i64 10 to double
  %..1326 = getelementptr inbounds %.struct8* %..1323, i32 0, i32 3
  store double %..1324, double* %..1326
  %..1327 = load %.struct8** %this
  br label %leave1316
leave1316:
  store %.struct8* %..1327, %.struct8** %..retVal
  br label %..leave
..leave:
  %..1609 = load %.struct8** %..retVal
  ret %.struct8* %..1609
}
define void @Bullet_init(%.struct8* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %..1329 = load %.struct8** %this
  %..1330 = load double* %x
  %..1331 = getelementptr inbounds %.struct8* %..1329, i32 0, i32 0
  store double %..1330, double* %..1331
  %..1332 = load %.struct8** %this
  %..1333 = load double* %y
  %..1334 = getelementptr inbounds %.struct8* %..1332, i32 0, i32 1
  store double %..1333, double* %..1334
  %..1335 = load %.struct8** %this
  %..1336 = load double* %rad
  %..1337 = getelementptr inbounds %.struct8* %..1335, i32 0, i32 4
  store double %..1336, double* %..1337
  %..1338 = load %.struct8** %this
  %..1340 = getelementptr inbounds %.struct8* %..1338, i32 0, i32 2
  store i32 0, i32* %..1340
  br label %leave1328
leave1328:
  ret void
}
define void @Bullet_draw(%.struct8* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  ; void
  br label %leave1341
leave1341:
  ret void
}
define i32 @Bullet_move(%.struct8* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct8*
  store %.struct8* %this.v, %.struct8** %this
  %..1343 = load %.struct8** %this
  %..1345 = load %.struct8** %this
  %..1346 = getelementptr inbounds %.struct8* %..1345, i32 0, i32 0
  %..1347 = load double* %..1346
  %..1350 = load %.struct8** %this
  %..1351 = getelementptr inbounds %.struct8* %..1350, i32 0, i32 4
  %..1352 = load double* %..1351
  %..1349 = call double @cos(double %..1352) nounwind ssp
  %..1353 = load %.struct8** %this
  %..1354 = getelementptr inbounds %.struct8* %..1353, i32 0, i32 3
  %..1355 = load double* %..1354
  %..1348 = fmul double %..1349, %..1355
  %..1344 = fadd double %..1347, %..1348
  %..1356 = getelementptr inbounds %.struct8* %..1343, i32 0, i32 0
  store double %..1344, double* %..1356
  %..1357 = load %.struct8** %this
  %..1359 = load %.struct8** %this
  %..1360 = getelementptr inbounds %.struct8* %..1359, i32 0, i32 1
  %..1361 = load double* %..1360
  %..1364 = load %.struct8** %this
  %..1365 = getelementptr inbounds %.struct8* %..1364, i32 0, i32 4
  %..1366 = load double* %..1365
  %..1363 = call double @sin(double %..1366) nounwind ssp
  %..1367 = load %.struct8** %this
  %..1368 = getelementptr inbounds %.struct8* %..1367, i32 0, i32 3
  %..1369 = load double* %..1368
  %..1362 = fmul double %..1363, %..1369
  %..1358 = fadd double %..1361, %..1362
  %..1370 = getelementptr inbounds %.struct8* %..1357, i32 0, i32 1
  store double %..1358, double* %..1370
  %..1381 = load %.struct8** %this
  %..1382 = getelementptr inbounds %.struct8* %..1381, i32 0, i32 0
  %..1383 = load double* %..1382
  %..1384 = sitofp i64 0 to double
  %..1610 = fcmp olt double %..1383, %..1384
  %..1380 = zext i1 %..1610 to i64
  %..1387 = sitofp i64 465 to double
  %..1389 = load %.struct8** %this
  %..1390 = getelementptr inbounds %.struct8* %..1389, i32 0, i32 0
  %..1391 = load double* %..1390
  %..1611 = fcmp olt double %..1387, %..1391
  %..1386 = zext i1 %..1611 to i64
  %..1379 = or i64 %..1380, %..1386
  %..1393 = load %.struct8** %this
  %..1394 = getelementptr inbounds %.struct8* %..1393, i32 0, i32 1
  %..1395 = load double* %..1394
  %..1396 = sitofp i64 0 to double
  %..1612 = fcmp olt double %..1395, %..1396
  %..1392 = zext i1 %..1612 to i64
  %..1378 = or i64 %..1379, %..1392
  %..1399 = sitofp i64 465 to double
  %..1401 = load %.struct8** %this
  %..1402 = getelementptr inbounds %.struct8* %..1401, i32 0, i32 1
  %..1403 = load double* %..1402
  %..1613 = fcmp olt double %..1399, %..1403
  %..1398 = zext i1 %..1613 to i64
  %..1377 = or i64 %..1378, %..1398
  %..1376 = bitcast i64 %..1377 to i64
  %reg_1614 = icmp ne i64 %..1376, 0
  br i1 %reg_1614, label %ok1371, label %else1372
ok1371:
  %..1404 = load %.struct8** %this
  %..1406 = getelementptr inbounds %.struct8* %..1404, i32 0, i32 2
  store i32 1, i32* %..1406
  br label %else1373
else1373:
  br label %endif1374
else1372:
  ; void
  br label %endif1375
endif1375:
  br label %endif1374
endif1374:
  %..1407 = load %.struct8** %this
  %..1408 = getelementptr inbounds %.struct8* %..1407, i32 0, i32 2
  %..1409 = load i32* %..1408
  br label %leave1342
leave1342:
  store i32 %..1409, i32* %..retVal
  br label %..leave
..leave:
  %..1615 = load i32* %..retVal
  ret i32 %..1615
}
define %.struct9* @newShot() nounwind ssp {
entry:
  %..retVal = alloca %.struct9*
  %this = alloca %.struct9*
  %..1411 = call i8* @malloc(i64 44) nounwind ssp
  %..1412 = bitcast i8* %..1411 to %.struct9*
  %..1413 = bitcast %.struct9* %..1412 to %.struct9*
  store %.struct9* %..1413, %.struct9** %this
  %..1414 = load %.struct9** %this
  %..1415 = sitofp i64 25 to double
  %..1417 = getelementptr inbounds %.struct9* %..1414, i32 0, i32 4
  store double %..1415, double* %..1417
  %..1418 = load %.struct9** %this
  %..1420 = getelementptr inbounds %.struct9* %..1418, i32 0, i32 2
  store i32 1, i32* %..1420
  %..1421 = load %.struct9** %this
  br label %leave1410
leave1410:
  store %.struct9* %..1421, %.struct9** %..retVal
  br label %..leave
..leave:
  %..1616 = load %.struct9** %..retVal
  ret %.struct9* %..1616
}
define void @Shot_init(%.struct9* %this.v, double %x.v, double %y.v, double %rad.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  %x = alloca double
  store double %x.v, double* %x
  %y = alloca double
  store double %y.v, double* %y
  %rad = alloca double
  store double %rad.v, double* %rad
  %..1423 = load %.struct9** %this
  %..1424 = load %.struct9** %this
  %..1425 = getelementptr inbounds %.struct9* %..1424, i32 0, i32 0
  %..1426 = load double* %..1425
  %..1427 = getelementptr inbounds %.struct9* %..1423, i32 0, i32 0
  store double %..1426, double* %..1427
  %..1428 = load %.struct9** %this
  %..1429 = load %.struct9** %this
  %..1430 = getelementptr inbounds %.struct9* %..1429, i32 0, i32 1
  %..1431 = load double* %..1430
  %..1432 = getelementptr inbounds %.struct9* %..1428, i32 0, i32 1
  store double %..1431, double* %..1432
  %..1433 = load %.struct9** %this
  %..1434 = load %.struct9** %this
  %..1435 = getelementptr inbounds %.struct9* %..1434, i32 0, i32 5
  %..1436 = load double* %..1435
  %..1437 = getelementptr inbounds %.struct9* %..1433, i32 0, i32 5
  store double %..1436, double* %..1437
  %..1438 = load %.struct9** %this
  %..1440 = getelementptr inbounds %.struct9* %..1438, i32 0, i32 2
  store i32 0, i32* %..1440
  br label %leave1422
leave1422:
  ret void
}
define void @Shot_draw(%.struct9* %this.v) nounwind ssp {
entry:
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  ; void
  br label %leave1441
leave1441:
  ret void
}
define i32 @Shot_move(%.struct9* %this.v) nounwind ssp {
entry:
  %..retVal = alloca i32
  %this = alloca %.struct9*
  store %.struct9* %this.v, %.struct9** %this
  %..1443 = load %.struct9** %this
  %..1445 = load %.struct9** %this
  %..1446 = getelementptr inbounds %.struct9* %..1445, i32 0, i32 0
  %..1447 = load double* %..1446
  %..1450 = load %.struct9** %this
  %..1451 = getelementptr inbounds %.struct9* %..1450, i32 0, i32 5
  %..1452 = load double* %..1451
  %..1449 = call double @cos(double %..1452) nounwind ssp
  %..1453 = load %.struct9** %this
  %..1454 = getelementptr inbounds %.struct9* %..1453, i32 0, i32 4
  %..1455 = load double* %..1454
  %..1448 = fmul double %..1449, %..1455
  %..1444 = fadd double %..1447, %..1448
  %..1456 = getelementptr inbounds %.struct9* %..1443, i32 0, i32 0
  store double %..1444, double* %..1456
  %..1457 = load %.struct9** %this
  %..1459 = load %.struct9** %this
  %..1460 = getelementptr inbounds %.struct9* %..1459, i32 0, i32 1
  %..1461 = load double* %..1460
  %..1464 = load %.struct9** %this
  %..1465 = getelementptr inbounds %.struct9* %..1464, i32 0, i32 5
  %..1466 = load double* %..1465
  %..1463 = call double @sin(double %..1466) nounwind ssp
  %..1467 = load %.struct9** %this
  %..1468 = getelementptr inbounds %.struct9* %..1467, i32 0, i32 4
  %..1469 = load double* %..1468
  %..1462 = fmul double %..1463, %..1469
  %..1458 = fadd double %..1461, %..1462
  %..1470 = getelementptr inbounds %.struct9* %..1457, i32 0, i32 1
  store double %..1458, double* %..1470
  %..1481 = load %.struct9** %this
  %..1482 = getelementptr inbounds %.struct9* %..1481, i32 0, i32 0
  %..1483 = load double* %..1482
  %..1484 = sitofp i64 0 to double
  %..1617 = fcmp olt double %..1483, %..1484
  %..1480 = zext i1 %..1617 to i64
  %..1487 = sitofp i64 465 to double
  %..1489 = load %.struct9** %this
  %..1490 = getelementptr inbounds %.struct9* %..1489, i32 0, i32 0
  %..1491 = load double* %..1490
  %..1618 = fcmp olt double %..1487, %..1491
  %..1486 = zext i1 %..1618 to i64
  %..1479 = or i64 %..1480, %..1486
  %..1493 = load %.struct9** %this
  %..1494 = getelementptr inbounds %.struct9* %..1493, i32 0, i32 1
  %..1495 = load double* %..1494
  %..1496 = sitofp i64 0 to double
  %..1619 = fcmp olt double %..1495, %..1496
  %..1492 = zext i1 %..1619 to i64
  %..1478 = or i64 %..1479, %..1492
  %..1499 = sitofp i64 465 to double
  %..1501 = load %.struct9** %this
  %..1502 = getelementptr inbounds %.struct9* %..1501, i32 0, i32 1
  %..1503 = load double* %..1502
  %..1620 = fcmp olt double %..1499, %..1503
  %..1498 = zext i1 %..1620 to i64
  %..1477 = or i64 %..1478, %..1498
  %..1476 = bitcast i64 %..1477 to i64
  %reg_1621 = icmp ne i64 %..1476, 0
  br i1 %reg_1621, label %ok1471, label %else1472
ok1471:
  %..1504 = load %.struct9** %this
  %..1506 = getelementptr inbounds %.struct9* %..1504, i32 0, i32 2
  store i32 1, i32* %..1506
  br label %else1473
else1473:
  br label %endif1474
else1472:
  ; void
  br label %endif1475
endif1475:
  br label %endif1474
endif1474:
  %..1507 = load %.struct9** %this
  %..1508 = getelementptr inbounds %.struct9* %..1507, i32 0, i32 2
  %..1509 = load i32* %..1508
  br label %leave1442
leave1442:
  store i32 %..1509, i32* %..retVal
  br label %..leave
..leave:
  %..1622 = load i32* %..retVal
  ret i32 %..1622
}
declare void @glutKeyboardFunc(void(i8, i32, i32)*) nounwind
@Shot = external global %.struct6
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
@Bullet = external global %.struct5
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
@Enemy = external global %.struct3
declare void @gluLookAt(double, double, double, double, double, double, double, double, double) nounwind
declare double @atan2(double, double) nounwind
@bool = external global i32
declare void @glutInit(i32*, i8**) nounwind
declare void @glutReshapeWindow(i32, i32) nounwind
@Ship = external global %.struct2
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
@Particle = external global %.struct5
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
@Key = external global %.struct1
