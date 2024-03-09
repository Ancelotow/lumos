//
//  MotionDetectorViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import HomeKit
import Combine

class MotionDetectorViewModel: ObservableObject {
    @Published var isMotionDetected: Bool = false
    public let motionDetector: HMAccessory
    private var cancellables: Set<AnyCancellable> = []
    private let historyRepository: HistoryRepository
    
    init(motionDetector: HMAccessory, historyRepository: HistoryRepository = HistoryLocalRepository()) {
        self.motionDetector = motionDetector
        self.historyRepository = historyRepository
        if let service = motionDetector.services.first(where: { $0.serviceType == HMServiceTypeMotionSensor }) {
            _bind(service: service)
        }
    }

    private func _bind(service: HMService) {
        if let characteristic = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypeMotionDetected }) {
            characteristic.enableNotification(true) { error in
                guard error == nil else {
                    return
                }
                characteristic.publisher(for: \.value)
                    .compactMap { $0 as? Bool }
                    .sink { [weak self] newValue in
                        self?.eventChange(characteristic: characteristic)
                    }
                    .store(in: &self.cancellables)
            }
        }
    }
    
    private func eventChange(characteristic: HMCharacteristic) {
        if characteristic.characteristicType == HMCharacteristicTypeMotionDetected {
            DispatchQueue.main.async {
                self.isMotionDetected = characteristic.value as? Bool ?? false
                var historyType = self.isMotionDetected ? HistoryType.intrusion : HistoryType.none
                var history = History(
                    type: historyType,
                    date: Date.now,
                    accessoryIdentifier: self.motionDetector.uniqueIdentifier
                )
                self.historyRepository.addHistory(history: history) { error in
                    guard error == nil else {
                        print(error?.localizedDescription)
                        return
                    }
                }
            }
        }
    }
}
