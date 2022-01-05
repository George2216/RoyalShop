//
//  DatailProductController.swift
//  ViolaVIPER
//
//  Created by George on 02.01.2022.
//

import UIKit

class DetailProductController: UICollectionViewController , DetailProductControllerInput {
    
    private let padding:CGFloat = 16
    
    private var header:DetailImageReusableView?
    
    var content:DetailProductModel = DetailProductModel()
    
    var presenter: DetailProductControllerOutput?


    override func viewDidLoad() {
        super.viewDidLoad()
        title = content.manufacturer
        customizationLayout()
        setupCollection()
        setupGoBackButton()
        setupShareButton()
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        let divider:CGFloat = contentOffsetY < 0 ?  150 : 2000
            header?.animator.fractionComplete = abs(contentOffsetY) / divider
        
    }
    
    
    private func setupGoBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(tapGoBack))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
   
    private func setupShareButton() {
        let shareBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareProduct))
                shareBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = shareBarButton
    }
   
    
    private func setupCollection() {
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(ProductDetailCell.self, forCellWithReuseIdentifier: ProductDetailCell().identifier)
        collectionView.register(DetailImageReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailImageReusableView().identifier)
    }
    
    private func customizationLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout  {
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 10
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let width = self.view.frame.width - CGFloat(ProductDetailCell.padding * 2)
        let priceHeight = UIFont.calculateHeight(text: content.price, width: width, font: ProductDetailCell.priseFont)
        let quantityHeight = UIFont.calculateHeight(text: content.quantity, width: width, font: ProductDetailCell.quantityFont)
        let descriptionHeight = UIFont.calculateHeight(text: content.description, width: width, font: ProductDetailCell.descriptionFont)
        let sum = priceHeight + quantityHeight + descriptionHeight + 60
        return sum
    }
   // actions
    

}
// required
extension DetailProductController: UICollectionViewDelegateFlowLayout {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailCell().identifier, for: indexPath) as? ProductDetailCell
                {
               cell.tapsDelegate = self

               cell.content = MainDetailContent(price: content.price, quantity: content.quantity, description: content.description)
            return cell
                
           }
        return .init()
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return  .init(width: view.frame.width , height: calculateCellHeight())
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailImageReusableView().identifier, for: indexPath) as? DetailImageReusableView
        
        header?.content = HeaderContentModel(imageURLStr: content.image, titleLabelText: content.title, detailLabelText: content.categoryName)
        
        return header ?? .init()
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         .init(width: view.frame.width , height: UIScreen.main.bounds.width * 1.5)
    }
    
    
    @objc func tapGoBack() {
        presenter?.goBack()
    }
    
    @objc func shareProduct() {
        presenter?.shareProduct()
    }
    
}

extension DetailProductController: TapsOnDetailMainCell {

    func tapCall() {
        presenter?.makeACall()
    }

    func tapShowInBrowser() {
        presenter?.goToBrowser()
    }


}
