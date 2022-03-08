//
//  Presenter.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 7.03.2022.
//

import Foundation

// talks to -> interactor, router, view
//View, Router ve Interactor arasındaki bağlantıyı sağlayan katman
// viewde tiklama tetikleme degistirme gibi islemler burada yapilir. interactorDidGetUsers gibi
//Interactor’dan bazı veriler isteyebiliriz veya Router’a farklı bir ekrana yönlenmesini söyleyebiliriz. Presenter ayrıca, Interactor’dan veriler alır ve komutlarla View’a iletir.
enum NetworkError : Error{
    case NetworkFailed
    case ParsingFailed
}

class UserPresenter : AnyPresenter{
    var router: AnyRouter?
    var interactor: AnyInteractor?{
        didSet{// didSet == buradaki deger atandiginda calis
            interactor?.getUsers() // deger atandigi zaman verileri cek
        }
    }
    var view: AnyView?
    
    func interactorDidGetUsers(result: Result<[UserModel], Error>) {
        switch result{
        case .success(let users):
            // view update
            view?.notify(with: users)
        case .failure(_):
            // view.update error
            view?.notify(with: "ERROR! Try again")
        }
    }
    
    
}
