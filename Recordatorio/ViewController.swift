//
//  ViewController.swift
//  Recordatorio
//
//  Created by Mac on 24/07/2022.
//  Copyright © 2022 Valeria. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var reminders = [Reminder]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self


    }

    @IBAction func AddButtom(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Recordatorio", message: "Agregar un nuevo recordatorio", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Agregar"
        }
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Guardar", style: .default, handler: { (_) in
            
            guard let remainderText = alert.textFields?.first?.text else{
                           return
                       }
            self.reminders.append(Reminder(text: remainderText, completed: false))
            self.tableView.reloadData()
        }))
        
        present(alert, animated: true)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.item]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = reminder.text
        
        if reminder.completed {
            cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.5
        } else {
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            reminders.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reminders[indexPath.item].toggleCompleted()
        tableView.reloadData()
    }
    
}
