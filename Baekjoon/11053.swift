import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
var answer:[Int] = [] //LIS를 이룰 배열

func binarySearch(_ start: Int, _ end: Int, _ value: Int) -> Int {
  var s = start //answer의 start 인덱스
  var e = end //answer의 맨 끝 인덱스
  var m = 0 //중간값을 탐색할 변수
  
  while s < e {
    m = (s + e) / 2
    if value <= answer[m] { e = m } //위치를 찾으려고 하는 값이 answer[m] 보다 작거나 같으면 end = middle
    else { s = m + 1 } //value가 더 큰수를 찾아나가는 과정
  }
  
  return s
}

for i in 0..<arr.count {
  if answer.isEmpty { answer.append(arr[i]) }
  else if answer.last! < arr[i] { answer.append(arr[i]) } //마지막 원소가 현재보다 작으면 현재 원소를 넣어줌
  else { answer[binarySearch(0, answer.count-1, arr[i])] = arr[i] }
}

print(answer.count)