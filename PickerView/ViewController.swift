//
//  ViewController.swift
//  PickerView
//
//  Created by mac on 21.03.2023.
//

import UIKit

class ViewController: UIViewController {

    var picker: UIPickerView!
    var imageView: UIImageView!
    var label: UILabel!
    
    let univerce = ["Marvel", "DC"]
    let marvel = ["Doctor Strange", "Black Widow", "Groot", "Spider Man", "Thor"]
    let dc = ["Wonder Women", "Batman", "Flash", "Super Man"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = UIPickerView()
        view.addSubview(picker)
        picker.center.x = view.center.x
        picker.center.y = view.center.y + 235
        picker.delegate = self
        picker.dataSource = self
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 120, width: view.frame.width - 50, height: view.frame.height / 2))
        view.addSubview(imageView)
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        setImage(name: "Doctor Strange")
        
        imageView.layer.shadowColor = UIColor.red.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 15
        
        label = UILabel(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 50))
        view.addSubview(label)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 27)
        label.text = "Choice your hero!"
        
        
    }
    
    func setImage(name: String){
        guard let newImage = UIImage(named: name) else {return}
        imageView.image = newImage
    }
    
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return univerce.count
        } else {
            return dc.count > marvel.count ? marvel.count : dc.count
        }
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return univerce[row]
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                return marvel[row]
            } else {
                return dc[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(name: marvel[pickerView.selectedRow(inComponent: 1)])
            } else {
                setImage(name: dc[pickerView.selectedRow(inComponent: 1)])
            }
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(name: marvel[row])
            } else {
                setImage(name: dc[row])
            }
        }
    }
}

