import Foundation

let N = Int(readLine()!)!

func rotateRight(_ array:[[Int]], _ count: Int) {
  var copied = array
  var array = array
  
  let n = array.count

  for _ in 0..<count {
    for i in 0..<n {
      copied[i][(n+1)/2-1] = array[i][i]
      copied[i][n-i-1] = array[i][(n+1)/2-1]
      copied[i][i] = array[(n+1)/2-1][i]
      copied[(n+1)/2-1][i] = array[n-i-1][i]
    }
    array = copied //원래 배열을 한번 더 돌려야하므로
  }
  
  for i in 0..<n {
    print(copied[i].map { String($0) }.joined(separator:" "))
  }
}

func rotateLeft(_ array:[[Int]], _ count: Int) {
  var copied = array
  var array = array
  
  let n = array.count

  for _ in 0..<count {
    for i in 0..<n {
      copied[(n+1)/2-1][i] = array[i][i]
      copied[i][i] = array[i][(n+1)/2-1]
      copied[n-i-1][i] = array[(n+1)/2-1][i]
      copied[n-i-1][(n+1)/2-1] = array[n-i-1][i]
    }
    array = copied
  }

  for i in 0..<n {
    print(copied[i].map { String($0) }.joined(separator:" "))
  }
}

for _ in 0..<N {
  let input = readLine()!.split(separator:" ").map { Int(String($0))! }
  let n = input[0], rotate = input[1]/45
  var arr:[[Int]] = []

  for _ in 0..<n {
    arr.append(readLine()!.split(separator:" ").map { Int(String($0))! })
  }

  if rotate < 0 { //반회전
    rotateLeft(arr, -rotate)
  } else { //회전
    rotateRight(arr, rotate)
  }
}