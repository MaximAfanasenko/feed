
import Foundation
import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {
    @IBOutlet var sourceImage: UIImageView!
    @IBOutlet var sourceName: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var postText: UILabel!
    
    @IBOutlet var likesCount: UILabel!
    @IBOutlet var commentsCount: UILabel!
    @IBOutlet var repostsCount: UILabel!
    @IBOutlet var viewsCount: UILabel!
    
    @IBOutlet var attachmentsCollectionView: DynamicHeightCollectionView!
           
    private let attachmentsCollectionViewSource: AttachmentsCollectionViewSource = AttachmentsCollectionViewSource()    
           
    override func awakeFromNib() {
        super.awakeFromNib()      
        attachmentsCollectionView.dataSource = attachmentsCollectionViewSource        
        attachmentsCollectionView.delegate = attachmentsCollectionViewSource
    }    
    
    public func setup(feedItem: FeedItem, onVideoClicked: ((VideoItem) -> Void)?) {
        sourceImage.kf.setImage(with: URL(string: feedItem.sourceImageUrl))
        
        sourceName.text = feedItem.sourceName
        
        date.text = feedItem.date
        postText.text = feedItem.text
        
        likesCount.text = feedItem.likesCount
        commentsCount.text = feedItem.commentsCount
        repostsCount.text = feedItem.repostsCount
        viewsCount.text = feedItem.viewsCount
        
        attachmentsCollectionViewSource.attachments = feedItem.attachments
        attachmentsCollectionViewSource.onVideoClicked = onVideoClicked
        
        attachmentsCollectionView.reloadData()
        attachmentsCollectionView.layoutIfNeeded()    
    }
}
