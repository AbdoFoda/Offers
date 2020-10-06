//
//  MasterViewController.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var offersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination.children[0] as? DetailViewController {
        }
    }




}



extension MasterViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        headerView.backgroundColor = .white
        let lblHeaderTitle = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 20, height: 70))
        lblHeaderTitle.text = "A Simple Title Goes Here!"
        lblHeaderTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        headerView.addSubview(lblHeaderTitle)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell", for: indexPath) as? OffersTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
}
