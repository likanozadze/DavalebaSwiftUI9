//
//  Model.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import Foundation

struct NewsData: Decodable {
    let news: [News]
}

struct News: Identifiable, Decodable {
    let id: Int
    let title: String
    let text: String
    let url: String
    let image: String
    let publishDate: String
    let author: String
    let authors: [String]
    let language: String
    let sourceCountry: String
    let sentiment: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, text, url, image, author, authors, language, sentiment
        case publishDate = "publish_date"
        case sourceCountry = "source_country"
    }
}

