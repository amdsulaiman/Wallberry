//
//  SearchVC.swift
//  PhotoSearch
//
// 
//

import UIKit

class SearchVC: UIViewController {

    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var categoryBaseView: UIView!
    @IBOutlet weak var ideaView: UIView!
    @IBOutlet weak var ideaSubView1: UIView!
    @IBOutlet weak var ideaSubView2: UIView!
    @IBOutlet weak var ideaSubView3: UIView!
    @IBOutlet weak var ideaSubView4: UIView!
    @IBOutlet weak var ideaSubImg1: UIImageView!
    @IBOutlet weak var ideaSubImg2: UIImageView!
    @IBOutlet weak var ideaSubImg3: UIImageView!
    @IBOutlet weak var ideaSubImg4: UIImageView!
    @IBOutlet weak var popularView: UIView!
    @IBOutlet weak var popularSubView1: UIView!
    @IBOutlet weak var popularSubView2: UIView!
    @IBOutlet weak var popularSubView3: UIView!
    @IBOutlet weak var popularSubView4: UIView!
    @IBOutlet weak var popularSubView5: UIView!
    @IBOutlet weak var popularSubView6: UIView!
    @IBOutlet weak var popularImgView1: UIImageView!
    @IBOutlet weak var popularImgView2: UIImageView!
    @IBOutlet weak var popularImgView3: UIImageView!
    @IBOutlet weak var popularImgView4: UIImageView!
    @IBOutlet weak var popularImgView5: UIImageView!
    @IBOutlet weak var popularImgView6: UIImageView!
    @IBOutlet weak var trndingView: UIView!
    @IBOutlet weak var trendingView1: UIView!
    @IBOutlet weak var trendingView2: UIView!
    @IBOutlet weak var trendingView3: UIView!
    @IBOutlet weak var trendingView4: UIView!
    @IBOutlet weak var trendingImgView1: UIImageView!
    @IBOutlet weak var trendingImgView2: UIImageView!
    @IBOutlet weak var trendingImgView3: UIImageView!
    @IBOutlet weak var trendingImgView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
    setupAction()

       
    }
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        ideaSubView1.layer.cornerRadius  = 8
        ideaSubView2.layer.cornerRadius  = 8
        ideaSubView3.layer.cornerRadius  = 8
        ideaSubView4.layer.cornerRadius  = 8
        ideaSubImg1.layer.cornerRadius = 8
        ideaSubImg2.layer.cornerRadius = 8
        ideaSubImg3.layer.cornerRadius = 8
        ideaSubImg4.layer.cornerRadius = 8
        
        popularSubView1.layer.cornerRadius  = 8
        popularSubView2.layer.cornerRadius  = 8
        popularSubView3.layer.cornerRadius  = 8
        popularSubView4.layer.cornerRadius  = 8
        popularSubView5.layer.cornerRadius = 8
        popularSubView6.layer.cornerRadius = 8
        
        popularImgView1.layer.cornerRadius  = 8
        popularImgView2.layer.cornerRadius  = 8
        popularImgView3.layer.cornerRadius  = 8
        popularImgView4.layer.cornerRadius  = 8
        popularImgView5.layer.cornerRadius = 8
        popularImgView6.layer.cornerRadius = 8
        
    
        trendingView1.layer.cornerRadius  = 8
        trendingView2.layer.cornerRadius  = 8
        trendingView3.layer.cornerRadius  = 8
        trendingView4.layer.cornerRadius  = 8
        
        trendingImgView1.layer.cornerRadius  = 8
        trendingImgView2.layer.cornerRadius  = 8
        trendingImgView3.layer.cornerRadius  = 8
        trendingImgView4.layer.cornerRadius  = 8
        
    }
    func setupAction() {
        ideaSubView1.isUserInteractionEnabled = true
        ideaSubView2.isUserInteractionEnabled = true
        ideaSubView3.isUserInteractionEnabled = true
        ideaSubView4.isUserInteractionEnabled = true
        
        popularSubView1.isUserInteractionEnabled = true
        popularSubView2.isUserInteractionEnabled = true
        popularSubView3.isUserInteractionEnabled = true
        popularSubView4.isUserInteractionEnabled = true
        popularSubView5.isUserInteractionEnabled = true
        popularSubView6.isUserInteractionEnabled = true
        
        trendingView1.isUserInteractionEnabled = true
        trendingView2.isUserInteractionEnabled = true
        trendingView3.isUserInteractionEnabled = true
        trendingView4.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ideaSubView1Action))
        ideaSubView1.addGestureRecognizer(gesture)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(ideaSubView2Action))
        ideaSubView2.addGestureRecognizer(gesture2)
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(ideaSubView3Action))
        ideaSubView3.addGestureRecognizer(gesture3)
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(ideaSubView4Action))
        ideaSubView4.addGestureRecognizer(gesture4)
        
        
        
        
        
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(popularSubView1Action))
        popularSubView1.addGestureRecognizer(gesture5)
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(popularSubView2Action))
        popularSubView2.addGestureRecognizer(gesture6)
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(popularSubView3Action))
        popularSubView3.addGestureRecognizer(gesture7)
        let gesture8 = UITapGestureRecognizer(target: self, action: #selector(popularSubView4Action))
        popularSubView4.addGestureRecognizer(gesture8)
        let gesture9 = UITapGestureRecognizer(target: self, action: #selector(popularSubView5Action))
        popularSubView5.addGestureRecognizer(gesture9)
        let gesture10 = UITapGestureRecognizer(target: self, action: #selector(popularSubView6Action))
        popularSubView6.addGestureRecognizer(gesture10)
       
        
        
        
        let gesture11 = UITapGestureRecognizer(target: self, action: #selector(trendingView1Action))
        trendingView1.addGestureRecognizer(gesture11)
        let gesture12 = UITapGestureRecognizer(target: self, action: #selector(trendingView2Action))
        trendingView2.addGestureRecognizer(gesture12)
        let gesture13 = UITapGestureRecognizer(target: self, action: #selector(trendingView3Action))
        trendingView3.addGestureRecognizer(gesture13)
        let gesture14 = UITapGestureRecognizer(target: self, action: #selector(trendingView4Action))
        trendingView4.addGestureRecognizer(gesture14)
        
      
        
        
    }
    
    @objc func ideaSubView1Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Writing"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true)
        
    }
    @objc func ideaSubView2Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Study"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func ideaSubView3Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Stationary"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    @objc func ideaSubView4Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "nofilter"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    @objc func popularSubView1Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Green"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func popularSubView2Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Creative"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
 
    @objc func popularSubView3Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "City"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func popularSubView4Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Camera"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func popularSubView5Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Food"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc func popularSubView6Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Design"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc func trendingView1Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Fitness"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func trendingView2Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Art"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func trendingView3Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Work"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func trendingView4Action() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.searchTitle = "Technology"
        vc.vcValue = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
 
    
}






