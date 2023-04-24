let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = 0, end = 0
var sum = 0, count = 0

while true {
    if sum >= M {
        sum -= nums[start]
        start += 1
    } else if end == N {    // 더해야하는데 end를 움직일 수 없으면 break
        break
    } else {
        sum += nums[end]
        end += 1
    }
    if sum == M { count += 1}
}

print(count)