//
//  UsersProtocols.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 8.03.2022.
//

import Foundation

// View
protocol AnyView{
    var presenter : AnyPresenter?{get set}
    
    func notify(with users : [UserModel])
    func notify(with error : String)
}

// Interactor
protocol AnyInteractor{
    var presenter : AnyPresenter?{get set}
    func getUsers()
    
}

// Presenter
protocol AnyPresenter{
    var router : AnyRouter?{get set} // for get or set veriable
    var interactor : AnyInteractor?{get set}
    var view : AnyView?{get set}
    
    func interactorDidGetUsers(result : Result<[UserModel],Error>) // for state management
}

// Router
protocol AnyRouter{
    var entry : EntryPoint? { get }
    static func startExecution() -> AnyRouter
}
