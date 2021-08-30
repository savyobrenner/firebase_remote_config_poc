//
//  FirebaseRemoteConfigManager.swift
//  FirebaseTeste
//
//  Created by Brenner on 25/08/21.
//

import Foundation

class RemoteVersionObject: NSObject {
    var isUpdated = true
    var isMaintenance = false
    var isBlocked = false
    var showFirstStackElement = true
    var showSecondStackElement = true
    var showThirdStackElement = true
    var showPrintButton = true
    var showSaveButton = true
    var showDonateButton = true
    var version = ""
}

class RemoteConfigManager {
    
    static var shared = RemoteConfigManager()
    
    var remoteConfigVersion = RemoteVersionObject()
    
    func setRemoteConfigContent(isMaintenance: Bool, isUpdated: Bool, isBlocked: Bool, version: String, showFirstStackElement: Bool, showSecondStackElement: Bool, showThirdStackElement: Bool, showPrintButton: Bool, showSaveButton: Bool, showDonateButton: Bool) {
        RemoteConfigManager.shared.remoteConfigVersion.isMaintenance = isMaintenance
        RemoteConfigManager.shared.remoteConfigVersion.isUpdated = isUpdated
        RemoteConfigManager.shared.remoteConfigVersion.isBlocked = isBlocked
        RemoteConfigManager.shared.remoteConfigVersion.version = version
        RemoteConfigManager.shared.remoteConfigVersion.showFirstStackElement = showFirstStackElement
        RemoteConfigManager.shared.remoteConfigVersion.showSecondStackElement = showSecondStackElement
        RemoteConfigManager.shared.remoteConfigVersion.showThirdStackElement = showThirdStackElement
        RemoteConfigManager.shared.remoteConfigVersion.showPrintButton = showPrintButton
        RemoteConfigManager.shared.remoteConfigVersion.showSaveButton = showSaveButton
        RemoteConfigManager.shared.remoteConfigVersion.showDonateButton = showDonateButton
    }
}
