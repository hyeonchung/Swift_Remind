import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// MARK: Array의 범위를 이용한 연산
// a...b: a이상 b이하 / a..<b: a이상 b미만
// 첫번째~세번째 원소 출력
var firstThree = evenNumbers[0...2] // [2, 4, 6]
firstThree = evenNumbers[0..<2] // [2, 4]

// MARK: 특정 요소 포함여부 확인
evenNumbers.contains(3) // false
evenNumbers.contains(12) // true

// MARK: 특정 인덱스에 새로운 원소 삽입
// .insert(_ newElement: ... , at: Int)
evenNumbers.insert(0, at: 0) // 0번째 index에 0 삽입
print(evenNumbers) // [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// MARK: 삭제하기
//evenNumbers.removeAll() // 전체 삭제
// 인덱스로 특정 원소 삭제
evenNumbers.remove(at: 0) // 0번째 요소 삭제
evenNumbers // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]


// MARK: 수정하기
evenNumbers[0] = -2 // 특정 원소값 수정
evenNumbers // [-2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers // [-2, 0, 2, 8, 10, 12, 14, 16, 18, 20]

// MARK: 순서 맞바꾸기(swapAt)
evenNumbers.swapAt(0, 1) // 0, 1번째 원소 서로 자리 맞바꾸기
evenNumbers // [0, -2, 2, 8, 10, 12, 14, 16, 18, 20]

// MARK: for loop을 활용한 연산: .enumerated()
// index와 element를 동시에 바로 알 수 있는 반복문
for (index, element) in evenNumbers.enumerated() {
    print("인덱스: \(index), value: \(element)")
}

// MARK: 앞에서부터 n개를 제외하고 반환 (삭제하는게 아님!)
// 맨 첫번째 원소부터 3개 제외하고 나머지 원소만 나타낸다
evenNumbers.dropFirst(3) // [8, 10, 12, 14, 16, 18, 20]
evenNumbers // [0, -2, 2, 8, 10, 12, 14, 16, 18, 20]

// 마지막 원소만 제외하고 출력
evenNumbers.dropLast() // [0, -2, 2, 8, 10, 12, 14, 16, 18]
evenNumbers // [0, -2, 2, 8, 10, 12, 14, 16, 18, 20]

// 맨 앞에서부터, 맨 뒤에서부터 요소 n개 추출하기
evenNumbers.prefix(3) // 앞에서부터 3개: [0, -2, 2]
evenNumbers.suffix(3) // 끝에 3개: [16, 18, 20]

