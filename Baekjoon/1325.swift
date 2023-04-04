import Foundation

func dfs(_ array: inout [[Int]], _ v: Int, _ visited: inout [Bool], _ count: inout Int ) {
  visited[v] = true
  count += 1

  for i in array[v] {
    if !visited[i] {
      dfs(&array, i, &visited, &count)
    }
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var array:[[Int]] = Array(repeating:[], count:n+1)
var answer:[(Int, Int)] = []

for _ in 0..<m {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let f = input[0], s = input[1]
  array[s].append(f) //B를 해킹하면 A도 해킹가능
}

var max = -1
for i in 1...n {
    var visited = Array(repeating:false, count:n+1)
    var count = 0
    dfs(&array, i, &visited, &count)

    max = max < count ? count : max
    answer.append((i, count))
}

var answerString: String = ""
for i in 0..<n {
    if answer[i].1 == max {
        answerString += "\(i+1) "
    }
}

print(answerString)