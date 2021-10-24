import UIKit

/* 기본 형태
 { (param) -> return type in
   statement
}
*/

// MARK: 예시 1 - Cho Simple Closure
let choSimpleClosure = {
}
choSimpleClosure() // () -> ()

// MARK: 예시 2 - 코드블럭을 구현한 Closure
let codeBlockClosure = {
    print("Hello, 클로저, 코로나 Bye!")
}
codeBlockClosure() // Hello, 클로저, 코로나 Bye!

// MARK: 예시 3 - 인풋 파라미터를 받는 Closure
let inputParamClosure: (String) -> Void = { name in
    print("Hello, 클로저, 코로나 Bye! 나의 이름은 \(name)입니다.")
}
inputParamClosure("하이언") // Hello, 클로저, 코로나 Bye! 나의 이름은 하이언입니다.

// MARK: 예시 4 - 값을 리턴하는 Closure
let returnTypeClosure: (String) -> String = { name in
    let message = "안녕하세요. iOS 개발자 \(name)입니다."
    return message
}
let result = returnTypeClosure("하이언")
print(result) // 안녕하세요. iOS 개발자 하이언입니다.

// MARK: 예시 5 - Closure를 파라미터로 받는 함수 구현
/* 이렇게 만들면 "Hello Corona, from closure"이 호출안됨!
func simpleClosureFunc(clousure: () -> Void) {
    print("함수에서 호출이 되었습니다.")
}

simpleClosureFunc {
    print("Hello Corona, from closure")
}
 */

// 이렇게 만들어야 함!
func simpleClosureFunc(message: String, clousure: () -> Void) {
    print("함수에서 호출이 되었습니다.")
    print("message: \(message)")
    clousure() // 여기서 앞에서 지정한 파라미터인 clousure()를 호출시켜줘야 함!
}

simpleClosureFunc(message: "테스트입니다.", clousure: {
    print("Hello Corona, from closure")
})
// 함수에서 호출이 되었습니다.
// message: 테스트입니다.
// Hello Corona, from closure

// MARK: 예시 6 - Trailing Closure: (예시 5)의 클로저를 인자로 받고 깔끔하게 정리
// 인자가 여러개 있고 마지막 인자로 클로저도 받는 경우, 클로저 부분을 깔끔하게 줄일 수 있는 기능
// 바로 앞 simpleClosureFunc을 Trailing Closure로 바꿔보자.
simpleClosureFunc(message: "메세지") {
    print("Hello Corona, from closure.")
}
