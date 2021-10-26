import UIKit

// MARK: 프로퍼티 고급
struct Person {
    // Stored property
    var firstName: String {
        // MARK: 1. 데이터의 변경 시점 확인 (only for Stored property)
        // MARK: 1-1. willSet: 값이 바뀌기 전 변경될 사항을 알려줌
        willSet {
            print("바뀌기 전 willSet: \(firstName) -> \(newValue)")
        }
        // MARK: 1-2. didSet: 값이 바뀌고 난 뒤 변경된 사항을 알려줌
        didSet {
            // 데이터 변경할 때 마다 어떻게 변한건지 출력하도록 설정
            print("바꾸고 난 후 didSet: \(oldValue) -> \(firstName)")
        }
    }
    var lastName: String

    // MARK: 2. Lazy Property
    // firstName, lastName, fullName 모두 타입 생성시 각각 프로퍼티로 즉각 할당됨
    // 하지만, Lazy는 해당 프로퍼티가 나중에 필요하여 접근할 때만 실행
    // 목적: cost가 다소 발생하는 일부 task의 경우, 선별하거나 미뤄서 작업하도록 설정 (효율화)
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()

    // Computed property
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }

            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    // Type property
    static let isAlien: Bool = false
}
var person = Person(firstName: "Hyeon", lastName: "CHUNG")

person.firstName // "Hyeon"
person.lastName // "CHUNG"

person.firstName = "Jason"
//바뀌기 전 willSet: Hyeon -> Jason
//바꾸고 난 후 didSet: Hyeon -> Jason
person.lastName = "LEE"
person.fullName // "Jason LEE"

person.fullName = "Jay Park"
//바뀌기 전 willSet: Jason -> Jay
//바꾸고 난 후 didSet: Jason -> Jay
person.isPopular // true

Person.isAlien // person이 아닌 Person => Type 자체의 속성을 반환시킴!
