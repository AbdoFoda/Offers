//
//  DetailsPresenter.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import Foundation
import Alamofire
class DetailsPresenter {
    
    func getOfferDetails(from url: String, onSuccess: @escaping(OfferDetailsModel)->Void, onFailure: @escaping(String)->Void){
        BaseAPIClient.getData(from: url, onSuccess: onSuccess, failure: onFailure)
    }
    
}
