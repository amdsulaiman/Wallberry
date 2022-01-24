//
//  ImageDetailViewController.swift
//  PhotoSearch
//
//  
//

import UIKit
import KRProgressHUD


class ImageDetailViewController: UIViewController {
    
    
    @IBOutlet weak var downloadView2: UIView!
    @IBOutlet weak var likeBtnRef: UIButton!
    @IBOutlet weak var downloadBtnRef: UIButton!
    @IBOutlet weak var saveBtnRef: UIButton!
    
    
    var detailImageUrl = ""
    var downloadURL = ""
    var isLiked =  true
    
    private let imageView  : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    private let dismissButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissimage"), for: .normal)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(with: detailImageUrl)
        view.addSubview(imageView)
        view.addSubview(dismissButton)
        view.addSubview(downloadView2)
        setupUI()
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        dismissButton.frame = CGRect(x:20, y: view.safeAreaInsets.top + 10, width: 25, height: 25)
        dismissButton.addTarget(self, action: #selector(dismissView), for:.touchUpInside)
        
    }
    
    @IBAction func onClickLikeBtn(_ sender: UIButton) {
       
        if (isLiked == true) {
            likeBtnRef.setImage(UIImage(named: "like"), for: .normal)
        }
        else
        {
            likeBtnRef.setImage(UIImage(named: "dislike"), for: .normal)
        }
        isLiked = !isLiked
    }
    
    @IBAction func onClickDownloadBtn(_ sender: UIButton) {
    }
    
    @IBAction func onClicksaveBtn(_ sender: UIButton) {
    }
    
    @objc func dismissView() {
       self.dismiss(animated: true)
        //self.navigationController?.popViewController(animated: true)
        
    }
    
    func configure(with urlString :String) {
        presentIndicator()
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data  = data ,error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.dismissIndicator()
                let image = UIImage(data: data)
                self?.imageView.image = image
            }
        }.resume()
    }
    func setupUI() {
        downloadView2.layer.cornerRadius = 12
        downloadView2.layer.borderWidth = 1
        downloadView2.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.navigationBar.isHidden = true
        saveBtnRef.layer.cornerRadius = 8
    }
    
    func presentIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.isUserInteractionEnabled = false
            KRProgressHUD.show()
        }
    }
    
    
    func dismissIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.isUserInteractionEnabled = true
            KRProgressHUD.dismiss()
        }
    }
    
}
