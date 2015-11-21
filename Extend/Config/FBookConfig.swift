//
//  FBookConfig.swift
//  FBook
//
//  Created by Angle on 15/11/21.
//  Copyright © 2015年 Feng. All rights reserved.
//

import Foundation

//本项目所有的collectioncell标示都放在此处，方便管理
enum FBookCollectionCellTag : String
{
    case BookShelf = "BookShelfCell";
}

typealias FBookBtnEventHandle = (Void) -> Void;
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width;
let SCREEN_HEIGH = UIScreen.mainScreen().bounds.height;