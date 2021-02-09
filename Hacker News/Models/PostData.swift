//
//  PostData.swift
//  Hacker News
//
//  Created by Olena Stepaniuk on 17.10.2020.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
