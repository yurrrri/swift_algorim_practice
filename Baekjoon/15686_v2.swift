import Foundation

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var nx = 0
var ny = 0

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var board:[[Int]] = []
for _ in 0..<n {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var copied:[[Int]] = []

var chicken:[(Int, Int)] = []
var house:[(Int, Int)] = []

for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == 2 {
      chicken.append((i, j))
    } else if board[i][j] == 1 {
      house.append((i, j))
    }
  }
}

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

var house_chicken_sum = 0
var house_min_sum = Int.max
var sum = 0
var answer = Int.max

for i in 1...m {
  let chickencombi = combination(chicken, i)
  
  for j in chickencombi {
    sum = 0
    for (x, y) in house { 
      for (a, b) in j { //집 위치와 치킨 거리간 비교하여, 더 작은값이 곧 그 집의 치킨거리다.
        house_chicken_sum = abs(x-a) + abs(y-b)
        house_min_sum = min(house_min_sum, house_chicken_sum)
      }
      sum += house_min_sum //도시의 치킨거리 = 치킨거리의 합
      house_min_sum = Int.max //각 집마다의 최소 치킨거리를 구해야하므로 다시 Int.max값으로 초기화
    }
    answer = min(answer, sum)
  }
}

print(answer)