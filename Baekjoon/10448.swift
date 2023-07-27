import Foundation

let n = Int(readLine()!)!
var triangleArr:[Int] = []

for i in 1...44 {   // 범위가 44인 이유? k의 최대가 1000인데, 1부터 44까지의 합이 1000과 가장 가까우므로 이때까지 돌면서 성립하는지 확인해도 무관 -> 범위를 늘리면 시간초과 발생
  triangleArr.append((i*(i+1))/2)
}

func simulation(_ n: Int) -> Int {
  for i in 0..<44 {    // 범위가 다 같아도 되는 이유? -> 삼각수가 중복되어도 무관
    for j in 0..<44 {
      for k in 0..<44 {
        if triangleArr[i] + triangleArr[j] + triangleArr[k] == n {
          return 1
        }
      }
    }
  }
  return 0
}

for _ in 0..<n {
  print(simulation(Int(readLine()!)!))
}