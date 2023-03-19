var input:[Int] = []
for _ in 0..<28 {
  input.append(Int(readLine()!)!)
}

let output = (1...30).filter { !input.contains($0) }.sorted()

print(output.first!)
print(output.last!)