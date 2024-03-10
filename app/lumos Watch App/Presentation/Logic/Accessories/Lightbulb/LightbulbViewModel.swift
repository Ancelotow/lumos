//
//  LightbulbViewModel.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import Combine
import HomeKit

class LightBulbViewModel: ObservableObject {
    @Published var isOn: Bool = false
    @Published var brightness: Int = 0
    private var cancellables: Set<AnyCancellable> = []
    private var light: HMAccessory
    
    init(lightbulb: HMAccessory) {
        self.light = lightbulb
        if let service = lightbulb.services.first(where: { $0.serviceType == HMServiceTypeLightbulb }) {
            self._bind(service: service)
        }
    }
    
    private func _bind(service: HMService) {
        if let characteristic = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypePowerState }) {
            characteristic.enableNotification(true) { error in
                guard error == nil else {
                    print("Error enabling notification for power state: \(error!)")
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

        if let charBrightness = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypeBrightness }) {
            charBrightness.enableNotification(true) { error in
                guard error == nil else {
                    print("Error enabling notification for brightness: \(error!)")
                    return
                }

                charBrightness.publisher(for: \.value)
                    .compactMap { $0 as? Int }
                    .sink { [weak self] newValue in
                        self?.eventChange(characteristic: charBrightness)
                    }
                    .store(in: &self.cancellables)
            }
        }
    }
    
    private func eventChange(characteristic: HMCharacteristic) {
        if characteristic.characteristicType == HMCharacteristicTypeBrightness {
            DispatchQueue.main.async {
                self.brightness = characteristic.value as? Int ?? 0
            }
        } else if characteristic.characteristicType == HMCharacteristicTypePowerState {
            DispatchQueue.main.async {
                self.isOn = characteristic.value as? Bool ?? false
            }
        }
    }
    
    func toggleLight() {
        isOn.toggle()
        if let service = light.services.first(where: { $0.serviceType == HMServiceTypeLightbulb }) {
            if let powerState = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypePowerState }) {
                powerState.writeValue(isOn) { error in
                    if let error = error {
                        print(error)
                    }
                }
            }
       }
    }
}
