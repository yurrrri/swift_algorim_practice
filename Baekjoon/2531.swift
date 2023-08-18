import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], d = input[1], k = input[2], c = input[3]   // d: 초밥의 가지수, k: 연속해서 먹는 접시의 수, c: 쿠폰 번호
var arr:[Int] = []
for _ in 0..<n {
  arr.append(Int(readLine()!)!)
}

/*
N이 30,000 -> 2중 반복문 불가
*/
var start = 0
var end = 0
// var sushiSet:Set<Int> = []  // 중복 없애고, contains의 시간을 줄이기 위함
/* 오답노트1. set여도 시간초과 나는 이유 -> 배열합치기 (array + array): O(n)  array -> Set: O(n)
시간을 줄이기 위해서 딕셔너리를 사용해야함 */
var dic:[Int:Int] = [:]     // 초밥 종류 별 초밥의 개수를 저장할 딕셔너리
dic[c] = 1 // 쿠폰에 들어있는 초밥은 무조건 먹는다 생각하기
while end < k {   // 처음 k 길이의 구간에 있는 초들 모두 딕셔너리에 추가
  dic[arr[end], default:0] += 1
  end += 1
}
var answer = 0   // 정답 (초밥 종류의 최대값)
end -= 1  // 위 while문에서 k가 되어버리므로 k-1로 바꾸기 위해 -1을 해줌

while start < n {
  answer = max(dic.keys.count, answer)

  dic[arr[start]]! -= 1
  if dic[arr[start]]! == 0 {  // 딕셔너리에서 제외시켜주는 이유는 28번째줄에서 종류를 세야하기 때문에 포함시키지 않기 위해 아얘 제거해줌
    dic[arr[start]] = nil
  }
  start += 1
  end += 1
  
  dic[arr[end % n], default:0] += 1  // end % n을 해주는 이유는 초밥은 회전하기 때문에 인덱스를 0부터 시작하게 해서 종류를 세게하기 위함
}

print(answer)