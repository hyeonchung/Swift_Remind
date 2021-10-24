import UIKit

/**
 # Set
 * 순서가 없지만, 유일한 값을 가지는 타입
    * 중복되는 element가 존재하지 않는 자료형
 * 중복이 없는 unique한 아이템으로 이뤄진 자료 만들 때 사용 (주민등록번호 등등)
 */

// MARK: Set vs Array
var someSet: Set<Int> = [1, 2, 3, 1] // {3, 2, 1} => 중복요소 제거
var someArray: Array<Int> = [1, 2, 3, 1] // [1, 2, 3, 1] => 중복 요소 그대로 둠

// MARK: 공통 프로퍼티, 메소드
someSet.isEmpty // false
someSet.count // 3

someSet.contains(4) // false
someSet.contains(1) // true

someSet.insert(5)
someSet // {1, 2, 5, 3}

someSet.remove(1)
someSet // {2, 5, 3}
