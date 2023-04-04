import Foundation

var board:[[Int]] = []
var dx = [0, 1, 1, -1] //차례대로 가로, 세로, 하향 대각선, 상향 대각선
var dy = [1, 0, 1, 1]

for _ in 0..<19 {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

for x in 0..<19 {
    for y in 0..<19 {
        if board[x][y] != 0 {
            let item = board[x][y]
            
            for i in 0..<4 {
                var count = 1
                var nx = x + dx[i] //가로, 세로, 대각선 4방향 차례대로 확인
                var ny = y + dy[i]
                
                while 0<=nx && nx<19 && 0<=ny && ny<19 && board[nx][ny] == item { //item이 연속될 때까지 count
                    count += 1
                    
                    if count == 5 { //오목이면, 육목인지 아닌지 확인
                        if 0 <= x-dx[i] && x-dx[i] < 19 && 0<=y-dy[i] && y-dy[i] < 19 && board[x-dx[i]][y-dy[i]] == item {
                            break //육목이면 반복문을 벗어나 그 다음 스텝 실행
                        }
                        
                        if 0 <= nx+dx[i] && nx+dx[i] < 19 && 0<=ny+dy[i] && ny+dy[i] < 19 && board[nx+dx[i]][ny+dy[i]] == item {
                            break
                        }
                        
                        print(item)
                        print("\(x+1) \(y+1)")
                        exit(0)
                    }
                    
                    nx += dx[i]
                    ny += dy[i]
                }
            }
        }
    }
}

print(0) //아직 판정이 나지 않은 경우