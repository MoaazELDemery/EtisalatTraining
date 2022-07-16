import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProductPhoto: UIImageView!
    @IBOutlet weak var lblProductTitle: UITextView!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductSale: UILabel!
    @IBOutlet weak var lblShipedAt: UILabel!
    @IBOutlet weak var lblShipedFrom: UILabel!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!

     override func prepareForReuse() {
         super.prepareForReuse()
         let image = UIImage(systemName: "star")!
         star1.setImage(image, for: .normal)
         star2.setImage(image, for: .normal)
         star3.setImage(image, for: .normal)
         star4.setImage(image, for: .normal)
         star5.setImage(image, for: .normal)
     }
    
    var completionHandler: ((Double)->Void)?
    
    func setupCell(photo : UIImage?, title : String, price : Double, sale : String, shippedAt : String, shipedFrom : String,rating:Double){
        
        if let img = photo {
            imgProductPhoto.image = img
        }
        lblProductPrice.text = "\(String(describing: price)) EGP"
        lblProductTitle.text = title
        lblProductSale.text = sale
        lblShipedAt.text = shippedAt
        lblShipedFrom.text = shipedFrom
        
        let image = UIImage(systemName: "star")!
        let imageFilled = UIImage(systemName: "star.fill")!
        
        switch rating {
        case 0.0:
            star1.setImage(image, for: .normal)
            star2.setImage(image, for: .normal)
            star3.setImage(image, for: .normal)
            star4.setImage(image, for: .normal)
            star5.setImage(image, for: .normal)
        case 1.0:
            star1.setImage(imageFilled, for: .normal)
        case 2.0:
            star1.setImage(imageFilled, for: .normal)
            star2.setImage(imageFilled, for: .normal)
        case 3.0:
            star1.setImage(imageFilled, for: .normal)
            star2.setImage(imageFilled, for: .normal)
            star3.setImage(imageFilled, for: .normal)
        case 4.0:
            star1.setImage(imageFilled, for: .normal)
            star2.setImage(imageFilled, for: .normal)
            star3.setImage(imageFilled, for: .normal)
            star4.setImage(imageFilled, for: .normal)
        case 5.0:
            star1.setImage(imageFilled, for: .normal)
            star2.setImage(imageFilled, for: .normal)
            star3.setImage(imageFilled, for: .normal)
            star4.setImage(imageFilled, for: .normal)
            star5.setImage(imageFilled, for: .normal)
        default:
            star1.setImage(image, for: .normal)
            star2.setImage(image, for: .normal)
            star3.setImage(image, for: .normal)
            star4.setImage(image, for: .normal)
            star5.setImage(image, for: .normal)
        }
    }
    @IBAction func star1(_ sender: UIButton) {
        let tag = sender.tag
        switch tag
        {
        case 1:
            completionHandler?(1.0)
        case 2:
            completionHandler?(2.0)
        case 3:
            completionHandler?(3.0)
        case 4:
            completionHandler?(4.0)
        case 5:
            completionHandler?(5.0)
        default: print("Other...")
        }
    }
}
