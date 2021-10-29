import UIKit

/** # Class
    * Structure 외의 또 다른 Object
     ```
     let pClass1 = PersonClass(name: "Jason", age: 5)
     let pClass2 = pClass2
     pClass2.name = "CHUNG"

     pClass1.name // "CHUNG"
     pClass2.name // "CHUNG"
     ```
    - Reference Types
    - Share: 구조, 틀, 변수의 값 등을 똑같이 공유 -> 클래스를 생성해도 모두 하나의 인스턴스를 바라보고 있음
    - Heap 자료구조

    ## (참고) 자료구조: Stack vs Heap
        ### Stack ... struct
             * 시스템에서 당장 실행해야하거나 타이트하게 컨트롤해야하는 것들을 저장, 처리 -> 효율적, 빠름
      ### Heap ... class
             * 시스템에서 클래스 같은 레퍼런스 타입을 저장.
        * 메모리 풀이 크기 때문에 시스템에 동적으로 메모리 할당 요청이 가능
        * 대신, 자동으로 데이터를 제거하지 않기 때문에 개발자가 직접 신경 써줘야 함 -> 비교적 복잡, 느림

    ## Structure와 Class 비교 최종정리
    ### Structure
      - Value Types
     - Copy
     - Stack 자료구조 => Fast
    ### Class
    - Reference Types
    - Share
    - Heap 자료구조 => Slow
  */

// MARK: 1. struct를 class 형식으로 변환시켜보기
struct PersonStruct {
    var firstName: String
    var lastName: String

    var fullName: String {
            return "\(firstName) \(lastName)"
    }

    // 이름 다 대문자로 바꾸는 함수: 구조체 내 프로퍼티값 변화 - mutating func
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass {
    var firstName: String
    var lastName: String

    // MARK: 1-1. 프로퍼티에 대한 initializer 생성
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    // MARK: 1-2. stored, computed property는 그대로 작성하면 됨
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    // MARK: 1-3. class에서는 mutating이 없기 때문에 그냥 함수로 생성하면 된다.
    func uppercaseName(){
        self.firstName = firstName.uppercased()
        self.lastName = lastName.uppercased()
    }
}

// MARK: 2. struct, class 할당하기
// struct
var personStruct1 = PersonStruct(firstName: "Hyeon", lastName: "CHUNG")
var personStruct2 = personStruct1

// class
var personClass1 = PersonClass(firstName: "Hyeon", lastName: "CHUNG")
var personClass2 = personClass1

// MARK: 2-1. struct상에서 데이터를 변경했을 때 - 지정한 것만 변한다
personStruct2.firstName = "Jay"
personStruct1.firstName // "Hyeon"
personStruct2.firstName // "Jay"

// MARK: 2-2. class상에서 데이터를 변경했을 때 - 지정한 것 말고도 전부 변한다
personClass2.firstName = "Jay"
personClass1.firstName // "Jay" <- 참조하는 클래스가 같기 때문에 personClass2와 같은 값
personClass2.firstName // "Jay"

// MARK: 3. 참조했던 클래스에 새로운 클래스를 할당하는 경우
// personClass2에 새로운 클래스 할당하는 경우
personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
personClass1.firstName // "Jay"
personClass2.firstName // "Bob" <- personClass2에 새로운 클래스가 할당되면서 해당 클래스를 참조하도록 바뀜!



