import UIKit

/** #응용과제
  1. 이름, 직업, 도시에 대해서 본인의 딕셔너리를 만드세요
 2. 여기서 도시를 부산으로 업데이트
 3. 딕셔너리를 받아서 이름과 도시를 프린트하는 함수 생성
 */


// 1
var hyeonDic : [String:String] = ["name": "Hyeon CHUNG",
                                  "occcupation": "Student",
                                  "city": "Goyang"]

// 2
hyeonDic["city"] = "Busan"
print(hyeonDic) // ["City": "Busan", "name": "Hyeon CHUNG", "Occcupation": "Student"]

// 3
func printNameCity(dict: [String: String]) {
    guard let name = dict["name"], let city = dict["city"] else {return}
    print("name: \(name), city: \(city)")
}

printNameCity(dict: hyeonDic)






