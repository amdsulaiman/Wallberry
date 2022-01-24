//
//  CategoryCollectionViewCell.swift
//  PhotoSearch
//
//  
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let searchLabel  : UILabel = {
        let searchLabel = UILabel()
        searchLabel.font = .systemFont(ofSize: 16, weight: .bold)
        searchLabel.textAlignment = .center
        searchLabel.textColor = .black
        searchLabel.numberOfLines = 0
        return searchLabel
        
    }()
    var searchKeyArray = ["Nature","People","Architecture","Street Photography","Technology","Travel","Ocean","Arts & Culture"]
    static let identifier = "CategoryCollectionViewCell"
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(searchLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchLabel.text = "cartoon"
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        searchLabel.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: 50)
    }
    func setupSearchKey(with searchKey : String)
    {
        searchLabel.text = searchKey
    }
    
    
    
}
