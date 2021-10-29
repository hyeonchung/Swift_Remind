import UIKit

// MARK: Convinience Initializer
/**
 모든 파라미터가 Initializer에서 안쓰일 때 -> Initializer가 너무 길어지는 것 방지
```
 convenience init(<#parameters#>) {
     <#statements#>
 }
 ```
    **단, 주 initializer (Designated Initializer)가 먼저 생성되고 난 다음에 생성 가능하다.**
 */

/** # 사용규칙: Designated Initializer (DI) vs Convinience Initializer (CI)
1. DI는 자기 부모의 DI를 호출해야 한다.
2. CI는 같은 클래스의 이니셜라이저를 꼭 하나 호출해야 한다.
3. CI는 궁극적으로는 DI를 호출해야 한다.
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

    // MARK: Convinience Initializer 생성 예시 (1)
    // 주 initializer (Designated Initializer) 생성
    // parent class인 Person의 프로퍼티를 가져와 initialize (override init 이용)
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName) // (규칙 1 - 부모 DI 호출)
    }

    // convenience init 생성: Student 클래스 자체를 파라미터로 가져와 생성
    // 적용 사례: 한 학생이 A학교에서 B학교로 전학가는 경우, 해당 학생의 데이터베이스를 그대로 가져오게 하려고 함
    convenience init(student: Student) {
        self.init(firstName: student.firstName, lastName: student.lastName) // (규칙2 - 같은 클래스 ), (규칙3 - DI 호출)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String] // 선수의 운동 종목을 나타내는 프로퍼티를 추가로 생성


    init(firstName: String, lastName: String, sports: [String]) {
        // 2-Phase Initialization
        // Phase 1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName) // (규칙1 - 부모 DI 호출)

        // Phase 2
        self.train()
    }

    // MARK: Convinience Initializer 생성 예시 (2)
    // StudentAthlete 타입 생성시, firstName 프로퍼티만 가지고 생성시킬 수 있도록 설정하기
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports: []) // (규칙2 - 같은 class), (규칙3 - DI 호출)
    }

    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "LEE")
let student1_1 = Student(student: student1) // MARK: 예시 (1) 인스턴스 생성
let student2 = StudentAthlete(firstName: "Jay", lastName: "LEE", sports: ["Football"])

// MARK: 예시 (2) 인스턴스 생성
let student3 = StudentAthlete(name: "Mike") // {{firstName "Mike", lastName ""}, []}
