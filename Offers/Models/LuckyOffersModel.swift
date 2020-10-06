//
//  LuckyOffers.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let luckyOffers = try? newJSONDecoder().decode(LuckyOffers.self, from: jsonData)

import Foundation

// MARK: - LuckyOffers
struct LuckyOffersModel: Codable {
    let title: String
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let title: String
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let detailURL, imageURL: String
    let brand, title: String
    let tags: String?
    let favoriteCount: Int

    enum CodingKeys: String, CodingKey {
        case detailURL = "detailUrl"
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
    }
}
