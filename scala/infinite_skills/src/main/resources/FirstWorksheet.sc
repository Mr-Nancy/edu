object FirstWorksheet {
  println("Welcome to the Scala worksheet")       //> Welcome to the Scala worksheet
  val a = 5                                       //> a  : Int = 5
  val b = 10                                      //> b  : Int = 10
  var i = 2                                       //> i  : Int = 2
  
  val next = if (a % 2 == 0) a / 2 else 3 * a + 1 //> next  : Int = 16
  
  if (a < 9) "hi" else ()                         //> res0: Any = hi
  
  val resutl = a*2 match {
  	case 0 => "zero"
  	case 1 => "one"
  	case `b` => "Same as b"                // `b` means val b from the outer scope
  	case i => "default , " + i             // i is a local to match, might be bound to anything. In fact we can use foo instead of i
  }                                               //> resutl  : String = Same as b
  
  val result = (a*3, b) match {
  	case (0, _) => "zero"
  	case (i, 0) => "i tuple, :" + i        // i is a local to match, might be bound to anything. In fact we can use foo instead of i
  	case i => "Just i, " + i
  }                                               //> result  : String = Just i, (15,10)
  
  def square (x: Double): Double = x*x            //> square: (x: Double)Double
  square(5)                                       //> res1: Double = 25.0
  
  def greet(name: String): Unit = {
  	println (s"Hello, $name")
  }                                               //> greet: (name: String)Unit
  greet("Dima")                                   //> Hello, Dima
  
  
  // Recursion
  def factorial (n: Int): Int = if (n<2) 1 else n*factorial(n-1)
                                                  //> factorial: (n: Int)Int
  factorial(3)                                    //> res2: Int = 6
  
  def estimatePi(n: Int): Double = {
    def helper (n: Int): Double = {
    	if (n<1) 0 else {
    		val x = math.random
    		val y = math.random
    		(if (x*x + y*y < 1) 1 else 0) + helper(n-1)
    	}
    }
    helper (n)/n*4
  }                                               //> estimatePi: (n: Int)Double
  // Stack overflow here
  estimatePi(4000)                                //> res3: Double = 3.129
  
  // Tail Recursion
  import scala.annotation._
  def estimatePiTail(n: Int): Double = {
    @tailrec
    def helper (n: Int, sum: Double): Double = {
    	if (n<1) sum else {
    		val x = math.random
    		val y = math.random
    		helper(n-1, sum + (if (x*x + y*y < 1) 1 else 0))
    	}
    }
    helper (n, 0)/n*4
  }                                               //> estimatePiTail: (n: Int)Double
  
  estimatePiTail(100000000)                       //> res4: Double = 3.14166456
  
}