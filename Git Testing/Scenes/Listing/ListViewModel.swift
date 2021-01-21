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
    private var pictures: [Picture]  = [Picture](){
        didSet{
            self.reloadTableviewClosure?()
        }
    }
    lazy var numberOfRows:Int = {
        return pictures.count
    }()
    lazy var heightForRow:CGFloat = {
        return CGFloat(150)
    }()
    var listRouter:ListRouter?
    weak var view:UIViewController?
    //MARK: - CLOSURE
    var reloadTableviewClosure:(()->())?
    
    //MARK:- Initializer
    init(view:UIViewController) {
        super.init()
        self.view = view
        listRouter = ListRouter(viewController: self.view)
        fetchData()
    }
    
    //MARK:- LOAD Data From Api
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

extension ListViewModel{
    //MARK: -  RETURN OBJECT AT SPECIFIC INDEX
    func object(for indexPath:IndexPath)->Picture{
        return self.pictures[indexPath.row]
    }
    
    func navigateToDetailVC(indexPath:IndexPath){
        listRouter?.pushVC(picture: self.object(for: indexPath))
    }
}


