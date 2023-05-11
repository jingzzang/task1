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
    
    var data = [1,2,3,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        contentView.register(UINib(nibName: "MainType0Cell", bundle: nil), forCellReuseIdentifier: "type0")
        contentView.register(UINib(nibName: "MainType1Cell", bundle: nil), forCellReuseIdentifier: "type1")
        contentView.register(UINib(nibName: "MainType2Cell", bundle: nil), forCellReuseIdentifier: "type2")
        contentView.register(UINib(nibName: "MainType3Cell", bundle: nil), forCellReuseIdentifier: "type3")
        contentBaseView.addSubview(contentView)
        contentView.separatorStyle = .none // 셀 사이 구분선 스타일
        
        contentView.delegate = self
        contentView.dataSource = self
    }
}

// UITableViewDataSource
extension MainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = data[indexPath.row]
        if idx == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "type0", for: indexPath) as! MainType0Cell
        }else if idx == 1 {
            return tableView.dequeueReusableCell(withIdentifier: "type1", for: indexPath) as! MainType1Cell
        }else if idx == 2 {
            return tableView.dequeueReusableCell(withIdentifier: "type2", for: indexPath) as! MainType2Cell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: "type3", for: indexPath) as! MainType3Cell
        }
    }
}

// UITableViewDelegate
extension MainViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
