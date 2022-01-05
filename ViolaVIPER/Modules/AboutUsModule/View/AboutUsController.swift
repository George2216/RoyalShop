//
//  AboutUsController.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import UIKit

class AboutUsController: UITableViewController , AboutUsControllerInput , Storyboarded {
    
    var presenter: AboutUsControllerOutput?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Контактна інформація"
        setupGoBackButton()
    }
    private func setupGoBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    @IBAction func goToFacebook(_ sender: Any) {
        presenter?.goToFacebook()
    }
    
    @IBAction func goToTelegram(_ sender: Any) {
        presenter?.goToTelegram()
    }
    
    @IBAction func goToViber(_ sender: Any) {
        presenter?.goToViber()
    }
    
    @IBAction func goToYouTube(_ sender: Any) {
        presenter?.goToYouTube()
    }
    
    @IBAction func goToPrivacyPolicy(_ sender: Any) {
        presenter?.goToPrivacyPolicy()
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
        presenter?.goToWebsite()
    }
    
    @objc func goBack() {
        presenter?.goBack()
    }
}
