// - 1에서 3번 막대로 옮길때, 2번 막대도 거치므로 from, start, via 3가지 개념을 사용한다.
// - hanoi(N, start, to, via): start에서 to로 via를 거쳐 총 N개의 원반을 옮긴다 라고 정의했을 때,  옮기는 과정을 크게 3가지로 분해 가능하다.
//     - hanoi(2, 1, 2, 3) : 위 2개를 먼저 막대2로 옮긴다.
//     - 마지막 남은 3 원반을 막대 1에서 막대 3으로 옮긴다.
//     - hanoi(2, 2, 3, 1) : 막대 2에 있는 2개의 막대를 막대 3으로 옮긴다.
// - 이를 재귀로 표현하면 아래와같다. 재귀함수는 반드시 자기 자신을 호출할 때의 종료 조건이 있어야하는데, N이 1개일 때는 재귀가 필요없고 바로 원반을 옮기고 종료하면 되기 때문에, N이 1일때가 이 하노이 함수의 종료조건이라고 할 수 있다.

func move(_ n: Int, _ from: Int, _ to :Int) {
	print("\(n)번 원반을 \(from)에서 \(to)로 이동")
}

func hanoi(_ n:Int, _ from: Int, _ to: Int, _ via: Int) {
	if n == 1 {
		move(1, from, to)
  }
	else {
		hanoi(n-1, from, via, to)
		move(n, from, to)
		hanoi(n-1, via, to, from)
  }
}

hanoi(3, 1, 3, 2)