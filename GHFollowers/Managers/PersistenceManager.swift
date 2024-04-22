//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-22.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(
        favorite: Follower,
        actionType : PersistenceActionType,
        complete: @escaping (GFError?) -> Void
    ){
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        complete(.ALREADY_FAVORITES)
                        return
                    }
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                complete(save(favorites: favorites))
                
            case .failure(let error):
                complete(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.UNABLE_TO_FAVORITE))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encode = JSONEncoder()
            let encodedFavorites = try encode.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        }
        catch {
            return .UNABLE_TO_FAVORITE
        }
    }
}
