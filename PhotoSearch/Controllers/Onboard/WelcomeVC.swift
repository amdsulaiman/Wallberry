//
//  WelcomeVC.swift
//  PhotoSearch
//
//  
//

import UIKit

class WelcomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var onboardCollectionView: UICollectionView!
    @IBOutlet weak var nextBtnRef: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1
            {
                nextBtnRef.setTitle("Get Started", for: .normal)
            }
            else
            {nextBtnRef.setTitle("Next", for: .normal)
                
            }
        }
    }
    var slides : [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtnRef.layer.cornerRadius = 8
        onboardCollectionView.delegate = self
        onboardCollectionView.dataSource = self
        
        slides = [OnboardingSlide(title: "Painting", description: "lots of Handpicked painting for you", image: #imageLiteral(resourceName: "paint")),
                  OnboardingSlide(title: "above & beyond", description: "Explore the Universe", image: #imageLiteral(resourceName: "iPhone Wallpapers - Wallpapers for iPhone 12, iPhone 11 and iPhone X")),
                  OnboardingSlide(title: "Automobile", description: "all kinds of wallpaper at your fingertips", image: #imageLiteral(resourceName: "car")), OnboardingSlide(title: "Nature", description: "Experience the silence of nature", image: #imageLiteral(resourceName: "jugando con la luna"))
        ]
        
        if UserDefaults.standard.bool(forKey: "ISLOGGEDIN") == true {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "nav") as! UINavigationController
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
        }
        
    }
    
    @IBAction func onclickNextBtn(_ sender: UIButton) {
        
        if currentPage == slides.count - 1{
            let vc = storyboard?.instantiateViewController(identifier: "tabVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            UserDefaults.standard.set(true, forKey: "ISLOGGEDIN")
            self.present(vc, animated: true)
            //.self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section:0)
            onboardCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardCollectionView.dequeueReusableCell(withReuseIdentifier: "onboardCollectionViewCell", for: indexPath) as! onboardCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardCollectionView.frame.size.width, height:  onboardCollectionView.frame.size.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
