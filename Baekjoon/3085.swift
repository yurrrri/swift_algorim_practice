import Foundation

let n = Int(readLine()!)!
var board:[[String]] = []
var answer = 0

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var nx = 0, ny = 0

for _ in 0..<n {
  board.append(readLine()!.map { String($0) })
}

func findLongline() -> Int {
  var count = 0
  var maxValue = 0

  //행
  for i in 0..<n {
    count = 0
    for j in 0..<n-1 {
      if board[i][j] == board[i][j+1] {
        count += 1
      } else {
  /*
   1) 다를때 여기서 break를 하면 안되는 이유는, 첫번째 말고 그 뒤에 연속되는 경우가 있기 때문
        ex) CCXCCC
   2) 따라서 여기서 그때까지 count를 센 것의 최대값을 구한다음 count를 0으로 초기화 
        */
        maxValue = max(maxValue, count+1)
        count = 0
      }
    }
    // count+1을 해주는 이유 -> 서로 같으면 +1을 해주므로 같은 갯수를 카운트 하려면 +1을 해줘야함
    maxValue = max(maxValue, count+1)
  }
  
  
  //열
  for i in 0..<n {
    count = 0
    for j in 0..<n-1 {
      if board[j][i] == board[j+1][i] {
        count += 1
      } else {
        maxValue = max(maxValue, count+1)
        count = 0
      }
    }
    maxValue = max(maxValue, count+1)
  }

  return maxValue
}

// answer = max(answer, findLongline())

for i in 0..<n {
  for j in 0..<n {
    for k in 0..<4 {
      nx = i + dx[k]
      ny = j + dy[k]

      guard 0..<n ~= nx && 0..<n ~= ny else { continue }

      if board[i][j] != board[nx][ny] { // 인접한 사탕이 서로 다르면
        var temp = board[nx][ny]
        board[nx][ny] = board[i][j]
        board[i][j] = temp

        answer = max(answer, findLongline()) // 찾기

        // 다시 바꾸는 이유는 한번만 교환 가능하기때문
        temp = board[nx][ny]  // 다시바꾸기
        board[nx][ny] = board[i][j]
        board[i][j] = temp
      }
    }
  }
}

print(answer)