//
//  SearchResultsViewController.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import UIKit

class SearchResultsViewController: UIViewController {

    // MARK: - Properties
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.idenfitifer)
        table.isHidden = true
        //table.backgroundColor = .blue
        return table
    }()
    internal var stockResults = [Stock]()
    internal var selectionDelegate : DidSelectSearchResultCell?
    internal var networkDelegate : NetworkCallComplete?
    
    // MARK: - UI Functions
    private func setTableViewFrame()
    {
        tableView.frame = view.bounds
    }
    
    private func setupTable()
    {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    // MARK: - System Called Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        initializeVC()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTableViewFrame()
    }
    
    
    
    // MARK: - Functions
    private func initializeVC()
    {
        view.backgroundColor = .systemBackground
        networkDelegate = self
    }

}

extension SearchResultsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // here we want to return the number of rows that is equal to the number of results that are our api caller returns
        return stockResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // here we want to create a custom tableViewCell and return it
        let stockToUse = stockResults[indexPath.row]
        let searchResultCell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.idenfitifer, for: indexPath) as! SearchResultTableViewCell
        
        var content = searchResultCell.defaultContentConfiguration()
        content.text = stockToUse.symbol
        content.secondaryText = stockToUse.description
        searchResultCell.contentConfiguration = content
        
        return searchResultCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        // so here what we want to do here is construct the model based off what was selected
        let stockSelected = stockResults[indexPath.row]
        selectionDelegate?.searchResultSelected(model: stockSelected)
    }
}

extension SearchResultsViewController : NetworkCallComplete
{
    func retrievedData(model: StockSearchResult)
    {
        stockResults = model.result
        tableView.isHidden = false
        tableView.reloadData()
    }
}
