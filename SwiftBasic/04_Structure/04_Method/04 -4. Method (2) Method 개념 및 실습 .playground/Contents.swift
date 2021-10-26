import UIKit

/** # Method 개념 및 실습
1. 구조체에 메서드 작성하기
2. 구조체에 mutating 메서드 작성하기
3. 구조체에 Type 메서드 작성하기
*/

/** 강의명, 최대 수용인원, 등록인원에 대한 구조체 생성
```
struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
}

var lec = Lecture(title: "iOS Basic")

// 잔여 인원수 반환 함수 작성
func remainSeats(of lec: Lecture) -> Int {
    let remainSeats = lec.maxStudent - lec.numOfRegistered
    return remainSeats
}

remainSeats(of: lec)
```
* 그런데, remainSeats(of: lec) 함수를 **Lecture 구조체에 넣을 수도 있지 않을까?**
 > 왜?: 구조체의 프로퍼티들과 관련되어 있으니까!
 => 그럼, 한번 만들어보자!
 */

// MARK: 구조체에 메서드 작성
struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0

    // MARK: Lecture 구조체에 메서드 작성하기
    // 1) 잔여 인원 조회 메서드
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }

    // 2) 수강 신청 메서드
    // MARK: mutating func - struct내의 property를 변형시키는 메서드를 작성하기
    mutating func register() {
        // 등록 후 학생 수 증가시키기
        numOfRegistered += 1
    }

    // Type Property
    static let target: String = "Anyone who wants to learn iOS Programming"

    // MARK: Type Method
    // Type Property 처럼 struct 자체의 공통된 작업을 실시해줌
    // 예시: 이 Lecture를 제공해주는 곳을 출력해주는 함수를 생성
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


