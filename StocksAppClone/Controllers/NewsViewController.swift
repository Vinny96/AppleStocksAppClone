//
//  TopStoriesViewController.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import UIKit

class NewsViewController: UIViewController {

    // properties
    private let controllerType : controllerType
    private var shouldShowAddButton : Bool
    
    
    
    
    internal let newsTableView : UITableView = {
        let tableViewToReturn = UITableView()
        // we will need to register a cell once that appropriate cell is made
        // we will need to register a headerview as well
        tableViewToReturn.register(NewsHeaderView.self, forHeaderFooterViewReuseIdentifier: NewsHeaderView.identifier)
        tableViewToReturn.backgroundColor = .clear
        return tableViewToReturn
    }()
    
    
    //MARK: - UI Functions
    private func setupNewsTable()
    {
        view.addSubview(newsTableView)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    
    //MARK: - System Functions
    init(controllerTypeVal: controllerType)
    {
        controllerType = controllerTypeVal
        switch controllerType {
        case .topStories:
            shouldShowAddButton = false
        case .companyStories(_):
            shouldShowAddButton = true
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newsTableView.frame = view.bounds
    }

    //MARK: - News Functions
    internal func fetchNews(companySymbol : String)
    {
        
        
    }
    
    private func open(url : URL)
    {
        
         
    }

}

// MARK: - ENUM
enum controllerType
{
    case topStories
    case companyStories(stockSymbol : String)
    
    var title : String {
        switch self {
        case . topStories:
            return "Top Stories"
        case .companyStories(stockSymbol: let stockSymbol):
            return stockSymbol.uppercased()
        }
    }
}

// MARK: - Extensions
extension NewsViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // this should return the number of rows as indicated by the API call 
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // temporary thing
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // so here we want to open a web browser and run the URL through there as it will be either a top story or a story for a specific stock
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return NewsHeaderView.preferredHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        guard let tableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsHeaderView.identifier) as? NewsHeaderView else {
            return nil
        }
        
        tableViewHeader.configureWithViewModel(with: .init(title: controllerType.title, shouldShowAddButton: shouldShowAddButton))
        return tableViewHeader
    }
    //'must pass a class of kind UITableViewCell' this error is coming up 
}

extension NewsViewController : NewsFetched
{
    func retrievedData(model: NewsResult)
    {
        newsTableView.reloadData()
        // expand more upon this and create cells to display the stories 
    }
    
}
