//
//  ViewController.swift
//  相册浏览器
//
//  Created by Anthony on 17/2/21.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 布局
        let layout = UICollectionViewFlowLayout()
        
        // 设置collectionView
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.center = self.view.center
        collectionView.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        collectionView.backgroundColor = UIColor.brownColor()
        view.addSubview(collectionView)
        
    }


}

