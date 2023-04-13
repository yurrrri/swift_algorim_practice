import Foundation

let s = readLine()!.map { String($0) }
var t = readLine()!.map { String($0) }

for _ in 0..<t.count {
  if t.last! == "A" {
    let removed = t.removeLast()
    if t.reversed() == s {
      print(1)
      exit(0)
    }
  } else {
    let reversed() = t.reversed()
    let _ = t.removeLast()

    if t.reversed() == s {
      print(1)
      exit(0)
    }
  }
}

print(0)
