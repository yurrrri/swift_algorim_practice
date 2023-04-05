import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = input[0], m = input[1]

var board:[[Int]] = []

for _ in 0..<n {
  board.append(readLine()!.map { Int(String($0))! })
}

var answer = 0
var visited:[(Int, Int)] = [] //방문한 좌표들을 넣을 리스트
var dx = [-1, 1, 0, 0] //칸 이동의 경우 습관적으로 좌표 배열을 먼저 두자.
var dy = [0, 0, 1, -1]

var nx = 0 //현재 위치에서 이동할 좌표
var ny = 0

func containsTuple(_ array: [(Int, Int)], _ tuple:(Int,Int)) -> Bool { //튜플 배열에 튜플이 있는지 판단하는 함수
    let (x, y) = tuple
    for (i, j) in array {
        if i == x && j == y { 
            return true 
        } 
    }
    return false
}

func bfs() {
  var q = [(0, 0)] //1. 시작좌표 집어넣고

  while !q.isEmpty {
    let (x, y) = q.removeFirst() //2. 매번 꺼내서 방문처리
    visited.append((x, y))

    for i in 0..<4 {
      nx = x + dx[i]
      ny = y + dy[i]

      if 0<=nx && nx<n && 0<=ny && ny<m && board[nx][ny] == 1 && !containsTuple(visited, (nx, ny)){
        board[nx][ny] = board[x][y] + 1 //3. 이전좌표에서 + 1
        q.append((nx, ny)) //전진
      }
    }
  }
}

bfs()
print(board[n-1][m-1])