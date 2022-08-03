import UIKit
import Cosmos

class OnePerRowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgProductPhoto: UIImageView!
    @IBOutlet weak var lblProductTitle: UITextView!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductSale: UILabel!
    @IBOutlet weak var lblShipedAt: UILabel!
    @IBOutlet weak var lblShipedFrom: UILabel!
    @IBOutlet weak var ratingStars: CosmosView!
        
    override func prepareForReuse() {
        ratingStars.prepareForReuse()
    }
    var completionHandler: ((Double)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        ratingStars.didTouchCosmos = { rating in
            
            let rate = self.ratingStars.rating
            switch rate
            {
            case 1:
                self.completionHandler?(1.0)
            case 2:
                self.completionHandler?(2.0)
            case 3:
                self.completionHandler?(3.0)
            case 4:
                self.completionHandler?(4.0)
            case 5:
                self.completionHandler?(5.0)
            default: print("Other...")
            }
        }
    }
    func setupCell(photo:String?, title:String, price:Double, sale:String, shippedAt:String, shipedFrom: String, rating:Double){
        
        if let img = photo {
            imgProductPhoto.image = UIImage(named: img)
        }
        lblProductPrice.text = "\(String(describing: price)) EGP"
        lblProductTitle.text = title
        lblProductSale.text = sale
        lblShipedAt.text = shippedAt
        lblShipedFrom.text = shipedFrom
        ratingStars.rating = rating
        }
}
