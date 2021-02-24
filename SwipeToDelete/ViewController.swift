//
//  ViewController.swift
//  SwipeToDelete
//
//  Created by Ishu on 12/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTable:UITableView!
    
    var modals = [ "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
                   "Hello world",
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for:indexPath)
        
        cell.textLabel?.text = modals[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tableView.beginUpdates()
            modals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
       
            tableView.endUpdates()
        
        }
    }
}

