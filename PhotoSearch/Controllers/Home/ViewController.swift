//
//  ViewController.swift
//  PhotoSearch
//
//  
//

import UIKit
import KRProgressHUD


//API

struct APIResponse : Codable {
    let total : Int
    let total_pages : Int
    let results : [Result]
}
struct Result :Codable {
    let id : String
    let urls : URLS
    let links : Download
}
struct URLS : Codable {
    let regular : String
    let full : String
    let raw : String
    let thumb : String
}
struct Download : Codable {
    let download : String
    let download_location : String
}


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate {
    
    
    
    
    
    private var collectionView : UICollectionView?
    private var categoryCollectionView : UICollectionView?
    
    private let tabView : UIView  = {
        var  tabView = UIView()
        tabView.backgroundColor = UIColor.black
        return tabView
    }()
    
    let searchBar = UISearchBar()
    var results : [Result] = []
    var searchKeyArray = ["Nature","People","Architec","Interior","Technology","Travel","Ocean","Arts & Culture"]
    let defaultLoader = ["Nature","RainyForest","Ocean","Coralreef","Mountains","Himalaya","WaterFalls","People","Home","Beach","Fashion","Interior","Coding","Travel","Technology","Textures","Patterns","Foods","Birds","Animals","Athletics","History","AmoledWallpapers","Trending","Exposure","Fire","Volcano","Sky"]
    var count = 0
    var appLaunchCount  = 0
    var indexPath = 0
    var searchTitle = ""
    var vcValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        setupDefaultFeed()
        print(defaultLoader.count)
      //  UserDefaults.standard.removeObject(forKey: "ISLOGGEDIN")
         // UserDefaults.standard.removeObject(forKey: "launchCount")
        
        appLaunchCount = UserDefaults.standard.integer(forKey: "AppLaunchCount")
          print("This applaunch is \(appLaunchCount)")
        fetchPhotos()
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.placeholder = "search"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.collectionViewLayout = generateLayout()
        view.addSubview(collectionView)
      
        self.collectionView = collectionView
        view.backgroundColor = .white
        searchBar.searchBarStyle = .default
        
        //Category
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumInteritemSpacing = 0
        let categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        view.addSubview(categoryCollectionView)
        self.categoryCollectionView = categoryCollectionView
        categoryCollectionView.backgroundColor = .white
        view.addSubview(tabView)
        tabView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.backgroundColor = .white
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+100, width: view.frame.size.width, height:view.frame.size.height-100)
        categoryCollectionView?.frame = CGRect(x: 0, y:view.safeAreaInsets.top+50, width: view.frame.size.width, height: 40)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        fetchPhotos()
        collectionView?.reloadData()
        
    }
    
    
    
    func setupDefaultFeed(){
        if appLaunchCount >  defaultLoader.count {
            print("IS Greater")
            UserDefaults.standard.removeObject(forKey: "AppLaunchCount")
            appLaunchCount = 1
            print("----------\(appLaunchCount)")
            UserDefaults.standard.set(appLaunchCount, forKey: "AppLaunchCount")

            count = 0
            
            
        }
        else {
         
            count = appLaunchCount

        }
    }
    func fetchPhotos() {
        presentIndicator()
        if vcValue == 0 {
            let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(defaultLoader[count])&client_id=YOUR_ACCESS_KEY"
            guard let url = URL(string: urlString) else {
                return
            }
           
            let task = URLSession.shared.dataTask(with: url) {[weak self] data,  _, error in
                
                guard let data = data, error  == nil else {
                    return
                }
                do {
                    self?.dismissIndicator()
                    let jsonResult =  try  JSONDecoder().decode(APIResponse.self, from: data)
                    print(jsonResult.results.count)
                    DispatchQueue.main.async {
                        self?.results = jsonResult.results
                        self?.collectionView?.reloadData()
                    }
                    
                }
                catch
                {
                    print(error)
                }
                
            }
            task.resume()
        }
        else if vcValue == 1 {
       
            let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(searchTitle)&client_id=YOUR_ACCESS_KEY"
            guard let url = URL(string: urlString) else {
                return
                    
            }
           
            
            let task = URLSession.shared.dataTask(with: url) {[weak self] data,  _, error in
                
                guard let data = data, error  == nil else {
                    return
                }
                do {
                    self?.dismissIndicator()
                    let jsonResult =  try  JSONDecoder().decode(APIResponse.self, from: data)
                    print(jsonResult.results.count)
                    DispatchQueue.main.async {
                        self?.results = jsonResult.results
                        self?.collectionView?.reloadData()
                    }
                    
                }
                catch
                {
                    print(error)
                }
                
            }
            task.resume()
            
            
            
            
            
        }
        
        
    }
    func searchPhotos(query:String) {
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query )&client_id=YOUR_ACCESS_KEY"
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data,  _, error in
            
            guard let data = data, error  == nil else {
                return
            }
            do {
                let jsonResult =  try  JSONDecoder().decode(APIResponse.self, from: data)
                print(jsonResult.results.count)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
                
                
            }
            catch
            {
                print(error)
            }
            
        }
        task.resume()
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionView) {
            return results.count
        }
        else {
            return searchKeyArray.count
        }
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (self.collectionView == collectionView) {
            let imageUrlString = results[indexPath.row].urls.regular
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: imageUrlString)
            cell.backgroundColor = .white
            return cell
        }
        else {
            guard  let cell = categoryCollectionView!.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setupSearchKey(with: searchKeyArray[indexPath.row])
            cell.backgroundColor = .white
            return cell
        }
        return UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (self.collectionView == collectionView) {
            
            guard let vc = self.storyboard?.instantiateViewController(identifier: "ImageDetailViewController") as? ImageDetailViewController else {
                return
            }
            vc.detailImageUrl = results[indexPath.row].urls.regular
            vc.downloadURL = results[indexPath.row].links.download
            print(results[indexPath.row].links.download_location )
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = .fullScreen
            vc.modalPresentationCapturesStatusBarAppearance = true
            self.present(vc, animated: true)
           // self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        else {
            searchPhotos(query: searchKeyArray[indexPath.row])
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (self.collectionView == collectionView) {
            let size = (collectionView.frame.size.width) / 2
            return CGSize(width:size , height: size)
        }
        else {
            let size2 = (collectionView.frame.size.width) / 4
            return CGSize(width:size2 , height: 50)
        }
        return CGSize()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            results = []
            collectionView?.reloadData()
            searchPhotos(query: text)
            
        }
    }
    //MARK:-Loader Function
    
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
    private func generateLayout() -> UICollectionViewLayout {
        
        
        // Big photos
        let pairMainPhotoSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1.0))
        let pairMainPhotoItem = NSCollectionLayoutItem(layoutSize: pairMainPhotoSize)
        pairMainPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let pairSmallPhotoSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1/2))
        let pairSmallPhotoItem = NSCollectionLayoutItem(layoutSize: pairSmallPhotoSize)
        pairSmallPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let stackedSmallPhotoGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)), subitem: pairSmallPhotoItem, count: 2)
        
        
        let mainAndSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitems: [stackedSmallPhotoGroup, pairMainPhotoItem])
        
        let smallPhotoSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let smallPhotoItem = NSCollectionLayoutItem(layoutSize: smallPhotoSize)
        smallPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let tripleSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitem: smallPhotoItem, count: 3)
        
        let stackedTripleSmallPhotoGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitem: tripleSmallPhotoGroup, count: 2)
        
        
        
        let reversedMainAndSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitems: [ pairMainPhotoItem, stackedSmallPhotoGroup])
        
        
        let allGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0 + 1/4)),
            subitems: [
                mainAndSmallPhotoGroup,
                stackedTripleSmallPhotoGroup,
                reversedMainAndSmallPhotoGroup
            ])
        let section = NSCollectionLayoutSection(group: allGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}



//wGbZJDZolaEr6pn2K-ZW7lrd5koygs6Hj64m3JUXFZc
