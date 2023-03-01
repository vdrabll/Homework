//
//  NetworkingSecondViewController.swift
//  NetworkHomework
//
//  Created by Виктория Федосова on 21.02.2023.
//

import UIKit

class NetworkingSecondViewController: UIViewController {
    
    lazy var beerName: UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Times New Roman", size: 27)
        lable.adjustsFontSizeToFitWidth = true
        lable.textAlignment = .center
        lable.sizeToFit()
        return lable
    }()
    
    lazy var beerImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var beerIngredients: UILabel = {
        var lable = UILabel()
        lable.sizeToFit()
        lable.textAlignment = .left
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 4
        lable.lineBreakMode = NSLineBreakMode.byWordWrapping
        return lable
    }()
    lazy var beerText: UILabel = {
        var lable = UILabel()
        lable.text = "К этому пивку хорошо подойдет: "
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Times New Roman", size: 20)
        lable.textAlignment = .left
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    lazy var beerFoodPairing: UILabel = {
        var lable = UILabel()
        lable.backgroundColor = .white
        lable.textAlignment = .natural
        lable.adjustsFontSizeToFitWidth = true
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.sizeToFit()
        lable.font = UIFont(name: "Times New Roman", size: 20)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInterface()
    }
    
    func setupInterface() {
        view.addSubview(beerName)
        view.addSubview(beerImage)
        view.addSubview(beerIngredients)
        view.addSubview(beerFoodPairing)
        view.addSubview(beerText)

        let constraints = [beerName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -560),
                           beerName.topAnchor.constraint(equalTo: view.topAnchor),
                           beerName.leftAnchor.constraint(equalTo: view.leftAnchor),
                           beerName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
                           
                           beerImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280),
                           beerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
                           beerImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                           beerImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200),
                           
                           beerIngredients.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280),
                           beerIngredients.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
                           beerIngredients.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
                           beerIngredients.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                           
                           beerText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
                           beerText.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
                           beerText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                           beerText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                           
                           beerFoodPairing.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
                           beerFoodPairing.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
                           beerFoodPairing.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                           beerFoodPairing.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
