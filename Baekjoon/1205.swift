import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], score = input[1], p = input[2]

if n == 0 {
  print(1)
  exit(0)
}

var score_list = readLine()!.split(separator:" ").map { Int(String($0))! }

if n == p && score_list.last! >= score {
  print(-1)
  exit(0)
}

var answer = 0
score_list.append(score)

for i in 0..<score_list.count {
  var seq = 1
  for j in 0..<score_list.count {
    if score_list[i] < score_list[j] {
      seq += 1
    }
  }
  answer = seq
}

print(answer)