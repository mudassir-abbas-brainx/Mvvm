//
//  ListViewModel.swift
//  Git Testing
//
//  Created by BrainX Technologies on 18/01/2021.
//

import Foundation
import UIKit

class ListViewModel: NSObject {
    //MARK: - PROPERTIES
    private let apiService: FakeAPIServiceProtocol
    private var pictures: [Picture] = [Picture](){
        didSet {
//            self.reloadTableViewClosure?()
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    var tableView:UITableView!
    // MARK: - Closures
    var reloadTableViewClosure: (()->())?
    
    //MARK:- FUNCTIONS
    init(tableView:UITableView) {
        self.apiService = FakeAPIService()
        self.tableView = tableView
    }
    
    
    // MARK: - Fetching functions
    
    func fetchData() {
        apiService.getPopularPictures(complete: ) { [weak self] (success, pictures, error) in
            
            if let error = error {
                print ("Error: \(error.rawValue)")
            } else {
                self?.pictures = pictures
            }
        }
    }
}


extension ListViewModel: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureListTableViewCell") as! PictureListTableViewCell
        cell.picture = self.pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
}
extension ListViewModel:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
