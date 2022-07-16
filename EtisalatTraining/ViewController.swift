import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var arrProduct = [Product]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        arrProduct.append(Product(photo:UIImage(named:"redmiNote11")!, title: "Xiaomi Redmi Note 11,90 Hz Amoled Pioneer, 64 GB, 4GB RAM, Graphite Gray", price: 5594.06, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Monday, July 11", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"redmiNote11")!, title: "Xiaomi Redmi Note 11,90 Hz Amoled Pioneer, 128 GB, 6GB RAM, Graphite Gray", price: 5859.00, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Monday, July 11", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"samsung50")!, title: "Samsung 50 Inch 4K UHD Smart LED TV with Built-in Receiver and Remote Control, Black - UA50AU7000UXEG", price: 8099.00, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Tuesday, July 12", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"redmiNote11")!, title: "Xiaomi Redmi Note 11,90 Hz Amoled Pioneer, 64 GB, 4GB RAM, Graphite Gray", price: 5594.06, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Monday, July 11", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
            
        arrProduct.append(Product(photo:UIImage(named:"LG50")!, title: "LG UHD 4K TV 55 Inch UP75 Series, 4K Active HDR WebOS Smart AI ThinQ (New 2022)", price: 9499.35, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Tuesday, July 12", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"nokia106")!, title: "Nokia 106 Dual SIM- Dark Grey", price: 425.83, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as Monday, July 11", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"samsung43")!, title: "Samsung 43 Inch Full HD Smart LED TV with Built-in Receiver, Black - UA43T5300AUXEG", price: 0, sale: "", shippedAt: "", shippedFrom: "", rating: 0))
        
        arrProduct.append(Product(photo:UIImage(named:"reno6cyan")!, title: "OPPO Reno 6 5G - 6.4-inch 128GB/8GB Dual SIM 5G Mobile Phone - Aurora", price: 10990.00, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it as soon as tomorrow, Jul 8", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0.0))
        
        arrProduct.append(Product(photo:UIImage(named:"samsung43")!, title: "SAMSUNG Galaxy A53 5G Mobile Phone SIM, 256GB, 8GB RAM, White", price: 10500.00, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: " Get it Friday, July 15 - Saturday, July 16", shippedFrom: "EGP 21.00 shipping", rating: 0.0))
        
        arrProduct.append(Product(photo:UIImage(named:"reno6black")!, title: "Reno 6 5G Dual SIM Stellar Black 8GB RAM 128GB", price: 10850.00, sale: "Extra 15% discount with code VISATHURSDAY", shippedAt: "Get it as soon as Monday, July 11", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0.0))
        
        arrProduct.append(Product(photo:UIImage(named:"LG43")!, title: "LG LED Smart TV 43 inch LM6370 Series Full HD HDR Smart LED TV - 43LM6370PVA", price: 6649.00, sale: "", shippedAt: "Get it as soon as Tuesday, July 12", shippedFrom: "Fulfilled by Amazon - FREE Shipping", rating: 0.0))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProduct.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath)as! CollectionViewCell
        
        let product = arrProduct[indexPath.row]
        cell.setupCell(photo: product.photo, title: product.title ?? "", price: product.price ?? 0, sale: product.sale ?? "", shippedAt: product.shippedAt ?? "", shipedFrom: product.shippedFrom ?? "", rating: product.rating ?? 0)
        
        cell.completionHandler = { newRating in
            product.rating = newRating
            collectionView.reloadData()
        }
        return cell
    }
}
class Product{
    var title: String?, sale: String?, shippedAt: String?, shippedFrom: String?
    var photo: UIImage?
    var price: Double?, rating: Double?
    
    init(photo: UIImage?,title: String?,price: Double?,sale: String?,shippedAt: String?,shippedFrom: String?,rating: Double?) {
        self.photo = photo
        self.title = title
        self.price = price
        self.shippedAt = shippedAt
        self.shippedFrom = shippedFrom
        self.sale = sale
        self.rating = rating
    }
}
