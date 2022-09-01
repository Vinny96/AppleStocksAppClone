//
//  ViewController.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import UIKit
import FloatingPanel


class WatchListViewController: UIViewController {

    //MARK: - Properties
    private let dateFormatterHandler = DateFormatterHandler.shared
    private var searchTimer : Timer?
    private var floatingPanel : FloatingPanelController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
        setupSearchController()
        setupFloatingPanel()
        setupTitleView()
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
        dateTitleLabel.text = dateFormatterHandler.GetCurrentDateAsString()
        dateTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        dateTitleLabel.textColor = .systemGray
        
        let titleStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        titleStackView.addArrangedSubview(stockTitleLabel)
        titleStackView.addArrangedSubview(dateTitleLabel)
        titleStackView.distribution = .fillEqually
        titleStackView.alignment = .leading
        titleStackView.axis = .vertical
    
        navigationItem.titleView = titleStackView
    }
    
    private func setupFloatingPanel()
    {
        let contentVC = NewsViewController(controllerTypeVal: .topStories)
        let panel = FloatingPanelController()
        panel.delegate = self
        panel.contentViewController = contentVC
        panel.surfaceView.backgroundColor = .secondarySystemBackground
        panel.addPanel(toParent: self)
        panel.track(scrollView: contentVC.newsTableView)
    }
    
    
    // MARK: - Functions
    func initializeVC()
    {
        view.backgroundColor = .systemBackground
    }
    
    func setupSearchController()
    {
        let searchResultsVC = SearchResultsViewController()
        searchResultsVC.selectionDelegate = self
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
        // now that we have the safeQuery we can call our request function from our NetworkManager and use those results to update these results
        // we want to call the api
        // we want to optimize the API calls so the API is not called with every keystroke COMPLETED
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            NetworkManager.shared.search(query: safeQuery) { results in
                switch results
                {
                case .success(let stockSearchResult):
                    DispatchQueue.main.async {
                        resultsVC.networkDelegate?.retrievedData(model: stockSearchResult)
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Error", message: "Unable to get stock for ticker symbol", preferredStyle: .alert)
                        let actionButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alertController.addAction(actionButton)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

extension WatchListViewController : DidSelectSearchResultCell
{
    func searchResultSelected(model: Stock)
    {
        print(model)
        let stockDetailVC = StockDetailsViewController()
        let navVC = UINavigationController(rootViewController: stockDetailVC)
        stockDetailVC.title = model.description
        present(navVC, animated: true, completion: nil)
    }
}


extension WatchListViewController : FloatingPanelControllerDelegate
{
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController)
    {
        navigationItem.titleView?.isHidden = fpc.state == .full
    }
}
