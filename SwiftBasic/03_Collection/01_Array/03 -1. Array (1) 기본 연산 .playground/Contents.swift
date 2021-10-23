import UIKit

/**
 # Collection
 *  대부분의 서비스들이 다양한 변수들을 가지고 있다. 이런 변수들을 관리하는 방법에 대한 것을 배우게 됨
 * 실생활에서의 예시: 커피 여러개 주문할 때 -> 캐리어가 필요
    => 변수들도 한번에 담아낼 수 있는 '통'이 필요 => Collection
 * Array, Dictionary, Set
 * Closure에 대해서도 배울 예정

 # Array
 * Array: 순서에 따라 요소(element)들을 담는다.
 * Array의 조건 2가지
    1. 같은 타입들로만 구성되어야 한다.
    2. 순서(Index)를 가지고 있다.
        -> 요소의 개수가 n개이면, Index는 0에서 시작해 (n-1)에서 끝
 * Array를 사용하는 경우
    - **순서**가 있는 아이템
    - 아이템의 순서를 알면 유용할 때
 */

/**
 Array에서 반드이 알아놓아야 할 연산 4가지!
 1. .isEmpty
 2. .count()
 3. Array명[index]
 4. for (idx, element) in Array명.enumerated() { ... }
 */

// MARK: Array 기본
// Array 생성
var evenNumbers: [Int] = [2, 4, 6, 8] // 짝수만 담은 Array
//let evenNumbers2: Array<Int> = [2, 4, 6, 6]

// Array에 요소 추가
evenNumbers.append(10) // [2, 4, 6, 8, 10]

// 요소를 여러개 추가시킬때
evenNumbers += [12, 14, 16] // [2, 4, 6, 8, 10, 12, 14, 16]
evenNumbers.append(contentsOf: [18, 20]) // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// Array가 비어있는지
let isEmpty = evenNumbers.isEmpty // false

// 요소 개수 확인
evenNumbers.count // 10

// 인덱싱을 이용해서 요소 확인
var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var lastItem = evenNumbers[evenNumbers.count-1]

// MARK: Optional로 출력되는 Array 메서드

// 첫번째, 마지막 원소 확인
//let firstItem = evenNumbers.first
//let lastItem = evenNumbers.last
// 옵셔널로 반환된다!!
// 왜?: 맨 첫번째 원소가 항상 존재한다고 볼 수 없기 때문에! (nil일수도 있다.)

// +) 옵셔널 바인딩을 이용해서 출력해보기
if let firstElement = evenNumbers.first {
    print(firstElement)
} else {
    print("The first element does not exist: nil")
}

// 최댓값, 최솟값 ... 최대 또는 최소가 존재하지 않을 수 있기 때문에 Optional로 반환됨
evenNumbers.max() // 20
evenNumbers.min() // 2
