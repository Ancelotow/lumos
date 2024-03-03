//
//  IconHelper.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import HomeKit

class IconHelper {
    
    private static let iconsAccessories: [String: String] = [
        HMAccessoryCategoryTypeLightbulb: "light",
        HMAccessoryCategoryTypeIPCamera: "camera",
        HMAccessoryCategoryTypeSensor: "intrusion"
    ]
    
    static func getIcon(_ accessory: HMAccessory) -> String {
        var type = accessory.category.categoryType
        return iconsAccessories[type] ?? "camera"
    }
}
