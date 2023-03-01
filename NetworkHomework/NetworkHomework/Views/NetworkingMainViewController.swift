//
//  ViewController.swift
//  NetworkHomework
//
//  Created by Виктория Федосова on 21.02.2023.
//

import UIKit

class NetworkingMainViewController: UIViewController {
    var service = NetworkingServices()
    var beerInfo = [BeerModelDTO]()
    var beerImages = [UIImage]()
    
    lazy var usersTableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NetworkingTableViewCell.self,
                       forCellReuseIdentifier: NetworkingTableViewCell.identefire)
        table.allowsSelection = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Application started")
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.main.async {
            self.service.getData { data  in
                self.beerInfo = data
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.setupInitialState()
            self.usersTableView.dataSource = self
            self.usersTableView.delegate = self
        }
    }

    func setupInitialState() {
        view.addSubview(usersTableView)
        usersTableView.frame = view.bounds
    }
}

extension NetworkingMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.beerInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = usersTableView.dequeueReusableCell(withIdentifier: NetworkingTableViewCell.identefire,
                                                            for: indexPath) as? NetworkingTableViewCell else {
            let cell = UITableViewCell()
            return cell
        }
        let group = DispatchGroup()
        group.enter()
        self.service.getImage(url: self.beerInfo[indexPath.row].imageURL) { image in
            self.beerImages.append(UIImage(data: image)!)
            group.leave()
        }
        group.notify(queue: .main) {
            cell.beerName.text = self.beerInfo[indexPath.row].name
            DispatchQueue.main.async {
                cell.beerImage.image = self.beerImages[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerDetailedView = NetworkingSecondViewController()
        beerDetailedView.beerName.text = beerInfo[indexPath.row].name
        beerDetailedView.beerImage.image = beerImages[indexPath.row]
        beerDetailedView.beerFoodPairing.text = beerInfo[indexPath.row].foodPairing.joined(separator: "\n")
        beerDetailedView.beerIngredients.text = String("Ингридиенты: \(self.beerInfo[indexPath.row].ingredients.yeast), \(self.beerInfo[indexPath.row].ingredients.hops[indexPath.row].name)")
        present(beerDetailedView, animated: true)
    }
    
}
