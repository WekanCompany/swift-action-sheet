//
//  NibExampleView.swift
//  SwiftEntryKit_Example
//
//  Created by Daniel Huri on 4/25/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import UIKit
import SwiftEntryKit

class NibExampleView: UIView {
    @IBOutlet var listTableView: UITableView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        fromNib()
        clipsToBounds = true
        layer.cornerRadius = 5
        
        // Do any setups that you require for this class
        listTableView.register(UINib(nibName: "ModelTableViewCell", bundle: nil), forCellReuseIdentifier: "ModelTableViewCell")
        listTableView.reloadData()
    }
    
    @IBAction func closeAction(sender: Any) {
        SwiftEntryKit.dismiss()
    }
}

extension NibExampleView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelTableViewCell") as! ModelTableViewCell
        cell.lblModelName.text = "Option \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

