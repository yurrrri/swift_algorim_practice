import Foundation

let n = Int(readLine()!)!

switch n {
  case 90...100:
    print("A")
  case 80..<90:
    print("B")
  case 70..<80:
    print("C")
  case 60..<70:
    print("D")
  default:
    print("F")
  break
}