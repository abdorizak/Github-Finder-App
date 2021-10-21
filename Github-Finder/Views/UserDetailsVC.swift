//
//  UserDetailsVC.swift
//  Github-Finder
//
//  Created by Abdirizak Hassan on 10/21/21.
//

import UIKit
import Kingfisher

class UserDetailsVC: UIViewController {
    
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    @IBOutlet var userWebsiteLabel: UILabel!
    @IBOutlet var UserLocationLabel: UILabel!
    @IBOutlet var userFollowersLabel: UILabel!
    @IBOutlet var UserRepoLabel: UILabel!
    
    var userDetail: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        UserImage.rounded()
        displayUserInfo()
    }
    
    func displayUserInfo() {
        
        guard let userinfo = userDetail else { return }
        
        UserImage.kf.setImage(with:userinfo.userImage?.asUrl)
        fullNameLabel.text = userinfo.fullName
        bioLabel.text = userinfo.userBio
        userWebsiteLabel.text = userinfo.userWebsite
        UserLocationLabel.text = userinfo.userLocation ?? "Nil"
        userFollowersLabel.text = "Followers:" + String(userinfo.userFollowers)
        UserRepoLabel.text = "Repositories:" + String(userinfo.userRepositories)
    }

}


extension UIImageView {

    func rounded() {
        self.layer.cornerRadius = (self.frame.size.width / 2)
        self.layer.masksToBounds = true
    }
}
