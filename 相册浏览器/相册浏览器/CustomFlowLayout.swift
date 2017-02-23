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
     *  在滚动的时候是否允许刷新
        只要显示的边界发生改变就重新布局:
        内部会重新调用prepareLayout和layoutAttributesForElementsInRect方法获得所有cell的布局属性
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

    // 用户手指一松开就会调用，注意：拖动比较快，最终的偏移量 ≠ 手指离开的偏移量
    // 确定最终的偏移量
    // 距离中心点越近,这个cell最终展示到中心点位置
    /**
     *  用来设置collectionView停止滚动那一刻的位置
     *
     *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
     *  @param velocity              滚动速度
     */
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // 最终的偏移量
        var targetP = super.targetContentOffsetForProposedContentOffset(proposedContentOffset, withScrollingVelocity: velocity)
        
        // collection的宽度
        let collectionW = collectionView!.bounds.width
        
        // 最终显示区域
        let targetRect = CGRect(x: targetP.x, y: CGFloat(0), width: collectionW, height: CGFloat(MAXFLOAT))
        
        // 获取最终显示的cell
        let attrs = super.layoutAttributesForElementsInRect(targetRect)
        
        // 获取最小间距
        var minDelta = CGFloat(MAXFLOAT)
        for attr in attrs! {
            // 获取距离中心点距离：注意应该用最终的x
            let delta = (attr.center.x - targetP.x) - collectionW * 0.5
            
            if fabs(delta) < fabs(minDelta) {
                minDelta = delta
            }
        }
        // 移动间距
        targetP.x += minDelta
        
        // 判断最小值等于=0
        if targetP.x < 0 {
            targetP.x = 0
        }
        
        return targetP
    }
}
