//
//  Storyboarded.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//

import Foundation

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let stroryboard = UIStoryboard(name: "Main", bundle: .main)
        return stroryboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
    
}
