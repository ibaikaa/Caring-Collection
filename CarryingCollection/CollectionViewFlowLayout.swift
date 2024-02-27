//
//  CollectionViewFlowLayout.swift
//  CarryingCollection
//
//  Created by Ian Baikuchukov on 27/2/24.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView else {
            let latestOffset = super.targetContentOffset(
                forProposedContentOffset: proposedContentOffset,
                withScrollingVelocity: velocity
            )
            
            return latestOffset
        }

        let pageWidth = itemSize.width + minimumInteritemSpacing
        
        let approximatePage = collectionView.contentOffset.x / pageWidth
        let currentPage = velocity.x < 0 ? floor(approximatePage) : ceil(approximatePage)
        
        let newHorizontalOffset: CGFloat
        
        if collectionView.contentOffset.x < pageWidth / 2 {
            newHorizontalOffset = currentPage - collectionView.contentInset.left
        } else {
            newHorizontalOffset = ((currentPage + ceil(velocity.x)) * pageWidth) - collectionView.contentInset.left
        }

        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
    
}
