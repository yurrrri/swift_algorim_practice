import Foundation

var board:[[Int]] = []
var bingo:[Int] = []
var answer = (0, 0)

for _ in 0..<19 {
  board.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

for i in 0..<19 {
  for j in 0..<19 {
    if board[i][j] != 0 {
      answer = (i+1, j+1)
      // 가로
      if j-1 >= 0 && j+5 < 19 {
        bingo = []
        for k in j...j+4 {
          bingo.append(board[i][k])
        }
        if !bingo.isEmpty && bingo.allSatisfy { $0 != 0 } && board[i][j+5] == 0 && board[i][j-1] == 0 {
          if bingo.allSatisfy { $0 == 1 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
          else if bingo.allSatisfy { $0 == 2 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
        }
      }
      
      if i-1 >= 0 && i+5 < 19 { //세로
        bingo = []
        for k in i...i+4 {
          bingo.append(board[k][j])
        }
        print(bingo)
        if !bingo.isEmpty && bingo.allSatisfy { $0 != 0 } && board[i+5][j] == 0 && board[i-1][j] == 0 {
          if bingo.allSatisfy { $0 == 1 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
          else if bingo.allSatisfy { $0 == 2 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
        }
      }
      
      if (i-5 >= 0) && (j+5 < 19) &&  { //정대각선
        bingo = []
        var temp = j
        for k in stride(from: i, to:i-5, by:-1) {
          bingo.append(board[k][temp])
          temp += 1
        }
        if !bingo.isEmpty && bingo.allSatisfy { $0 != 0 } && board[i-5][temp] == 0 &&  {
          if bingo.allSatisfy { $0 == 1 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
          else if bingo.allSatisfy { $0 == 2 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
        }
      }
      
      if (i+5 < 19) && (j+5 < 19) { //부대각선
        bingo = []
        var temp = j
        for k in i..<i+5 {
          bingo.append(board[k][temp])
          temp += 1
        }
        print(bingo)
        if !bingo.isEmpty && bingo.allSatisfy { $0 != 0 } && board[i+5][temp] == 0 {
          if bingo.allSatisfy { $0 == 1 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
          else if bingo.allSatisfy { $0 == 2 } {
            print(bingo.first!)
            print("\(answer.0) \(answer.1)")
            exit(0)
          }
        }
      }
    }
  }
}

print(0) //아직 판정이 나지 않은 경우