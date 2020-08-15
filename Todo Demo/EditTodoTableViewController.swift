//
//  EditTodoTableViewController.swift
//  Todo Demo
//
//  Created by YJ Soon on 1/8/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import UIKit

class EditTodoTableViewController: UITableViewController {
    
    var todo: Todo!
    var isNewTodo = false

    @IBOutlet weak var doneToggle: UISwitch!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = todo.name
        doneToggle.isOn = todo.done
    }

    @IBAction func textFieldEdited(_ sender: Any) {
        todo.name = nameField.text ?? ""
    }
    
    @IBAction func toggled(_ sender: Any) {
        todo.done = doneToggle.isOn
    }
    
    
}
