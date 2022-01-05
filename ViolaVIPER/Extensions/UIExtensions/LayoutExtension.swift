//
//  LayoutExtension.swift
//  ViolaVIPER
//
//  Created by George on 03.01.2022.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    func fillSuperview(){
        self.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
