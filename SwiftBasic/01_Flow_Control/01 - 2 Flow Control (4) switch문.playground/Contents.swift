import UIKit
// 다른 언어들의 switch문 보다 강력한 편
/** # Switch문
 ```
switch (확인하고자 하는 변수) {
 case A:
    ...
 case B:
    ...
 }
 ```
 */

// MARK: 예시(1)
let num = 10

switch num {
case 0:
    print("===> 0입니다.")
case 10:
    print("===> 10입니다.")
default: // default: 는 무조건 입력해야함
    print("===> 나머지입니다.")
} // "===> 10입니다."

// MARK: 예시(2): switch문에서도 range 표현이 가능하다.
switch num {
case 0:
    print("===> 0입니다.")
case 0...10:
    print("===> 0부터 10사이 구간입니다.")
case 10:
    print("===> 10입니다.")
default: // default: 는 무조건 입력해야함
    print("===> 나머지입니다.")
} // "===> 0부터 10사이 구간입니다."

//MARK: 예시(3): 한 케이스에 여러가지 값을 지정하는 경우
let pet = "bird"

switch pet {
case "dog", "cat", "bird":
    print("==> 집동물이네요?")
default:
    print("==> 잘 모르겠습니다.")
} // ==> 집동물이네요?

// MARK: where문을 혼합한 Switch문
// 짝수, 홀수 구분지어 출력시키는 switch문을 where문을 응용해 작성
let number = 20
switch number {
case _ where num % 2 == 0:
    print("===> 짝수")
default:
    print("===> 홀수")
} // "===> 짝수"
