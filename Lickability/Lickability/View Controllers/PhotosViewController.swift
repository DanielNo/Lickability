//
//  PhotosViewController.swift
//  Lickability
//
//  Created by Daniel No on 6/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel : PhotosVCViewModel!
    
    @IBOutlet weak var photosTableView: UITableView! {
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension PhotosViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = PhotoDetailVCViewModel()
        let photoDetailVC = PhotoDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
    }


}
