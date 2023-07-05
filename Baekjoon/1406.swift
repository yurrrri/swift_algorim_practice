import Foundation

var left = readLine()! // 커서 왼쪽에 있는 수
var right = "" // 커서 오른쪽에 있는 수
let m = Int(readLine()!)!

// left : y
// right : cbax

for _ in 0..<m {
    let cmd = readLine()!

    switch cmd {  // 포인터를 스택으로 처리하는 느낌?
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(cmd.last!)
    }
}

print(left + right.reversed())