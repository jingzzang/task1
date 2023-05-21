//
//  AddAccountModalViewController.swift
//  task1
//
//  Created by 징 on 2023/05/20.
//

import UIKit

class AddAccountModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var contentView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.register(UINib(nibName: "AddAccountModalCell", bundle: nil), forCellReuseIdentifier: "AddAccountModalCell")
        contentView.register(UINib(nibName: "AdsCell", bundle: nil), forCellReuseIdentifier: "AdsCell")
        
        contentView.separatorStyle = .none
        contentView.delegate = self
        contentView.dataSource = self
    }
}

extension AddAccountModalViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.productData.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The last cell is always an ads
        if indexPath.row == DataManager.productData.count {
            let adsInfo = AdsInfo(img: "logo", title: "다른금융계좌 등록하기", exp: "내 모든 계좌를 한눈에", destination: "여기로 뿅")
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdsCell", for: indexPath) as! AdsCell
            cell.configure(info: adsInfo)
            cell.delegate = self
            return cell
        }else {
            let data = DataManager.productData[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccountModalCell", for: indexPath) as! AddAccountModalCell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        }
    }
}

extension AddAccountModalViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension AddAccountModalViewController: AddAccountModalCellDelegate {
    func goToMall(info: ProductInfo) {
        weak var pvc = self.presentingViewController
        
        self.dismiss(animated: true, completion: {
            let vc = TempNextViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.text = "\(info.typeName) 만들러옴"
            pvc?.present(vc, animated: true, completion: nil)
        })
    }
}

extension AddAccountModalViewController: AdsCellDelegate {
    func showAdsDetail() {
        weak var pvc = self.presentingViewController
        self.dismiss(animated: true, completion: {
            let vc = TempNextViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.text = "광고보러옴"
            pvc?.present(vc, animated: true)
        })
    }
}
