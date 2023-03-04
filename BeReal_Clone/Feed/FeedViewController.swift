//
//  FeedViewController.swift
//  BeReal_Clone
//
//  Created by Stephanie Hernandez on 3/3/23.
//

import UIKit
import ParseSwift

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutBtnTapped(_ sender: UIBarButtonItem) {
        // Logs out the user asynchronously
        User.logout { [weak self] result in // Handle the result (of type Result<Void, ParseError>)
            switch result {
            case .success:
                print("✅ Successfully logged out!")
                
                // Post a notification that the user has successfully logged out.
                NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
                
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Error", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
