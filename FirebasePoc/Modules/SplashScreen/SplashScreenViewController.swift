//
//  SplashScreenViewController.swift
//  FirebaseTeste
//
//  Created by Brenner on 25/08/21.
//

import UIKit
import FirebaseRemoteConfig

class SplashScreenViewController: UIViewController {
    
    let remoteConfig = RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchConfig()
        // Do any additional setup after loading the view.
    }
    
    private func fetchConfig() {
        FirebaseRemoteConfig.updateRemoteConfigValues(remoteConfig: remoteConfig) { success in
            if success {
                if RemoteConfigManager.shared.remoteConfigVersion.isMaintenance {
                    // Maintanance - should go to maintenance screen
                    self.navigate(MaintenanceScreenViewController())
                } else if RemoteConfigManager.shared.remoteConfigVersion.isBlocked {
                    // Blocked - should go to blocked screen
                    self.navigate(MaintenanceScreenViewController())
                } else if !RemoteConfigManager.shared.remoteConfigVersion.isUpdated {
                    // Outdated - should go to update screen
                    self.navigate(UpdataScreenViewController())
                } else {
                    // Normal flow
                    self.navigate(HomeViewController())
                }
            }
        }
    }
    
    private func navigate(_ viewcontroller: UIViewController) {
        viewcontroller.modalPresentationStyle = .fullScreen
        self.present(viewcontroller, animated: true, completion: nil)
    }
}
