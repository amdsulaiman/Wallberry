//
//  ProfileVC.swift
//  PhotoSearch
//
// 
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var profileImgView: UIView!
    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var editImgRefBtn: UIButton!
    @IBOutlet weak var baseView2: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileImg.layer.cornerRadius = ProfileImg.frame.height / 2
        ProfileImg.clipsToBounds = true
        ProfileImg.layer.borderWidth = 1
        ProfileImg.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        baseView2.layer.cornerRadius = 16
        
        

      
    }
    
    
    @IBAction func editProfileAction(_ sender: UIButton) {
    }
    
    
    
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
