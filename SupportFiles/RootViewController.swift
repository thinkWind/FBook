//
//  RootViewController.swift
//  FBook
//
//  Created by Angle on 15/11/19.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.902, alpha: 1.00);
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "菜单", style: .Plain, target: self.navigationController, action: "toggleMenu");
        let label = UILabel();
        label.autoresizingMask = [.FlexibleWidth,.FlexibleHeight];
        label.text = NSStringFromClass(self.classForCoder);
        label.textAlignment = .Center;
        label.textColor = UIColor.whiteColor();
        label.font = UIFont.boldSystemFontOfSize(20);
        label.backgroundColor = UIColor.clearColor();
        self.view.addSubview(label);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews();
        if let ownNavController = self.navigationController
        {
            let navigationController = ownNavController as! FNavgationViewController;
            navigationController.menu.setNeedsLayout();
        }
    }
    
    init()
    {
        super.init(nibName: nil, bundle: nil);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
