//
//  ArticalsListViewController.swift
//  NYTimes
//
//  Created by Mais Assaf on 5/10/23.
//

import UIKit

class ArticalsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var cellDetails = ""
    
    var viewModel = ArticalsListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let articalTableViewCell =  UINib(nibName: ArticalTableViewCell.nibName, bundle: nil)
        self.tableView.register(articalTableViewCell, forCellReuseIdentifier: ArticalTableViewCell.nibName)
        self.viewModel.getAPICall() { success in
            self.tableView.reloadData()
            
        }
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArticalDetailsViewController {
            vc.details = self.cellDetails
        }
    }
}


extension ArticalsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.data?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticalTableViewCell.nibName, for: indexPath) as? ArticalTableViewCell else {
            return ArticalTableViewCell()
        }
        
        var imageString = ""
        let media = viewModel.data?.results[indexPath.row].media
        if media?.count ?? 0 > 0 {
            if  media?[0].mediaMetadata.count ?? 0 > 0 {
                imageString = media?[0].mediaMetadata[0].url ?? ""
            }
        }
        cell.configureCell(articalString: viewModel.data?.results[indexPath.row].title ?? "" , articalInfo: viewModel.data?.results[indexPath.row].abstract ?? "", articalDate: viewModel.data?.results[indexPath.row].publishedDate ?? "", imageURL: imageString)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    self.goToDetails(details: self.viewModel.data?.results[indexPath.row].abstract ?? "")
        cellDetails = self.viewModel.data?.results[indexPath.row].abstract ?? ""
        self.performSegue(withIdentifier: "GoToDetails", sender: self)
    }

}
