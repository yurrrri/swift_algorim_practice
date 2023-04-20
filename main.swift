import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator:" ").map { Int(String($0))! }

if n == 1 || n == 2 {
  print(n)
  exit(0)
}

for i in 0..<n{
  for j in i+1..<n {
    for k in j+1..<n {
      
    }
  }
}