//
//  TableTestFiewController.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 23/2/24.
//

import Foundation
import UIKit

class TableTestViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var numbersList: [Int] = []
    
    
    @IBOutlet weak var TextTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextTableView.dataSource = self
        TextTableView.delegate = self
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numbersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: TextCell =
                tableView.dequeueReusableCell(withIdentifier: "TextCell_ID", for: indexPath)
                as? TextCell
        else {
            return UITableViewCell()
        }
        
        cell.TextTitle.text = String(numbersList[indexPath.row])
        
        return cell
    }
    
    
    
    @IBAction func AddRowsButtonPressed(_ sender: Any) {
        numbersList.append(numbersList.count + 1)
        TextTableView.reloadData()
    }
    
}
