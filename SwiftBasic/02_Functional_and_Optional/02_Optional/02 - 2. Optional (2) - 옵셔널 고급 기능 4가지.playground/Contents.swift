import UIKit

/**
 # Optional의 고급 기능 4가지
 1. Forced Unwrapping: 강제로 unbox
 2. Optional Binding: 비교적 부드럽게 unbox
    1) guard let
    2) if let
 3. Nil colescing: unbox 했는데 값이 없는(nil) 경우, default 값을 부여
*/

// MARK: Forced Unwrapping: (변수명)!
var carName: String?

carName = "탱크" // "탱크"
print(carName) //"Optional("탱크")\n" -> 옵셔널로 출력됨! 하지만 우리는 옵셔널 속의 value만 필요함!
print(carName!) // "탱크\n" <- optinal 벗기고 그 속의 value만 가져옴

carName = nil // nil
//print(carName!) // error: nil 상태에서는 강제로 unwrapping 할 수 없음!

// MARK: Optional Binding (1): if let
// if let (변수) { a } else { b }: (변수)가 nil값이 아니면 a블록 실행, nil인 경우 b 실행
if let unwrappedCarName = carName { // unwrappedCarName은 String 타입으로 잡힘
    print(unwrappedCarName)
} else {
    print("부여된 value가 존재하지 않음")
}

// MARK: if let 활용 예시
// String을 Int로 변환했을 때 가능한 경우와, 불가능한 경우별로 출력값 설정
func printParsedIntIf(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로의 변환이 불가능합니다.")
    }
}

printParsedIntIf(from: "100") // "100\n"
printParsedIntIf(from: "스위프트") // "Int로의 변환이 불가능합니다.\n"


// MARK: Optional Binding (2): guard let
// guard let (변수) = a else { b return } : a가 가능하다면 (변수)에 a를 할당하고, nil인 경우 b 실행 -> if let에서 복잡성을 줄임!

// if let 활용 예시를 변형
func printParsedIntGurad(from: String) {
    // parsedInt는 Int 타입으로 잡힘
    guard let parsedInt = Int(from) else {
        print("Int로의 변환이 불가능합니다.")
        return
    }
    print(parsedInt)
}

printParsedIntGurad(from: "100") // "100\n"
printParsedIntGurad(from: "스위프트") // "Int로의 변환이 불가능합니다.\n"


// MARK: 추가) if let, guard let 여러개 한번에 생성하기
/** 옵셔널 바인딩을 통해서 name, city라는 값을 뽑아낸다고 가정했을 때

``` guard let name = Array[0], let city = Array["city"] else { ... } ```
``` if let name = Array[0], let city = Array["city"] {
        .....
    } else {
        .....
    }
```
 방식으로 한번에 작성 가능함!
*/

// MARK: Nil colescing
// let (변수명): 타입 = (옵셔널타입_변수) ?? (기본값) ... (옵셔널타입_변수)이 존재하는 경우 (변수명)에 할당하고, nil이면 (기본값)을 대신 할당
// String 타입의 myCarName 변수에 String? 타입 변수인 carName을 부여하는데 carName이 nil값이면 "모델 5"를 부여한다.
let myCarName: String = carName ?? "모델 5"

