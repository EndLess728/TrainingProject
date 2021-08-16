//
//  HomeScreenViewController.swift
//  Training
//
//  Created by SSS Mac MIni on 14/08/21.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension HomeScreenViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FruitsVegetableTableViewCell", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemContainerTableViewCell", for: indexPath)
            return cell
        }
        
    }
    
    
    
}
