import Foundation

let n = Int(readLine()!)!
var arr:[Int] = []

for _ in 0..<n {
  arr.append(readLine()!.split(separator:" ").map { Int(String($0))! }

for k in 0..<n {
  for a in 0..<n {
    for b in 0..<n {
      if arr[a][b] == 1 || (arr[a][k] == 1 && arr[k][b] == 1){
        arr[a][b] = 1
      }
    }
  }


for a in 0..<n{
  for b in 0..<n{
    print(arr[a][b], terminator= " ")
  }
  print()
}