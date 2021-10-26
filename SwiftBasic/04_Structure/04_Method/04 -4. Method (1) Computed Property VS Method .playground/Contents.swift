import UIKit

// MARK: Computed 프로퍼티 vs 메서드
struct Person {
    var firstName: String {
        willSet {
            print("바뀌기 전 willSet: \(firstName) -> \(newValue)")
        }
        didSet {
            print("바꾸고 난 후 didSet: \(oldValue) -> \(firstName)")
        }
    }
    var lastName: String

    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }

//        if fullName() == "Jay Park" {
//            return true
//        } else {
//            return false
//        }
    }()

    // MARK: Computed Property 재가공
//    var fullName: String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//        set {
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//        }
//    }
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }

    // fullName이랑 fullName()이랑 뭐가 다른거야? => computed property vs method!

    static let isAlien: Bool = false
}
var person = Person(firstName: "Hyeon", lastName: "CHUNG")

// MARK: fullName이랑 fullName()이랑 뭐가 달랐던걸까?
/** # Computed Property VS Method
# Computed Property
 * 호출시 **(저장된) 값**을 하나 반환한다!
 * Computed Property로 작성하는 경우
    - get(getter) - set(setter) 작성시 Setter가 필요한 경우
    - Setter가 필요하지 않을 뿐더러, 복잡한 계산이나 DB access나 File io가 필요하지 않은 경우

# Method
 * 호출시 어떤 **작업**을 한다
 * Method로 작성하는 경우
    - Setter 작성이 하지 않으며, 복잡한 계산이나 DB access나 File io가 필요한 경우
 */
