//
//  MasterPresenter.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import Foundation

class MasterPresenter {
    
    func getAllOffers(onSuccess: @escaping (LuckyOffersModel)->Void, onFailure: @escaping (String)->Void){
        OffersAPIClient.getAllOffers(success: onSuccess, failure: onFailure)
    }
}
