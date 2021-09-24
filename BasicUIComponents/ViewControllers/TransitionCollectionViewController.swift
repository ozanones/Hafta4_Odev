//
//  TransitionCollectionViewController.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 24.09.2021.
//

import UIKit

class TransitionCollectionViewController: UIViewController {

    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBOutlet weak var transitionCollectionView: UICollectionView!
    
    var myImages: [ImageModel] = [ImageModel(id: 1, image: UIImage(named: "first.jpg")!),ImageModel(id: 2, image: UIImage(named: "second.jpg")!),ImageModel(id: 3, image: UIImage(named: "third.jpg")!),ImageModel(id: 4, image: UIImage(named: "fourth.jpg")!),ImageModel(id: 5, image: UIImage(named: "fifth.jpg")!),ImageModel(id: 6, image: UIImage(named: "sixth.jpg")!),ImageModel(id: 7, image: UIImage(named: "seventh.jpg")!),ImageModel(id: 8, image: UIImage(named: "eigth.jpg")!),ImageModel(id: 9, image: UIImage(named: "nineth.jpg")!),ImageModel(id: 10, image: UIImage(named: "tenth.jpg")!)]
    
    var change: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "=", style: .plain, target: self, action: #selector(changeDisplay))
    }
    
    @objc func changeDisplay(){
        change.toggle()
        self.transitionCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension TransitionCollectionViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension TransitionCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! TransitionImageCollectionViewCell
        cell.imageView.image = myImages[indexPath.row].image
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension TransitionCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if change {
            return CGSize(width: 200, height: 200)
        }
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }

}
