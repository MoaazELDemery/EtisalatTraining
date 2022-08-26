import UIKit

class Selected3rdViewTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblDimensionsKey: UILabel!
    @IBOutlet weak var lblDimensionsValue: UILabel!
    @IBOutlet weak var lblColorKey: UILabel!
    @IBOutlet weak var lblColorValue: UILabel!
    @IBOutlet weak var lblMaterialKey: UILabel!
    @IBOutlet weak var lblMaterialValue: UILabel!
    @IBOutlet weak var lblWeightKey: UILabel!
    @IBOutlet weak var lblWeighValue: UILabel!
    @IBOutlet weak var lblBrandKey: UILabel!
    @IBOutlet weak var lblBrandValue: UILabel!
    @IBOutlet weak var lblModelKey: UILabel!
    @IBOutlet weak var lblModelValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupThirdCell(dimensions:String, color:String, material:String, weight:String, brand:String, model:String){
        lblDimensionsValue.text = dimensions
        lblColorValue.text = color
        lblMaterialValue.text = material
        lblWeighValue.text = weight
        lblBrandValue.text = brand
        lblModelValue.text = model
        
        }
    }
