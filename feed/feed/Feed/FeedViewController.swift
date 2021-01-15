
import UIKit
import Alamofire
import Foundation
import Kingfisher

class FeedViewController: UIViewController {
    
    @IBOutlet var feedTableView: UITableView!       
    
    private let navigationItemTitle = "Лента"
    
    private let navBarColor = UIColor(red: 0.236, green: 0.36, blue: 1, alpha: 1)
    
    private let feedTableViewDataSource: FeedTableViewDataSource = FeedTableViewDataSource()
    
    private let tokenCacheService: TokenCacheService
    private let feedService: FeedService
    
    init?(coder: NSCoder, tokenCacheService: TokenCacheService, feedService: FeedService) {
        self.tokenCacheService = tokenCacheService
        self.feedService = feedService
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with an TokenCacheService and FeedService.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableViewDataSource.loadNextPage = self.loadNextPage
        feedTableViewDataSource.onVideoClicked = self.openVideoPlayerLink
        
        self.feedTableView.dataSource = feedTableViewDataSource
        self.feedTableView.delegate = feedTableViewDataSource              
        self.feedTableView.estimatedRowHeight = 300
        self.feedTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = navBarColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)        
        navigationItem.title = self.navigationItemTitle
        navigationItem.hidesBackButton = true;
        
        loadNextPage()
    }
    
    private func loadNextPage() {
        let accessToken = tokenCacheService.getToken()
        if (accessToken != nil) {
            feedService.getFeed(accessToken: accessToken!, completion: updateFeedTableView)
        }
    }
    
    private func updateFeedTableView(feedItems: [FeedItem]) {
        self.feedTableViewDataSource.addFeetItems(newFeedItems: feedItems)
        self.feedTableView.reloadData()
        self.feedTableView.layoutIfNeeded()
    }
    
    private func openVideoPlayerLink(videoItem: VideoItem) {
        guard let url = URL(string: videoItem.playerUrl) else { return }
        UIApplication.shared.open(url)
    }
}
