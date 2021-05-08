//
//  CharacterDetailViewController.swift
//  RickAndMortySwift
//
//  Created by Manan Patel on 2021-05-08.
//

import UIKit

class CharacterDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CharacterInfoTableViewCell.self, forCellReuseIdentifier: CharacterInfoTableViewCell.identifier)
        tableView.clipsToBounds = true
        return tableView
    }()
    
    var character: Character?
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    var speciesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    var genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = character?.name
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    init(character: Character) {
        super.init(nibName: nil, bundle: nil)
        self.character = character
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 5
        }
        
        else if section == 2 {
            return character?.episode.count ?? 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
//            let cell: UITableViewCell = {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
//                    return UITableViewCell(style: .default, reuseIdentifier: "cell")
//                    }
//                    return cell
//                }()
//            if let data = character?.imageData {
//                let cellImg : UIImageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 250)))
//                cellImg.contentMode = .center
//                cellImg.image = UIImage.init(data: data)
//                cell.addSubview(cellImg)
//                //cell.imageView?.frame = CGRect(origin: .zero, size: CGSize(width: 150, height: 150))
//                //cell.cel?.image =
//            }
//
//            return cell
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTableViewCell.identifier, for: indexPath) as? CharacterInfoTableViewCell else {
                fatalError()
            }
            if let data = character?.imageData {
                cell.charImageView.anchor(top: cell.topAnchor,
                                          left: cell.leftAnchor,
                                          bottom: cell.bottomAnchor,
                                          right: cell.rightAnchor,
                                          paddingTop: 4,
                                          paddingLeft: 4,
                                          paddingBottom: 4,
                                          paddingRight: 4,
                                          width: 250,
                                          height: 250,
                                          enableInsets: false)
                cell.charImageView.image = UIImage.init(data: data)
                cell.charImageView.contentMode = .center
                cell.charImageView.layer.cornerRadius = 16
            }
            
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTableViewCell.identifier, for: indexPath) as? CharacterInfoTableViewCell else {
                fatalError()
            }
            if indexPath.row == 0 {
                cell.charImageView.image = UIImage.init(systemName: "hare")
                cell.typeLabel.text = "Species"
                cell.dataLabel.text = character?.species
            }
            
            else if indexPath.row == 1 {
                cell.charImageView.image = UIImage.init(systemName: "person.2")
                cell.typeLabel.text = "Gender"
                cell.dataLabel.text = character?.gender
            }
            
            else if indexPath.row == 2 {
                cell.charImageView.image = UIImage.init(systemName: "waveform.path.ecg.rectangle.fill")
                cell.typeLabel.text = "Status"
                cell.dataLabel.text = character?.status
            }
            
            else if indexPath.row == 3 {
                cell.charImageView.image = UIImage.init(systemName: "map")
                cell.typeLabel.text = "Location"
                cell.dataLabel.text = character?.location.name
            }
            else if indexPath.row == 4 {
                cell.charImageView.image = UIImage.init(systemName: "house")
                cell.typeLabel.text = "Origin"
                cell.dataLabel.text = character?.origin.name
            }
            
            cell.character = character
            return cell
        }
        
    
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        switch section
        {
            case 0:
                return "Mugshot"
            case 1:
                return "Info"
            default:
                return "Default"
        }
    }
}
