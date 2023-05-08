//O(n^n) 알고리즘
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

//O(n^2) 알고리즘
var arr:[Int] = [1, 2, 3]

func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
  var result = [[Int]]()
  
  func permutation(_ depth: Int) {
    if depth == targetNum {
      result.append(Array(arr[0..<depth]))
      return
    }
    
    for i in depth..<nums.count {
      arr.swapAt(i, depth)
      permutation(depth+1)
      arr.swapAt(i, depth)
    }
  }
  permutation(0)
  
  return result
}

print(permute(Array(1...3), 3))