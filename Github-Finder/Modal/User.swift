//
//  User.swift
//  Github-Finder
//
//  Created by Abdirizak Hassan on 10/21/21.
//

import Foundation

struct User: Decodable {
    let userImage: String?
    let fullName:String
    let userWebsite: String?
    let userBio: String?
    let userLocation: String?
    let userRepositories: Int
    let userFollowers: Int
    
    enum CodingKeys: String, CodingKey {
        case userImage = "avatar_url"
        case fullName = "name"
        case userWebsite = "blog"
        case userBio = "bio"
        case userLocation = "location"
        case userRepositories = "public_repos"
        case userFollowers = "followers"
        
    }
    
}
