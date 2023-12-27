//
//  NewsPageViewModel.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import SwiftUI

final class NewsPageViewModel: ObservableObject {
   @Published var News: [News] = []
    var error: String?

    init() {
        fetchNews()
    }
    
    func fetchNews() {
      let apiKey = "a5eac0d9cf31478383b3d6fbde268b7f"
        let urlString = "https://api.worldnewsapi.com/search-news?api-key=\(apiKey)&text=tesla"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: NewsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.News = data.news
              //  print("Data fetched successfully: \(data)")
            case .failure(let error):
              //  print("Error fetching data: \(error)")
                self.error = error.localizedDescription
            }
        })
    }
}
