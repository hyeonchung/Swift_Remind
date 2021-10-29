import UIKit
// MARK: 상속의 규칙과 실습
/** # SuperClass, SubClass
** "A is B" = "A는 B에 포함된다" = class A는 class B를 상속받는다**
 ## 예시
 * Student is Person: Student는 Person에 포함 ... O
 * Teacher is Person: Teacher는 Person에 포함 ... O
 * Person is Student: Person은 Student에 포함 안됨! ... X

 # Class의 분류
 * Person: SuperClass ( = Parent Class)
 * Student: SubClass (= Child Class)
 */

/** # 상속의 규칙
1. SubClass는 하나의 SuperClass만 상속 받는다.
 ``` SubClass A' <- SuperClass A```
2. SuperClass는 여러 SubClass들을 가질 수 있다.
 ``` SubClass X <- SuperClass A
     SubClass Y <- SuperClass A
     SubClass Z <- SuperClass A```
3. 상속의 깊이는 상관이 없다. (= 대대손손 상속이 가능하다)
``` grandchildClass A'' <- childClass A' <- ParentClass A ```
 */

// MARK: Person > Student > Athlete > FootballPlayer 순서로 상속시켜보기
// 이전 챕터에서 작성한 것 바탕으로 실습

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

let jay = Person(firstName: "Jay", lastName: "LEE")
let hyeon = Student(firstName: "Hyeon", lastName: "CHUNG")

jay.firstName // "Jay"
hyeon.firstName // "Hyeon"


let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)

hyeon.grades.append(math)
hyeon.grades.append(history)

hyeon.grades.count


// MARK: 상속 1 - 학생인데 운동선수
class StudentAthlete: Student {
    /* Student 클래스를 상속받기 때문에
     이름(Person에서 상속), grade 프로퍼티 그대로 물려받음*/

    // StudentAthlete 클래스 고유 프로퍼티, 함수 생성
    var minimumTrainingTime: Int = 2 // 최소 운동 시간
    var trainedTime: Int = 0 // 운동 시간 기록

    func train() { // 운동 함수: 운동 시간 +1 실시
        trainedTime += 1
    }
}

// MARK: 상속 2 - 학생인 운동선수인데 축구선수
class FootballPlayer: StudentAthlete{
    var footballTeam: String = "FC Swift" // 소속팀 이름

    // MARK: override - 상속받은 SuperClass의 프로퍼티 값을 subClass에 맞춰 변경
    override func train() { // 축구선수들은 운동 한 번 하면 시간 +2 실시
        trainedTime += 2
    }
}

// MARK: 상속받은 Class에 접근해 프로퍼티 확인하기
// Person 클래스의 firstName 프로퍼티
var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName // "Yuna"
athelete2.firstName // "Heung"

// Person 클래스의 grades 프로퍼티 접근
athelete1.grades.append(math)
athelete2.grades.append(math)

// StudentAthlete 클래스의 minimumTrainingTime 접근
athelete1.minimumTrainingTime // 2
athelete2.minimumTrainingTime // 2

// FootballPlayer의 footballTeam 접근
//athelete1.footballTeam // error: value of type 'StudentAthlete' has no member 'footballTeam' -  별개의 Class이기 때문에 접근 불가능
athelete2.footballTeam // "FC Swift"

// 각 인스턴스의 train() 함수 실행 후 trainedTime 변화 확인
athelete1.train()
athelete2.train()

athelete1.trainedTime // 0 + 1 = 1
athelete2.trainedTime // 0 + 2 = 2

// MARK: as? - 클래스의 형(Type) 변환
// MARK: 클래스의 형(Type) 변환 (1) -  Upper Casting
// super -> sub로 상속되면서 재정의 된 프로퍼티를 super 클래스에서 접근하고자 할 때 이용
// 예시: athlete2에서 재정의된 train() 함수를 StudentAthlete 클래스에서 사용하기
athelete1 = athelete2 as StudentAthlete // FootballPlayer 클래스의 인스턴스 athelete2를 StudentAthlete로 Upper Casting
athelete1.train()
athelete1.trainedTime // 2 (앞에서 작성한 athelete2.train() 변화값 ) -> 2+2 = 4 : +1이 아닌 +2가 된걸로 보아 FootballPlayer를 따르는걸 확인

// MARK: 클래스의 형(Type) 변환 (2) - Down Casting
// Upper super Class에서 Sub Class의 프로퍼티를 접근

// 예시: StudentAthleted 클래스인 athelete1에서 FootballPlayer 클래스의 footballTeam 프로퍼티 접근해보기
/**
 ```
 athelete1.footballTeam // error 발생
 ```
 * athelete1은 FootballPlayer을 upper casting한 상황이기 때문에 FootballPlayer 클래스 자체 인스턴스 접근 불가능.
 */

// if let 구문을 이용해 athelete1이 FootballPlayer 클래스로의 접근이 가능한지 옵셔널을 이용해 확인 후 접근시킨다.
if let son = athelete1 as? FootballPlayer {
    print("=======> team: \(son.footballTeam)")
} // =======> team: FC Swift

