import Foundation

let input = readLine()!.components(separatedBy:" ").map { Int($0)! }
let N = input[0]
let K = input[1]
var step = 1 //단계
var count = 0 //내구도가 0인 칸의 개수
let naegudo = readLine()!.components(separatedBy:" ").map { Int($0)! }
var conveyor:[Int] = []
var robots = Array(repeating:0, count:N) //N개인 로봇 배열 만들기 (로봇은 컨베이어 벨트 위에만 존재하므로)

var a = 0 //내구도
var b = 0 //로봇

for i in 0..<2*N {
  conveyor.append(naegudo[i])
}

while true {
  //1. 내구도 회전
  a = conveyor.removeLast()
  conveyor.insert(a, at:0)

  b = robots.removeLast()
  robots.insert(b, at:0) //로봇도 같이 회전
  
  robots[N-1] = 0

  for i in stride(from:N-1, to:-1, by:-1) { //가장 먼저 벨트에 올라간 로봇을 찾으려면, 뒤에서부터 찾아야함
    if robots[i] == 1 && robots[i+1] != 1 && conveyor[i+1] >= 1 {
        robots[i] = 0 //로봇이동
        robots[i+1] = 1
        conveyor[i+1] -= 1 //내구도 감소
    }
  }
  robots[N-1] = 0 //로봇 맨 끝은 항상 1
  
  if conveyor[0] > 0 && robots[0] != 1 { //내구도가 0이 아니라면 올리기
    conveyor[0] -= 1
    robots[0] = 1
  }

  for i in conveyor {
    if i == 0{
      count += 1
    }
  }

  if count >= K {
    break
  }
  count = 0 //각 케이스마다 0인 원소의 갯수를 세려면, 매번 초기화를 해서 세어줘야함
  step += 1
}

print(step)