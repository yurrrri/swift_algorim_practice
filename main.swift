import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let l = input[0], c = input[1]
// 최소 1개의 모음과 2개의 자음, 알파벳순 정렬
let letters = readLine()!.split(separator:" ").map { String($0) }.sorted() // 암호가 알파벳순으로 배열되어있으므로 먼저 정렬시키고 시작
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
    if isValidLetter(answer) {
      print(answer.joined())
    }
    return
  }

  for i in start..<c {
      answer.append(letters[i])
     backtracking(i+1)
    answer.removeLast() 
  }
}

backtracking(0)