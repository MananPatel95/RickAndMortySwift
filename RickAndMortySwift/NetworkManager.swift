//
//  NetworkManager.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api/"
    }
    
    enum endpoints: String {
        case character
        case location
        case episode
        case avatar
    }
    
    private init() {}
    
    // MARK: - Public
    
    public func getAllData(){
        
    }
    
    public func getEpisodesData(
        page: Int, completion: @escaping (Result<PagedEpisode, Error>) -> Void
    ) {
        
        print(URL(string: Constants.baseURL + endpoints.episode.rawValue + "/?page=\(String(page))") ?? "Printed episode url")
        guard let url = URL(string: Constants.baseURL + endpoints.episode.rawValue + "/?page=\(String(page))") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let episodes = try JSONDecoder().decode(PagedEpisode.self, from: data)
                
                completion(.success(episodes))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    
    public func getCharactersData(page: Int, completion: @escaping (Result<PagedCharacter, Error>) -> Void
    ) {
        
        print(URL(string: Constants.baseURL + endpoints.character.rawValue + "/?page=\(String(page))") ?? "Printed character url")
        guard let url = URL(string: Constants.baseURL + endpoints.character.rawValue + "/?page=\(String(page))") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let characters = try JSONDecoder().decode(PagedCharacter.self, from: data)
                
                completion(.success(characters))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    public func getCharacterImage(character: Character, completion: @escaping (Result<Data, Error>) -> Void
    ) {
        
        if let imgUrl = character.image {
            guard let url = URL(string: imgUrl) else { return }
            
            let task = URLSession.shared.dataTask(with: url) {data, _ , error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    //let image = try Data(contentsOf: data)
                    print("Success image for url: \(url)")
                    completion(.success(data))
                }
                catch {
                    print("Fail image for url: \(url)")
                    completion(.failure(error))
                }
            }
            
            task.resume()
            
        }
    }
    
    public func getLocationsData(    page: Int, completion: @escaping (Result<PagedLocation, Error>) -> Void
    ) {
        
        print(URL(string: Constants.baseURL + endpoints.location.rawValue + "/?page=\(String(page))") ?? "Printed location url")
        guard let url = URL(string: Constants.baseURL + endpoints.location.rawValue + "/?page=\(String(page))") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let locations = try JSONDecoder().decode(PagedLocation.self, from: data)
                
                completion(.success(locations))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
}
