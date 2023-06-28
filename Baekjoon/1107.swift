import Foundation

let n = Int(readLine()!)! // 이동하려고 하는 채널
let m = Int(readLine()!)! // 고장난 버튼 개수
if m == 0 {   // 고장난 리모콘이 없을 때
  if abs(n-100) > 3 {   // 번호를 누르는게 더 빠른경우
    print(String(n).count)
  } else {
    print(abs(n-100))  // 번호 다 누르는거보다 그냥 +나 -하는게 빠른경우
  }
  exit(0)
}

let broken = readLine()!.split(separator:" ").map { String($0) }
var minValue = abs(100-n) // 현재가 100번이니까 100번에서 시작

for i in 0...1000000 { 
  //50만이 아니라 100만으로 하는 이유 -> https://seongonion.tistory.com/99 참고
  let str = String(i).map { String($0) }
  for j in 0..<str.count {
    if broken.contains(str[j]) {  // 돌고있는 숫자중에 고장난 숫자가 하나라도 있다면 그 다음 번호 판단
      break
    }

    if j == str.count-1 { // 길이가 같다면, 해당 번호를 눌러서 이동한것 + (+나 -를 누른 횟수)
      minValue = min(minValue, abs(Int(str.joined())! - n) + str.count)
    }
  }
}

print(minValue)