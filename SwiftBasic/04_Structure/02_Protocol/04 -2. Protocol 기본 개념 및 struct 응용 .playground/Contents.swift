import UIKit

// MARK: 프로토콜
/**
 # Protocol
 * 지켜야 할 **약속** => 반드시 구현되어야 할 목록
 * 특정 서비스를 구현할 때 해야하는 목록이며, 이를 준수해야 사용 가능하다.
 * 예시: CustomStringConvertible이라는 서비스를 구현하기 위해서는 description이 반드시 있어야 한다.
    ```
    public protocol CustomStringConvertible {
        public var description: String {get}
    }
    ```
 */
// MARK: struct 응용과제 변형: 프로토콜 적용
// CustomStringConvertible 프로토콜을 적용시켜 데이터 출력시 커스텀 해놓은 description이 출력되도록 설정

// 1. struct 이름 바로 뒤에 ': CustomStringConvertible' 덧붙이기
// Type 'Lecture' does not conform to protocol 'CustomStringConvertible' 오류를 fix 시켜 description 요소 추가 및 준수
struct Lecture: CustomStringConvertible {
    let lectureTitle: String
    let lecturer: String
    let numOfStudent: Int

    var description: String {
        return "Title: \(lectureTitle), Lecturer: \(lecturer)"
    }
}

// 3. 강의 3개를 만들고 강사이름으로 강의 찾기
let lecture1 = Lecture(lectureTitle: "교육심리학", lecturer: "메슬로우", numOfStudent: 20)
let lecture2 = Lecture(lectureTitle: "알고리즘", lecturer: "빌게이츠", numOfStudent: 40)
let lecture3 = Lecture(lectureTitle: "경제학원론", lecturer: "맨큐", numOfStudent: 35)

// CustomStringConvertible 프로토콜에 의해 지정된 description이 출력됨!
print(lecture1) // Title: 교육심리학, Lecturer: 메슬로우
print(lecture2) // Title: 알고리즘, Lecturer: 빌게이츠
print(lecture3) // Title: 경제학원론, Lecturer: 맨큐
