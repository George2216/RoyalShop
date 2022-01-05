//
//  AboutUsContract.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation

protocol AboutUsControllerInput {
    var presenter:AboutUsControllerOutput? { get set }
}

protocol AboutUsControllerOutput {
    func goToFacebook()
    func goToTelegram()
    func goToViber()
    func goToYouTube()
    func goToPrivacyPolicy()
    func goToWebsite()
    func goBack()
   
  
    
}

protocol AboutUsInteractorInput {
    var presenter:AboutUsInteractorOutput? { get set }
    func goToFacebook()
    
    func goToTelegram()
    
    func goToViber()
    
    func goToYouTube()
    
    func goToPrivacyPolicy()
    
    func goToWebsite() 

}

protocol AboutUsInteractorOutput {
    
}

protocol AboutUsRouterInput {
    func goBack()
}
