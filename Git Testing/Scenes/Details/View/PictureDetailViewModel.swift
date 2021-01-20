//
//  PictureDetailViewModel.swift
//  Git Testing
//
//  Created by BrainX Technologies on 19/01/2021.
//

import UIKit
import Kingfisher

class PictureDetailViewModel: NSObject {
    //MARK:- PROPERTIES
    private var view:UIViewController!
    private var picture:Picture!{
        didSet{
            dataBindwithView(picture: picture)
        }
    }
    
    //MARK:- INITIALIZER
    init(picture:Picture,viewController:UIViewController) {
        self.picture = picture
        self.view = viewController
    }
    //MARK: - BIND DATA
    func dataBindwithView(picture: Picture!){
        if let data = picture {
            if let picture_url = URL( string: data.image_url ) {
                (view as? PictureDetailVC)?.theImageView.kf.setImage(with: picture_url)
            }
        }
    }
}
