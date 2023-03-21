import Foundation

let N = Int(readLine()!)!

let input = readLine()!.split(separator:" ").map { Int(String($0))!}
// var q = (1...N).map { ($0, input[$0-1])}
var q:[(Int, Int)] = []
input.enumerated().forEach {
  q.append(($0.0+1, $0.1))
}

var poped = q.removeFirst()
var answer:[Int] = [poped.0]
var index = 0 // 일단 맨 첫번째꺼 터뜨림

while !q.isEmpty {
  if poped.1 > 0 { //1을 빼는 이유 : removeFirst() 하여 q.count가 감소했으므로
    index = (index+poped.1-1) % q.count
  } else {
    index = (index+poped.1) % q.count
  }

  if index < 0 { //swift는 음수 인덱스 처리를 못하므로 현재 q의 count만큼 더해줘야함
    index += q.count
  }
  
  poped = q.remove(at: index)
  answer.append(poped.0)
}

print(answer.map { String($0) }.joined(separator: " "))