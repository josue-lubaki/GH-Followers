//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-17.
//

import Foundation

class NetworkManager {
    static let shared   = NetworkManager()
    let baseURL         = "https://api.github.com"
    
    private init() {
        
    }
    
    func getFollowers(
        for username : String,
        page : Int,
        completed : @escaping(Result<[Follower], GFError>) -> Void
    ) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.INVALID_USERNAME))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.UNABLE_TO_COMPLETE))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.INVALID_RESPONSE))
                return
            }
            
            guard let data = data else {
                completed(.failure(.INVALID_DATA))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.INVALID_DATA))
            }
        }
        
        task.resume()
    }

}
