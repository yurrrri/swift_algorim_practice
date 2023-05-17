import Foundation

var board:[[Int]] = []
let dx = [0, 1, 1, -1] //차례대로 가로, 세로, 하향 대각선, 상향 대각선
let dy = [1, 0, 1, 1]

var nx = 0
var ny = 0

for _ in 0..<19 {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

for x in 0..<19 {
    for y in 0..<19 {
        if board[x][y] != 0 {
            let item = board[x][y]
            
            for i in 0..<4 {
                var count = 1
              
                nx = x + dx[i] //가로, 세로, 대각선 4방향 차례대로 확인
                ny = y + dy[i]
                
                while 0..<19 ~= nx && 0..<19 ~= ny && board[nx][ny] == item { //item이 연속될 때까지 count
                    count += 1
                    
                    if count == 5 { //오목이면, 육목인지 아닌지 확인
                        if 0..<19 ~= x-dx[i] && 0..<19 ~= y-dy[i] && board[x-dx[i]][y-dy[i]] == item {
                            break //육목이면 반복문을 벗어나 그 다음 스텝 실행
                        }
                        
                        if 0..<19 ~= nx+dx[i] && 0..<19 ~= ny+dy[i] && board[nx+dx[i]][ny+dy[i]] == item {
                            break
                        }
                        
                        print(item)
                        print("\(x+1) \(y+1)")
                        exit(0)
                    }
                    
                    nx += dx[i] // 가로면 가로 세로면 세로 방향대로 쭉 같은 방향으로 전진
                    ny += dy[i]
                }
            }
        }
    }
}

print(0) //아직 판정이 나지 않은 경우