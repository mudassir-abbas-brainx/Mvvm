//
//  ViewController.swift
//  Git Testing
//
//  Created by BrainX Technologies on 14/01/2021.
//

import UIKit

class ListingVC: UIViewController {
    
    //MARK:- IBOUTLETS
    @IBOutlet var tableView:UITableView!
    
    //MARK:- PROPERTIES
    var viewModel: ListViewModel!
    
    //MARK:- FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ListViewModel(tableView: self.tableView)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
//        viewModel.reloadTableViewClosure = {
//
//
//        }
        viewModel.fetchData()
    }

}

