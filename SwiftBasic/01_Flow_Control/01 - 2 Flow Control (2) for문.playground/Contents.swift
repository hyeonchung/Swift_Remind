import UIKit

// MARK: 1. for loop의 범위 정하는 법 알아보기 (range)
// {lowerBound , upperBound }
let closedRange = 0...10 // 0 ~ 10
let halfClosedRange = 0..<10 // 0 ~ 9
// 둘 다 출력은 {lowerBound 0, upperBound 10}로 표시된다.

// MARK: 2. for loop 만들기
// MARK: 예 (1): closedRange, halfClosedRange의 숫자들을 다 더하게 만들기
var sum = 0
for i in closedRange {
    print("-----> \(i)")
    sum += i
}
print("total sum: \(sum)")
/*
 -----> 0
 -----> 1
 -----> 2
 -----> 3
 -----> 4
 -----> 5
 -----> 6
 -----> 7
 -----> 8
 -----> 9
 -----> 10
 total sum: 55
*/

sum = 0
for i in halfClosedRange {
    print("-----> \(i)")
    sum += i
}
print("total sum: \(sum)")
/*
 -----> 0
 -----> 1
 -----> 2
 -----> 3
 -----> 4
 -----> 5
 -----> 6
 -----> 7
 -----> 8
 -----> 9
 total sum: 45
 */

// MARK: 예 (2): closedRange범위 내에서 삼각함수(sin함수) 그래프 표현해보기
// sin 그래프
import Foundation
var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

// MARK: 예(3): 똑같은 문자 반복 출력
let name = "Hyeon"
for _ in closedRange {
    print("---> name: \(name)")
}
/*
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 ---> name: Hyeon
 */
/*
for i in closedRange {... } 로 작성하는 경우,
Immutable value 'i' was never used; consider replacing with '_' or removing it 라고 알림이 뜬다.
이는, i가 코드블럭에서 한번도 사용되지 않으며, 이를 _(언더스코어)로 대체할 수 있다는 것을 알려주는 것이다.
*/
