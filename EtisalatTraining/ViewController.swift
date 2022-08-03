import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var arrProduct = [Product]()
    var isClicked = true
    let defaults = UserDefaults.standard

    @IBOutlet weak var navBarBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isClicked = defaults.bool(forKey: "isBtnClicked")
        viewOfCell()
        let plistPath = Bundle.main.path(forResource: "Data", ofType: "plist")
        if let plistDataArray = NSArray(contentsOfFile: plistPath!) as? [[String:Any]] {
            for dictionary in plistDataArray {
                let photo = dictionary["photo"] as? String
                let title = dictionary["title"] as? String
                let price = dictionary["price"] as? Double
                let sale = dictionary["sale"] as? String
                let shippedAt = dictionary["shippedAt"] as? String
                let shippedFrom = dictionary["shippedFrom"] as? String
                let rating = dictionary["rating"] as? Double

                arrProduct.append(Product(photo: photo, title: title, price: price, sale: sale, shippedAt: shippedAt, shippedFrom: shippedFrom, rating: rating))
            }
        }
        let oneCellNib = UINib(nibName: "OnePerRowCollectionViewCell", bundle:  nil)
        collectionView.register(oneCellNib, forCellWithReuseIdentifier: "OnePerRowCell")
        let twoCellNib = UINib(nibName: "TwoPerRowCollectionViewCell", bundle:  nil)
        collectionView.register(twoCellNib, forCellWithReuseIdentifier: "TwoPerRowCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @IBAction func navBarBtnAction() {
        viewOfCellisClicked()
        defaults.set(isClicked, forKey: "isBtnClicked")
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProduct.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var retCell : UICollectionViewCell!
        
        if isClicked == true {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnePerRowCell", for: indexPath)as! OnePerRowCollectionViewCell
        
        let product = arrProduct[indexPath.row]
        cell.setupCell(photo: product.photo, title: product.title ?? "", price: product.price ?? 0, sale: product.sale ?? "", shippedAt: product.shippedAt ?? "", shipedFrom: product.shippedFrom ?? "", rating: product.rating ?? 0)
            cell.completionHandler = { newRating in
                        product.rating = newRating
                        collectionView.reloadData()
                    }
            retCell = cell
        }
        if isClicked == false {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoPerRowCell", for: indexPath)as! TwoPerRowCollectionViewCell
            
            let product = arrProduct[indexPath.row]
            cell.setupCell(photo: product.photo, title: product.title ?? "", price: product.price ?? 0, sale: product.sale ?? "", shippedAt: product.shippedAt ?? "", shipedFrom: product.shippedFrom ?? "", rating: product.rating ?? 0)
            cell.completionHandler = { newRating in
                        product.rating = newRating
                        collectionView.reloadData()
                    }
            retCell = cell
        }
        return retCell
    }
    
    func viewOfCell(){
        if isClicked{
            navBarBtn.setImage(UIImage(named: "twoPerRow"), for: .normal)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
            layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.width/1.8)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            collectionView!.collectionViewLayout = layout
        }else{
            navBarBtn.setImage(UIImage(named: "onePerRow"), for: .normal)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            layout.itemSize = CGSize(width: self.view.frame.width/2.2, height: 460)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            collectionView!.collectionViewLayout = layout
        }
    }
    func viewOfCellisClicked(){
        if isClicked {
            isClicked = false
            navBarBtn.setImage(UIImage(named: "onePerRow"), for: .normal)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            layout.itemSize = CGSize(width: self.view.frame.width/2.2, height: 460)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            collectionView!.collectionViewLayout = layout
        }else{
            isClicked = true
            navBarBtn.setImage(UIImage(named: "twoPerRow"), for: .normal)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
            layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.width/1.8)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            collectionView!.collectionViewLayout = layout
        }
    }
}
class Product{
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
