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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findBtn.layer.cornerRadius = 10
        
    }
    
    func getUserInfo() {
        let username = inputText.text
        let apiUrl = "https://api.github.com/users/\(username ?? "nill")"
        
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let res = response as? HTTPURLResponse {
                print("Status: \(res.statusCode)")
            }
            
            if let data = data {
                do{
//                    let result = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(result)
                    let result = try JSONDecoder().decode(User.self, from: data)
                    print(result)
                } catch {
                    print(error)
                }
            }
            
        }.resume()
    }
    
    @IBAction func findUser(_ sender: UIButton) {
        getUserInfo()
    }
    

}

