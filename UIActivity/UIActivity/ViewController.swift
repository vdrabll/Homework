//
//  ViewController.swift
//  UIActivity
//
//  Created by Виктория Федосова on 13.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var shearButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Поделиться...", for: .normal )
        return button
    }()

    var shearTextField: UITextField = {
        var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "Введите текст"
        return field
    }()
    
    var activityViewController: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupButton() 
        // Do any additional setup after loading the view.
    }
    
    func setupButton() {
        shearButton.addTarget(self, action: #selector(shearData) , for: .touchUpInside)
    }
    
    @objc func shearData(_ sender: Any ) {
        let text = self.shearTextField.text
        
        if text?.isEmpty == true {
            let message = "Сначала введите текст!"
            let alertController = UIAlertController(title: "Ошибка", message: message , preferredStyle: .alert )
            let handler = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(handler)
            self.present(alertController, animated: true )
        }
        self.activityViewController = UIActivityViewController(activityItems: [shearTextField.text ?? nil], applicationActivities: nil)
        self.present(activityViewController!, animated: true)
    }
    
    func setupConstraints() {
        view.addSubview(shearTextField)
        view.addSubview(shearButton)
        shearTextField.delegate = self
        
        NSLayoutConstraint.activate([
            shearTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            shearTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            shearTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            shearTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            shearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
            shearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            shearButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -25),
            shearButton.rightAnchor.constraint(equalTo: view.rightAnchor ),
        ])
    }
}
