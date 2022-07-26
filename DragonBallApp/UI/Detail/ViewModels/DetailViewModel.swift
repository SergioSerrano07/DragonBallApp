//
//  DetailViewModel.swift
//  DragonBallApp
//
//  Created by sergio serrano on 26/7/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

final class DetailViewModel {
    private weak var viewDelegate: DetailViewProtocol?
    private var viewData: HomeCellModel
    
    init(data: HomeCellModel,
         viewDelegate: DetailViewProtocol) {
        viewData = data
        self.viewDelegate = viewDelegate
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.update(image: viewData.image)
        viewDelegate?.update(title: viewData.title)
    }
}
