//
//  ViewController.swift
//  mvvmExample
//
//  Created by zoehor on 2020/9/30.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var viewModel:ViewModel!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource=self

        viewModel.jsonPasing {
            self.tableview.reloadData()
        }
    }
    
    
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{

        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.titleForItemsIndexPath(indexPath: indexPath )
        
        return cell
        
    }
    
}
