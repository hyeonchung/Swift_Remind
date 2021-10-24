import UIKit

/** 클로저 보충설명
 # Closure
 * 클로저에는 Global함수, Nested 함수, Closure Expressions로 나뉨
 * 그 중에서 지금 배우고 있는건 **Clousre Expressions**

 # Closure Expressions
    "Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surriounding context"
 * 함수처럼  기능을 수행하는 코드 블록
 * 함수와 다르게 이름이 없다

 # 함수 vs 클로저
 * 공통점
    * **First Class Type (일급객체)**
        * 변수에 할당할 수 있다
        * 인자로 받을 수 있다.
        * 값으로 리턴 가능함
 * 차이점
    * 이름
        함수:  O / 클로저: X
    * func 키워드
        함수: 필요 / 클로저: 불필요

 # 실제 자주 쓰이는 클로저 사례
 ## Completion Block
    * 특정 Task가 완료 되었을 때 실행되는 클로저
    * 예시: 비동기 네트워크 - 네트워킹을 통해 데이터를 받고난 뒤 인터페이스에 나타냄
     ``` DispatchQueue.main.async { <#code#> } ```

 ## Higher Order Function (고계함수)
    * 인자를 함수로 받을 수 있는 함수
    * 별도로 함수를 만들어 input에 넣을 수 있지만, 그렇게 하지 않고 함수 내에서 클로저로 만들어냄
    * 예시: Collection 타입에서 쓰이는 map, filter, reduce, sort 메서드
 */

