//
//  ViewController.swift
//  VamoshUI
//
//  Created by Annu Priya on 27/06/20.
//  Copyright © 2020 Annu Priya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblProduct : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tblProduct.estimatedRowHeight = 44
        tblProduct.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(1.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        return cell
    }
    
    
}


extension ViewController : UITableViewDelegate{
    
}

