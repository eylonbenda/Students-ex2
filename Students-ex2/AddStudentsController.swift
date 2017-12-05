//
//  AddStudentsController.swift
//  Students-ex2
//
//  Created by admin on 01/12/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit


protocol RecieveData {
    
    func recieveData(fName : String , lName : String , id : String , phone : String)
    
}

class AddStudentsController: UIViewController {
    @IBOutlet weak var fnameInput: UITextField!
    
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var studentIDInput: UITextField!
    @IBOutlet weak var lnameInput: UITextField!
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var delegate : RecieveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func savePresssed(_ sender: Any) {
        
      delegate?.recieveData(fName: fnameInput.text!, lName: lnameInput.text!, id: studentIDLabel.text!, phone: phoneInput.text!)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func clearPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
