var input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0] //NXN 도시 정보
let M = input[1] //살려둘 치킨집 최대 갯수
var temp:[[Int]] = []

var house_position:[(Int, Int)] = []
var chicken_position:[(Int, Int)] = []
var combination:[(Int, Int)] = []
var answer_list:[Int] = []

for _ in 0..<N {
  temp.append(readLine()!.split(separator:" ").map { Int($0)! })
}

for i in 0..<N {
  for j in 0..<N {
    if temp[i][j] == 1 {
      house_position.append((i+1, j+1))
    }
    else if temp[i][j] == 2 {
      chicken_position.append((i+1, j+1))
    }
  }
}

var i = 1 //치킨 빼는 갯수를 더하는 함수
var chickencombi:[[(Int, Int)]]
var house_chicken_sum = 0
var house_min_sum = 100000
var sum = 0
var array:[Int] = []

while i<=M {
  chickencombi = combi(chicken_position, i)
  
  for j in chickencombi { //조합의 경우 리스트 하나하나
    sum = 0
    for k in house_position{ //집 위치 튜플 하나하나
      for m in j { //리스트 하나하나 안의 튜플
        house_chicken_sum = 0
        house_chicken_sum += abs(k.0-m.0) + abs(k.1-m.1)
        house_min_sum = min(house_min_sum, house_chicken_sum)
      }
      sum += house_min_sum
      house_min_sum = 100000
    }
    array.append(sum)
  }
  i+=1
}

print(array.min()!)

func combi(_ nums: [(Int, Int)], _ targetNum: Int) -> [[(Int, Int)]] {
    var result: [[(Int, Int)]] = []
    
    func combination(_ index: Int, _ nowCombi: [(Int, Int)]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    combination(0, [])
    
    return result
}