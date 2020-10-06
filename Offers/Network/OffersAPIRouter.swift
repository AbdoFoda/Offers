//
//  OffersAPIRouter.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

import Alamofire

enum OffersAPIRouter: URLRequestConvertible {
    static let baseOffersURL = URL(string: "https://www.nasable.com/luckytest/api/offers/")!
    
    case offers
    
    var method: HTTPMethod {
        switch self {
            case .offers: return .get
        }
    }
    
    var path: URL {
        let url =  OffersAPIRouter.baseOffersURL
        switch self {
            case .offers: return url
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: path)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
    
    
    
}
