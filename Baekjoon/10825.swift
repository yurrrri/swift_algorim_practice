let n = Int(readLine()!)!
var students:[(String, Int, Int, Int)] = []

for _ in 0 ..< n {

	let info = readLine()!.split(separator: " ").map { String($0) }
  students.append((info[0], Int(info[1])!, Int(info[2])!, Int(info[3])!)) // n개의 정보 저장
}

students = students.sorted(){ $0.1 == $1.1 ? // 국어 점수가 같다면
	($0.2 == $1.2 ? // 영어 점수가 같다면
		($0.3 == $1.3 ? // 수학 점수가 같다면
        $0.0 < $1.0: // 이름을 오름차순으로
        $0.3 > $1.3) // 영어 점수가 같고, 수학 점수가 다르다면 수학 점수를 오름차순으로
			: $0.2 < $1.2) // 국어 점수가 같고, 영어점수가 다르다면 내림차순으로
	: $0.1 > $1.1} // 국어 점수가 같지 않다면 내림차순으로 정렬한다.

for i in students {
    print(i.0) // 이름만 출력
}