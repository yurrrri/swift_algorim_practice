let N = Int(readLine()!)! //회의의 수
var array:[[Int]] = []
var end = 0
var result = 0

for _ in 0...N-1
{
 array.append(readLine()!.split(separator:" ").map{ Int($0)! })
}

array.sort(by: { $0[0] < $1[0] }) // 맨 먼저 시작하는거부터 정렬
array.sort(by: { $0[1] < $1[1] }) // 끝나는 시간이 빠른것부터 정렬

for i in 0...N-1 {
  if array[i][0] >= end {
    result += 1
    end = array[i][1]
  }
}

print(result)