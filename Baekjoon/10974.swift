let N = Int(readLine()!)!
let array = Array(1...N)

func permute(_ array:[Int], _ k: Int) -> [[Int]] {
  var result:[[Int]] = []
  var visited = Array(repeating:false, count:array.count)

  func permutation(_ arr: [Int]){
    if arr.count == k {
      result.append(arr)
      return
    }

    for i in 0..<array.count {
      if !visited[i] {
        visited[i] = true
        permutation(arr + [array[i]])
        visited[i] = false
      }
    }
  }

  permutation([])

  return result
}

var result = permute(array, N)

for i in result {
  print(i.map { String($0) }.joined(separator:" "))
}