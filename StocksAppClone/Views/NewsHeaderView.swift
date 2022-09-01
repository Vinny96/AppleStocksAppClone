//
//  NewsHeaderView.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-08-22.
//

import UIKit

class NewsHeaderView: UITableViewHeaderFooterView
{
    static let identifier = "NewsHeaderView"
    static let preferredHeight : CGFloat = 50
    
    
    //MARK: - Properties
    private let newsHeaderLabel : UILabel  = {
        let labelToReturn = UILabel()
        labelToReturn.font = .boldSystemFont(ofSize: 32)
        return labelToReturn
    }()
    
    private let addToWatchListButton : UIButton = {
        let buttonToReturn = UIButton()
        buttonToReturn.backgroundColor = .systemBlue
        buttonToReturn.setTitle("+ Watchlist", for: .normal) // write notes about this
        buttonToReturn.layer.cornerRadius = 8
        buttonToReturn.layer.masksToBounds = true
        return buttonToReturn
    }()
    
    weak internal var newsHeaderViewDelegate : NewsHeaderViewDelegate?
    
    // this viewModel will be used to configure the NewsHeaderView
    struct ViewModel
    {
        let title : String
        let shouldShowAddButton : Bool
        
    }
    
    //MARK: - Initializer
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(viewsToAdd: newsHeaderLabel,addToWatchListButton)
        contentView.backgroundColor = .secondarySystemBackground
        addToWatchListButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError()
    }
    
    
    //MARK: - OBJC Functions
    @objc private func didTapButton()
    {
        // call delgate function here so we are going to implement the delegate function in the NewsViewController
        newsHeaderViewDelegate?.didTapAddButton(headerView: self)
    }
    
    //MARK: - System Called Functions
    override func layoutSubviews() {
        super.layoutSubviews()
        setUPFrames()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsHeaderLabel.text = nil
    }
    
    private func setUPFrames()
    {
        newsHeaderLabel.frame = CGRect(x: 14, y: 0, width: contentView.width - 28 , height: contentView.height)
        addToWatchListButton.sizeToFit()
        addToWatchListButton.frame = CGRect(x: contentView.width - addToWatchListButton.width - 26, y: (contentView.height - addToWatchListButton.height) / 2, width: addToWatchListButton.width + 10, height: addToWatchListButton.height)
    }
    
    //MARK: - Functions
    internal func configureWithViewModel(with viewModel : ViewModel)
    {
        newsHeaderLabel.text = viewModel.title
        addToWatchListButton.isHidden = !viewModel.shouldShowAddButton // this should have a not operator in front of it but for testing purpoes we are going to remove it
    }
    
    
    
}


