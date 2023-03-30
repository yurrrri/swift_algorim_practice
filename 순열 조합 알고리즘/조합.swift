func combine(_ nums: [Int], _ k: Int) -> [[Int]] {
    var result:[[Int]] = []

    func combination(_ index:Int, _ arr:[Int]) {
        if arr.count == k {
            result.append(arr)
            return
        }

        for i in index..<nums.count {
            combination(i+1, arr + [array[i]])
        }
    }

    combination(0, [])

    return result
}