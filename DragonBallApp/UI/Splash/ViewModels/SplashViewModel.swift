//
//  SplashViewModel.swift
//  DragonBallApp
//
//  Created by sergio serrano on 26/7/22.
//

import Foundation


protocol SplashViewModelProtocol {
    func onLoadingViews()
}

final class SplashViewModel {
    
    private weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewDelegate?.onLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.viewDelegate?.onLoading(false)
            self?.viewDelegate?.navigationToHome()
        }
    }
    
}

extension SplashViewModel: SplashViewModelProtocol {
    func onLoadingViews() {
        loadData()
    }
}

