import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }
var operator_count = readLine()!.split(separator:" ").map { Int($0)! }

var minValue = 1000000000  // 최소, 최대값 설정할 때 범위를 잘 볼것
var maxValue = -1000000000 // 최소, 최대값은 -10억 ~ 10억 사이

func dfs(_ depth:Int, _ result:Int) {
  if depth == n { // 숫자의 개수가 n일때
    minValue = min(result, minValue)
    maxValue = max(result, maxValue)
    return
  }

  for i in 0..<operator_count.count {
    if operator_count[i] > 0 { // 연산자의 개수가 아직 남아있는 경우
      operator_count[i] -= 1 // 연산자 사용하는걸로 했다가
      switch i {
        case 0:
        dfs(depth+1, result+arr[depth])
        case 1:
        dfs(depth+1, result-arr[depth])
        case 2:
        dfs(depth+1, result*arr[depth])
        default:
        dfs(depth+1, result/arr[depth])
      }
      operator_count[i] += 1 // 다시 안하는걸로 가지치기
    }
  }
}

dfs(1, arr[0]) // 처음수부터 입력인자로 넣기

print(maxValue)
print(minValue)