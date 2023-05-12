import heapq
import sys

input = sys.stdin.readline
minheap = []
maxheap = []

t = int(input())
for _ in range(t):
  minheap = []
  maxheap = []
  k = int(input())
  visited = [True] * k
  
  for i in range(k):
    cal, num = input().split()
    num = int(num)
    
    if cal == "I":
      heapq.heappush(minheap,(num,i))
      heapq.heappush(maxheap,(-num,i))
    else:
    ## 원소를 제거함과 동시에 해당하는 숫자의 인덱스를 통해 False로 표시하여 삭제됨을 표시
      if num == -1:
        if minheap:
          visited[heapq.heappop(minheap)[1]] = False
      elif num == 1:
        if maxheap:
          visited[heapq.heappop(maxheap)[1]] = False
          
    ## 위에서 표시한 인덱스의 원소라면 제거
    while minheap and not visited[minheap[0][1]]:
      heapq.heappop(minheap)
    while maxheap and not visited[maxheap[0][1]]:
      heapq.heappop(maxheap)
  
  if not (minheap and maxheap):
    print("EMPTY")
  else:
    print(-maxheap[0][0], minheap[0][0])