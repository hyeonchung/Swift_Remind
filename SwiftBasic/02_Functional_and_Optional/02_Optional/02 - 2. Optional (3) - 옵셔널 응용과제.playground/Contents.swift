import UIKit

/**
 # Optional 도전 과제
 1. 제일 좋아하는 음식 이름을 담는 변수를 작성하고, (String?) 으로 지정
 2. 옵셔널 바인딩을 이용해 값을 확인
 3. 닉네임을 받아 출력하는 함수 만들기 (단, 입력 파라미터는 String? 타입)
*/

//MARK: 1.
let favoriteFood: String? = "양꼬치"


//MARK: 2.
func unboxOptional(from: String?) {
    if let result = from {
        print(result)
    } else {
        print("입력된 값 출력 불가능")
    }
}
unboxOptional(from: favoriteFood) // 양꼬치

// 2번 - guard let 구문 사용
func unboxOptionalGuard (from: String?) {
    guard let result = from  else {
        print("입력값 출력 불가능")
        return
    }
    print(result)
}
unboxOptionalGuard(from: favoriteFood) // 양꼬치


//MARK: 3.
func printNickName(from: String?) {
    if let nickName = from {
        print(nickName)
    } else {
        print("입력값 출력 불가능")
    }
}

var nickName: String? = "하이언"
printNickName(from: nickName) // 하이언

nickName = nil
printNickName(from: nickName) // 입력값 출력 불가능

// 3번 - guard let 구문 사용

func printNickNameGuard(from: String?) {
    guard let nickName = from else {
        print("입력값 출력 불가능")
        return
    }
    print(nickName)
}

nickName = "하이언"
printNickName(from: nickName) // 하이언

nickName = nil
printNickName(from: nickName) // 입력값 출력 불가능

