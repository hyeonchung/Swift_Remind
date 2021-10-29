import UIKit

// MARK: Class의 상속 코드로 바로 배우기

/** 처음 주어진 코드
 ```
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

class Student {
    var grades: [Grade] = []

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
 ```
 */

// 성적에 대한 프로퍼티를 모아놓은 Grade 구조체
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}
// MARK: 1. 코드에서 Person, Student 클래스를 보면 겹치는게 많음 -> 상속을 이용해 중복 해결!
/*
학생은 사람의 부분집합이다.
 => Student 클래스는 Person 클래스를 상속받도록 설정하자!
 */

// 사람에 대한 정보를 담은 클래스
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

// MARK: 1-1. Person 클래스를 상속받도록 Student 클래스 바꾸기
class Student: Person {
    var grades: [Grade] = []

    // 중복되는 부분을 또 작성하지 않아도 Person에서 상속받기 때문에 그대로 사용 가능함
}

// MARK: 1-2. 상속시킨대로 되는지 인스턴스 생성해서 테스트해보기
let jay = Person(firstName: "Jay", lastName: "LEE")
let hyeon = Student(firstName: "Hyeon", lastName: "CHUNG")

jay.firstName // "Jay"
hyeon.firstName // "Hyeon"
// hyeon을 보면, Student에서 따로 프로퍼티 선언 안했는데도 Person에서 상속 받은대로 자동으로 프로퍼티를 불러오고 접근할 수 있음


let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
hyeon.grades.append(math)
hyeon.grades.append(history)
hyeon.grades // [{letter "B", points 8.5, credits 3}, {letter "A", points 10, credits 3}]
//jay.grades // Mother Class에서는 상속받은 클래스로 접근은 불가능하다.
