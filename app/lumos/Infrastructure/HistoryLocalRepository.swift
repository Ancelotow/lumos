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
            let histories = try _getHistories()
            let results = histories
                .filter { $0.accessoryIdentifier == accessoryIdentifier }
                .sorted { $0.date > $1.date }
            completion(results, nil)
        } catch {
            completion([], error)
        }
    }
    
    func addHistory(history: History, completion: @escaping (Error?) -> Void) {
        do {
            var histories = try _getHistories()
            let results = histories
                .filter { $0.accessoryIdentifier == history.accessoryIdentifier }
                .sorted { $0.date > $1.date }
            guard let lastHistory = results.first else {
                completion(nil)
                return
            }
            guard lastHistory.type != history.type else {
                completion(nil)
                return
            }
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
    
    private func calculateIntervalInMinutes(from startDate: Date, to endDate: Date) -> Double {
        let intervalInSeconds = endDate.timeIntervalSince(startDate)
        let intervalInMinutes = intervalInSeconds / 60.0
        print(intervalInMinutes)
        return intervalInMinutes
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
