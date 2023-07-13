import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let l = input[0], c = input[1]
// 최소 1개의 모음과 2개의 자음, 알파벳순 정렬
let letters = readLine()!.split(separator:" ").map { String($0) }.sorted()  // 먼저 정렬해주기

let moeum = ["a", "e", "i", "o", "u"]
var answer:[String] = []

func isValidLetter(_ str: [String]) -> Bool {
  var moeum_count = 0
  var jaeum_count = 0
  
  for i in str {
    if moeum.contains(i) {
      moeum_count += 1
    } else {
      jaeum_count += 1
    }
  }

  return moeum_count >= 1 && jaeum_count >= 2
}

func backtracking(_ start: Int) {
  if answer.count == l {
    if isValidLetter(answer) {   // 조건 맞는지 한번 더 체크
      print(answer.joined())
    }
    return
  }

  for i in start..<c {   // 조합이라고 생각하면 조합 틀 알고리즘 그대로 옮기기
    answer.append(letters[i])
    backtracking(i+1)
    answer.removeLast() 
  }
}

backtracking(0)