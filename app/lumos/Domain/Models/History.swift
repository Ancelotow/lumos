//
//  History.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Foundation

struct History: Codable, Identifiable, Hashable {
    let id = UUID()
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
    
    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    func formattedType() -> String {
        switch self.type {
            case .intrusion:
                return "Enter"
            
            default:
                return "Exit"
        }
    }
}
