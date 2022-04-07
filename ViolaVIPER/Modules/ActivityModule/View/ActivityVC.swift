//
//  ActivityVC.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import UIKit

class ActivityVC: UIActivityViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityTypes()
    }
    
    private func setupActivityTypes() {
        
        self.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo]
    }
    
    deinit {
        print("Activity module deinit")
    }
}
