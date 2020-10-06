//
//  BaseAPIClient.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import Foundation
import Alamofire
class BaseAPIClient {
    class func getData<T: Codable>(from url:String, onSuccess: @escaping(T)-> Void, failure: @escaping (String)-> Void){
          AF.request(url)
          .validate()
              .responseJSON { (response: AFDataResponse<Any>) in
                  do{
                      if let data = response.data{
                          let conversionResult = try JSONDecoder().decode(T.self, from: data)
                          onSuccess(conversionResult)
                      }
                  }catch{
                      failure(error.localizedDescription)
                  }
          }
      }
}
