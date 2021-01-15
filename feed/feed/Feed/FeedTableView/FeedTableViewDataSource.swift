
import Foundation
import UIKit

class FeedTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var feedItems: [FeedItem] = [FeedItem]()
    
    public var loadNextPage: (() -> Void)?
    
    public var onVideoClicked: ((VideoItem) -> Void)?
    
    public func addFeetItems(newFeedItems: [FeedItem]) {
        feedItems.append(contentsOf: newFeedItems)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        cell.setup(feedItem: feedItems[indexPath.row], onVideoClicked: onVideoClicked)
        
        if (indexPath.row == feedItems.count - 1) {
            self.loadNextPage?()
        }        
        
        return cell
    }
}
