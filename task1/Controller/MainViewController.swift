//
//  ViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/08.
//

import UIKit

final class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var contentView: UITableView!
    
    @IBOutlet weak var cView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.register(UINib(nibName: "MainType0Cell", bundle: nil), forCellReuseIdentifier: "type0")
        contentView.register(UINib(nibName: "MainType1Cell", bundle: nil), forCellReuseIdentifier: "type1")
        cView.addSubview(contentView)
        
        contentView.delegate = self
        contentView.dataSource = self
    }
}

// UITableViewDataSource
extension MainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var identifier = indexPath.row == 0 ? "type2" : "type3"
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "type0", for: indexPath) as! MainType0Cell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "type1", for: indexPath) as! MainType1Cell
            return cell
        }
        // cell은 반드시 연결된 UITableViewCell 타입으로 캐스팅되어야 함.
            // TableViewCell(sb)의 Attributes Inspector 내 identifier 값 설정 필수

//        let data = dataArr[indexPath.row] // indexPath.row : data의 index
//
//            //cell을 통해 UITableViewCell의 Outlet 변수에 직접 접근
//        cell.imageViewMain.image = data.image
//        cell.lblName.text = data.name
    }
}

// UITableViewDelegate
extension MainViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
