//
//  FBookShelfViewController.swift
//  FBook
//
//  Created by Angle on 15/11/20.
//  Copyright © 2015年 Feng. All rights reserved.
//

import UIKit

class FBookShelfViewController: RootViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    //MARK: -成员变量
    @IBOutlet weak var collectionView: UICollectionView!
    var bookData = Array<String>();
    var bookFile = Array<String>();
    //MARK: -生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        bookData = ["aizaixianjingderizi.jpeg","anshizhangda.jpeg","bubizhidaowoshishui.jpeg","dangnigudannihuixiangqishui.jpeg","hudielaiguozheshijie.jpeg","liaiyigeIDdejuli.jpeg","shalou.jpeg","shinian.jpeg","tangyi.jpeg", "tiaopin.jpeg", "wobushinideyuanjia.jpeg", "woyaowomenzaiyiqi.jpeg", "xiaofudequnbai.jpeg", "xiaoyaodejinsechengbao.jpeg", "zuishuxidemoshengren.jpeg", "zuoer.jpg", "zuoerzhongjie.jpeg", "aizaixianjingderizi.jpeg"];
        bookFile = ["aizaixianjingderizi.txt","anshizhangda.txt","bubizhidaowoshishui.txt","dangnigudannihuixiangqishui.txt","hudielaiguozheshijie.txt","liaiyigeIDdejuli.txt","shalou.txt","shinian.txt","tangyi.txt", "tiaopin.txt", "wobushinideyuanjia.txt", "woyaowomenzaiyiqi.txt", "xiaofudequnbai.txt", "xiaoyaodejinsechengbao.txt", "zuishuxidemoshengren.txt", "zuoer.txt", "zuoerzhongjie.txt", "aizaixianjingderizi.txt"];
        // Do any additional setup after loading the view.
        setupView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init()
    {
        super.init();
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    //MARK: -UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bookData.count;
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(FBookCollectionCellTag.BookShelf.rawValue, forIndexPath: indexPath) as! FBookShelfCollectionViewCell;
        cell.viewModel = self.bookData[indexPath.row];
        cell.bookShelfBtnHandle = {()->Void in
            let readBooksVc = FReadBooksViewController();
            readBooksVc.fileName = self.bookFile[indexPath.row];
            self.navigationController?.pushViewController(readBooksVc, animated: true);
        };
        return cell;
    }
    
    //MARK: -UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: -UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(93, 139);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
    
    //MARK: 私有方法
    private func  setupView()
    {
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.registerNib(UINib(nibName: "FBookShelfCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FBookCollectionCellTag.BookShelf.rawValue);
    }
}
