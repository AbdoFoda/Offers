//
//  MasterViewController.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import UIKit
import SwiftSpinner
import Kingfisher

class MasterViewController: UIViewController {

    @IBOutlet weak var offersTableView: UITableView!
    
    @IBOutlet weak var pageTitleNavigationItem: UINavigationItem!
  
    var pageTitle = "Lucky Offers!" {
        didSet{
            pageTitleNavigationItem.title = pageTitle
        }
    }
    
    var presenter = MasterPresenter()
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show("Loading Offers...")
        presenter.getAllOffers(onSuccess: { (offers) in
            SwiftSpinner.hide()
            self.title = offers.title
            self.sections = offers.sections
            self.offersTableView.reloadData()
        }) { (error) in
            SwiftSpinner.hide()
            print("Network error:\(error)")
        }
    }
    

    var selectedItem: Item?
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination.children[0] as? DetailViewController {
            if let item = selectedItem {
                // pass selected item url
                details.detailsUrl = item.detailURL
            }
        }
    }




}



extension MasterViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        headerView.backgroundColor = .white
        let lblHeaderTitle = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 20, height: 70))
        lblHeaderTitle.text = sections[section].title
        lblHeaderTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        headerView.addSubview(lblHeaderTitle)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell", for: indexPath) as? OffersTableViewCell else {
            return UITableViewCell()
        }
        let offer = self.sections[indexPath.section].items[indexPath.row]
        cell.iconImageView.kf.setImage(with: URL(string: offer.imageURL))
        cell.lblTitle.text = offer.title
        cell.lblDesc.text = offer.brand
        cell.lblTags.text = offer.tags
        cell.lblFavCount.text = String(offer.favoriteCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //save the selected item to be used in 'prepare' function
        self.selectedItem = sections[indexPath.section].items[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
}
