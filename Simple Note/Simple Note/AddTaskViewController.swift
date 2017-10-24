//
//  AddTaskViewController.swift
//  Simple Note
//
//  Created by Muhammad Hilmy Fauzi on 24/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var etNameTask: UITextField!
    @IBOutlet weak var etDay: UITextField!
    @IBOutlet weak var etDescription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnSaveTask(_ sender: Any) {
        //declare context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //declare task
        let nameTask = Task(context: context) //declare nameTask as context from entyty task
         //declare is the nameTask.name_task field is from etNameTask.text
        nameTask.name_task = etNameTask.text
        nameTask.day_task = etDay.text
        nameTask.desc_task = etDescription.text
         // Save the data to coredata
        //check are value from etTask is nil or not
        if etNameTask.text! == "" && etDay.text! == "" && etDescription.text! == "" {
            //condition if nil
            //display alert dialog
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Input Profile Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            //condition if task text is filled
            //data saved to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            
            //print if the data has been added
            print("Data has been added")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
