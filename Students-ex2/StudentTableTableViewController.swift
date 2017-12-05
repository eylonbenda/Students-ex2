//
//  StudentTableTableViewController.swift
//  Students-ex2
//
//  Created by admin on 30/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class StudentTableTableViewController: UITableViewController  , RecieveData {

    @IBOutlet var studentsTable: UITableView!
    
    var students : [Student] = [Student]()
    var selectedRow : Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        studentsTable.delegate = self
        studentsTable.dataSource = self
        
        studentsTable.isEditing = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        studentsTable.reloadData()
    }
    
    @IBAction func plusPressed(_ sender: Any) {
        
        
            performSegue(withIdentifier: "goToNewStudent", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToNewStudent" {
        
            let newStudentVC = segue.destination as! AddStudentsController
            
            newStudentVC.delegate = self
            
        } else if segue.identifier == "goToDetails" {
            
            let detailsVC = segue.destination as! StudentsDetailsVC
            
            detailsVC.fName.text = students[selectedRow!].FirstName
            detailsVC.lName.text  = students[selectedRow!].LastName
            detailsVC.id.text = students[selectedRow!].id
            detailsVC.phone.text = students[selectedRow!].phone
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student_cell", for: indexPath) as! StudentRowCell
        cell.firstNameLabel.text = students[indexPath.row].FirstName
        cell.lastNameLabel.text = students[indexPath.row].LastName
        
        
        // Configure the cell...

        return cell
    }
    
    
    
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        selectedRow = indexPath.row
        print("row \(indexPath.row) was selected")
        performSegue(withIdentifier: "goToDetails", sender: self)


    }
    
    
    func recieveData(fName: String, lName: String, id: String, phone: String) {
        
        let student = Student()
        student.FirstName = fName
        student.LastName = lName
        student.id = id
        student.phone = phone
        
        students.append(student)
        print(student.FirstName , student.LastName)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
