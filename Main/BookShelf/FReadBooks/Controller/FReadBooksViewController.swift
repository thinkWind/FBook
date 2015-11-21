//
//  FReadBooksViewController.swift
//  FBook
//
//  Created by Angle on 15/11/21.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit
import MBProgressHUD

class FReadBooksViewController: UIViewController {

    //MARK: -私有变量
    private var fileContent : String?;
    
    //MARK: -成员变量
    @IBOutlet weak var showView: UITextView!
    
    var fileName : String?;
    //默认当前页，总页数都为0
    var currentPage = 0;
    var allPage = 0;
    //MARK: -生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.hidden = true;
        let hub = MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        hub.mode = .AnnularDeterminate;
        hub.labelText = "拼命加载中...";
        loadLocalFile(fileName);
    }
    

    //MARK: - 私有方法
    private func setupView()
    {
        self.view.backgroundColor = UIColor.whiteColor();
        self.showView.textColor = UIColor.blackColor();
        self.showView.editable = false;
    }
    
    private func showTheContent()
    {
        if(self.fileContent == nil)
        {
            loadFileFailed(true);
            return;
        }
        loadFileFailed(false);
        
        //计算总页数
        allPage = Int(showView.contentSize.height / SCREEN_HEIGH) + 1;
        currentPage = 1;
        showView.text = fileContent!;
    }

    private func loadLocalFile(fileName : String?) -> Void
    {
       if let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
       {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), { () -> Void in
                self.fileContent = try? String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding);
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showTheContent();
                });
            });
        }else
        {
            loadFileFailed(true);
        }
    }
    
    private func loadFileFailed(isFailed : Bool)
    {
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true);
        let hub = MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        hub.mode = .Text;
        hub.hide(true, afterDelay: 1.0);
        hub.labelText = isFailed ? "加载失败" : "加载成功";
    }
}
