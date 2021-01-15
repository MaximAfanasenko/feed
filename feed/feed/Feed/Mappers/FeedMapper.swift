
import Foundation

class FeedMapper {
    
    private static let dateFormat = "DD MMM в HH:mm"
    private static let locale = "ru-RU"
    private static let photoTypeString = "photo"
    private static let videoTypeString = "video"
    
    static func toModel(_ dto:FeedDto) -> [FeedItem] {
        let feedItems = dto.response.items.map { item -> FeedItem in
            let postSource = dto.response.groups.first(where: {$0.id == abs(item.sourceID ?? 0) })
            
            let sourceImageUrl = postSource?.photo100 ?? ""
            let sourceName = postSource?.name ?? ""            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = self.dateFormat
            dateFormatter.locale = Locale.init(identifier: self.locale)
            
            let date = Date(timeIntervalSince1970: TimeInterval(item.date ?? 0))
            
            let dateString = dateFormatter.string(from: date)
            
            let text = item.text ?? ""
            
            let attachments = item.attachments?.filter {$0.type == self.photoTypeString || $0.type == self.videoTypeString} ?? [AttachmentDto]()
            
            let attachmentItems = attachments.compactMap { attachment -> AttachmentItem? in
                
                if (attachment.type == videoTypeString && attachment.video != nil) {
                    let videoItem = VideoItem(imageUrl: attachment.video!.image.url, playerUrl: attachment.video!.player)
                    return AttachmentItem(videoItem: videoItem)
                }
                else if (attachment.type == photoTypeString && attachment.photo != nil) {
                    let photoItem = PhotoItem(imageUrl: attachment.photo!.sizes.last!.url)
                    return AttachmentItem(photoItem: photoItem)
                } else {
                    return nil
                }
            }
            
            let likesCount = String(item.likes?.count ?? 0)
            let commentsCount = String(item.comments?.count ?? 0)
            let repostsCount = String(item.reposts?.count ?? 0)
            let viewsCount = String(item.views?.count ?? 0)
            
            return FeedItem(sourceImageUrl: sourceImageUrl, sourceName: sourceName, date: dateString, text: text, attachments: attachmentItems, likesCount: likesCount, commentsCount: commentsCount, repostsCount: repostsCount, viewsCount: viewsCount)
        }
        
        
        return feedItems
    }
}
