//
//  Interactor.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 7.03.2022.
//

import Foundation

// talks to -> Presenter
//Servis ile haberleşmenin yapıldığı katman
//Interactor business logic içerir. Ve çoğunlukla API çağrılarından sorumludur. Bu katmanda yapılan işlemler UI dan bağımsız olarak gerçekleşir.
class UserInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    func getUsers() {
        guard let url = NetworkPaths.USERS.path.getUrl() else {
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in // [weak self] sayfalar arasi gecislerde verinin tekrar cagrilmasaini engeller (veriyi tutar)
            
            guard let data = data,error == nil else{
                self?.presenter?.interactorDidGetUsers(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do{
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                self?.presenter?.interactorDidGetUsers(result: .success(users))
            }catch{
                self?.presenter?.interactorDidGetUsers(result: .failure(NetworkError.ParsingFailed))
            }
            
        }.resume()
    }
}
