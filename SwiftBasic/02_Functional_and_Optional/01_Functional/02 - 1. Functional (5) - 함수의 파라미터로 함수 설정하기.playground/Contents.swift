import Foundation
/**
 # Function(4) - 고급함수: 함수가 함수의 파라미터가 되는 경우
 1. 변수를 함수로 설정하기
 2. 함수가 함수의 파라미터가 되는 경우
 */

// MARK: 1. 변수를 함수로 설정하기
func add(_ a: Int, _ b: Int) -> Int { // 더하기 함수
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int { // 빼기 함수
    return a - b
}

// 변수에 함수 부여가 가능함 (반환 타입이 지정되어 있는 경우!)
var function = add // function이라는 변수에 add함수를 부여
function(4, 2) // 6 (add 함수의 파라미터 function으로 이용 가능)

function = subtract // function에 subtract 함수 부여
function(4, 2) // 2


// MARK: 2. 함수가 함수의 파라미터가 될 때
// 함수 파라미터 function의 입력란에 (Input 타입) -> return 타입 입력
func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(add, 8, 5) // 13
printResult(subtract, 8, 5) // 3
