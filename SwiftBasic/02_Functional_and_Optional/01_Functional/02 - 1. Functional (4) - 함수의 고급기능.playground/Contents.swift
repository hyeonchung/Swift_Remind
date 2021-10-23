/**
 # Functional & Optional
 */

import Foundation

/*
 함수의 기본 골자
 externalName: parameter명을 외부에는 다르게 명시하고 싶을 때 따로 지정
func functionName(externalName params: ParamType) -> ReturnType {
    // ...
    return returnValue
}
 */

// MARK: Function(4) - 고급함수
// MARK: overlaod
// 같은 함수의 이름을 가지고 있지만, parameter나 return이 달라지는 경우
// 예시: 같은 음료 자판기 - 미국용, 한국용

// 한국용 자판기: 원화는 소숫점이 없기 때문에 Int만 사용하면 됨
func printTotalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

// 미국용 자판기: 달러화는 소숫점(센트) 존재하기 때문에 Float으로 parameter 타입을 변경
func printTotalPrice(price: Double, count: Double) -> Double {
    let totalPrice = price * count
    return totalPrice
}

// MARK: inoout Parameter
// parameter는 기본적으로 let 상수! - 아래 함수 예시의 경우 오류가 발생!
/* 함수 예시
func incrementAndPrint(_ value: Int) {
    value -= 1 // Parameter인 value는 기본적으로 let으로 지정! -> 연산 불가능!
    print(value)
}
*/

//해결방법: parameter type 바로 뒤에 inout을 서술하여 var 변수타입으로 지정
var value = 3
func incrementAndPrint(_ value: inout Int) {
    value -= 1 // Parameter인 value는 기본적으로 let으로 지정! -> 연산 불가능!
    print(value)
}
// 입력시 &을 앞에 붙여줘야함!
incrementAndPrint(&value)
