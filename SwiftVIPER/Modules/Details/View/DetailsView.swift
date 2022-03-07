//
//  DetailsView.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 8.03.2022.
//

import Foundation
import UIKit
class DetailsViewController : UIViewController{
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var adress: String = ""
    var phone: String = ""
    var website: String = ""
    
    private let nameLabel : UILabel = CustomLabel().label()!
    private let usernameLabel : UILabel = CustomLabel().label()!
    private let emailLabel : UILabel = CustomLabel().label()!
    private let adressLabel : UILabel = CustomLabel().label()!
    private let phoneLabel : UILabel = CustomLabel().label()!
    private let webSiteLabel : UILabel = CustomLabel().label()!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(webSiteLabel)
        view.addSubview(adressLabel)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2 - 400/2, width: 100, height: 50)
        usernameLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2 - 300/2, width: 100, height: 50)
        emailLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2 - 200/2, width: 100, height: 50)
        phoneLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2 - 100/2 , width: 100, height: 50)
        webSiteLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2 - 50/2, width: 100, height: 50)
        adressLabel.frame = CGRect(x: view.frame.width/2 - 100/2, y: view.frame.height/2, width: 100, height: 50)
        
        nameLabel.text = name
        usernameLabel.text = username
        emailLabel.text = email
        phoneLabel.text = phone
        webSiteLabel.text = website
        adressLabel.text = adress
        
        
    }
}
