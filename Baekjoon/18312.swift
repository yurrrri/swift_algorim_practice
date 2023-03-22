let input = readLine()!.map { String($0) }
let N = Int(input[0])!
let K = input[1]
var answer = 0

for i in 0...N {
  for j in 0..<60 {
    for k in 0..<60 {
      if (String(i)+String(j)+String(k)).contains(K) {
        answer += 1
      }
    }
  }
}