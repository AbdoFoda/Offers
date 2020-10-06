//
//  DetailViewController.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import UIKit
import SwiftSpinner
class DetailViewController: UIViewController {
    
    //MARK:- Variables
    var detailsUrl: String?
    var presenter = DetailsPresenter()

    //MARK:- Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var lblOfferDesc: UILabel!
    @IBOutlet weak var lblOfferTitle: UILabel!
    @IBOutlet weak var lblFavCount: UILabel!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblRedemptions: UILabel!
    @IBOutlet weak var lblExpDate: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblOldPrice: UILabel!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = detailsUrl {
            SwiftSpinner.show("Loading Offer Details...")
            getData()
        }else{
            scrollView.isHidden = true
        }
    }

    
    //MARK:- Data Loading
    func getData(){
        self.presenter.getOfferDetails(from: detailsUrl!, onSuccess: { (offer) in
            SwiftSpinner.hide()
            self.loadUI(from: offer)
        }) { (error) in
            SwiftSpinner.hide()
            print(error)
        }
    }
    
    
    
    func loadUI(from offer: OfferDetailsModel) {
        self.offerImageView.kf.setImage(with: URL(string: offer.imageURL))
        self.lblBrand.text = offer.brand
        self.lblFavCount.text = String(offer.favoriteCount)
        self.lblOfferTitle.text = offer.title
        self.lblOfferDesc.text = offer.offerDetailsModelDescription
        self.lblOldPrice.text = offer.price.old
        self.lblDiscountPrice.text = offer.price.new
        self.lblExpDate.text = offer.expiration
        self.lblRedemptions.text = offer.redemptionsCap
    }
   
    
    
    //MARK:- Actions
    @IBAction func shareButtonTapped(_ sender: Any) {
        print("Share!")
    }
    
    @IBAction func heartIconTapped(_ sender: Any) {
        print("Add To Fav!")
    }
    
    

}

