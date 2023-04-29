import Foundation

var arr = readLine()!.split(separator:" ").map{ Int(String($0))! }

if arr == Array(1...8){
  print("ascending")
} else if arr == Array(8...1) {
  print("descending")
} else {
  print("mixed")
}