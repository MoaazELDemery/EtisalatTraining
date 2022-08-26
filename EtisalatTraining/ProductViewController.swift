import UIKit
import Kingfisher

class ProdcutViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var arrProduct = [Product]()
    var isClicked = true
    let defaults = UserDefaults.standard
    var selectedProduct:Product?
    @IBOutlet weak var navBarBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        isClicked = defaults.bool(forKey: "isBtnClicked")
        viewOfCell()
        let plistPath = Bundle.main.path(forResource: "Data", ofType: "plist")
        if let plistDataArray = NSArray(contentsOfFile: plistPath!) as? [[String:Any]] {
            for dictionary in plistDataArray {
                let brand = dictionary["brand"] as? String
                let title = dictionary["title"] as? String
                let rating = dictionary["rating"] as? Double
                let ratingNum = dictionary["ratingNum"] as? Double
                let photo = dictionary["photo"] as? String
                let dimensions = dictionary["dimensions"] as? String
                let color = dictionary["color"] as? String
                let weight = dictionary["weight"] as? String
                let model = dictionary["modelNum"] as? String
                let material = dictionary["material"] as? String
                let mainPrice = dictionary["price"] as? Double
                let saleNum = dictionary["sale%"] as? String
                let oldPrice = dictionary["oldPrice"] as? Double
                let tax = dictionary["tax"] as? String
                let installment = dictionary["installment"] as? String
                let shippedTo = dictionary["shippedTo"] as? String
                let availability = dictionary["availability"] as? String
                let spippedFromName = dictionary["spippedFromName"] as? String
                let sellerName = dictionary["sellerName"] as? String
                let sale = dictionary["sale"] as? String
                let shippedAt = dictionary["shippedAt"] as? String
                let shippedFrom = dictionary["shippedFrom"] as? String
                let photoArray = dictionary["photoArray"] as? [String]
                
                
                arrProduct.append(Product(photo: photo, title: title, price: mainPrice, sale: sale, shippedAt: shippedAt, shippedFrom: shippedFrom, rating: rating, brand: brand, ratingNum: ratingNum, dimensions: dimensions, color: color, material: material, weight: weight, model: model, mainPrice: mainPrice, saleNum: saleNum, oldPrice: oldPrice, tax: tax, installment: installment, shippedTo: shippedTo, availability: availability, shippedFromName: spippedFromName, sellerName: sellerName, photoArray: photoArray))
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "SelectedView") as! SelectedViewController
        destination.product = self.arrProduct[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "home") {
            if let vc = segue.destination as? SelectedViewController {
                    vc.product = selectedProduct
                }
            }
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
