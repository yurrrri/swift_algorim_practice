import Foundation

let N = Int(readLine()!)!
var answer = 0
var seq = ""

func move(_ n: Int, _ from: Int, _ to: Int) {
  seq += "\(from) \(to)\n"
}

func hanoi(_ n: Int, _ from: Int, _ to: Int, _ via: Int) {
  answer += 1
  
  if n == 1 {
    move(n, from, to)
  }
  else{
    hanoi(n-1, from, via, to)
    move(n, from, to)
    hanoi(n-1, via, to, from)
  }
}

hanoi(N, 1, 3, 2)
print(answer)
print(seq)