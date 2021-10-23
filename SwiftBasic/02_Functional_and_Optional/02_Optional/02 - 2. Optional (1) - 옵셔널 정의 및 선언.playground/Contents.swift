import Foundation
/**
 # Optional (1)
 "Joon에게 여러 프로퍼티를 부여하는데, 그는 뚜벅이라 자동차가 없다! 이 경우에 어떻게 하나?"
 ```
 var name: String = "Joon"
 var dogName: String = "Mozzi"
 var carName: String = nil
 // 이에 대해 표현하자고 하니, 애매해짐! => 연계 함수/작업에서 파라미터로 쓰일 때 오류가 날 수 있기 떄문에!
 // 그래서 옵셔널이 등장함!!!
 ```
 # 옵셔널 Optional
 - 타입 뒤에 ? 또는 ! 가 붙여진 것
 - 변수에 nil값이 있는 경우 코드 진행에 있어 오류가 발생하지 않도록 설정해줌
 -
 */

// 옵셔널 선언
var carName: String? // let으로 선언은 안됨!
carName = nil // nil
carName = "탱크" // "탱크"

/* 아주 간단한 과제
 1. 여러분의 최애 영화배우의 이름을 담는 변수를 작성해주세요 (타입: String?)
 2. let num = Int("10") 의 타입은?
 */

// 1.
var favoriteActor: String?
favoriteActor = "한예리"

// 2.
let num = Int("10")
type(of:num) // 타입: Optional<Int>.Type .. Int? 타입! .. 왜?

/**
 #왜 Int로 변환했는데 Int? 형태로 변환이 된걸까?
 - Int로 변환했는데 실패하는 경우(nil이 반환)가 생길 수 있기 때문에!
 */

// 변환 실패 예시
let stringToNum = Int("가") // nil -> 변환 실패

