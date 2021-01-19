//
//  PictureDetailViewController.swift
//  Git Testing
//
//  Created by BrainX Technologies on 14/01/2021.
//

import UIKit

class PictureDetailVC: UIViewController {

    @IBOutlet weak var theImageView: UIImageView!
    
    var picture: Picture! {
        didSet{
//            _ = PictureDetailViewModel(picture: picture, viewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = picture {
            if let picture_url = URL( string: data.image_url ) {
                self.theImageView.kf.setImage(with: picture_url)
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
