//
//  CharacterCellTableViewCell.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import UIKit

class EpisodeCellTableViewCell: UITableViewCell {
    
    static let identifier = "EpisodeCellTableViewCell"
    
    var episode: Episode? {
        didSet {
            configureCell()
        }
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        label.frame = frame
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        if let episodeStr = episode?.episode, let name = episode?.name {
            label.text = episodeStr + " - " + name
        }
    }
}
