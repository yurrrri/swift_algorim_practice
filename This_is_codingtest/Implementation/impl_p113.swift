import Foundation

let N = Int(readLine()!)!
var count = 0

for i in 0...N {
  for j in 0...59 {
    for k in 0...59 {
      if (String(i)+String(j)+String(k)).contains("3") {
        count += 1
      }
    }
  }
}

print(count)