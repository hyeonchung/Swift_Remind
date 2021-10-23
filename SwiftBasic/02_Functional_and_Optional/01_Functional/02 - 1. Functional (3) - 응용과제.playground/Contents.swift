/**
 # Functional & Optional
 */

import Foundation

// MARK: Function(3) - 응용, 도전과제

// 1. 성, 이름을 받아서 fullName을 출력하는 함수 만들기
func printFullName(firstName: String, lastName: String) {
    print(firstName + " " + lastName)
}
printFullName(firstName: "Hyeon", lastName: "CHUNG")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거한 뒤 fullName을 출력하는 함수 작성
func printFullNameWithLastName(_ firstName: String, _ lastName: String) {
    print(firstName + " " + lastName)
}
printFullNameWithLastName("Hyeon", "CHUNG")

// 3. 성, 이름을 받아서 fullName을 return하는 함수 작성
func printFullNameWithParams(firstName: String, lastName: String) -> String {
    let fullName = firstName + " " + lastName
    return fullName
}
let fullName = printFullNameWithParams(firstName: "Hyeon", lastName: "CHUNG")
print(fullName)
