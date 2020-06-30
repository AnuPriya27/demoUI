//
//  HomeViewController.swift
//  VamoshUI
//
//  Created by Annu Priya on 28/06/20.
//  Copyright © 2020 Annu Priya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrlImg: UIScrollView!{
           didSet{
               scrlImg.delegate = self
           }
       }

    var imageData : [String] = []
    var index = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollImge()
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
            self.productCollectionView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(moveToNextImage), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        timer.invalidate()
    }
    
    func scrollImge(){
           self.imageData = ["background", "background"]
           pageControl.numberOfPages = imageData.count
           pageControl.currentPage = 0
           view.bringSubviewToFront(pageControl)
           self.scrlImg.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.scrlImg.frame.height)
           
           for i in 0..<self.imageData.count {
               let imageView = UIImageView()
               let x = self.view.frame.size.width * CGFloat(i)
               imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.scrlImg.frame.height)
               imageView.contentMode = .scaleAspectFit
               imageView.image = UIImage(named: self.imageData[i] as! String)
               self.scrlImg.contentSize.width = self.scrlImg.frame.size.width * CGFloat(i + 1)
               self.scrlImg.addSubview(imageView)
               scrlImg.contentSize = CGSize(width: view.frame.width * CGFloat(imageData.count), height: self.scrlImg.frame.height)
           }
           
           self.scrlImg.delegate = self
           self.scrlImg.isPagingEnabled = true
       }
    
    @objc func moveToNextImage (){
           self.pageControl.currentPage = self.index
           if self.pageControl.currentPage == self.imageData.count - 1{
               self.scrlImg.reloadInputViews()
           } else{
               let pageWidth:CGFloat = self.scrlImg.frame.width
               let maxWidth:CGFloat = pageWidth * CGFloat(self.imageData.count)
               let contentOffset:CGFloat = self.scrlImg.contentOffset.x
               
               var slideToX = contentOffset + pageWidth
               
               if  contentOffset + pageWidth == maxWidth{
                   slideToX = 0
               }
               self.scrlImg.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrlImg.frame.height), animated: true)
           }
           
       }
}

extension HomeViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView{
            return 5
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            return cell
               }else{
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.shadowDecorate()
                   return cell
               }
    }
    
    
    
    
}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView{
           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + (flowLayout.minimumInteritemSpacing * CGFloat(2))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
            return CGSize(width: size, height: 200)
        }else{
            return CGSize(width: 160, height: 150)
        }
    }
}



