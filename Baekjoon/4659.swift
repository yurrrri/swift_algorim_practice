import Foundation

let moeum_list = ["a", "e", "i", "o", "u"]

while let input = readLine(), input != "end" {
  let str = input.map { String($0) }
  var isCorrect = false
  var moeum = 0 //연속으로 몇번 나왔는지 체크하는 변수
  var jaeum = 0

  for i in str {
    if moeum_list.contains(i){ // 1. 하나라도 포함되면 isCorrect
      isCorrect = true
      moeum += 1
      jaeum = 0 //모음이 나왔으므로 자음 변수 초기화

      if moeum == 3 {
        isCorrect = false
        break
      }
    }
    else{
      moeum = 0 //자음이 나왔으므로 모음 변수 초기화
      jaeum += 1

      if jaeum == 3 {
        isCorrect = false
        break
      }
    }
  }

  if !isCorrect { //이미 틀렸으므로 아래를 볼 필요 없이 다음으로 넘어감
    print("<\(input)> is not acceptable.")
    continue
  }

  for i in 0..<str.count-1{
    if str[i] == str[i+1] { //같은 문자 연속 2개 인데 e와 o이 아니면 틀린 문자
      if !(str[i+1] == "e" || str[i+1] == "o") {
        isCorrect = false
        break
      }
    }
  }

  if isCorrect {
    print("<\(input)> is acceptable.")
  }
  else{
    print("<\(input)> is not acceptable.")
  }
}