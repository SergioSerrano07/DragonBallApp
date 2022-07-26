//
//  HomeViewController.swift
//  DragonBallApp
//
//  Created by sergio serrano on 25/7/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func navigateToDetail(with data: HomeCellModel?)
    func updateViews()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    var viewModel: HomeViewModelProtocol?
    
    private let detailStoryboardName = "Detail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        configureViews()
        viewModel?.onViewsLoaded()
    }
    
    
    private func configureViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: HomeViewProtocol {
    func updateViews() {
        collectionView.reloadData()
    }
    
    func navigateToDetail(with data: HomeCellModel?) {
        let detailStoryboard = UIStoryboard(name: detailStoryboardName,
                                            bundle: nil)
        
        guard let viewData = data,
              let destination = detailStoryboard.instantiateInitialViewController() as? DetailViewController else { return }
        
        destination.viewModel = DetailViewModel(data: viewData,
                                                viewDelegate: destination)
        
        navigationController?.pushViewController(destination,
                                                 animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 16,
               height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.cellIdentifier,
                                                      for: indexPath) as? CellView
        
        if let data = viewModel?.data(for: indexPath.row) {
            cell?.updateViews(data: data)
        }
        
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        viewModel?.onItemSelected(at: indexPath.row)
        
    }
}
