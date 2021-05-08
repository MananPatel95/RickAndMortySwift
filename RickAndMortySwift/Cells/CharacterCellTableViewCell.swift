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
        
        addSubview(label)
        addSubview(subLabel)
        
        label.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 300, height: 32, enableInsets: false)
        subLabel.anchor(top: label.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 16, paddingBottom: 4, paddingRight: 4, width: 300, height: 12, enableInsets: false)
        
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
}
