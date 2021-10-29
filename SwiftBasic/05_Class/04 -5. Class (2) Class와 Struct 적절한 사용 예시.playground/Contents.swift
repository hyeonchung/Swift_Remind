import UIKit

// MARK: Struct와 Class 사용하는 경우

/** # Struct를 적절히 사용하는 경우
 1. 두 Object를 "같다, 다르다"로 비교해야 하는 경우
```
let point1 = Point(x: 3, y: 5)
let point2 = Point(x: 3, y: 5)
// 위 두 point가 같은지 확인하는 것 처럼, 데이터 자체를 비교하는 경우에는 struct를 사용한다.
 ```

 2. Copy된 각 객체들이 독립적인 상태를 가져야 하는 경우
```
var myMac = Mac(owner: "Jason")
var yourMac = myMac
yourMac.owner = "Jay"

myMac.owner // "Jason"
yourMac.owner // "Jay"
```

 3. 코드에서 Object의 데이터를 여러 스레드에 걸쳐 사용하는 경우
 * 여러 스레드에 걸쳐 사용하는 경우, 데이터의 안전성을 고려해야 함
 * 각 스레드가 unique한 인스턴스들을 가지고 있기 때문에 잠재적 위험을 최소화 시킬 수 있음
*/


/** # Class를 적절히 사용하는 경우
 1. 두 Object의 인스턴스 자체가 같음을 확인하는 경우
 * Object의 데이터 같은게 아닌 **객체 자체**가 정말 같은지 확인해야 하는 경우

 2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우
 * 예시: iOS 앱 개발 -> UIApplication 객체 ... 단일 객체지만 앱 내의 여러 객체들이 접근해야 함
    => 이럴땐 Reference Type인 Class로 만들어 줘서 제공해줘야 함
*/

/** # 좀 더 빠르게 판단할 수 있는 방법!
우선, Struct로 만들어보자!  ->  Swift는 Struct를 선호하는 편.
 */
