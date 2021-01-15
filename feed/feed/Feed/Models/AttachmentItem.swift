
import Foundation

class AttachmentItem {
    let photoItem: PhotoItem?
    let videoItem: VideoItem?
    
    init(photoItem: PhotoItem? = nil, videoItem: VideoItem? = nil) {
        self.photoItem = photoItem
        self.videoItem = videoItem
    }
}
