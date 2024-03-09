//
//  HistoryLocalRepository.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Foundation

class HistoryLocalRepository : HistoryRepository {
    
    private let fileUri = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first?.appendingPathComponent("history.json")
    
    func getHistories(accessoryIdentifier: UUID, completion: @escaping ([History], Error?) -> Void) -> Void {
        do {
            var histories = try _getHistories()
            var results = histories
                .filter { $0.accessoryIdentifier == accessoryIdentifier }
                .sorted { $0.date < $1.date }
            completion(results, nil)
        } catch {
            completion([], error)
        }
    }
    
    func addHistory(history: History, completion: @escaping (Error?) -> Void) {
        do {
            var histories = try _getHistories()
            histories.append(history)
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let jsonFile = try encoder.encode(histories)
            if let fileUrl = fileUri {
                try jsonFile.write(to: fileUrl, options: .atomic)
                completion(nil)
            } else {
                completion(CustomError.defaultError(message: "Failed to get file URL"))
            }
        } catch {
            completion(error)
        }
    }

    private func _getHistories() throws -> [History] {
        if let fileUrl = fileUri, FileManager.default.fileExists(atPath: fileUrl.path) {
            let jsonData = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([History].self, from: jsonData)
        } else {
            return []
        }
    }
    
}
