//
//  ViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/08.
//

import UIKit

final class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var contentView: UITableView!
    @IBOutlet var contentBaseView: UIView!
    
    let cellTypes = ["MainType0Cell", "MainType1Cell", "MainType2Cell", "MainType3Cell"]
    
    var testData: [AccountInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: (tabBarController?.tabBar.frame.size.height ?? 0)+100, right: 0)
        cellTypes.forEach { type in
            contentView.register(UINib(nibName: type, bundle: nil), forCellReuseIdentifier: type)
        }
        contentBaseView.addSubview(contentView)
        contentView.separatorStyle = .none // 셀 사이 구분선 스타일
        
        contentView.delegate = self
        contentView.dataSource = self
        
        testData = DataManager().getAcctInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hide Navigation Bar
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        if !Data.shared.isLogin {
            let loginVC = LoginViewController(nibName: "Login", bundle: nil)
            navigationController?.pushViewController(loginVC, animated: false)
        }else {
            tabBarController?.tabBar.isHidden = false
            if Data.shared.showAds {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    let vc = AdsModalViewController()
                    self.present(vc, animated: true)
                })
            }
        }
    }
}

// UITableViewDataSource
extension MainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = testData[indexPath.row]
        let type = data.type
        if type == .Default {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainType0Cell", for: indexPath) as! MainType0Cell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        }else if type == .Deposit {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainType1Cell", for: indexPath) as! MainType1Cell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        }else if type == .Party {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainType2Cell", for: indexPath) as! MainType2Cell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainType3Cell", for: indexPath) as! MainType3Cell
            cell.configure(data: data)
            cell.delegate = self
            return cell
        }
    }
}

// UITableViewDelegate
extension MainViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: MainTypeCellDelegate {
    func moreButtonClicked(isWithoutTheAcctNum: Bool) {
        let vc = AccountOptionViewController(isWithoutTheAcctNum: isWithoutTheAcctNum)
        present(vc, animated: true)
    }
    
    //temporary function
    func moveButtonClicked(isModal: Bool){
        let vc = TempNextViewController()
        vc.isModal = isModal
        if isModal {
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }else {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
