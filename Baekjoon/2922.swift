import Foundation

let str = readLine()!.map { String($0) }
let moeum = ["A", "E", "I", "O", "U"]
var answer = 0
var newStr:[String] = []

func isGoodWord(_ str:[String]) -> Bool { // "L" 포함하면서, 자음이나 모음이 3글자 연속 나오면 안됨
  if !str.contains("L") { return false }
  for idx in 0..<str.count-2 {
    if Array(str[idx...idx+2]).allSatisfy({ moeum.contains($0) }) || Array(str[idx...idx+2]).allSatisfy ({ !moeum.contains($0) }) {
      return false
    }
  }
  return true
}

func backtracking(_ str:[String], _ idx: Int, _ char: [String]) {
  if !str.contains("_") {
    if isGoodWord(str) {
      var temp = 1 

      for s in str {
        if s == "A" {
          temp *= 5
        } else if s == "B" {
          temp *= 20
        } 
      }

      answer += temp
    }
    return
  }

  for i in idx..<str.count {
    if str[i] == "_" {
      var s1 = str
      s1[i] = "A"
      backtracking(s1, i+1, char + ["A"])
      var s2 = str
      s2[i] = "B"
      backtracking(s2, i+1, char + ["B"])
      var s3 = str
      s3[i] = "L"
      backtracking(s3, i+1, char + ["L"])
    }
  }
}

var flag = false

for i in 0..<str.count {
    if str[i] == "_" { //str 에서 처음으로 _ 발견하면 그때부터 재귀 시작
        flag = true
        backtracking(str, i, [""])
        break
    }
}

if !flag { answer = 1 }

print(answer)