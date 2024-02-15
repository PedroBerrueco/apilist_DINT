//
//  Post.swift
//  apilist
//
//  Created by pedro on 15/2/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
