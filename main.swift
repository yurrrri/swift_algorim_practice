import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var board:[[Int]] = []
for i in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var chicken:[(Int, Int)] = []
var house:[(Int, Int)] = []

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 2 { //치킨 좌표 저장
      chicken.append((i, j))
    } else if board[i][j] == 1 { //집 좌표 저장
      house.append((i, j))
    }
  }
}

var answer = Int.max

// func bfs(_ chicken: [(Int, Int)]) -> Int {
//   var chicken_arr = chicken
//   var idx = 0
//   var sum = 0
  
//   while idx < chicken_arr.count { //시간 줄이는 방법 (bfs)
//     let (x, y) = chicken_arr[idx]

//     for (a, b) in house {
//       sum += abs(x-a)+abs(y-b)
//     }
//     idx += 1
//   }

//   return sum
// }

//치킨집 좌표 조합
func combination(_ nums:[(Int, Int)], _ m:Int) -> [[(Int, Int)]] {
  var result:[[(Int, Int)]] = []

  func combi(_ arr:[(Int, Int)], _ index: Int) {
    if arr.count == m {
      result.append(arr)
      return
    }

    for i in index..<nums.count {
      combi(arr + [nums[i]], i+1)
    }
  }

  combi([], 0)
  
  return result
}

for i in 1...m {
  var result = combination(chicken, i)
  var sum = 0
  
  for j in result {
    for (a, b) in j {
            for (x, y) in house {
        sum += abs(a-x)+abs(b-y)
      }
    }
    answer = min(answer, sum)
  }
}

print(answer)