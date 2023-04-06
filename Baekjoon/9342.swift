import Foundation

let n = Int(readLine()!)!
var flag = false

for _ in 0..<n {
  let input = readLine()!.map { String($0) }

  if !(input.contains("A") && input.contains("F") && input.contains("C")) { //A, F, C 셋중 하나라도 없으면 good
    print("Good")
    continue
  }

  for i in input {
    if !["A", "B", "C", "D", "E", "F"].contains(i) {
      print("Good")
      flag = true
      break
    }
  }

  if !flag { print("Infected!") }
  
}