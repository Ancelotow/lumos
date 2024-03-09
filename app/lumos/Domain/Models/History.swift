//
//  History.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Foundation

struct History: Codable {
    let type: HistoryType
    let date: Date
    let accessoryIdentifier: UUID
    
    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }

    static func fromJson(_ jsonData: Data) throws -> History {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(History.self, from: jsonData)
    }
}
