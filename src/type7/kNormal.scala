package type7

import scala.collection.mutable.ArrayBuffer

/**
 * k正規化処理
 *
 * ProgからLLVM疑似命令のリスト(List[LL])に変換します。
 */
object kNormal {

  /** 出力バッファ */
  private var outputBuffer: ArrayBuffer[LL] = null
  /** リターンラベル */
  private var retLabel: String = null
  /** リターン型 */
  private var retT: T = null
  /** ネストしたbreakできる命令のbreakリスト */
  private var breaks = List[String]()
  /** ネストしたcontinueできる命令のcontinueリスト */
  private var continues = List[String]()

  /**
   * エントリポイント
   *
   * @param prog プログラム
   * @return ArrayBuffer[LL] 出力LLVM命令リスト
   */
  def apply(prog: Prog): ArrayBuffer[LL] = {
    outputBuffer = new ArrayBuffer[LL]
    //println(e)
    prog.b.foreach { e => transGlobal(e) }
    outputBuffer
  }

  /**
   * グローバルな式の変換
   *
   * @param e: E 式
   *
   */
  private def transGlobal(e: E) {
    e match {
      case EVar(t, id, e) =>
        llemit.p(t)
        (t, e) match {
          case (t, ELd(_, v)) => add(LLGlobal(RG(t, id), RN(t, "" + v)))
          case (t, ELdd(_, v)) => add(LLGlobal(RG(t, id), RN(t, "" + v)))
          case (t: TStr, v @ ETuple(_, _)) =>
            def p(e: E): String = e match {
              case ELd(_, v) => "" + v
              case ELdd(_, v) => "" + v
              case ETuple(_, ls) => "{" + ls.map { l => llemit.p(l.t) + " " + p(l) }.mkString(", ") + "}"
              case _ => throw new Exception("error expression " + e)
            }
            add(LLGlobal(RG(t, id), RN(t, p(v))))
          case (t, null) => add(LLGlobal(RG(t, id), null))
          case _ => throw new Exception("error")
        }

      case EFun(t, n, p, b) =>
        env.init(p)
        val oldOutputBuf = outputBuffer
        outputBuffer = new ArrayBuffer()
        val ft = if (n == "main" && t == Tv) Ti(32) else t
        if (ft != Tv) {
          env.add(".retVal", ft)
          add(LLAlloca(RL(ft, "..retVal")))
        }
        retLabel = genid("leave")
        breaks = List()
        continues = List()
        for ((id, t) <- p) {
          add(LLAlloca(RL(t, id)))
          add(LLStore(RL(t, id + ".v"), RL(Tp(t), id)))
        }
        val b1 = transLocal(b)
        val r = if (n == "main" && t == Tv) RN(Ti(32), "0") else b1
        add(LLLabel(retLabel, retLabel))
        val fun = LLFun(ft, n, p, env.copy()._1, outputBuffer, r)
        outputBuffer = oldOutputBuf
        add(fun)

      case ETypeDef(t, id) =>
      case _: ENop =>
      case _: EImport =>
      case _ => throw TypeError(e.pos, "error global value " + e)
    }
  }

  /**
   * LL出力
   * 
   * @param a: LL LLVM命令
   */
  private def add(a: LL) {
    outputBuffer += a
  }

  /**
   * RにTを設定
   *
   * @param a: R レジスタ
   * @param t: T 型
   * @return R 返り値レジスタ
   */
  def setT(a: R, t: T): R = {
    a match {
      case a: RL => a.copy(t)
      case a: RG => a.copy(t)
      case a: RR => a.copy(t)
      case a: RN => a.copy(t)
    }
  }

  /**
   * 型の種類を "p" "a" "" で返却
   *
   * @param t: T 型
   * @return String 型種別文字列
   */
  def tName2(t: T): String = {
    t match {
      case TDef(id) => tName2(env.find(id))
      case _: TArr => "p"
      case _: TStr => "p"
      case _: TFun => "p"
      case _: Tp => "a"
      case _: Tr => "a"
      case _ => ""
    }
  }
  
  /**
   * ローカルレジスタ生成
   *
   * @param t: T 型
   * @return R ローカルレジスタ
   */
  def genRL(t: T): R = {
    RL(t, genid(".."))
  }

