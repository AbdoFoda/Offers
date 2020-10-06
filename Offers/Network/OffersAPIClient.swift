//
//  OffersAPIClient.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//
import Alamofire

class OffersAPIClient: BaseAPIClient {
    static func getAllOffers( success: @escaping (LuckyOffersModel)-> Void , failure: @escaping (String)->Void ){
        AF.request(OffersAPIRouter.offers)
            .validate()
            .responseJSON(completionHandler: { ( requestResponse: AFDataResponse<Any>) in
                do {
                    print("status code ", requestResponse.response?.statusCode ?? -1)
                    if let data = requestResponse.data {
                        let requestResult = try JSONDecoder().decode(LuckyOffersModel.self, from: data)
                        success(requestResult)
                    }else{
                        failure("failed to load data")
                    }
                    
                }
                catch {
                    failure(error.localizedDescription)
                    
                }
                
            })
    }
    
    
    
}
