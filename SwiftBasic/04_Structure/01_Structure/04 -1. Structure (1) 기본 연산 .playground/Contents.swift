import UIKit

// MARK: Structure
/** Structue
 # Structure
 * 관계가 있는 여러 정보들을 묶어서 하나의 그룹으로 관리
 * Object와의 차이점?
    * Object = Data + Method
    * 여기서 Object가 구현될 수 있는 방식으로 Structure와 Class가 있다.
 */

// MARK: Class와 Struct의 차이점
/**
 # Structure vs Class
 (동일 프로퍼티로 구성된 PersonStruct와 PersonClass를 미리 만들어 놓았다고 가정)
 * Structure
     ```
     let pStruct1 = PersonStruct(name: "Jason", age: 5)
     let pStruct2 = pStruct1
     pStruct2.name = "CHUNG"

     pStruct1.name // "Jason"
     pStruct2.name // "CHUNG"
     ```
    - Value Types
    - Copy: 구조, 틀, 변수 구성 등을 복사시켜 할당 -> 틀만 공유하고 인스턴스 값은 저마다 다 다름
    - Stack 자료구조
 * Class
     ```
     let pClass1 = PersonClass(name: "Jason", age: 5)
     let pClass2 = pClass2
     pClass2.name = "CHUNG"

     pClass1.name // "CHUNG"
     pClass2.name // "CHUNG"
     ```
    - Reference Types:
    - Share: 구조, 틀, 변수의 값 등을 똑같이 공유 -> 클래스를 생성해도 모두 하나의 인스턴스를 바라보고 있음
    - Heap 자료구조
 */


// MARK: Struct 만들어서 활용하기 - 나와 가장 가까운 편의점 찾기!
// 1. Struct 구조 없이 풀이
/**
    // 1) 편의점에 대한 정보: 위치(x, y좌표), 이름 .. 우선 튜플 형태로 형성
 ```
 let store1 = (x: 3, y: 5, name: "gs")
 let store2 = (x: 4, y: 6, name: "seven")
 let store3 = (x: 1, y: 7, name: "cu")
 ```
    //2) 거리 구하는 함수 생성: 피타고라스 최단거리 공식으로 구하기
```
 func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(target.x - current.y)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)

    return distance
}
 ```
    //3) 가장 가까운 매장 출력시키는 함수
```
 func printClosestStore(currentLocation: (x: Int, y: Int), stores: [(x: Int, y: Int, name: String)]) {
    var closestStoreName: String = ""
    var closestStoreDistance = Double.infinity // 무한으로 설정해놓고 가장 짧은 거리로 줄여나간다

    for store in stores {
        let distance = distance(current: (x: currentLocation.x, y: currentLocation.y), target: (x: store.x, y: store.y))
        closestStoreDistance = min(distance, closestStoreDistance)
        if closestStoreDistance == distance {
            closestStoreName = store.name
        }
    }
    print("가장 가까운 편의점: \(closestStoreName)")
}
```
    // 4) store1, 2, 3 모아놓은 Array 및 현재 내 위치 생성
 ```
let myLocation = (x: 2, y: 2)
let stores = [store1, store2, store3]
```
    // 5) 가장 가까운 매장 출력하기
 ```
printClosestStore(currentLocation: myLocation, stores: stores) // 가장 가까운 편의점: gs
 ```
 */

