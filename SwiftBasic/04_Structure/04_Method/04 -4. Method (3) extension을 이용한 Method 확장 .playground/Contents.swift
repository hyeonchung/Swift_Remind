import UIKit

/** # Method 확장
1. extension - 다른 struct의 메서드를 추가
*/

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0

    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }

    mutating func register() {
        // 등록 후 학생 수 증가시키기
        numOfRegistered += 1
    }

    static let target: String = "Anyone who wants to learn iOS Programming"

    static func returnAcademyName() -> String {
        return "아이폰학원"
    }
}

var lec = Lecture(title: "iOS Basic")
lec.remainSeats() // 10

// MARK: mutating func 이용해 구조체의 데이터 값 변화시키기
// lec에 6명 등록후 잔여 인원 조회하기
for _ in 0...5 {
    lec.register()
}
lec.remainSeats() // 4

Lecture.target // "Anyone who wants to learn iOS Programming"

// MARK: Type Method 실행해보기
Lecture.returnAcademyName() // "아이폰학원"

// MARK: extension을 이용해 메서드를 외부에서 별도로 추가
struct Math {
    // 절댓값 생성 타입 메서드
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20) // 20

// Math 구조체에 제곱, 2로 나누기 타입 메서드를 외부에서 추가로 넣고 싶을 때
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }

    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.abs(value: -4) // -4
Math.square(value: -4) // 16
Math.half(value: -4) // -2

// MARK: 기존의 타입 struct인 Int에 제곱, 반값 메서드 extension으로 넣어보기
// 애플이 기존에 만들어놓은 타입 struct도 내 입맛에 맞게 extension으로 추가 메서드 생성이 가능함
extension Int {
    func square() -> Int {
        return self * self
    }

    func half() -> Int {
        return self / 2
    }
}

10.square() // 10
10.half() // 5
