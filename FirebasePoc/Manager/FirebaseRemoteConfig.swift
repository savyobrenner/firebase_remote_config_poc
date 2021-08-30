//
//  FirebaseRemoteConfig.swift
//  FirebaseTeste
//
//  Created by Brenner on 25/08/21.
//

import Foundation
import FirebaseRemoteConfig


class FirebaseRemoteConfig: NSObject {
    
    
    class func updateRemoteConfigValues(remoteConfig: RemoteConfig, completion: @escaping ( _ success: Bool) -> Void) {

        var remoteKeyForSplash: String = "firebase_teste_ios_"
        var remoteKeyForHome: String = "firebase_teste_ios_home_"
        let expirationDuration = 0
        var currentVersion: String = ""
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            currentVersion = version
            remoteKeyForSplash += currentVersion.replacingOccurrences(of: ".", with: "_")
            remoteKeyForHome += currentVersion.replacingOccurrences(of: ".", with: "_")
        }
        
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                remoteConfig.activate(completion: nil)
                let version = RemoteVersionObject()
                
                if remoteConfig[remoteKeyForSplash].stringValue?.uppercased() == "BLOCK" { version.isBlocked = true }
                if remoteConfig[remoteKeyForSplash].stringValue?.uppercased() == "NEEDUPDATE" { version.isUpdated = false }
                if remoteConfig[remoteKeyForSplash].stringValue?.uppercased() == "MAINTENANCE" { version.isMaintenance = true }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDEFIRSTSTACKELEMENT" { version.showFirstStackElement = false }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDESECONDSTACKELEMENT" { version.showSecondStackElement = false }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDETHIRDSTACKELEMENT" { version.showThirdStackElement = false }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDESPRINTBUTTON" { version.showPrintButton = false }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDESAVEBUTTON" { version.showSaveButton = false }
                if remoteConfig[remoteKeyForHome].stringValue?.uppercased() == "HIDEDONATEBUTTON" { version.showDonateButton = false }
                
                RemoteConfigManager.shared.setRemoteConfigContent(isMaintenance: version.isMaintenance,
                                                                  isUpdated: version.isUpdated,
                                                                  isBlocked: version.isBlocked,
                                                                  version: currentVersion,
                                                                  showFirstStackElement: version.showFirstStackElement,
                                                                  showSecondStackElement: version.showSecondStackElement,
                                                                  showThirdStackElement: version.showThirdStackElement,
                                                                  showPrintButton: version.showPrintButton,
                                                                  showSaveButton: version.showSaveButton,
                                                                  showDonateButton: version.showDonateButton)
                completion(true)
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
                completion(false)
            }
        }
    }
    
}
