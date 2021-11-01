import UIKit

// MARK: for문 심화

let closedRange = 0...10 // 0 ~ 10
let halfClosedRange = 0..<10 // 0 ~ 9

// 짝수 부분만 출력하기
for i in closedRange {
    if i%2 == 0 {
        print("짝수: \(i)")
    }
}
/*
 짝수: 2
 짝수: 4
 짝수: 6
 짝수: 8
 짝수: 10
 */

// MARK: where을 사용해 for문 + 조건문을 한줄로 표현하기
// for문 + where + 조건문
for i in closedRange where i % 2 == 0 {
    print("짝수: \(i)")
}

// (활용) closedRange에서 i = 3을 제외하고 나머지들을 출력
for i in closedRange where i != 3 {
    print("3을 제외한 나머지 수: \(i)")
}

// MARK: for문의 중첩
// 구구단 만들기
for i in closedRange {
    for j in closedRange {
        print("gugu -> \(i) * \(j) = \(i * j)")
    }
}

// 단, 개발시 for문 중첩은 가능하면 많이 쓰지 않는다. (용량, 효율성 문제)