// 2. struct 이용한 풀이
/**
```
 // 1) 편의점 위치 정보를 담은 Location 구조체와 편의점의 이름까지 포함한 Store 구조체 생성
 struct Location {
     let x: Int
     let y: Int
 }

 struct Store {
     let loc: Location
     let name: String
 }

 // 2) 편의점 위치 정보
 let store1 = Store(loc:Location(x: 3, y: 5), name: "gs")
 let store2 = Store(loc:Location(x: 4, y: 6), name: "seven")
 let store3 = Store(loc:Location(x: 1, y: 7), name: "cu")

 // 3) 거리 구하기 함수
 func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.y)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)

    return distance
 }

 // 4) 가장 가까운 매장 출력 함수
 func printClosestStore(currentLocation: Location, stores: [Store]) {
    var closestStoreName: String = ""
    var closestStoreDistance = Double.infinity // 무한으로 설정해놓고 가장 짧은 거리로 줄여나간다

    for store in stores {
        let distance = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distance, closestStoreDistance)
        if closestStoreDistance == distance {
            closestStoreName = store.name
        }
    }
    print("가장 가까운 편의점: \(closestStoreName)")
 }

 // 5) store1, 2, 3  모아놓은 Array 및 내 현재위치 생성
 let stores: [Store] = [store1, store2, store3]
 let myLocation = Location(x: 2, y: 2)

 printClosestStore(currentLocation: myLocation, stores: stores) // 가장 가까운 편의점: gs
```
 */

// MARK: Struct에 다양한 프로퍼티 넣어서 활용 - 배달 가능 거리 판별여부를 추가하자!
// 1) 거리 구하기 함수 먼저 생성
// struct에 배달 가능 여부 함수를 생성해줄거기 때문에 이번엔 먼저 작성!
func distance(current: Location, target: Location) -> Double {
   let distanceX = Double(target.x - current.y)
   let distanceY = Double(target.y - current.y)
   let distance = sqrt(distanceX * distanceX + distanceY * distanceY)

   return distance
}

// 1) Location, Store 구조체 생성
struct Location {
    let x: Int
    let y: Int
}

// Store 구조체: 배달 가능 거리 =. 2.0 와 distance 함수를 활용한 배달 가능 여부 함수를 추가
struct Store {
    let loc: Location
    let name: String
    let deliveryRange: Double = 2.0

    func isDeliverable(userLoc: Location) -> Bool {
        let distance = distance(current: userLoc, target: loc)
        return distance < deliveryRange
    }
}

// 2) 편의점 위치 정보
let store1 = Store(loc:Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc:Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc:Location(x: 1, y: 7), name: "cu")

// 4) 가장 가까운 매장 및 배달 가능여부 출력
func printClosestStore(currentLocation: Location, stores: [Store]) {
    var closestStoreName: String = ""
    var closestStoreDistance = Double.infinity // 무한으로 설정해놓고 가장 짧은 거리로 줄여나간다
    var isDeliverable = false // false를 디폴트로 설정하고 가능한 곳을 찾았을 때 변경시키도록 한다

    for store in stores {
       let distance = distance(current: currentLocation, target: store.loc)
       closestStoreDistance = min(distance, closestStoreDistance)
       if closestStoreDistance == distance {
           closestStoreName = store.name
           isDeliverable = store.isDeliverable(userLoc: currentLocation)
       }
    }
    print("가장 가까운 편의점: \(closestStoreName), 배달 가능여부: \(isDeliverable)")
}

// 5) store1, 2, 3  모아놓은 Array 및 내 현재위치 생성
let stores: [Store] = [store1, store2, store3]
let myLocation = Location(x: 2, y: 5)
printClosestStore(currentLocation: myLocation, stores: stores) // 가장 가까운 편의점: seven, 배달 가능여부: true

// MARK: 그래서? 일반적인 튜플이랑 무슨 차이인건데?
/**
```
 let store1 = (x: 3, y: 5, name: "gs") // 튜플형
 let store1 = Store(loc:Location(x: 3, y: 5), name: "gs") // 구조체형
```
 * 일반적인 튜플형의 경우에는 단순히 정보를 나열한 것에 불과함. 그래서, 각 데이터가 어떤 관계를 띄는지 알 수 없음
 * 그런데 구조체의 경우, 묶어낸 데이터에 이름을 붙여서 어떤 용도로 필요한 것인지, 어떤 관계인 것인지 등의 의미를 나타내준다.
    - Store 구조체
        - Location: 매장의 위치를 의미
            -   x: 매장 위치의 x좌표 / y: 매장 위치의 y 좌표
    - name: 매장의 이름을 의미
 * 그리고, 의미관계로 묶어서 표현했을 때 가독성이 높아지고 재사용성이나 리팩토링에 효과적.
 */
