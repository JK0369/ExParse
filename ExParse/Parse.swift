//
//  Parse.swift
//  ExParse
//
//  Created by 김종권 on 2024/03/09.
//

import Foundation

public protocol QueryParameterParsable: Codable {}

public extension QueryParameterParsable {
    static func parse(urlString: String) -> Self? {
        // 1. URL을 URLComponents을 사용하여 field, value 쌍을 dictionary로 표현
        guard let components = URLComponents(string: urlString),
              let queryItems = components.queryItems else {
            return nil
        }
        
        // 2. JSONSerialization를 사용하면 dictionary를 jsonData로 만들기가 가능
        var parameters: [String: String] = [:]
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 3. jsonData는 Codable로 decoding 수행이 가능
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []),
              let decodedSelf = try? decoder.decode(Self.self, from: jsonData) else {
            return nil
        }
        
        return decodedSelf
    }
}
