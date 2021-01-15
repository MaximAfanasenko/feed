
import Foundation

class SizeDto: Codable {
    let src: String?
    let width, height: Int?
    let type: String?
    let fileSize: Int?
    let url: String

    enum CodingKeys: String, CodingKey {
        case src, width, height, type
        case fileSize = "file_size"
        case url
    }

    init(src: String?, width: Int?, height: Int?, type: String?, fileSize: Int?, url: String) {
        self.src = src
        self.width = width
        self.height = height
        self.type = type
        self.fileSize = fileSize
        self.url = url
    }
}
