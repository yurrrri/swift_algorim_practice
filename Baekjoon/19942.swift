import Foundation

let n = Int(readLine()!)!
var minSet:[([Int], Int)] = [] // (최소 비용 집합, 최소 비용)
let nutri = readLine()!.split(separator:" ").map { Int($0)! } // 차례대로 단백질, 지방, 탄수화물, 비타민
// 백트래킹
var table:[[Int]] = [[0]] // 1부터 시작하기 위해 껍데기 데이터 넣음
for _ in 0..<n {
  table.append(readLine()!.split(separator:" ").map { Int($0)! }) // 차례대로 단백질, 지방, 탄수화물, 비타민
}

func backtracking(_ nums: [Int], _ idx: Int) {
  if nums.count > 0 {  // 몇개 선택해야된다 라고 정해진게 없어서 다 세줘야함
    var dan = 0, ji = 0, tan = 0, vi = 0, money = 0
    
    for i in nums {
      dan += table[i][0]
      ji += table[i][1]
      tan += table[i][2]
      vi += table[i][3]
      money += table[i][4]
    }
    
    if dan >= nutri[0] && ji >= nutri[1] && tan >= nutri[2] && vi >= nutri[3] {
      minSet.append((nums, money))
    }
  }

  for i in idx+1..<n {  // 조합(1, 3이나 3, 1이나 같으므로 idx를 다르게 줘서 다르게 골라야함)
    backtracking(nums + [i], i)
  }
}

backtracking([], 0)

if minSet.isEmpty {
  print(-1)
} else {
  let minValue = minSet.min(by: { $0.1 < $1.1 })!.1
  print(minValue)
  let minSet = minSet.filter { $0.1 == minValue }.sorted(by: { $0.0[0] < $1.0[0] })[0].0
  print(minSet.map { String($0) }.joined(separator:" "))
}