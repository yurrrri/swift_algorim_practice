import Foundation

let num = readLine()!.map { Int(String($0))! }
var dic:[Int:Int] = [:]

for i in num {
  if i == 9 {
    if dic[9] != nil {
      dic[6, default:0] += 1
    } else {
      dic[9, default:0] += 1
    }
  }
  else if i == 6 {
    if dic[6] != nil {
      dic[9, default:0] += 1
    } else {
      dic[9, default:0] += 1
    }
  }
  dic[i, default:0] += 1
}

print(dic.values.max()!)
