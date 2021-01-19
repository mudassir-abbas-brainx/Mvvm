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
    private var pictures: [Picture] = [Picture](){
        didSet {
            viewModel = ListViewModel(pictures: pictures)
            DispatchQueue.main.async{
                self.tableView.delegate = self.viewModel
                self.tableView.dataSource = self.viewModel
                self.tableView.reloadData()
            }
            viewModel.didSelectCellClosure = { picture in
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PictureDetailVC") as! PictureDetailVC
                vc.picture = picture
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    //MARK:- FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchData()
    }
    
    
    // MARK: - Fetching Data
    func fetchData() {
        let apiService =  FakeAPIService()
        apiService.getPopularPictures(complete: ) { [weak self] (success, pictures, error) in
            
            if let error = error {
                print ("Error: \(error.rawValue)")
            } else {
                self?.pictures = pictures
            }
        }
    }
    
}


