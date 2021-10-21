//
//  ViewController.swift
//  Github-Finder
//
//  Created by Abdirizak Hassan on 10/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputText: UITextField!
    
    @IBOutlet var findBtn: UIButton!
    
    var user: User?
    
    enum segue {
        static let userDetail = "segue.showUserDetail"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findBtn.layer.cornerRadius = 10
        
        
    }
    
    func getUserInfo() {
        let username = inputText.text
        guard username?.isEmpty == false else {
            return showAlert(title: "Empty!😡", message: "Text input Cannot be empty...")
        }
        let apiUrl = "https://api.github.com/users/\(username ?? "nill")"
        
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let res = response as? HTTPURLResponse {
                print("Status: \(res.statusCode)")
            }
            
            if let data = data {
                do{
                    let result = try JSONDecoder().decode(User.self, from: data)
//                    print(result)
                    self.user = result
//                    print("User Detail: \(self.user)")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: segue.userDetail, sender: self.user)
                    }
                } catch {
                    print(error)
                }
                
                if let error = error {
                    print(error)
                }
            }
            
        }.resume()
    }
    
    func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "ok", style: .cancel))
        present(ac, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let detailvc = segue.destination as? UserDetailsVC, let userDetail = sender as? User {
            detailvc.userDetail = userDetail
        }
            
    }
    
    @IBAction func findUser(_ sender: UIButton) {
        getUserInfo()
    }
    

}

