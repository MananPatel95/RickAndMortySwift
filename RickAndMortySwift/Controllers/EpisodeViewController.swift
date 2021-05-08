//
//  ViewController.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var page: Int = 1
    var pagedEpisodes: PagedEpisode?
    
    var episodes: [Episode?] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(EpisodeCellTableViewCell.self, forCellReuseIdentifier: EpisodeCellTableViewCell.identifier)
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.identifier)
        tableView.clipsToBounds = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Episodes"
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.episodes.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.identifier, for: indexPath) as? LoadingTableViewCell else {
                fatalError()
            }
            
            NetworkManager.shared.getEpisodesData(page: page) { result in
                switch result {
                case .success(let models):
                    self.pagedEpisodes = models
                    
                    for result in models.results {
                        self.episodes.append(result)
                    }
                    self.page += 1
                    
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        cell.isHidden = true
                    }
                }
            }
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCellTableViewCell.identifier, for: indexPath) as? EpisodeCellTableViewCell else {
            fatalError()
        }
        
        cell.episode = episodes[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count + 1
    }

}

