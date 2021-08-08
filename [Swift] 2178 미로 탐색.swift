let input = readLine()!.split(separator: " ").map({Int($0)!})
let (n,m) = (input.first!, input.last!)

var arr: [[Int]] = Array(repeating: Array(repeating: 0, count:m ), count: n)
var visit: [[Bool]] = Array(repeating: Array(repeating: false, count:m ), count: n)

for i in 0...n-1 {
    arr[i] = readLine()!.map{Int(String($0))!}
}

var queue: [(y: Int,x: Int)] = []
queue.append((0,0))
visit[0][0] =  true

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var cnt = 1
while !queue.isEmpty {
    cnt += 1
    let size = queue.count
    for _ in 0..<size {
        let elem = queue.removeFirst()
        let y = elem.y
        let x = elem.x
        for i in 0..<4 {
            let Y = y+dy[i]
            let X = x+dx[i]
                if 0<=Y, Y<n, 0<=X, X<m {
                    if arr[Y][X] == 1, visit[Y][X] == false {
                    visit[Y][X] = true
                    queue.append((Y, X))
                    if n-1 == Y, m-1 == X {
                        print(cnt)
                    }
                }
            }
        }
    }
}
