//
//  AboutUsPresenter.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation


class AboutUsPresenter {
    var view: AboutUsControllerInput
    var interactor:AboutUsInteractorInput
    var router:AboutUsRouterInput
    
    
    init(view: AboutUsControllerInput,interactor:AboutUsInteractorInput,router:AboutUsRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// access view
extension AboutUsPresenter:AboutUsControllerOutput {
    func goBack() {
        router.goBack()
    }
    
    
    func goToFacebook() {
        interactor.goToFacebook()
    }
    
    func goToTelegram() {
        interactor.goToTelegram()

    }
    
    func goToViber() {
        interactor.goToViber()

    }
    
    func goToYouTube() {
        interactor.goToYouTube()

    }
    
    func goToPrivacyPolicy() {
        interactor.goToPrivacyPolicy()

    }
    
    func goToWebsite() {
        interactor.goToWebsite()

    }
    
    
}

// access interactor
extension AboutUsPresenter:AboutUsInteractorOutput {
    
}
