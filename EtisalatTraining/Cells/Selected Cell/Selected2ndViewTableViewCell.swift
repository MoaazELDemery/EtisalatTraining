import UIKit

class Selected2ndViewTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMainPrice: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var lblOldPrice: UILabel!
    @IBOutlet weak var lblIncludeTax: UILabel!
    @IBOutlet weak var lblInstallmentOptions: UILabel!
    @IBOutlet weak var btnShippedTo: UIButton!
    @IBOutlet weak var lblShippedTo: UILabel!
    @IBOutlet weak var lblAvailability: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var btnBuyNow: UIButton!
    @IBOutlet weak var lblShippedFrom: UIView!
    @IBOutlet weak var lblShippedFromeName: UILabel!
    @IBOutlet weak var lblSeller: UILabel!
    @IBOutlet weak var lblSellerName: UILabel!
    @IBOutlet weak var btnAddToList: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var btnShippedToAction: UIStackView!
    @IBAction func btnAddToCartAction(_ sender: Any) {
    }
    @IBAction func btnBuyNowAction(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupSecondCell(mainPrice:Double, sale:String, oldPrice:Double, tax:String, installment:String, shippedTo:String, availability:String, shippedFromName:String, sellerName:String){
        
        lblMainPrice.text = "\(String(describing: mainPrice))"
        lblSale.text = sale
        lblOldPrice.text = "\(String(describing: oldPrice))"
        lblIncludeTax.text = tax
        lblInstallmentOptions.text = installment
        lblShippedTo.text = shippedTo
        lblAvailability.text = availability
        lblShippedFromeName.text = shippedFromName
        lblSellerName.text = sellerName
        }
    
}
