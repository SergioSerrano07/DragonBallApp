//
//  HomeViewModel.swift
//  DragonBallApp
//
//  Created by sergio serrano on 26/7/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var  dataCount: Int { get }
    func onViewsLoaded()
    func data(for index: Int) -> HomeCellModel?
    func onItemSelected(at index: Int)
}

final class HomeViewModel {
    
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = [HomeCellModel]()
    
    init(viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleCharactersData.compactMap {
            HomeCellModel(image: $0.image,
                          title: "\($0.name) \($0.lastname)")
        }
        
        viewDelegate?.updateViews()
    }
    
}

extension HomeViewModel: HomeViewModelProtocol {
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func data(for index: Int) -> HomeCellModel? {
        guard index < dataCount else { return nil }
        return viewData[index]
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(for: index) else { return }
        viewDelegate?.navigateToDetail(with: data)
    }
}
