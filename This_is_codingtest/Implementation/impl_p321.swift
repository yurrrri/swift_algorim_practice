let array = readLine()!.map { String($0) }.map { Int($0)! }
var first_array:[Int] = []
var second_array:[Int] = []

first_array = Array(array[0...array.count/2-1])
second_array = Array(array[array.count/2...array.count-1])

if first_array.reduce(0, +) == second_array.reduce(0, +) {
  print("LUCKY")
}
else{
  print("READY")
}