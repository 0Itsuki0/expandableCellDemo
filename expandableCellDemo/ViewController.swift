//
//  ViewController.swift
//  expandableCellDemo
//
//  Created by Itsuki on 2023/10/23.
//

import UIKit

struct Section {
    var mainCellTitle: String
    var expandableCellOptions: [String]
    var isExpandableCellsHidden: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = [
        Section(mainCellTitle: "1~3", expandableCellOptions: ["1", "2", "3"], isExpandableCellsHidden: false),
        Section(mainCellTitle: "4~6", expandableCellOptions: ["4", "5", "6"], isExpandableCellsHidden: false),
        Section(mainCellTitle: "7~9", expandableCellOptions: ["7", "8", "9"], isExpandableCellsHidden: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: ExpandableCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: ExpandableCell.cellIdentifier)
        tableView.register(UINib(nibName: MainCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: MainCell.cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if !section.isExpandableCellsHidden {
            return section.expandableCellOptions.count + 1
        } else {
            return 1
        }
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // section main cell title
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.cellIdentifier, for: indexPath) as! MainCell
            cell.label.text = sections[indexPath.section].mainCellTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.cellIdentifier, for: indexPath) as! ExpandableCell
            cell.label.text = sections[indexPath.section].expandableCellOptions[indexPath.row - 1]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0{
            sections[indexPath.section].isExpandableCellsHidden = !sections[indexPath.section].isExpandableCellsHidden
            tableView.reloadData()
        }

    }


}

