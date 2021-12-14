//
//  ViewController.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/10.
//

import UIKit

struct MainModel {
    var title: String = ""
    
    var identifier: String = ""
}

class ViewController: UIViewController {
    private lazy var ageTableView: AGETableView = {
        let view = AGETableView(frame: .zero, style: .grouped)
        view.estimatedRowHeight = 100
        view.delegate = self
        view.register(LabelCell.self,
                      forCellWithReuseIdentifier: LabelCell.description())
        view.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.description())
        view.register(ToastViewCell.self, forCellWithReuseIdentifier: ToastViewCell.description())
        view.register(OtherViewCell.self, forCellWithReuseIdentifier: OtherViewCell.description())
        view.register(SliderCell.self, forCellWithReuseIdentifier: SliderCell.description())
        view.register(TextFiledCell.self, forCellWithReuseIdentifier: TextFiledCell.description())
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        ageTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageTableView)
        ageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ageTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        ageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        createData()
    }
    private func createData() {
        var dataArray = [MainModel]()
        for i in 0..<6 {
            switch i {
            case 0:
                let model = MainModel(title: "Label",
                                      identifier: LabelCell.description())
                dataArray.append(model)
            
            case 1:
                let model = MainModel(title: "Button", identifier: ButtonCell.description())
                dataArray.append(model)
                
            case 2:
                let model = MainModel(title: "Toast", identifier: ToastViewCell.description())
                dataArray.append(model)
                
            case 3:
                let model = MainModel(title: "Slider", identifier: SliderCell.description())
                dataArray.append(model)
                
            case 4:
                let model = MainModel(title: "TextField", identifier: TextFiledCell.description())
                dataArray.append(model)
                
            case 5:
                let model = MainModel(title: "Other", identifier: OtherViewCell.description())
                dataArray.append(model)
                
            default: break
            }
        }
        ageTableView.dataArray = dataArray
    }
}

extension ViewController: AGETableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = ageTableView.dataArray?[indexPath.section] as? MainModel
        let cell = tableView.dequeueReusableCell(withIdentifier: model?.identifier ?? "",
                                                 for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = ageTableView.dataArray?[section] as? MainModel
        return model?.title
    }
}
