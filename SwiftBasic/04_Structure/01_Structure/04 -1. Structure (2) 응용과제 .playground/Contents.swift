import UIKit

// 응용과제
// MARK: 1. 강의 이름, 강사 이름, 학생 수를 가지는 Lecture 구조체 생성
struct Lecture {
    let lectureTitle: String
    let lecturer: String
    let numOfStudent: Int
}

// MARK: 2. 강의 Array와 강사 이름을 받아서 해당 강사의 강의 이름을 출력하는 함수 생성
/** 기본 생성법
```
func printLectureTitle(lectures: [Lecture], lecturer: String) {
    var lectureTitle = ""
    for lecture in lectures {
        if lecture.lecturer == lecturer {
            lectureTitle = lecture.lectureTitle
        }
    }
    print("\(lecturer) 강사님의 강의는 \(lectureTitle)입니다.")
}
```
 */

// 클로저를 이용한 생성법
func printLectureTitle(lectures: [Lecture], lecturer: String) {
    // first 메서드 이용: lectures 속 각 lecture들의 강사명을 대조해 맞는게 있을 때 그 강의명을 lectureTitle로 지정
    let lectureTitle = lectures.first { (lecture) -> Bool in
                                        return lecture.lecturer == lecturer
    }?.lectureTitle ?? "" // 옵셔널이 기본적으로 출력되기 때문에 nil일 경우 빈 텍스트를 출력하도록 설정
    print ("\(lecturer) 강사님의 강의는 \(lectureTitle)입니다.")
}

// MARK: 3. 강의 3개를 만들고 강사이름으로 강의 찾기
let lecture1 = Lecture(lectureTitle: "교육심리학", lecturer: "메슬로우", numOfStudent: 20)
let lecture2 = Lecture(lectureTitle: "알고리즘", lecturer: "빌게이츠", numOfStudent: 40)
let lecture3 = Lecture(lectureTitle: "경제학원론", lecturer: "맨큐", numOfStudent: 35)

let lectures: [Lecture] = [lecture1, lecture2, lecture3]

printLectureTitle(lectures: lectures, lecturer: "맨큐") // 맨큐 강사님의 강의는 경제학원론입니다.

