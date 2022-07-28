//
//  ViewController.swift
//  Coping&Detecting
//
//  Created by KhaleD HuSsien on 28/07/2022.
//

import UIKit

class HomeViewController: UIViewController{
    //MARK: - outlet
    @IBOutlet weak var textView: UITextView!
    var pastedStrings: [String] = []
    let Data_Key = "Data_Key"
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loaded_String = UserDefaults.standard.stringArray(forKey: Data_Key){
            pastedStrings.append(contentsOf: loaded_String)
        }
        showText()
        
    }
    // functions
    func addText(){
        guard let text = UIPasteboard.general.string , !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: Data_Key)
        showText()
    }
    func showText(){
        textView.text = ""
        for str in pastedStrings {
            textView.text.append("\(str)\n-------------\n")
        }
    }
    
    // actions
    @IBAction func trashButtonTapped(_ sender: UIBarButtonItem) {
        pastedStrings.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey: Data_Key)
    }
    
}

