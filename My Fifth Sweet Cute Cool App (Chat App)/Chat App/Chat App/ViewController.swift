//
//  ViewController.swift
//  Chat App
//
//  Created by Rafal Ozog on 12/09/2019.
//  Copyright © 2019 Rafal Learning Center. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var dockViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    var messagesArray:[String] = [String]()
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.messagesTableView.delegate = self
        self.messagesTableView.dataSource = self
        
        // Set self as the delegate for the TextField
        self.messageTextField.delegate = self
        
        // Add a tap gesture recognizer to the TableView
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tableViewTapped")
        self.messagesTableView.addGestureRecognizer(tapGesture)
    
        // Add some sample data
        self.messagesArray.append("First item")
        self.messagesArray.append("Second item")
        self.messagesArray.append("Third item")
    }
    
    @objc func tableViewTapped() {
        
        // Force the TextField to end editing.
        self.messageTextField.endEditing(true)
    }
    
    // MARK: TextField Delegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // Perform an animation to grow the dockview
        UIView.animate(withDuration: 0.5, animations: {
            
            self.dockViewHeightConstraint.constant = 400
            
            // It tells the view to update the layout in case of any constraints changes.
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Perform an animation to hide the dockview
        UIView.animate(withDuration: 0.5, animations: {
            
            self.dockViewHeightConstraint.constant = 60
            
            // It tells the view to update the layout in case of any constraints changes.
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    // MARK: TableView Delegate Methods
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        // Call the end editing method for the text field
        self.messageTextField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: "MessageCell") as! UITableViewCell
        
        cell.textLabel?.text = messagesArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }

}

