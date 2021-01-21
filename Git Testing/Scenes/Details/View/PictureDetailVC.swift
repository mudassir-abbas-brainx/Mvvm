//
//  PictureDetailViewController.swift
//  Git Testing
//
//  Created by BrainX Technologies on 14/01/2021.
//

import UIKit

class PictureDetailVC: UIViewController {
    //MARK:- IBOUTLETS
    @IBOutlet weak var productImageView: UIImageView!
    
    //MARK:- PROPERTIES
    var picture: Picture?
    var viewModel: PictureDetailViewModel?
    
    //MARK:- View Controller Lifecycle Function
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataOnUi()
    }
    
    //MARK:- SETUP UI
    func showDataOnUi(){
        productImageView.kf.setImage(with: viewModel?.productImage)
    }
}