  /**
   * LL出力処理
   *
   * eを受け取り、LL出力処理での返り値がある場合はRとして返却する。
   * ネストした式が平たくなります。
   *
   * @param e: E 式
   * @return R 返り値レジスタ
   */
  private def transLocal(e: E): R = {
    //add(LLNop("f " + e))
    e match {

      case EVar(t, id, c) =>
        llemit.p(t)
        val r = RL(t, id)
        add(LLAlloca(r))
        env.add(id, t)
        if (c != null) transAssign(t, EId(t, id), c) else r

      case ETypeDef(t, id) =>
        env.addTypeDef(id, t); null

      case ENewArray(t, a) =>
        val ft = TFun(Tp(Ti(8)), List(Ti(64)))
        val (r, r2, r3) = (genRL(Ti(64)), genRL(Tp(Ti(8))), genRL(t))
        val a2 = transLocal(a)
        add(LLBin(r, "mul", a2, RN(Ti(64), "" + env.size(t))))
        add(LLCall(r2, RG(ft, "malloc"), List(r)))
        add(LLCast(r3, r2))
        global_env.add("malloc", ft)
        r3

      case ERet(t, a) =>
        val l1 = transLocal(a)
        val l2 = genid("ret");
        if (t != Tv && t != Tr(Tv)) {
          add(LLStore(l1, RL(Tp(t), "..retVal")))
          add(LLGoto(l2, "..leave"))
        } else {
          add(LLGoto(l2, retLabel))
        }
        l1

      case ENew(Tp(t)) =>
        val (r, r2) = (genRL(Tp(Ti(8))), genRL(Tp(t)))
        add(LLCall(r, RG(Tp(Ti(8)), "malloc"), List(RN(Ti(64), "" + env.size(t)))))
        add(LLCast(r2, r))
        global_env.add("malloc", TFun(Tp(Ti(8)), List(Ti(64))))
        r2

      case EGCNew(Tp(t)) =>
        val (r, r2) = (genRL(Tp(Ti(8))), genRL(Tp(t)))
        val ft = TFun(Tp(Ti(8)), List(Ti(64)))
        add(LLCall(r, RG(ft, "newobj"), List(RN(Ti(64), "" + env.size(t)))))
        add(LLCast(r2, r))
        global_env.add("newobj", ft)
        r2

      case ERef(t, e @ EId(_, id)) => setT(env.findR(id), t)
      case EBlock(t, l1) => l1.foldLeft(RN(Tv, null): R) { case (r, a) => transLocal(a) }
      case ESizeOf(_, t, _) =>
        val r = genRL(Ti(64)); add(LLBin(r, "add", RN(Ti(64), "0"), RN(t, "" + env.size(t)))); r
      case ELd(t, i) =>
        val r = genRL(t); add(LLAssign(r, RN(t, "" + i))); r
      case ELdd(t, i) =>
        val r = genRL(t); add(LLAssign(r, RN(t, "" + i))); r
      case ELds(t, i) =>
        val r = genRL(t); add(LLLoadCStr(r, i)); r
      case EBin(t, it, op, a, b) =>
        val r = genRL(t); add(LLBin(r, op, transLocal(a), transLocal(b))); r
      case ENeg(t, a) =>
        val r = genRL(t); add(LLUnary(r, "neg", transLocal(a))); r
      case ENot(t, a) =>
        val r = genRL(t); add(LLUnary(r, "not", transLocal(a))); r
      case _: EArray | _: EField | _: EPtr | _: EArrow | _: EId => transField(e)
      case EAssign(t, a, b) => transAssign(t, a, b)
      case ECall(t, EId(ft, n), l1) if (!env.map.contains(n) && global_env.map.contains(n)) =>
        val r = genRL(t)
        add(LLCall(r, env.findR(n), l1.map { transLocal }))
        r

      case ECall(t, fe, l1) =>
        val l2 = l1.map { transLocal }
        val l3 = transLocal(fe)
        val r = genRL(t)
        add(LLCall(r, l3, l2))
        r

      case ENop(t, a) =>
        add(LLNop(a)); null
      case ELabel(t, a, b) =>
        add(LLLabel("Local._" + a, "Local._" + a)); transLocal(b)

      case ECast(t, a) =>
        val r = genRL(t); add(LLCast(r, transLocal(a))); r
      case EGoto(t, a) =>
        val l = genid("goto"); add(LLGoto(l, "Local._" + a)); null
      case EBreak(_) =>
        val (b :: bs) = breaks; val l = genid("break"); add(LLGoto(l, b)); null
      case EContinue(_) =>
        val (b :: bs) = continues; val l = genid("continue"); add(LLGoto(l, b)); null
      case EIf(t, a, b, c) =>
        val id0 = genid("ok")
        val (id1, l0) = (genid("else"), genid("else"))
        val (id2, l1) = (genid("endif"), genid("endif"))
        val r = transLocal(a) // cond
        add(LLJne(r, id0, id0, id1))
        val r0 = transLocal(b) // then
        add(LLLabel(l0, l0))
        add(LLGoto(id1, id2))
        val r1 = transLocal(c) // else
        add(LLLabel(l1, l1))
        add(LLGoto(id2, id2))
        if (t != Tv && r0 != null && r1 != null && r0.t == r1.t) {
          val r = genRL(r0.t)
          add(LLPhi(r, l0, l1, t, r0, r1))
          r
        } else {
          null
        }

      case EWhile(t, a, b) =>
        val id0 = genid("id0")
        val id1 = genid("while")
        val id2 = genid("endwhile")
        continues = id1 :: continues
        breaks = id2 :: breaks
        add(LLLabel(id1, id1))
        val r = transLocal(a)
        add(LLJne(r, id0, id0, id2))
        transLocal(b)
        add(LLGoto(id2, id1))
        continues = continues.tail
        breaks = breaks.tail
        null

      case EFor(t, a, b, c, d) =>
        val id0 = genid("ok")
        val id1 = genid("for")
        val id2 = genid("endfor")
        continues = id1 :: continues
        breaks = id2 :: breaks
        transLocal(a)
        add(LLLabel(id1, id1))
        val r1 = transLocal(b)
        add(LLJne(r1, id0, id0, id2))
        val r2 = transLocal(d)
        transLocal(c)
        add(LLGoto(id2, id1))
        continues = continues.tail
        breaks = breaks.tail
        r2

      case EDo(t, l1, a) =>
        val id1 = genid("do")
        val id2 = genid("enddo")
        continues = id1 :: continues
        breaks = id2 :: breaks
        add(LLLabel(id1, id1))
        for (l <- l1) transLocal(l)
        val r = transLocal(a)
        add(LLJne(r, id2, id1, id2))
        continues = continues.tail
        breaks = breaks.tail
        null
/*
      case e @ ESwitch(t: T, a: E, cases: List[(E, E)]) =>
        val ra = transLocal(a)
        val lbl = genid("switch")
        var default = lbl + cases.length
        val (length, ls) = cases.foldLeft(0, List[(R, String)]()) {
          case ((n, ls), (ECase(_, null, _), _)) =>
            default = lbl + n; (n + 1, ls)
          case ((n, ls), (ECase(_, e, _), _)) => (n + 1, (transLocal(e), lbl + n) :: ls)
          case a => throw new Exception(" " + a)
        }
        add(LLSwitch(ra, default, ls.reverse))
        breaks = lbl + cases.length :: breaks
        for ((n, (_, e)) <- (0 until cases.length).zip(cases)) {
          add(LLLabel(null, lbl + n)); transLocal(e); add(LLGoto(null, lbl + (n + 1)))
        }
        breaks = breaks.tail
        add(LLLabel(null, lbl + cases.length))
        null
*/
      case ESwitch(t, a, cases) =>
        val ra = transLocal(a)
        val lbl = genid("switch")+"_"
        val end = lbl+"end"
        breaks = end::breaks
        val (hasDefault, defaultno) = cases.foldLeft(false,0) {
          case ((hasDefault,no), (ECase(t, null, _), b)) => (true, no)// default
          case ((hasDefault,no), (ECase(t, a, _), b)) =>// case a: b
            val l3 = transLocal(a)
            val next = lbl+"case"+(no+1)
            val r = genRL(Ti(64)); add(LLBin(r, "eq", l3, ra))
            add(LLJne(r, next, lbl+no, next))
            (hasDefault, no + 1)
        }
        if(!hasDefault) {
          add(LLGoto(lbl+"_block", end))
        } else {
          add(LLGoto(lbl+"_block", lbl+"_default"))
        }
        // とび先
        cases.foldLeft(0) {
          case (no, (ECase(t, null, _), b)) =>// default
            add(LLLabel(lbl + "_default",lbl + "_default"))
            transLocal(b)
            no
          case (no, (ECase(t, a, _), b)) =>
            add(LLLabel(lbl + no, lbl + no))
            transLocal(b)
            no + 1
        }
        breaks = breaks.tail
        // 終了
        add(LLLabel(end, end))
        null
        
      case _ => throw new Exception("error " + e)
    }
  }
  
