//
//  onboardCollectionViewCell.swift
//  PhotoSearch
//
// 
//

import UIKit

class onboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func setup(_ slide : OnboardingSlide) {
        onboardImg.image = slide.image
        titleLbl.text = slide.title
        descriptionLbl.text = slide.description
    }
    
    
}
