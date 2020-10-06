//
//  OfferDetailsModel.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let offerDetailsModel = try? newJSONDecoder().decode(OfferDetailsModel.self, from: jsonData)

import Foundation

// MARK: - OfferDetailsModel
struct OfferDetailsModel: Codable {
    let id: Int
    let imageURL: String
    let brand, title, tags: String
    let favoriteCount: Int
    let offerDetailsModelDescription: String
    let price: Price
    let expiration, redemptionsCap: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
        case offerDetailsModelDescription = "description"
        case price, expiration, redemptionsCap
    }
}

// MARK: - Price
struct Price: Codable {
    let old, new: String
}
