
/** # 스위프트 기초
 1. Swift Playground: 간단한 Task Code, Pair Programming 등을 할 때 자주 사용
 2. Comment
 3. Tuple
 4. Boolean
 5. Scope
*/

import UIKit

var greeting = "Hello, playground"

// MARK: 1. Playground를 이용한 간단한 코드 작성
let value = arc4random_uniform(100)
print("---> \(value)")

// MARK: 2. Comment
/**
 1. // (comment): // 뒤 ( ) 부분 주석처리
 2. command + / : 해당 라인 모두 주석처리
 3. /* ... */: 여러 줄의 주석을 남기는 경우
 */

// MARK: 3. Tuple
/**
 - 두 개의 데이터가 동시에 필요한 경우
 */

let coordinate = (4, 6) // (Int, Int) 형태의 튜플 형식

let x = coordinate.0 // 4
let y = coordinate.1 // 6

// 튜플 요소에 이름을 부여해서 생성 가능
let coordinateNamed = (x: 2, y: 3)
let x2 = coordinateNamed.x
let y2 = coordinateNamed.y

// 개별 변수를 쉽게 추출하는 방법 ... 생성할 때 미리 이름을 지정
let (x3, y3) = coordinateNamed
x3
y3

// MARK: 4. Boolean
// True, False 두 가지 값만 존재하는 타입
let yes = true
let no = false
// Bool 타입으로 표시됨

// 사용법1: 특정 조건의 참, 거짓 판별
let isFourGreaterThanFive = 4 > 5 // false

// 사용법2: 코드 흐름을 제어 (Flow Control)
if isFourGreaterThanFive {
    print("참")
} else {
    print("거짓")
}

/*
 if (조건) {
    (조건이 참인 경우 실시할 코드)
 } else {
    (조건이 거짓인 경우 실시할 코드)
 }
*/

// Boolean 예시 1
let a = 5
let b = 10

if a > b {
    print("======> a가 크다")
} else {
    print("======> b가 크다")
}

// Boolean 예시 2
let name1 = "Jin"
let name2 = "Jason"

let isTwoNameSame: Bool = name1 == name2

if isTwoNameSame {
    print("=======> 이름이 일치합니다.")
} else {
    print("=======> 이름이 불일치합니다.")
}


// MARK: Boolean 추가 개념 - 논리, 삼항 연산자
/**
 1. 논리연산자
 2,. 삼항연산자
 */

// 논리연산자: AND, OR
// AND: 조건을 모두 만족하는 경우 => &&
// OR: 조건들 중 하나라도 만족하는 경우 => ||
let isJason = name2 == "Jason"
let isMale = false

let jasonAndMale = isJason && isMale // 둘 다 만족해야 함
let jasonOrMale = isJason || isMale // 둘 중 하나라도 만족하면 됨

let greetingMessage: String
if isJason {
    greetingMessage = "Hello Jason"
} else {
    greetingMessage = "Hello Somebody"
}
print(greetingMessage) // "Hello Jason\n"


// 삼항 연산자
// let (상수명): 출력 타입 = (조건문) ? (참일때 코드) : (거짓일때 코드)
// 위에 5줄로 작성한 greetingMessage 조건문을 삼항연산자를 이용해 한줄로 축약

let printingMessage: String = isJason ? "Hello Jason" : "Hello Somebody"

// MARK: Scope
/**
 코드블럭 내에 설정된 변수
 # Local Scope
 - 메소드 내에서만 사용
 - 코드 블럭 내에 있는 것
 */

// 아르바이트를 해서 시급을 받는 예제
var hours = 50
var payPerHour = 10000
var salary  = 0

if hours > 40 {
    // if절 내 여기 코드블럭이 하나의 scope이 됨!
    let extraHours = hours - 40
    salary += extraHours * payPerHour * 2
    hours -= extraHours
}
salary += hours * payPerHour
print(salary)

// extraHours는 코드블록 안에서만 사용하는걸로 생성되었기 때문에 밖에선 출력 못함
//print(extraHours)

// 반면 hours는 코드블럭 바깥에서 생성된 전역변수기 때문에 출력 가능함
print(hours)
