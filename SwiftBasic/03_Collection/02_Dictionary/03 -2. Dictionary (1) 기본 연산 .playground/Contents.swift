import UIKit

/**
 # Dictionary
 *  Array와 다르게 순서가 없다
 * Key-Value 쌍으로 구성되어 있다.
    * Key는 Unique해야한다. (구분 가능, 유일)
 * **의미 단위**의 데이터를 찾을 때 편리하다.

 ## Dictionary vs Array
 *  Array는 순서기반, Dictionary는 Key 기반
 */

// MARK: Dictionary 구현
// 시험성적에 대한 자료 형성
var scoreDict: [String: Int] = ["Jason": 88, "Jay": 95, "Jake": 90]
//var scoreDict: Dictionary<String, Int> = ["Jason": 88, "Jay": 95, "Jake": 90]

// MARK: Key값을 이용해 데이터 접근
// 주의! 타입: Optional
scoreDict["Jason"] // 88
scoreDict["Jay"] // 95
scoreDict["Jake"] // 90
scoreDict["Jerry"] // 해당되는 Key값이 없는 경우엔 nil이 출력

    // +) 옵셔널 바인딩으로 value 가져오기
if let score = scoreDict["Jason"] {
    score
} else {
    print("nil")
}

// MARK: 빈 자료인지 확인 및 item 개수 카운트
scoreDict.isEmpty // false
scoreDict.count // 3

// MARK: 기존 데이터 수정 (업데이트)
scoreDict["Jason"] = 99
scoreDict // ["Jay": 95, "Jason": 99, "Jake": 90]

// MARK: 신규 데이터 추가
scoreDict["Jack"] = 100
scoreDict // ["Jake": 90, "Jay": 95, "Jason": 99, "Jack": 100]

// MARK: 데이터 삭제: 해당 key의 value를 nil로 설정
scoreDict["Jack"] = nil
scoreDict // ["Jay": 95, "Jason": 99, "Jake": 90]

// MARK: for loop 활용
// for (key, value) in Dict명 {}: key, value 둘다 활용
for (name, score) in scoreDict {
    print("이름: \(name), 점수: \(score)")
}

// key만 따로 볼 수 있는 for문
for key in scoreDict.keys {
    print(key)
}

