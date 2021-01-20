//
//  PictureDetailViewController.swift
//  Git Testing
//
//  Created by BrainX Technologies on 14/01/2021.
//

import UIKit

class PictureDetailVC: UIViewController {
    //MARK:- IBOUTLETS
    @IBOutlet weak var theImageView: UIImageView!
    
    //MARK:- PROPERTIES
    var picture: Picture!
    
    //MARK:- View Controller Lifecycle Function
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = picture {
            if let picture_url = URL( string: data.image_url ) {
                self.theImageView.kf.setImage(with: picture_url)
            }
        }
    }
    

}
