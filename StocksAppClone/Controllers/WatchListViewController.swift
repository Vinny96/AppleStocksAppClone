//
//  ViewController.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import UIKit

class WatchListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleView()
        initializeVC()
        setupSearchController()
    }
    
    //MARK: - UI Variables
    
    

    // MARK: - UI Functions
    private func setupTitleView()
    {
        
        let stockTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        stockTitleLabel.textAlignment = .left
        stockTitleLabel.text = "Stocks"
        stockTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        
        let dateTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        dateTitleLabel.textAlignment = .left
        dateTitleLabel.text = "DATE"
        dateTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        dateTitleLabel.textColor = .systemGray
        
        let titleStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        titleStackView.addArrangedSubview(stockTitleLabel)
        titleStackView.addArrangedSubview(dateTitleLabel)
        titleStackView.distribution = .fillEqually
        titleStackView.alignment = .leading
        titleStackView.axis = .vertical
    
        navigationItem.titleView = titleStackView
        
        // we need to get the DATE to display the actual date and this will be done via a DateFormatter
    }
    
    
    // MARK: - Functions
    func initializeVC()
    {
        view.backgroundColor = .systemBackground
    }
    
    func setupSearchController()
    {
        let searchResultsVC = SearchResultsViewController()
        let searchVC = UISearchController(searchResultsController: searchResultsVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
        
    }
    
}

// MARK: - Extensions
extension WatchListViewController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        guard let safeQuery = searchController.searchBar.text, !safeQuery.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        guard let resultsVC = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        // now that we have the safeQuery we can call our request function from out NetworkManager and use those results to update these results
        
        // we want to call the api
        
        
        // we want to optimize the API calls so the API is not called with every keystroke
        
        // we want to update the searchResultsViewController
        print(safeQuery)
    }
    
    
    
    
    
}
