//
//  ListViewController.swift
//  WekanActionSheet
//
//  Created by Brian on 17/04/20.
//  Copyright © 2020 Wekan. All rights reserved.
//

import UIKit
import SwiftEntryKit

class ListViewController: UIViewController {    
    
    private let injectedView: UIView

    init(with view: UIView) {
        injectedView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func loadView() {
        view = injectedView
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
