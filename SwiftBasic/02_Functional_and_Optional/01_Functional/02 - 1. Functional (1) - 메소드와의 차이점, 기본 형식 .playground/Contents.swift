/**
 # Functional & Optional
 */

import Foundation

// MARK: Function
/**
 #  메소드와의 차이점?
    - 의미는 같으나, 메소드는 object에 속해서 호출: object.methodName()
    - Function은 독립적으로 호출: functionName()
 */

// function 예시
func printName() {
    print("=====> My name is Hyeon")
}
printName() // "=====> My name is Hyeon\n"

// Parameter를 input으로 받는 func 예시
// param 1개, 숫자를 받아서 10을 곱해 반환
func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}
printMultipleOfTen(value: 5) // "5 * 10 = 50\n"

// param 2개, 물건값과 갯수를 받아서 전체 금액을 출력
// 참고로, 스위프트는 유니코드를 지원하기 때문에 한글로 파라미터 입력이 가능
//func printTotalPrice(price: Int, count: Int) {
//    print("Total Price = \(price * count)")
//}
//printTotalPrice(price: 1500, count: 5) // "Total Price = 7500\n"

// parameter 이름을 일일이 쓰지 않고 input을 순서대로 쓰는 방법도 존재한다.

func printTotalPrice(_ price: Int, _ count: Int) {
    print("Total Price = \(price * count)")
}
printTotalPrice(1500, 5) // "Total Price = 7500\n"


