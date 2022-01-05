//
//  AboutUsInteractor.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation


class AboutUsInteractor:AboutUsInteractorInput {
    
    var presenter: AboutUsInteractorOutput?
    private let contactData = ContactData()

    func goToFacebook() {
        LinkOperations.tryURL(urls: [contactData.facebookUrl]) // maybe not good

    }
    
    func goToTelegram() {
        LinkOperations.tryURL(urls: [contactData.telegramUrl])

    }
    
    func goToViber() {
        LinkOperations.tryURL(urls: [contactData.viberUrl])

    }
    
    func goToYouTube() {
        LinkOperations.tryURL(urls: [contactData.youtubeUrl])

    }
    
    func goToPrivacyPolicy() {
        LinkOperations.tryURL(urls: [contactData.privacyPolicyUrl])
    }
    
    func goToWebsite() {
        LinkOperations.tryURL(urls: [contactData.urlSite])
    }
}
