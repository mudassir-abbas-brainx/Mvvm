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
    
    //MARK:- View Controller Lifecycle FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        //closure called when data fetched
        viewModel = ListViewModel(view: self)
        viewModel.reloadTableviewClosure = {
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
}
//MARK:- TABLEVIEW DATA SOURCE
extension ListingVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureListTableViewCell") as! PictureListTableViewCell
        cell.picture = viewModel.object(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow
    }
    
}
//MARK:- TABLEVIEW DELEGATES
extension ListingVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PictureDetailVC") as! PictureDetailVC
        vc.viewModel = PictureDetailViewModel(picture: viewModel.object(for: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
