//
//  CharacterCellTableViewCell.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import UIKit

class CharacterCellTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterCellTableViewCell"
    
    var character: Character? {
        didSet {
            configureCell()
        }
    }
    
    var image: UIImage? {
        didSet {
            configureImage()
        }
    }
    
    var charImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage.init(systemName: "person")
        iv.contentMode = .scaleAspectFit
        iv.frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    var subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(charImageView)
        addSubview(label)
        addSubview(subLabel)
        
        charImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 50, height: 50, enableInsets: false)
        label.anchor(top: topAnchor, left: charImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 300, height: 32, enableInsets: false)
        subLabel.anchor(top: label.bottomAnchor, left: charImageView.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 4, paddingRight: 4, width: 300, height: 12, enableInsets: false)
        
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        if let name = character?.name, let subtitle = character?.species {
            label.text = name
            subLabel.text = subtitle
        }
    }
    
    func configureImage() {
        charImageView.image = image
    }
}
