
import Foundation

class AttachmentDto: Codable {
    let type: String
    let photo: PhotoDto?
    let video: VideoDto?

    init(type: String, photo: PhotoDto?, video: VideoDto?) {
        self.type = type
        self.photo = photo
        self.video = video
    }
}
