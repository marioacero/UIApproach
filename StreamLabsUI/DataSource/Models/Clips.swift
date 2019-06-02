//
//  Clips.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

// MARK: - Reviews
struct ClipList: Codable {
    let highlights: [ClipItem]
}

struct ClipItem: Codable {
    let nickName: String
    let badge: Int?
    let avatar: String
    let likes, followers: String?
    let video: Video?
}

struct Video: Codable {
    let status, clipLikes, views: String
    let clippedTime: Int
    let clippedUser, lenght, entries, rank: String
    let prize, thumbnail: String
    let totalComments: Int
    let comments: [Comment]
}

// MARK: - Comment
struct Comment: Codable {
    let user, comment: String
}
