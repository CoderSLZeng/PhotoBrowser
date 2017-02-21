//
//  CustomFlowLayout.swift
//  相册浏览器
//
//  Created by Anthony on 17/2/21.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    /**
     在滚动的时候是否允许刷新
     */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    /**
     作用：指定一段区域，修改区域内cell的尺寸
     
     - parameter rect: 指定的区域
     
     - returns: 指定区域内的cell
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      
        // 需要显示的区域
        let rect = collectionView!.bounds
        
        // 获取指定区域中的cell
        let attrs = super.layoutAttributesForElementsInRect(rect)
        
        for attr in attrs! {
            // 计算中心点的距离
            let delta = fabs(attr.center.x - collectionView!.contentOffset.x - collectionView!.bounds.width * 0.5)
            
            // 计算缩放比例
            let scale = 1 - delta / (rect.width * 0.5) * 0.25
            
            // 设置Cell的形变
            attr.transform = CGAffineTransformMakeScale(scale, scale)
            
        }
        
        return attrs
    }

}
