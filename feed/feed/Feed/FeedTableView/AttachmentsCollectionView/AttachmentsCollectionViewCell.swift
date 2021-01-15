
import Foundation
import UIKit
import Kingfisher

class AttachmentsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var attachmentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        attachmentImage.kf.indicatorType = .activity
    }
    
    public func setup(imageUrl: String) {
        attachmentImage.kf.setImage(with: URL(string: imageUrl), options: [.transition(.fade(1)), .cacheOriginalImage, .fromMemoryCacheOrRefresh])
    }   
}
