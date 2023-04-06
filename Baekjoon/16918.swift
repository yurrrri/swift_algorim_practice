import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0], c = input[1], n = input[2]
var board:[[String]] = []

var nx = 0
var ny = 0

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

var bomb:[(Int, Int)] = []

func findBomb(_ board: [[String]], _ bomb: inout [(Int, Int)]) {
  for i in 0..<r{
    for j in 0..<c {
      if board[i][j] == "O" {
        bomb.append((i, j))
      }
    }
  }
}

func printBoard(_ board: [[String]]){
  board.forEach {
    print($0.joined())
  }
}

func bfs(_ bomb: [(Int, Int)]){
  var q = bomb

  while !q.isEmpty {
    let (x, y) = q.removeFirst()
    board[x][y] = "."

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      if 0..<r ~= nx && 0..<c ~= ny {
        board[nx][ny] = "."
      }
    }
  }
}

for _ in 0..<r {
  board.append(readLine()!.map { String($0) })
}

if n == 1 { //1, 5, 9... 순으로 초기 보드
  printBoard(board)
}
else if n%2 == 0 { //짝수번은 O만 출력!
  printBoard(Array(repeating: Array(repeating: "O", count:c), count:r))
}
else if n%4 == 3 {
  findBomb(board, &bomb) //폭탄리스트 일단 넣고
  board = Array(repeating: Array(repeating: "O", count:c), count:r) //모두 폭탄 깔기
  bfs(bomb)
  printBoard(board)
}
else if n>1 && n%4 == 1 { //폭탄 2번 터뜨리기
  findBomb(board, &bomb) 
  board = Array(repeating: Array(repeating: "O", count:c), count:r) 
  bfs(bomb)
  
  bomb = []
  findBomb(board, &bomb) 
  board = Array(repeating: Array(repeating: "O", count:c), count:r) 
  bfs(bomb)
  printBoard(board)
}