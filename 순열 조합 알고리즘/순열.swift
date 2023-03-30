func permute(_ nums: [Int], _ k: Int) -> [[Int]] {
  var result:[[Int]] = []
  var visited:[Bool] = Array(repeating:false, count:nums.count)

  func permutation(_ arr: [Int]) {
    if arr.count == k {
      result.append(arr)
      return 
    }

    for i in 0..<k {
      if !visited[i] {
        visited[i] = true
        permutation(arr + [nums[i]])
        visited[i] = false
      }
    }
  }

  permutation([])

  return result
}