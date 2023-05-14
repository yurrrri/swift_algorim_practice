import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
var answer:[Int] = [] //LIS를 이룰 배열

func binarySearch(_ start: Int, _ end: Int, _ value: Int) -> Bool {
  var s = start //answer의 start 인덱스
  var e = end //answer의 맨 끝 인덱스
  var m = 0 //중간값을 탐색할 변수
  
  while s < e {
    m = (s + e) / 2
    if answer[m] < value {
      s = m + 1 //현재 위치가 찾으려는 value보다 작을 때 start를 늘려줘야함
    } else { //더 크면 end 크기를 중간 크기로 줄임
      e = m //m-1이 아닌 이유는 같은 경우도 같이 커버하기 때문
    }
  }

  if s == answer.count - 1{
    return true
  } else {
    return false
  }
}

for i in 0..<arr.count {
  if answer.isEmpty { answer.append(arr[i]) }
  else if answer.last! < arr[i] { answer.append(arr[i]) } //마지막 원소가 현재보다 작으면 현재 원소를 넣어줌
  else { 
    if binarySearch(0, answer.count-1, arr[i]) {
      answer[answer.count-1] = arr[i] 
    } //비어있지 않으면서 마지막 원소보다 현재 보고있는 원소가 더 작으면 이분탐색으로 위치 찾음
  }
}

print(answer.count)
print(answer.map { String($0) }.joined(separator:" "))ㅋ