//
//  FReadBooksViewController.swift
//  FBook
//
//  Created by Angle on 15/11/21.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit
import MBProgressHUD
import pop

class FReadBooksViewController: UIViewController {

    //MARK: -私有变量
    private var fileContent : String?;
    private var isShowFuncBtn : Bool = false;
    //MARK: -成员变量
    @IBOutlet weak var showView: UITextView!
    //工具栏
    @IBOutlet weak var toolBar: UIView!
    //导航栏
    @IBOutlet weak var navBar: UIView!
    //返回按钮
    @IBOutlet weak var navBackBtn: UIButton!
    //更多按钮
    @IBOutlet weak var navMoreBtn: UIButton!
    //目录
    @IBOutlet weak var catalogueBtn: UIButton!
    //设置按钮
    @IBOutlet weak var settingBtn: UIButton!
    //约束
    @IBOutlet weak var navVieTop: NSLayoutConstraint!
    
    @IBOutlet weak var toolBarBottom: NSLayoutConstraint!
    var fileName : String?;
    //默认当前页，总页数都为0
    var currentPage = 0;
    var allPage = 0;
    //MARK: -生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
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
    

    //MARK: - 共有方法
    //处理单击事件，用来显示和隐藏工具栏
    func handleSingeTap(singeTap : UITapGestureRecognizer) -> Void
    {
        let navBegin : Float;
        let navEnd : Float;
        let toolBegin : Float;
        let toolEnd : Float;
        if(self.isShowFuncBtn)
        {
            navBegin = 0;
            navEnd = Float(-NAVBAR_HEIGHT);
            toolBegin = 0;
            toolEnd = Float(-TOOBAR_HEIGHT);
        }else
        {
            navBegin = Float(-NAVBAR_HEIGHT);
            navEnd = 0;
            toolBegin = Float(-TOOBAR_HEIGHT);
            toolEnd = 0;
        }
        
        let animation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant);
        animation.fromValue = NSNumber(float: navBegin);
        animation.toValue = NSNumber(float:navEnd);
        animation.springBounciness = 10;
        animation.springSpeed = 6;
        self.navVieTop.pop_addAnimation(animation, forKey: "navAnimation");
        
        let toolBarAnimation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant);
        toolBarAnimation.fromValue = NSNumber(float: toolBegin);
        toolBarAnimation.toValue = NSNumber(float:toolEnd);
        toolBarAnimation.springBounciness = 10;
        toolBarAnimation.springSpeed = 6;
        self.toolBarBottom.pop_addAnimation(toolBarAnimation, forKey: "toolAnimation");
        
        isShowFuncBtn = !isShowFuncBtn;
    }
    //MARK: - 私有方法
    private func setupView()
    {
        self.view.backgroundColor = UIColor.whiteColor();
        self.showView.textColor = UIColor.blackColor();
        self.showView.editable = false;
        self.toolBarBottom.constant = -TOOBAR_HEIGHT;
        self.navVieTop.constant = -NAVBAR_HEIGHT;
        
        let singleTap = UITapGestureRecognizer(target: self, action: "handleSingeTap:");
        singleTap.numberOfTapsRequired = 1;
        self.view.addGestureRecognizer(singleTap);
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
