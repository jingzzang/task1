//
//  AccountOptionViewController.swift
//  task1
//
//  Created by 징 on 2023/05/14.
//

import UIKit

class AccountOptionViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var acctName: UILabel!
    
    @IBOutlet var contentWithAcctView: UIView!
    @IBOutlet weak var WithAcctscrollView: UIScrollView!
    @IBOutlet weak var acctNum: UILabel!
    
    @IBOutlet var contentWithoutAcctView: UIView!
    @IBOutlet weak var WithoutAcctscrollView: UIScrollView!
    
    @IBOutlet var colorsView: UIView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    private var isWithoutTheAcctNum: Bool = false
    private var data: AccountInfo?
    var selectedIndexPath: IndexPath?
    
    init(isWithoutTheAcctNum: Bool, acctInfo: AccountInfo?) {
        super.init(nibName: "AccountOptionView", bundle: nil)
        self.isWithoutTheAcctNum = isWithoutTheAcctNum
        self.data = acctInfo
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        colorCollectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: "ColorCell")
        
        acctName.text = data?.accountName ?? ""
        acctNum.text = getWholeAccountNum()
        
        if isWithoutTheAcctNum {
            WithoutAcctscrollView.addSubview(colorsView)
            contentView.addSubview(contentWithoutAcctView)
        }else {
            WithAcctscrollView.addSubview(colorsView)
            contentView.addSubview(contentWithAcctView)
        }
        
        
    }
    
    @IBAction func renameBtnClock(_ sender: UIButton) {
        /*
         * MainViewController > AccountOptionViewController > AccountNameEditingViewController
         * dismiss(vc) : presentedViewController를 dismiss시키는 메소드.
         *               다만, presentedViewController가 없으면 자신을 dismiss 시킴.
         */
        weak var pvc = self.presentingViewController
        
        self.dismiss(animated: true, completion: {
            let vc = AccountNameEditingViewController()
            /*
             * 1. dismiss 호출 시점에 presentedViewController이 없어 자신이 dismiss됨
             * 2. dismiss 후 MainViewController(presentingViewController)로 AccountNameEditingViewController(presentedViewController)를 띄우게 함.
             */
            vc.data = self.data
            pvc?.present(vc, animated: true, completion: nil)
        })
    }
    
    // mark : 상단 확인 버튼 Click Action
    
    @IBAction func confirmBtnClick(_ sender: UIButton) {
        if let colorIndx = selectedIndexPath {
            data?.backgroundColor = CommonUtil().colorArray[colorIndx.row]
        }
        DataManager.updateAcctInfoData(data: data!)
        self.dismiss(animated: true){
            NotificationCenter.default.post(name: NSNotification.Name("showMain"), object: nil)
        }
    }
    
    // mark : 계좌번호 복사하기 버튼 Click Action
    
    @IBAction func copyButtonClick(_ sender: UIButton) {
        let pasteboard = UIPasteboard.general

        pasteboard.string = acctNum.text
        
        view.showToast(msg: "계좌번호가 복사되었습니다.")
    }
    
    private func getWholeAccountNum() -> String {
        let type = data?.type ?? .Default
        let wholeAcctNum = data?.accountNum ?? ""
        switch type {
        case .Deposit:
            return "입출금 \(wholeAcctNum)"
        case .Saving:
            return "예적금 \(wholeAcctNum)"
        default:
            return ""
        }
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
        if let selectedIndexPath = selectedIndexPath {
            cell?.isSelected = selectedIndexPath == indexPath
        }else {
            if color == data?.backgroundColor {
                selectedIndexPath = indexPath
                cell?.isSelected = true
            }else {
                cell?.isSelected = false
            }
        }
        
        cell?.configureUI(color: color)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deSelectedIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        collectionView.reloadItems(at: [deSelectedIndexPath!, indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return indexPath != selectedIndexPath
    }
}

