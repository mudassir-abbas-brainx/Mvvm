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
    private var picture:Picture?
    lazy var productImage : URL? = {
        guard picture != nil && picture?.image_url != nil else{
            return URL(string: "")
        }
        return URL(string: picture?.image_url ?? "") 
    }()
    //MARK:-View Model Initializer
    init(picture:Picture?) {
        self.picture = picture
    }
}
