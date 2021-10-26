import UIKit

/** # 시작하기에 앞서: Object 리마인드
 * Struct는 관계가 있는 것들을 하나로 묶어 나타낸다.
 * 그리고 이렇게 관계 있는 것들을 묶어서 표현한 것을 Object라고 칭하였다.
 * Object = Data + Method
    ```
     struct Store {
        // Data
        let loc: Location
        let name: String
        let deliveryRange: Double = 2.0

        // Method
        func isDeliverable(userLoc: Location) -> Bool {
            let distance = distance(current: userLoc, target: loc)
            return distance < deliveryRange
        }
     }
    ```
 * 이번엔 여기서 Data와 관련하여 Property를 학습할 예정
 */

/** # Property
 * Swift에서는 Object의 Data 파트를 칭함
 * 종류
    ```
    struct Lecture: CustomStringConvertible {
        // Stored Property
        let lectureTitle: String
        let lecturer: String
        let numOfStudent: Int

        // Computed Property
        var description: String {
            get{ // 구조체 내의 property를 가공해 나타내는 부분
                return "Title: \(lectureTitle), Lecturer: \(lecturer)"
            }
            set{
             // 완전 새로운 데이터(newValue)를 받았을 때 구조체 내의 property에 알맞게 변경시켜주도록 세팅
                        self.(프로퍼티명) = newValue (또는 newValue를 알맞게 변경한 값)
            }
        }

        // Type Property: 모든 Lecture 타입은 폐강되지 않았다는 공통 속성을 넣어놓자.
        static let isClosed: Bool = false
    }
    ```
    * Stored Property
        - 어떤 값을 저장시켜 변수로 담고 있는 것
        - var, let 둘 다 작성 가능
    * Computed Property
        - Stored Property를 이용, 가공시켜 나타내는 값
        - var 만 작성 가능
        - **Read-Only** 성질! ->  특정 값으로 할당 및 세팅이 불가능!
          - 하지만, Stored 값끼리 서로 관계를 정리할 수 있다면, 세팅도 가능함
          - 이때, get-set (또는 getter - setter) 구문을 추가해서 작성해줘야 함
    * Type Property
        - 생성된 인스턴스와 상관없이 struct/class의 타입 자체의 속성을 정하고자 할 때 사용
*/

// MARK: 프로퍼티 만들기
struct Person {
    // Stored property
    var firstName: String
    var lastName: String

    // Computed property
    var fullName: String {
        get { // 구조체 내의 property를 가공해 나타내는 부분
            return "\(firstName) \(lastName)"
        }
        set { // 완전 새로운 데이터(newValue)를 받았을 때 구조체 내의 property에 알맞게 변경시켜주도록 세팅
            // 공백을 기준으로 분해했을 때 맨 첫번째 component를 firstName으로 할당
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }

            // 공백을 기준으로 분해했을 때 맨 마지막 component를 lastName으로 할당
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    // Type property
    // Person 자체는 외계인이 아니기 때문에 isAlien = false 특성을 갖도록 설정
    static let isAlien: Bool = false
}

var person = Person(firstName: "Hyeon", lastName: "CHUNG")

// MARK: Stored Property
person.firstName // "Hyeon"
person.lastName // "CHUNG"

// MARK: 프로퍼티 바꿔보기
person.firstName = "Jason"
person.lastName = "LEE"

// Person struct에서 var 변수로 프로퍼티를 선언했기 때문에 변경 가능함
// let으로 선언시 초기 생성값에서 변경 불가능
// (참고) 실무에서는 최대한 let으로 선언하는 편
person.firstName // "Jason"
person.lastName // "LEE"


// MARK: Computed Property
// 기존 stored property를 바탕으로 출력 (get 구문이 작동)
person.fullName // "Jason LEE"

// 새로 받은 데이터를 이용해 stored property 출력 (set 구문이 작동)
person.fullName = "Jay Park"
person.firstName // "Jay"
person.lastName // "Park"

// MARK: 타입 프로퍼티
Person.isAlien // person이 아닌 Person => Type 자체의 속성을 반환시킴!
