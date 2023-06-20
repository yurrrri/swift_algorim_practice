import Foundation

let nm = readLine()!.split(separator:" ").map { Int($0)! }
let n = nm[0], m = nm[1]
let treeHeights = readLine()!.split(separator:" ").map { Int($0)! }.sorted()

var start = 0
var end = treeHeights.max()!   // 이분탐색 -> 시작/끝 인덱스 혹은 시작값 / 최대값으로 정한 뒤 mid를 조정하는 일
var mid = 0
var total = 0

var maxValue = 0

while start <= end {
  mid = (start+end)/2
  total = 0

  for i in treeHeights {
    if i > mid {
      total += i-mid  // 나무 자르기
    }
  }

  if total >= m {   // 조건을 만족하면 일단 maxValue에 저장 후 오른쪽 (큰쪽)을 봤을 떄에도 조건을 만족하는지 확인
    maxValue = max(maxValue, mid)
    start = mid + 1
  } else { // m보다 작으면 더 많이 잘라봐야 하니까 왼쪽으로 범위를 좁힘
    end = mid - 1
  }
}

print(maxValue)