object Collections {
  println("Welcome to the Scala worksheet")       //> Welcome to the Scala worksheet
  
  val arr = Array(1,2,3)                          //> arr  : Array[Int] = Array(1, 2, 3)
  val lst = List(7,4,9,7)                         //> lst  : List[Int] = List(7, 4, 9, 7)
  arr(0)                                          //> res0: Int = 1
  lst(1)                                          //> res1: Int = 4
  
  arr(0) = 99
  arr                                             //> res2: Array[Int] = Array(99, 2, 3)
  // List is immutable
  // List is a singly-linked, so indexing is slow
  
  // :: is a cons
  1::lst                                          //> res3: List[Int] = List(1, 7, 4, 9, 7)
  lst                                             //> res4: List[Int] = List(7, 4, 9, 7)
  
  val lst2 = 1::lst                               //> lst2  : List[Int] = List(1, 7, 4, 9, 7)
  
  val arr_ = new Array[Int](10)                   //> arr_  : Array[Int] = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  val arr__ = new Array[String](10)               //> arr__  : Array[String] = Array(null, null, null, null, null, null, null, nul
                                                  //| l, null, null)
  
  val arr2 = Array.fill(12)(26)                   //> arr2  : Array[Int] = Array(26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26)
  val arrStr = Array.fill(12)("hi")               //> arrStr  : Array[String] = Array(hi, hi, hi, hi, hi, hi, hi, hi, hi, hi, hi, 
                                                  //| hi)
  val arrRand = Array.fill(10)(math.random)       //> arrRand  : Array[Double] = Array(0.13244452183510624, 0.042150764504762406, 
                                                  //| 0.6165786181860554, 0.8521843484109988, 0.8582231401432147, 0.60330575590705
                                                  //| 69, 0.7122441262990546, 0.8784499538244235, 0.9723419473220972, 0.7570906314
                                                  //| 938873)
  def littleArray(i: Int): Array[Int] = Array(i, i, i)					// Pass function return value as an argument, reuslt of util.Random.nextInt(10)
                                                  //> littleArray: (i: Int)Array[Int]
  littleArray(util.Random.nextInt(10))            //> res5: Array[Int] = Array(9, 9, 9)
  
  def littleArrayRocket(i: => Int): Array[Int] = Array(i, i, i) // Pass function as an argument, below - util.Random.nextInt(10)
                                                  //> littleArrayRocket: (i: => Int)Array[Int]
  littleArrayRocket(util.Random.nextInt(10))      //> res6: Array[Int] = Array(0, 2, 3)
  
  // Using Lambda to initialize Array
  val arr3 = Array.tabulate(10)(i => i)           //> arr3  : Array[Int] = Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  val arr3_ = Array.tabulate(10)(i => i*i)        //> arr3_  : Array[Int] = Array(0, 1, 4, 9, 16, 25, 36, 49, 64, 81)
  val arr3__ = Array.tabulate(10)(i => 2*i + 5)   //> arr3__  : Array[Int] = Array(5, 7, 9, 11, 13, 15, 17, 19, 21, 23)
  
  Vector(1,2,3)                                   //> res7: scala.collection.immutable.Vector[Int] = Vector(1, 2, 3)
  
  import collection.mutable
  mutable.Buffer(1,2,3)                           //> res8: scala.collection.mutable.Buffer[Int] = ArrayBuffer(1, 2, 3)
  
  //Ranges
  1 to 10 by 2                                    //> res9: scala.collection.immutable.Range = Range(1, 3, 5, 7, 9)
  10 to 1 by -1                                   //> res10: scala.collection.immutable.Range = Range(10, 9, 8, 7, 6, 5, 4, 3, 2,
                                                  //|  1)
  
  (1).+(2)                                        //> res11: Int(3) = 3
  (1).to(10)                                      //> res12: scala.collection.immutable.Range.Inclusive = Range(1, 2, 3, 4, 5, 6,
                                                  //|  7, 8, 9, 10)
}