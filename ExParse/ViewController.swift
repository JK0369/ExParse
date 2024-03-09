//
//  ViewController.swift
//  ExParse
//
//  Created by 김종권 on 2024/03/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "abc://host?a1_b=1&a2=2"
        if let model = Model.parse(urlString: url) {
            print(model) // Model(a1B: Optional("1"), a2: Optional("2"))
        }
        
    }
}

// Codable을 사용한 API 응답 파싱 예시
struct SomeResponse: Codable {
    let age: Int
    let name: String
}
