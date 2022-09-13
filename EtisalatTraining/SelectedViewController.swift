import UIKit
import Kingfisher

class SelectedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var product: Product?
    @IBOutlet weak var selectedTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            selectedTableView.delegate = self
            selectedTableView.dataSource = self
        let firstCellNib = UINib(nibName: "Selected1stViewTableViewCell", bundle:  nil)
        selectedTableView.register(firstCellNib, forCellReuseIdentifier: "firstSelectedCell")
        let secondCellNib = UINib(nibName: "Selected2ndViewTableViewCell", bundle:  nil)
        selectedTableView.register(secondCellNib, forCellReuseIdentifier: "secondSelectedCell")
        let thirdCellNib = UINib(nibName: "Selected3rdViewTableViewCell", bundle:  nil)
        selectedTableView.register(thirdCellNib, forCellReuseIdentifier: "thirdSelectedCell")
        
    }
    @IBAction func navBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = selectedTableView.dequeueReusableCell(withIdentifier: "firstSelectedCell", for: indexPath)as! Selected1stViewTableViewCell
            cell.setupFirstCell(product: product!)
            cell.completionHandler = { newRating in
                self.product?.rating = newRating
                self.selectedTableView.reloadData()
            }
            return cell
        }else if indexPath.row == 1{
            let cell = selectedTableView.dequeueReusableCell(withIdentifier: "secondSelectedCell", for: indexPath)as! Selected2ndViewTableViewCell
            cell.setupSecondCell(mainPrice: self.product?.price ?? 0, sale: self.product?.saleNum ?? "", oldPrice: self.product?.oldPrice ?? 0, tax: self.product?.tax ?? "", installment: self.product?.installment ?? "", shippedTo: self.product?.shippedTo ?? "", availability: self.product?.availability ?? "", shippedFromName: self.product?.shippedFrom ?? "", sellerName: self.product?.sellerName ?? "")
            return cell
        }else{
            let cell = selectedTableView.dequeueReusableCell(withIdentifier: "thirdSelectedCell", for: indexPath)as! Selected3rdViewTableViewCell
            cell.setupThirdCell(dimensions: self.product?.dimensions ?? "", color: self.product?.color ?? "", material: self.product?.material ?? "", weight: self.product?.weight ?? "", brand: self.product?.brand ?? "", model: self.product?.model ?? "")
            
            return cell
        }
    }
    
}

