
import Foundation
import UIKit

class AttachmentsCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public var attachments: [AttachmentItem] = [AttachmentItem]()
    
    public var onVideoClicked: ((VideoItem) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attachments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttachmentsCollectionViewCell", for: indexPath) as! AttachmentsCollectionViewCell
        cell.setup(imageUrl: attachments[indexPath.row].photoItem!.imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let videoItem = attachments[indexPath.row].videoItem
        
        if (videoItem != nil) {
            self.onVideoClicked?(videoItem!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.item == 0 {
            width = UIScreen.main.bounds.width
            height = UIScreen.main.bounds.width
        } else {
            width = UIScreen.main.bounds.width / 2
            height = UIScreen.main.bounds.width / 2
        }
        
        return CGSize(width:width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
