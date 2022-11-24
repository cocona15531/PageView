//
//  ContentViewController.swift
//  PageIn
//
//  Created by Issei Ueda on 2022/11/18.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var memo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        memo = textField.text!
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

}
