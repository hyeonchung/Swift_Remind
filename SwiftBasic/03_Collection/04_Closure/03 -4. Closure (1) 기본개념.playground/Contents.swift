import UIKit

/**
 # Clousure: 이름이 없는 메소드
**Swift에서 자주 등장하는 문법**
 ## 예시: 곱셈 클로저 생성
        * 선언 형태 ... 메소드명: (Input타입) -> Output타입 = { ... }
     ```
     var multiplyClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
        return a * b
     }
     ```
    * 또는 이렇게 간단히 표현 가능
        * $0, $1: 순서대로 선언한 input을 나타냄
    ```var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }```
    * 하지만 후자처럼 너무 간략히 줄이기 보다는 아래 정도로 줄이는걸 목표로 연습한다.
 */

// MARK: 클로저 생성해보기
var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

let result = multiplyClosure(4, 2) // 8

// MARK: function이 클로저를 받는 경우
// 함수 설명: Int 타입인 a, b와 두 개의 Int를 input/output으로 이용하는 함수를 input으로 넣어 Int를 반환
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
// operation에 앞에서 만든 multiplyClosure를 넣어보자
operateTwoNum(a: 4, b: 2, operation: multiplyClosure) // 8

// 더하기 클로저 생성해서 operation에 넣어보기
var addClousure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClousure) // 6

// MARK: 클로저를 미리 만들어놓지 않고 함수 파라미터상에서 바로 만드는 경우
// 나누기 클로저는 함수 파라미터 상에서 만들어보기
operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
} // 2

// MARK: 특이한 형태의 클로저 -  input과 output이 없는 클로저
let voidClosure: () -> Void = {
    print("iOS Developer❤️")
}
voidClosure() // iOS Developer❤️

