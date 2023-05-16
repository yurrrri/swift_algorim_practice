let nk = readLine()!.split(separator:" ").map { Int($0)! }
let n = nk[0], k = nk[1]

var board = Array(repeating: Array(repeating:0, count: k+1), count:n+1)
var arr:[(Int, Int)] = [(0, 0)]
for _ in 0..<n {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr.append((input[0], input[1]))
}

for i in 1...n {
  for j in 1...k {
    let (w, v) = arr[i]

    if j < w { //현재 물건의 무게보다 w가 더 크면
      board[i][j] = board[i-1][j]
    } else {
      board[i][j] = max(v + board[i-1][j-w], board[i-1][j])
    }
  }
}

print(board[n][k])