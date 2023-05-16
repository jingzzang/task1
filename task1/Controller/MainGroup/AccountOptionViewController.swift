//
//  AccountOptionViewController.swift
//  task1
//
//  Created by 징 on 2023/05/14.
//

import UIKit

class AccountOptionViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var contentWithAcctView: UIView!
    @IBOutlet weak var WithAcctscrollView: UIScrollView!
    
    @IBOutlet var contentWithoutAcctView: UIView!
    @IBOutlet weak var WithoutAcctscrollView: UIScrollView!
    
    @IBOutlet var colorsView: UIView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    private var isWithoutTheAcctNum: Bool = false
    
    init(isWithoutTheAcctNum: Bool) {
        super.init(nibName: "AccountOptionView", bundle: nil)
        self.isWithoutTheAcctNum = isWithoutTheAcctNum
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        colorCollectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: "ColorCell")
        
        if isWithoutTheAcctNum {
            WithoutAcctscrollView.addSubview(colorsView)
            contentView.addSubview(contentWithoutAcctView)
        }else {
            WithAcctscrollView.addSubview(colorsView)
            contentView.addSubview(contentWithAcctView)
        }
    }
    
    @IBAction func confirmBtnClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension AccountOptionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CommonUtil().colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell
        let color =  CommonUtil().colorArray[indexPath.row]
        cell?.configureUI(color: color, isYours: color == .daisyDaisy)
        return cell ?? UICollectionViewCell()
    }
}
