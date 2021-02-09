//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Olena Stepaniuk on 17.10.2020.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                let decoder = JSONDecoder()
                
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch  {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
