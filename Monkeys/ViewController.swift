//
//  ViewController.swift
//  Monkeys
//
//  Created by Admin on 22.06.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectedMonkeyTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var monkeysList: [(String, String)] = [
        ("Мартышки", "Африка"),
        ("Горилла", "Америка"),
        ("Бабуин", "Азия"),
        ("Шимпанзе", "Америка"),
        ("Капуцин", "Америка"),
        ("Король Джулиан", "Африка"),
        ("Моррис", "Азия"),
        ("Морт", "Африка"),
        ("Орангутанг", "Америка")
    ]
    let picker = UIPickerView()
    
    func toolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let done = UIBarButtonItem(title: "Done",
                                   style: .done,
                                   target: self,
                                   action: #selector(selectItem))
        toolbar.setItems([done], animated: false)
        return toolbar
    }
    
    @objc func selectItem() {
        selectedMonkeyTextField.text = "\(picker.selectedRow(inComponent: 0) + 1) " + monkeysList[picker.selectedRow(inComponent: 1)].0
        selectedMonkeyTextField.resignFirstResponder() // Скрыть текст филд
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        picker.delegate = self
        picker.dataSource = self
        selectedMonkeyTextField.inputView = picker
        selectedMonkeyTextField.inputAccessoryView = toolbar()
        // Делаем констрейнт в ручную
//        view.addSubview(picker)
//
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        picker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        picker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        picker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        picker.alpha = 0
        
    }

    }
    

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 10
        case 1:
            return monkeysList.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row + 1)"
        case 1:
            return monkeysList[row].0
        default:
            return ""
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monkeysList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MonkeyTableViewCell
        cell?.monkeyNameLabel.text = monkeysList[indexPath.row].0
        cell?.monkeyArealLabel.text = monkeysList[indexPath.row].1
        return cell ?? UITableViewCell()
    }
    
    
}
