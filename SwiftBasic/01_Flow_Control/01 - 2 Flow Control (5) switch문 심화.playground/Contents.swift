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

let num = 10
switch num {
case 0:
    print("===> 0입니다.")
case 10:
    print("===> 10입니다.")
default:
    print("===> 나머지입니다.")
}

switch num {
case 0:
    print("===> 0입니다.")
case 0...10:
    print("===> 0부터 10사이 구간입니다.")
case 10:
    print("===> 10입니다.")
default:
    print("===> 나머지입니다.")
}


let pet = "bird"
switch pet {
case "dog", "cat", "bird":
    print("==> 집동물이네요?")
default:
    print("==> 잘 모르겠습니다.")
}

let number = 20
switch number {
case _ where num % 2 == 0:
    print("===> 짝수")
default:
    print("===> 홀수")
}

// MARK: Switch 심화
// MARK: 튜플을 이용한 Switch문 (1)
// 주어진 좌표의 위치(특징)을 나타내는 switch문 작성
let coordinate = (x: 0, y: 10)
switch coordinate {
case (0, 0):
    print("==> 원점입니다.")
case (_,0):
    print("==> x축 위에 있네요")
case (0,_):
    print("==> y축 위에 있네요")
default:
    print("==> 좌표 어딘가")
} // ==> y축 위에 있네요

// MARK: 튜플을 이용한 Switch문 (2)
// 좌표의 위치와 함께 x 또는 y좌표의 값을 확인하는 switch문
// case문에 let x, let y를 선언해 값을 받을 수 있도록 작성
switch coordinate {
case (0, 0):
    print("==> 원점입니다.")
case (let x,0):
    print("==> x축 \(x)위에 있네요")
case (0,let y):
    print("==> y축 \(y)위에 있네요")
case (let x, let y):
    print("==> 좌표 어딘가, x: \(x), y:\(y)")
} // ==> y축 10위에 있네요

// MARK: 튜플을 이용한 Switch문 (3): case에 where를 이용하여 추가적인 조건 생성
// x = y인 경우에 출력문 생성하기
let loc = (x: 5, y: 5)
switch loc {
case (0, 0):
    print("==> 원점입니다.")
case (let x,0):
    print("==> x축 \(x)위에 있네요")
case (0,let y):
    print("==> y축 \(y)위에 있네요")
case (let x, let y) where x == y:
    print("==> 좌표값이 서로 같네요. x: \(x), y:\(y)")
case (let x, let y): // default의 역할을 하는 부분
    print("==> 좌표 어딘가. x: \(x), y:\(y)")
} // "==> 좌표값이 서로 같네요. x: 5, y:5\n"
