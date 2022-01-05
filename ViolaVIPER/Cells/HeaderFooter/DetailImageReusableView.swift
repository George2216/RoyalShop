//
//  DetailImageReusableView.swift
//  ViolaVIPER
//
//  Created by George on 03.01.2022.
//

import UIKit
import SnapKit
import SDWebImage

class DetailImageReusableView: UICollectionReusableView {
        
    let identifier = "DetailHeaderImageIdentifier"

    var content:HeaderContentModel? {
        didSet {
            guard let content = content else { return }
            imageView.sd_setImage(with: URL(string: content.imageURLStr), placeholderImage: UIImage.placeholderImage())
            titleLabel.text = content.titleLabelText
            detailLabel.text = content.detailLabelText

        }
    }
    
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)

    
    private let imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private let detailLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private var visualEffectView =  UIVisualEffectView(effect: .none)
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        setupImageView()
        setupVisualEffectBlur()
        setupLabels()

    }
    
    
        private func setupVisualEffectBlur() {

        self.addSubview(visualEffectView)

        animator.addAnimations {
            self.visualEffectView.effect = UIBlurEffect(style: .light)
        }
            
        visualEffectView.fillSuperview()

       }

    private func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    
    private func setupLabels() {
        let stack = UIStackView(arrangedSubviews: [titleLabel , detailLabel])
        stack.axis = .vertical
        stack.spacing = 8.0
        self.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.leading.equalTo(16)
            make.bottom.equalToSuperview()
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    

}
