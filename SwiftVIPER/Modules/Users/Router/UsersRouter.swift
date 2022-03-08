//
//  Router.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 7.03.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController
//Router veya Wireframe(Ekranlar arası geçişin kontrol edildiği katman)
//Router’ın işi ekranlar arasında yönlenmeyi sağlamaktır. Yalnızca Presenter’ı tanır ve ondan komutlar alır.
class UserRouter : AnyRouter{
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = UserRouter()
        
        var view : AnyView = UserViewController()
        var presenter : AnyPresenter = UserPresenter()
        var interactor : AnyInteractor = UserInteractor()
        
        // view
        view.presenter = presenter
        
        // presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        // interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        return router
    }
}
