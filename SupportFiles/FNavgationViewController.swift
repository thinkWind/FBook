//
//  FNavgationViewController.swift
//  FBook
//
//  Created by Angle on 15/11/19.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit

class FNavgationViewController: UINavigationController {

    //MARK: - 成员变量
    var menu : REMenu = REMenu();
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeItem = REMenuItem(title: "最新更新", subtitle: "实时更新", image: nil, highlightedImage: nil, action: { (item ) -> Void in
            
        });
        
        weak var ws = self;
        let bookshelfItem = REMenuItem(title: "书架", subtitle: "您喜欢的", image: nil, highlightedImage: nil) { (item) -> Void in
            let bookShelVc = FBookShelfViewController();
            ws?.setViewControllers([bookShelVc], animated: true);
        };
        
        let searchBookItem = REMenuItem(title: "搜索", subtitle: "搜您喜欢的", image: nil, highlightedImage: nil) { (item) -> Void in
            
        };
        
        let settingItem = REMenuItem(title: "设置", image: nil, highlightedImage: nil) { (item) -> Void in
            
        };
        
        homeItem.tag = 0;
        bookshelfItem.tag = 1;
        searchBookItem.tag = 2;
        settingItem.tag = 3;
        self.menu = REMenu(items: [homeItem,bookshelfItem,searchBookItem,settingItem]);
        self.menu.separatorOffset = CGSizeMake(15.0, 0.0);
        self.menu.imageOffset = CGSizeMake(5, -1);
        self.menu.waitUntilAnimationIsComplete = false;
        self.menu.badgeLabelConfigurationBlock = {(badgeLabel ,item ) -> Void in
            badgeLabel.backgroundColor = UIColor(red: 0, green: 179.0/255.0, blue: 134.0/255.0, alpha: 1);
            badgeLabel.layer.borderColor = UIColor(red:0.000, green:0.648, blue:0.507, alpha:1).CGColor;
        };
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController);
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    //MARK: - 共有方法
    func toggleMenu()
    {
        if self.menu.isOpen
        {
            self.menu.close();
            return;
        }
        
        self.menu.showFromNavigationController(self);
        
    }

}
