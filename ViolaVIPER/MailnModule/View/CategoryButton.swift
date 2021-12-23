//
//  CategoryButton.swift
//  ViolaVIPER
//
//  Created by George on 23.12.2021.
//

import UIKit

class CategoryButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        addLine(rect)
        titlePrepare()
    }
    
    private func addLine(_ rect: CGRect) {
        let cgContext = UIGraphicsGetCurrentContext()
        cgContext?.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        cgContext?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        let color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.1543098096)
        cgContext?.setStrokeColor(color.cgColor)
        cgContext?.setLineWidth(6.0)
        cgContext?.strokePath()
    }
    
    private func titlePrepare() {
        self.setTitleColor(.systemBlue, for: .normal)
        let highlightedTitleColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5215749172)
        self.setTitleColor(highlightedTitleColor, for: .highlighted)
    }
    
}
