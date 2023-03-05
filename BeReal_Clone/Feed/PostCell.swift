//
//  PostCell.swift
//  BeReal_Clone
//
//  Created by Stephanie Hernandez on 3/3/23.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    private var imageDataRequest: DataRequest?
    
    func configure(with post: Post) {
        // Configure Post Cell
        // Username
        if let user = post.user {
            usernameLabel.text = user.username
        }
        
        // Image
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    print("👍 Was able to get image")
                    self?.postImageView.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
        
        // Caption
        captionLabel.text = post.caption
        
        // Date
        if let date = post.createdAt {
            dateLabel.text = DateFormatter.postFormatter.string(from: date)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Cancel image download
        // Reset image view image.
        postImageView.image = nil

        // Cancel image request.
        imageDataRequest?.cancel()
    }
}
