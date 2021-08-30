//
//  HomeViewController.swift
//  FirebaseTeste
//
//  Created by Brenner on 25/08/21.
//

import UIKit
import FirebaseRemoteConfig

class HomeViewController: UIViewController {
    
    @IBOutlet weak var firstElementStackView: UIStackView!
    @IBOutlet weak var secondElementStackView: UIStackView!
    @IBOutlet weak var thirdElementStackView: UIStackView!
    @IBOutlet weak var printButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        firstElementStackView.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showFirstStackElement
        secondElementStackView.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showSecondStackElement
        thirdElementStackView.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showThirdStackElement
        printButton.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showPrintButton
        saveButton.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showSaveButton
        donateButton.isHidden = !RemoteConfigManager.shared.remoteConfigVersion.showDonateButton
    }
}