  /**
   * フィールドの変換
   *
   * @param e: E 式
   * @return R 返り値レジスタ
   */
  private def transField(e: E): R = {
    e match {
      case EId(t, id) => transLoad(env.findR(id))
      case EArray(t, e, idx) => transALoad(t, transField(e), transLocal(idx))
      case EPtr(t, e) => transALoad(t, transField(e), RN(Ti(64), "0"))
      case EField(_, t, e, idx) => transGetField(t, idx, transField(e))
      case EArrow(_, t, e, idx) => transGetField(t, idx, transField(EPtr(t, e)))
      case _ => throw new Exception("error " + e)
    }
  }

  /**
   * 代入の変換
   *
   * @param t: T 型
   * @param a: E 代入先の式
   * @param b: E 代入元の式
   * @return R 返り値レジスタ
   */
  private def transAssign(t: T, a: E, b: E): R = {
    a match {
      case EId(_, a) => add(LLNop("EId "+ a.toString().replaceAll("\n"," "))); transStore(env.findR(a), transLocal(b))
      case EArray(t, e, idx) => transAStore(t, transField(e), transLocal(idx), transLocal(b))
      case EPtr(t, e) => transAStore(t, transField(e), RN(Ti(64), "0"), transLocal(b))
      case EField(_, t, e, idx) =>
        add(LLNop("EField "+a.toString().replaceAll("\n"," ")));
        val e2 = transField(e)
        add(LLNop("e2 "+e2.toString().replaceAll("\n"," ")));
        val b2 = transLocal(b)
        println("b="+b+ " b2="+b2)
        add(LLNop("b2 "+b2.toString().replaceAll("\n"," ")));
        transPutField(t, idx, e2, b2)
      case EArrow(_, t, e, idx) => transPutField(t, idx, transField(EPtr(t, e)), transLocal(b))
      case _ => throw new Exception("error assign " + t + " " + a + " " + b)
    }
  }

