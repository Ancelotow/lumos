//
//  HMAccessory.swift
//  lumos
//
//  Created by Owen Ancelot on 07/03/2024.
//

import HomeKit

extension HMAccessory {
    
    
    func isAvailableForApp() -> Bool {
        return self.isSensor() || self.isLightbulb()
    }
    
    func isSensor() -> Bool {
        return self.category.categoryType == HMAccessoryCategoryTypeSensor
    }
    
    func isLightbulb() -> Bool {
        return self.category.categoryType == HMAccessoryCategoryTypeLightbulb
    }
    
    func sortByCategory(_ otherAccessory: HMAccessory) -> Bool {
        return self.isLightbulb() && otherAccessory.isSensor()
    }
    
}

