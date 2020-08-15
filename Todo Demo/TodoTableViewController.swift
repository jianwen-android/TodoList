//
//  TodoTableViewController.swift
//  Todo Demo
//
//  Created by YJ Soon on 1/8/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos = [
        Todo(name: "Shave the cat"),
        Todo(name: "Go see a doctor for deadly scratches")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todos"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)

        cell.textLabel?.text = todos[indexPath.row].name
        if todos[indexPath.row].done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let todo = todos.remove(at: fromIndexPath.row)
        todos.insert(todo, at: to.row)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "addTodo" {
            
            let nav = segue.destination as! UINavigationController
            let destination = nav.viewControllers.first as! EditTodoTableViewController
            destination.todo = Todo() // give it an empty one
            destination.isNewTodo = true
            
        } else if segue.identifier == "editTodo" {
            
            let destination = segue.destination as! EditTodoTableViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.todo = todos[selectedIndexPath.row]
            
        }
    }
    
    @IBAction func unWindToMain(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addedTodo" {
            
            let source = segue.source as! EditTodoTableViewController
            if source.isNewTodo {
                todos.append(source.todo)
                tableView.reloadData() // this doesn't work... hmph
            }
            
        }
        
    }
    

}