  /**
   * 値読み込みの変換
   *
   * @param a: R レジスタ
   * @return R 返り値レジスタ
   */
  private def transLoad(a: R): R = {
    tName2(a.t) match {
      case "a" | "p" =>
        val tt = env.stripType(env.find(a.id))
        tt match {
          case t: Tp =>
            val r = genRL(t); add(LLLoad(r, setT(a, Tp(t)))); r
          case t: Tr => setT(a, t)
          case t @ TArr(t2, _) =>
            val r = genRL(Tp(t2)); add(LLCast(r, setT(a, Tp(t)))); r
          case t: TFun =>
            a match {
              case RL(t:Tp, id) =>
                add(LLNop("R1---------"))
                val r = kNormal.genRL(Tp(t)); add(LLLoad(r, RL(Tp(t),id))); r
                val r2 = kNormal.genRL(t); add(LLLoad(r2, r))
                add(LLNop("R1 AAAAAA"))
                
                r2
              case RL(t, id) =>
                add(LLNop("R2--------- "+a))

                val r = kNormal.genRL(t); add(LLLoad(r, RL(Tp(t),id))); r
              case a => a
            }
          
          case t => setT(a, Tp(t))
        }
      case _ => val r = genRL(a.t); add(LLLoad(r, setT(a, Tp(a.t)))); r
    }
  }

