//
//  PhotosViewController.swift
//  Lickability
//
//  Created by Daniel No on 6/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class PhotosViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate  {
    
    var viewModel : PhotosVCViewModel!
    let disposeBag = DisposeBag()
    let photoCellIdentifier = "photoCell"
    
    @IBOutlet weak var photosCollectionView: UICollectionView! {
        didSet{
            let refreshControl = UIRefreshControl()
            refreshControl.attributedTitle = NSAttributedString(string: "Reload Photos", attributes: nil)
            refreshControl.addTarget(self, action: #selector(refreshPhotos), for: .valueChanged)
            self.photosCollectionView.refreshControl = refreshControl
            let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
            self.photosCollectionView.register(nib, forCellWithReuseIdentifier: photoCellIdentifier)
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.estimatedItemSize = CGSize(width: 150, height: 150)
            self.photosCollectionView.setCollectionViewLayout(flowLayout, animated: true)
            self.photosCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
            self.photosCollectionView.alwaysBounceVertical = true
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUserInterface()
        self.refreshPhotos()
        // Do any additional setup after loading the view.
    }
    
    @objc func refreshPhotos() -> Void{
        self.viewModel.getPhotos { [unowned self](error) in
            DispatchQueue.main.async {
                self.photosCollectionView.refreshControl?.endRefreshing()

            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    convenience init(viewModel : PhotosVCViewModel) {
        self.init()
        self.viewModel = viewModel
    }


}

extension PhotosViewController{
    func bindUserInterface(){
        let dataSource = RxCollectionViewSectionedAnimatedDataSource<PhotoCollectionViewSection>(configureCell:{datasource, collectionView, index, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.photoCellIdentifier, for: index) as! PhotoCollectionViewCell

            cell.configureCell(photo: item)
            return cell
        }, configureSupplementaryView: {dataSource,collectionView,str,index in
            return UICollectionReusableView()
        })
        
        self.viewModel.photos
        .asObservable()
            .bind(to: photosCollectionView.rx.items(cellIdentifier: photoCellIdentifier, cellType: PhotoCollectionViewCell.self)){ (row,element,cell) in
                cell.configureCell(photo: element)
            }.disposed(by: disposeBag)
    }
    
}

