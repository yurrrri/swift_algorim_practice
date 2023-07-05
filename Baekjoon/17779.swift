import Foundation

let N = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 0..<N {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var total = 0
for row in matrix {   // 전체 인구수의 합
    total += row.reduce(0, +)
}
var answer = Int(1e9)

func calculate(_ row: Int, _ col: Int, _ d1: Int, _ d2: Int) {
    var first = 0, second = 0, third = 0, fourth = 0
    
    // 구역 1
    var col1 = col + 1
    for r in 0..<(row + d1) {
        if r >= row {
            col1 -= 1
        }
        first += matrix[r][..<col1].reduce(0, +)
    }
    
    // 구역 2
    var col2 = col + 1
    for r in 0..<(row + d2 + 1) {
        if r > row {
            col2 += 1
        }
        second += matrix[r][col2...].reduce(0, +)
    }
    
    // 구역 3
    var col3 = col - d1
    for r in (row + d1)..<N {
        third += matrix[r][..<col3].reduce(0, +)
        if r < (row + d1 + d2) {
            col3 += 1
        }
    }
    
    // 구역 4
    var col4 = (col + d2) - N
    for r in (row + d2 + 1)..<N {
        fourth += matrix[r][col4...].reduce(0, +)
        if r <= (row + d1 + d2) {
            col4 -= 1
        }
    }
    
    // 구역 5
    let five = total - first - second - third - fourth
    answer = min(answer, max(first, second, third, fourth, five) - min(first, second, third, fourth, five))
}

func check(_ r: Int, _ c: Int, _ d1: Int, _ d2: Int) {
    if (0..<(r + d1)).contains(where: { $0 < N }) && (0..<(r + d2)).contains(where: { $0 < N }) && (0..<(c - d1 + d2)).contains(where: { $0 < N }) {
        if (0...(c - d1)).contains(where: { $0 >= 0 }) && ((c + d2)..<N).contains(where: { $0 < N }) && ((r + d1 + d2)..<N).contains(where: { $0 < N }) {
            calculate(r, c, d1, d2)
        }
    }
}

for r in 0..<(N - 2) {
    for c in 1..<(N - 1) {
        for d1 in 1..<(N - 1) {
            for d2 in 1..<(N - 1) {
                check(r, c, d1, d2)
            }
        }
    }
}

print(answer)