let input = Int(readLine()!)!

print(input % 4 == 0 && (input % 100 != 0 || input % 400 == 0) ? 1 :0)