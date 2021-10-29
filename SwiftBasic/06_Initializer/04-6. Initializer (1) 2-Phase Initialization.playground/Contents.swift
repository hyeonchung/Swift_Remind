import UIKit
// 상속된 자식 class가 새로운 형태로 생성자를 만들 수 있음을 알아본다.

/** **2-Phase Initialization**
# 2-Phase Initialization
* 자식 클래스에서 생성자 생성시 부모 클래스의 프로퍼티도 같이 추가시켜줘야 함
* 생성자 생성시 **자식 클래스의 프로퍼티를 먼저 생성한 뒤, 부모 클래스의 프로퍼티를 생성**시켜줘야 함

 ## Phase 1
 * "모든 Stored Property는 Initialize 되어야 한다."
 * 방향: Child (Sub) Class -> Parent (Super) Class
    - 자식 클래스의 프로퍼티 먼저 챙기고 부모 클래스를 챙기는 형식
 * **Phase 1 이 끝나기 전에는 다른 프로퍼티나 메서드를 사용할 수 없다**

 ## Phase 2
 * Phase 1과의 정 반대 방향: Parent (Super) Class -> Chile (Sub) Class
 * 부모 클래스의 Property까지 Initialize하고 난 뒤 프로퍼티, 메서드에 대한 사용이 가능해짐
 */

// 처음 코드
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
}

// MARK: 2Phase 예시 1: 학생이면서 운동선수인 Class에 프로퍼티를 추가로 생성하고 초기 생성자를 설정
// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String] // MARK: 1-1. 선수의 운동 종목을 나타내는 프로퍼티를 추가로 생성


    init(firstName: String, lastName: String, sports: [String]) {
        // MARK: 1-2. Phase 1: StudentAthlete에 대한 초기 생성자를 설정 (Stored Property)
        // (순서!) 자식 클래스의 프로퍼티를 먼저 선언 한 뒤, 부모 프로퍼티를 불러와 선언
        // firstName, lastName의 경우, super.init(...)을 이용해 상위 클래스인 Person에서 가져오면 됨
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)

        // MARK: 1-3. Phase 2: 생성자 설정 후 기타 프로퍼티, 메서드 접근
        self.train()
    }

    func train() {
        trainedTime += 1
    }
}

// MARK: 1-4. StudentAthlete 타입의 변수 불러오기
let student1 = StudentAthlete(firstName: "Jay", lastName: "LEE", sports: ["Football"])

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

