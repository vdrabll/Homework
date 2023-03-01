//
//  NetworkingTableViewCell.swift
//  NetworkHomework
//
//  Created by Виктория Федосова on 21.02.2023.
//

import UIKit

class NetworkingTableViewCell: UITableViewCell {
    static var identefire = "NetworkingTableViewCell"
    lazy var beerName: UILabel = {
        var lable = UILabel()
        lable.textColor = .black
        lable.textAlignment = .left
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    lazy var beerImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInterface() {
        self.contentView.addSubview(beerName)
        self.contentView.addSubview(beerImage)
        
        beerName.translatesAutoresizingMaskIntoConstraints = false
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            beerImage.heightAnchor.constraint(equalToConstant: 100),
            beerImage.widthAnchor.constraint(equalToConstant: 100),
            
            beerImage.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            beerImage.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            beerImage.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            beerImage.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor, constant: -250),
            
            beerName.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 20),
            beerName.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -20),
            beerName.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor, constant: 150),
            beerName.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor)
        ])
    }
}
