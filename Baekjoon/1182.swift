let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], s = input[1]
let num = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: n)

var answer = 0

func dfs(_ idx: Int, _ depth: Int, _ sum: Int) {
    if sum == s && depth > 0 { //초기에 0임을 방지하기 위해 (합이 0인 경우가 있으니까)
      answer += 1
    }
    
    for i in idx..<n { //조합을 거치면서 더해나감
      dfs(i + 1, depth + 1, sum + num[i])
    }
}

dfs(0, 0, 0)
print(answer)