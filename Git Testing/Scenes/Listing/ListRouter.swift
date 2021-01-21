//
//  ListRouter.swift
//  Git Testing
//
//  Created by BrainX Technologies on 21/01/2021.
//

import UIKit

class ListRouter: NSObject {
    //MARK:- PROPERTIES
    weak var viewController: UIViewController?
    
    //MARK:- CLASS INITIALIZER
    init(viewController:UIViewController?) {
        super.init()
        self.viewController = viewController
    }
    
    //MARK:- PUSH CONTROLLERf
    func pushVC(picture:Picture?){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PictureDetailVC") as! PictureDetailVC
        vc.viewModel = PictureDetailViewModel(picture: picture)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
