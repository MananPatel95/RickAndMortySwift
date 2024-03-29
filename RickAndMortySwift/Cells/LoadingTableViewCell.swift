//
//  LoadingTableViewCell.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    static let identifier = "LoadingTableViewCell"
    
    let activityIndicatior: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .gray
        activityIndicator.style = .medium
        return activityIndicator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        addSubview(activityIndicatior)
        activityIndicatior.frame = frame
        
        activityIndicatior.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
