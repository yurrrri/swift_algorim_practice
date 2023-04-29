let arr = readLine()!.split(separator:" ").map { Int(String($0))!}.sorted(by: <)
print(arr[1])