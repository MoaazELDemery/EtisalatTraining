import UIKit

class FavouritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arrProduct = [Product]()
    @IBOutlet weak var favTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        if var productsData = UserDefaults.standard.data(forKey: "FavoritProducts"){
            do {
            let decoder = JSONDecoder()
            var products = try decoder.decode([Product].self, from: productsData)
            arrProduct = products
            } catch {
                print("Unable to Encode Note (\(error))")
            }
        }
        favTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let favCellNib = UINib(nibName: "FavoritesProductTableViewCell", bundle:  nil)
        favTableView.register(favCellNib, forCellReuseIdentifier: "favCell")
        favTableView.delegate = self
        favTableView.dataSource = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)as! FavoritesProductTableViewCell
        let product = arrProduct[indexPath.row]
        cell.setupFavCell(photo: product.photo, title: product.title ?? "", price: product.price ?? 0, sale: product.sale ?? "", shippedAt: product.shippedAt ?? "", shipedFrom: product.shippedFrom ?? "", rating: product.rating ?? 0)
        cell.completionHandler = { newRating in
            product.rating = newRating
            self.favTableView.reloadData()
        }
        return cell
        }
    }
class FProduct{
    var title: String?, sale: String?, shippedAt: String?, shippedFrom: String?, photo: String?
    var price: Double?, rating: Double?
    
    init(photo: String?,title: String?,price: Double?,sale: String?,shippedAt: String?,shippedFrom: String?,rating:Double?) {
        self.photo = photo
        self.title = title
        self.price = price
        self.shippedAt = shippedAt
        self.shippedFrom = shippedFrom
        self.sale = sale
        self.rating = rating
    }
}