  /**
   * 値保存の変換
   *
   * bをaに保存します。
   *
   * @param a: R 保存先レジスタ
   * @param b: R 保存元レジスタ
   * @return R 返り値レジスタ
   */
  private def transStore(a: R, b: R): R = {
    tName2(a.t) match {
      case "a" =>
        val t = env.find(a.id)
        val r = genRL(t)
        add(LLCast(r, b))
        add(LLStore(r, setT(a, Tp(t))))
      case _ => add(LLStore(b, setT(a, Tp(a.t))))
    }
    b
  }

  /**
   * ポインタの読み込み
   *
   * @param t: T 型
   * @param e1: R 元のレジスタ
   * @param r: R フィールドを表すレジスタ
   * @return R 返り値レジスタ
   */
  private def transALoad(t: T, e1: R, r: R): R = {
    tName2(t) match {
      case "a" =>
        val (r0, r1, r2) = (genRL(Tp(t)), genRL(Tp(t)), genRL(t))
        add(LLCast(r0, e1))
        add(LLField(r1, r0, null, r))
        add(LLLoad(r2, r1))
        r2
      case "p" =>
        val (r1, r2) = e1.t match {
          case Tp(TArr(t, size)) => (genRL(Tp(t)), genRL(Tp(t)))
          case t => (genRL(t), genRL(t))
        }
        add(LLCast(r1, e1))
        add(LLField(r2, r1, null, r))
        r2
      case _ =>
        val (r0, r1, r2) = (genRL(Tp(t)), genRL(Tp(t)), genRL(t))
        add(LLCast(r0, e1))
        add(LLField(r1, r0, null, r))
        add(LLLoad(r2, r1))
        r2
    }
  }

  /**
   * ポインタの保存
   *
   * @param t: T 型
   * @param e: R 元のレジスタ
   * @param idx: R インデックスを表すレジスタ
   * @param b: R 保存する値
   * @return R 返り値レジスタ。bを返します
   */
  private def transAStore(t: T, e: R, idx: R, b: R): R = {
    val (r0, r1) = (genRL(Tp(t)), genRL(Tp(t)))
    add(LLCast(r0, e))
    add(LLField(r1, r0, null, idx))
    add(LLStore(b, r1))
    b
  }

  /**
   * フィールド取得
   *
   * @param t: T 型
   * @param idx: String 文字列
   * @param a: R 元のレジスタ
   * @return R 返り値レジスタ
   */
  private def transGetField(t: T, idx: String, a: R): R = {
    val (t2, s) = getOffset(t, idx)
    val r2 = genRL(Tp(t2))
    add(LLField(r2, a, RN(Ti(32), "0"), RN(Ti(32), "" + s)))

    t2 match {
      case Ti(_) | Tu(_) | Tf | Td | Tp(_) |_: TFun =>
        val r1 = genRL(t2); add(LLLoad(r1, r2)); r1
      case _ => r2
    }
  }

  /**
   * フィールド出力
   *
   * @param t: T 型
   * @param idx: String 文字列
   * @param a: R 元のレジスタ
   * @param b: R 設定値のレジスタ
   * @return R 返り値レジスタ。bをそのまま返却
   */
  private def transPutField(t: T, idx: String, a: R, b: R): R = {
    val (t2, off) = getOffset(t, idx)
    val r = genRL(Tp(t2))
    add(LLField(r, a, RN(Ti(32), "0"), RN(Ti(32), "" + off)))
    add(LLStore(b, r))
    b
  }

  /**
   * 構造体内のフィールドオフセット取得
   *
   * @param t: T 型
   * @param x: String フィールド名
   * @return (T, Any) 検索結果の型と、オフセット値
   */
  private def getOffset(t: T, x: String): (T, Any) = {
    env.stripType(t) match {
      case TStr(m) =>
        def ck(m1: List[(String, T)], s: Long): (T, Long) = m1 match {
          case List() => throw new Exception("error " + m + " is not have " + x)
          case (name, t) :: xs => if (name == x) (t, s) else ck(xs, s + 1)
        }
        ck(m.toList, 0L)
      case Tp(t) => getOffset(t, x)
      case t => throw new Exception("error "+t)
    }
  }

}
