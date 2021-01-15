
import Foundation

class FeedItem {
    let sourceImageUrl: String
    let sourceName: String
    let date: String
    
    let text: String
    
    let attachments: [AttachmentItem]
    
    let likesCount: String
    let commentsCount: String
    let repostsCount: String
    let viewsCount: String
    
    init(sourceImageUrl: String,
         sourceName: String,
         date: String,
         
         text: String,
         attachments: [AttachmentItem],
         
         likesCount: String,
         commentsCount: String,
         repostsCount: String,
         viewsCount: String) {
        self.sourceImageUrl = sourceImageUrl
        self.sourceName = sourceName
        self.date = date
        
        self.text = text
        self.attachments = attachments
        
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.repostsCount = repostsCount
        self.viewsCount = viewsCount
    }
}
