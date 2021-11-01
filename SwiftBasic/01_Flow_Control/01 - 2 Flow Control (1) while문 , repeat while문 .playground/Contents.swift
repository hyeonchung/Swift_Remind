import UIKit

/** # Flow Control
 * 코드의 동작 흐름을 조절할 때 사용
 * 예시: if-else 구문
 ```
 if (조건1) {
        ...
  } else {
        ...
  }
 ```
 ## 다른 경우
 * While loop, for loop, **Switch Statement**
 */

// MARK: 1. While Loop
/*
while (조건) {
    code
}
 */
// 예시(1): i가 0~9일 때 해당 수를 출력
var i = 0
while i < 10 {
    print("i: \(i)")
    i += 1
}

/*
 i: 0
 i: 1
 i: 2
 i: 3
 i: 4
 i: 5
 i: 6
 i: 7
 i: 8
 i: 9

 i = 10 -> 조건 이탈 -> 자동으로 break
 */

// 예시(2): (1)의 루프를 돌다가 i=5일 때 탈출시키기
print("while문")
i = 0
while i < 10 {
    print("i: \(i)")

    // i를 출력하고난 다음에 i == 5일 때 break하도록 if 조건문 작성
    if i == 5 {
        break
    }

    i += 1
}

/*
 while문
 i: 0
 i: 1
 i: 2
 i: 3
 i: 4
 i: 5

*/

// MARK: while의 또 다른 형식
/*
 repeat{
 ...

 } while (조건)
 */

// 예시(1)
print("repeat문")
i = 0
repeat {
    print("i: \(i)")
    i += 1
} while i < 10

/*
 repeat문
 i: 0
 i: 1
 i: 2
 i: 3
 i: 4
 i: 5
 i: 6
 i: 7
 i: 8
 i: 9
 */

//MARK: repeat {... } while 문 vs while { ... } 문 비교
// j가 10일 때 맨 첫번째 while문 실행시켜보기
print(">>>while문")
var j = 10
while i < 10 {
    print("j: \(j)")
    i += 1
}

print(">>>repeat문")
j = 10
repeat {
    print("j: \(j)")
    i += 1
} while i < 10

/** 출력 결과: 조건 대조 순서 차이
 ```
 >>>while문
 >>>repeat문
 j: 10
 ```
 * while문의 경우, 첫 문장부터 조건 불충족으로 코드 실행이 안되어 바로 탈출
 * 하지만, repeat문의 경우, 첫 문장이 조건문이 아니였기 때문에, 우선 코드를 순차적으로 실행하고 while 조건문을 비교한 뒤 탈출

 #결론: 수행 동작의 순서에서 차이가 있다!
 * while문 : 조건 대조 > 코드 수행 > 조건대조 > 코드 수행
 * repeat문: 코드 수행 > 조건 대조 > 코드 수행 > 조건 대조
 */
