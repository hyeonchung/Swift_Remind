import UIKit

/**
 # Capturing Values
 ## Scope 개념
 ```{swift}
 // 바깥 Scope
 if true {
    let numOutside = 3

    // 안쪽 Scope
    if true {
        let numInside = 5
        print(numOutside, numInside)
    }
    print(numOutside, numInside) // 오류발생!: Cannot find 'numInside' in scope
 }
 ```
    * 안쪽 Scope는 바깥쪽 Scope에 대한 접근이 가능함
    * 하지만, 오류로 알 수 있듯이 바깥쪽 Scope는 안쪽 Scope에 대한 접근이 불가능함!

 ## 내부 Scope가 Closure인 경우
 ```{swift}
 // 바깥 Scope
 if true {
    let name = "jason"

    // 안쪽 Scope가 클로저인 경우
    printClosure = {
        print(name)
    }
 }
```
    * printClosure를 통해 바깥쪽 name 상수를 가져와서 함수를 실행 가능하단 것을 알 수 있음 (바깥쪽 scope의 접근이 가능해짐)
    * 기존 Scope 개념과 다르게, printClousure는 if절 (바깥 Scope)를 벗어나서도 사용이 가능함
    * 이 때, 바깥 Scope에 있는 name 상수는 **Closure에 의해 Captured되었다**고 표현 => Capturing Value
 */

// MARK: Capturing Values
var count = 0
let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count // 4
