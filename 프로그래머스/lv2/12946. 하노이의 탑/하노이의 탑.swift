import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result:[[Int]] = []
    
    func hanoi(_ n: Int, _ from: Int, _ by: Int, _ to: Int)  {
        if n == 1 {
            result.append([from, to])
            return
        }
        
        hanoi(n-1, from, to, by) //n-1개를 from에서 by로 옮긴다
        result.append([from, to]) // 1개를 from에서 to로 옮긴다
        hanoi(n-1, by, from, to) //n-1개를 by에서 to로 옮긴다
    }
    
    hanoi(n, 1, 2, 3)
    
    return result
}