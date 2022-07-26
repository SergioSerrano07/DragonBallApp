//
//  SplashViewController.swift
//  DragonBallApp
//
//  Created by sergio serrano on 22/7/22.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func onLoading(_ show: Bool)
    func navigationToHome()
}

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
    private let homeStoryboardName = "Home"
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.onLoadingViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
}

extension SplashViewController: SplashViewProtocol {
    func onLoading(_ show: Bool) {
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
            
        default: break
        }
    }
    
    func navigationToHome() {
        let homeStoryboard = UIStoryboard(name: homeStoryboardName,
                                          bundle: nil)
        guard let destinationViewController = homeStoryboard.instantiateInitialViewController() as? HomeViewController else { return }
        destinationViewController.viewModel = HomeViewModel(viewDelegate: destinationViewController)
        
        navigationController?.setViewControllers([destinationViewController], animated: true)
    }
}

