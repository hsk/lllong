package type7.test
import type7._
object test_class extends TestCase {
  import type7.test.test_globals._

  def apply() {
    test("class trans after test",

        """
typedef ClassInfo = struct {
  parent:Ptr[ClassInfo]
}
typedef A = struct{
  classInfo:Ptr[A_ClassInfo]
  a:int
}
typedef A_ClassInfo = struct {
  parent:Ptr[ClassInfo]
  this:Ptr[(Ptr[A], int)=>Ptr[A]]
  setA:Ptr[(Ptr[A], int)=>void]
  getA:Ptr[(Ptr[A])=>int]
  hoge:Ptr[(Ptr[A])=>int]
}
        
var   hoge:Ptr[(Ptr[A])=>int] = A_hoge

def A_this(this:Ptr[A], a:int):Ptr[A] = { this->a = a; this}
def A_setA(this:Ptr[A], a:int):void = { this->a = a }
def A_getA(this:Ptr[A]):int = { this->a }
def A_hoge(this:Ptr[A]):int = { A_getA(this) }

var a_classInfo:A_ClassInfo = ( 0, A_this, A_setA, A_getA, A_hoge )

def A_alloc():Ptr[A] = {
  var this:Ptr[A]
  this = new A;
  this->classInfo = &a_classInfo;
  this
}
def main():int = {
  var v:int
  var a:Ptr[A]
  var f:Ptr[(Ptr[A])=>int]

  a = A_alloc()
  a = A_this(a, 33)
  v = A_hoge(a)
  print_i(v)
  f = A_hoge
  print_i(f(a))
        
  f = a_classInfo.hoge
  f(a)

  f = a->classInfo->hoge
  print_i(f(a))
  print_i(a->classInfo->hoge(a))
 
  0
}
        """,
      null,
      (0, "33\n33\n33\n33\n", ""))

    test("class test1",
      """
      typedef A = class {
        var a:int
        def this(a:int) {
          this->a = a
        }
        def getA():int = this->a
        def hoge():int = this->a
      }
      def add(a:int,b:int):int = a + b
      def main() {
        var a:Ptr[A]
        a = A_alloc()
        a = A_this(a, 3)
        print_i(A_hoge(a))
        print_i(__A_ClassInfo__.hoge(a))
        print_i(a->hoge(a))
        print_i(a->getA(a))
        print_i(add(add(1,2),3))
      }
      """,
      null,
      (0, "3\n3\n3\n3\n6\n", ""))

  }
}