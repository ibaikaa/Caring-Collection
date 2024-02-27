//
//  ViewController.swift
//  CarryingCollection
//
//  Created by Ian Baikuchukov on 26/2/24.
//

import UIKit

final class ViewController: UIViewController {
    
    private let collectionViewLayout = CollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCollectionViewItemSize()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.frame = view.bounds
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = false
        collectionView.dataSource = self
        
        collectionViewLayout.scrollDirection = .horizontal
    }
    
    private func setupCollectionViewItemSize() {
        let leftInset = collectionView.layoutMargins.left
        let rightInset = collectionView.layoutMargins.right
                
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        collectionViewLayout.itemSize = CGSize(
            width: collectionView.frame.size.width * 0.7,
            height: collectionView.frame.size.height * 0.5
        )
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
}
