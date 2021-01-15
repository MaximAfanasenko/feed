
import Foundation

class ItemDto: Codable {
    let sourceID: Int?
    let date: Int?
    let postType: String?
    let text: String?
    let attachments: [AttachmentDto]?
    let comments: CommentsDto?
    let likes: LikesDto?
    let reposts: RepostsDto?
    let views: ViewsDto?
    let postID: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case postType = "post_type"
        case text
        case attachments
        case comments
        case likes
        case reposts
        case views
        case postID = "post_id"
        case type
    }
    

    init(sourceID: Int?, date: Int?, postType: String?, text: String?, attachments: [AttachmentDto]?, comments: CommentsDto?, likes: LikesDto?, reposts: RepostsDto?, views: ViewsDto?, postID: Int?, type: String?) {
        
        self.sourceID = sourceID
        self.date = date
        self.postType = postType
        self.text = text
        self.attachments = attachments
        self.comments = comments
        self.likes = likes
        self.reposts = reposts
        self.views = views
        self.postID = postID
        self.type = type
    }
}
