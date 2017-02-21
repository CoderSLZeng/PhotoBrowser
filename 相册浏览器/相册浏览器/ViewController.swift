//
//  ViewController.swift
//  相册浏览器
//
//  Created by Anthony on 17/2/21.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // cell的标识符
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 160)
        // 滚动方向
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        // 最小行间距
        layout.minimumLineSpacing = 50

        
        // 设置collectionView
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        // 一定要先设置中心文字在设置bounds
        collectionView.center = self.view.center
        collectionView.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        collectionView.backgroundColor = UIColor.brownColor()
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        // 内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100)
        
        // 注册cell
        let nib = UINib(nibName: "\(PhotoCell.self)", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

}

extension ViewController: UICollectionViewDataSource
{
    // 每组有多少个
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhotoCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        
        return cell
    }
}
