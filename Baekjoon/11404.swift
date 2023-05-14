let n = Int(readLine()!)!
let m = Int(readLine()!)!
let inf = Int(1e9) //Int.max 대신 1e9

var arr = Array(repeating: Array(repeating: inf, count:(n+1)), count:(n+1))

for i in 1...n {
  arr[i][i] = 0
}

for _ in 0..<m {
  let input = readLine()!.split(separator:" ").map { Int($0)! }
  arr[input[0]][input[1]] = min(input[2], arr[input[0]][input[1]])
} // 같은 경로에 비용이 여러개이므로 최소값 갱신

for k in 1...n {
  for a in 1...n {
    for b in 1...n {
      arr[a][b] = min(arr[a][b], arr[a][k] + arr[k][b])
    }
  }
}

for i in 1...n {
  for j in 1...n {
    if arr[i][j] == inf {
      print(0, terminator:" ")
    } else {
      print(arr[i][j], terminator:" ")
    }
  }
  print()
}