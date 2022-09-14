//
//  PostData.swift
//  HackNews
//
//  Created by Jun Guo on 2022-09-13.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { // computed property
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
