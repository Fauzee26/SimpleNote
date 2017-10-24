//
//  NoteTableViewController.swift
//  Simple Note
//
//  Created by Muhammad Hilmy Fauzi on 24/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    //declare variable task as object
    var tasks: [Task] = [] // this task called from entity that was created previous

    
    //declare content for persistent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath)
        as! DescTableViewCell

        //declare dataTask as index from task
        let dataTask = tasks[indexPath.row]
        //put data eith attributs name_task
        if let myDataTask = dataTask.day_task {
            //display data to label
            cell.labelDay.text = myDataTask
        }
        if let myDataTask1 = dataTask.name_task {
            //display data to label
            cell.labelTask.text = myDataTask1
        }
        if let myDataTask2 = dataTask.desc_task {
            //display data to label
            cell.labelDesc.text = myDataTask2
        }


        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //call method getData()
        getData()
        //call reloadData
        tableView.reloadData()
    }

    //method getData
    func getData() {
        //check what there is error or not
        do {
            //condition if nothing error
            //so will request download data
            tasks = try context.fetch(Task.fetchRequest())
        }catch{
            //condition if error fatch data
            print("Fetching Failed")
        }
    }
    
    //add data to delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //check swipe menu if the editing style is delete
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrieve data
                tasks = try context.fetch(Task.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
    }
    
}
