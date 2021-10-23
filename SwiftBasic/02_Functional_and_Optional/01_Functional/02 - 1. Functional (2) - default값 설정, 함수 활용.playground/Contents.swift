/**
 # Functional & Optional
 */

import Foundation

// MARK: Function(2)
func printTotalPrice(_ price: Int, _ count: Int) {
    print("Total Price = \(price * count)")
}

printTotalPrice(1500, 5) // "Total Price = 7500\n"
printTotalPrice(1500, 10)
printTotalPrice(1500, 7)
printTotalPrice(1500, 1)


// MARK: 함수에 default 값을 설정하기
// printTotalPrice 함수에 기본 가격을 1500원으로 설정해보자.
func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price = \(price * count)")
}

printTotalPriceWithDefaultValue(count: 5) // price: Int = 1500 으로 설정했기 때문에 파라미터를 count만 입력해도 됨
printTotalPriceWithDefaultValue(count: 10)
printTotalPriceWithDefaultValue(count: 7)
printTotalPriceWithDefaultValue(count: 1)

// 그렇다고 price값 입력 못하는건 아님, 다른 price가 있으면 그거 포함해서 파라미터 입력하면 됨
printTotalPriceWithDefaultValue(price: 2000, count: 5)


// MARK: 확장, 활용해보기
// 최종으로 출력되는 Total Price을 반환시켜 제대로 계산된 값인지 확인해보는 함수 만들기
// func 함수명(파라미터) -> 반환타입 {...} 형식으로 작성
func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice: Int = 10000 * 77

func isCalculatedSame(totalPrice: Int, caculatedPrice: Int) {
    if calculatedPrice == totalPrice {
        print("계산결과 일치!")
    }else {
        print("계산결과 불일치 - totalPrice: \(totalPrice), caculatedPrice: \(calculatedPrice)")
    }
}

isCalculatedSame(totalPrice: totalPrice(price: 10000, count: 77), caculatedPrice: 10000 * 77 ) // "계산결과 일치!\n"

isCalculatedSame(totalPrice: totalPrice(price: 10000, count: 56), caculatedPrice: 10000 * 77 ) // "계산결과 불일치 - totalPrice: 560000, caculatedPrice: 770000\n"

