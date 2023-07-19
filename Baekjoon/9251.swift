let str1 = ["0"] + readLine()!.map { $0 }
let str2 = ["0"] + readLine()!.map { $0 }
let n = str1.count
let m = str2.count

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

for y in 1..<m {
    for x in 1..<n {
        if str2[y] != str1[x] {
            dp[y][x] = max(dp[y - 1][x], dp[y][x - 1])
        } else {
            dp[y][x] = dp[y - 1][x - 1] + 1
        }
    }
}

print(dp[m - 1][n - 1])