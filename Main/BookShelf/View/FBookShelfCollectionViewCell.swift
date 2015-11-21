//
//  FBookShelfCollectionViewCell.swift
//  FBook
//
//  Created by Angle on 15/11/21.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit

class FBookShelfCollectionViewCell: UICollectionViewCell {

    //MARK: - 成员变量
    //每本书的头像+按钮事件
    @IBOutlet weak var headerBtn: UIButton!
    private var _viewModel = String();
    var bookShelfBtnHandle : FBookBtnEventHandle?;
    //MARK: - 属性
    var viewModel : String
    {
        get
        {
            return _viewModel;
        }
        
        set
        {
            _viewModel = newValue;
             self.headerBtn.setImage(UIImage(named: _viewModel), forState: .Normal);
        }
    }
    //生命周期
    override func awakeFromNib() {
        super.awakeFromNib()
        self.headerBtn.rac_signalForControlEvents(.TouchUpInside).subscribeNext { (touchBtn) -> Void in
            if self.bookShelfBtnHandle != nil
            {
                self.bookShelfBtnHandle!();
            }
        }
    }

}
