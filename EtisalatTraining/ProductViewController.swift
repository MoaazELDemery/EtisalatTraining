import UIKit
import Kingfisher
import CoreData

class ProdcutViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var arrProduct = [Product]()
    var isClicked = true
    let defaults = UserDefaults.standard
    var selectedProduct:Product?
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var navBarBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        arrProduct.removeAll()
        getCoreData()
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isClicked = defaults.bool(forKey: "isBtnClicked")
        viewOfCell()

//        getPlistData()
        getCoreData()
        
        let oneCellNib = UINib(nibName: "OnePerRowCollectionViewCell", bundle:  nil)
        collectionView.register(oneCellNib, forCellWithReuseIdentifier: "OnePerRowCell")
        let twoCellNib = UINib(nibName: "TwoPerRowCollectionViewCell", bundle:  nil)
        collectionView.register(twoCellNib, forCellWithReuseIdentifier: "TwoPerRowCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func getCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductData")
        request.returnsObjectsAsFaults = false
        do {
            print("Fetching from DB")
            let result = try context.fetch(request)
            //printing data
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "title") as! String)
                let title = data.value(forKey: "title") as! String
                let sale = data.value(forKey: "sale") as! String
                let shippedAt = data.value(forKey: "shippedAt") as! String
                let shippedFrom = data.value(forKey: "shippedFrom") as! String
                let price = data.value(forKey: "price") as! String
                let rating = data.value(forKey: "rating") as! String
                let photo = data.value(forKey: "photo1") as! Data
                let photo2 = data.value(forKey: "photo2") as? Data
                let photo3 = data.value(forKey: "photo3") as? Data
                let brand = data.value(forKey: "brand") as! String
                let oldPrice = data.value(forKey: "oldPrice") as! String
                let tax = data.value(forKey: "tax") as! String
                let installment = data.value(forKey: "installment") as! String
                let availability = data.value(forKey: "availability") as! String
                let color = data.value(forKey: "color") as! String
                let material = data.value(forKey: "material") as! String
                let dimensions = data.value(forKey: "dimensions") as! String
                let weight = data.value(forKey: "weight") as! String
                let seller = data.value(forKey: "seller") as! String
                let salePerc = data.value(forKey: "salePerc") as! String

                let oldPriceDouble = Double(oldPrice)
                let priceDouble = Double(price)
                let ratingDouble = Double(rating)

                let photoArray:[Data?] = [photo,photo2,photo3]
                arrProduct.append(Product(photo: photo, title: title , price: priceDouble, sale: sale, shippedAt: shippedAt, shippedFrom: shippedFrom, rating: ratingDouble, brand: brand, ratingNum: 10, dimensions: dimensions, color: color, material: material, weight: weight, model: "model", mainPrice: priceDouble, saleNum: salePerc, oldPrice: oldPriceDouble, tax: tax, installment: installment, shippedTo: nil, availability: availability, shippedFromName: shippedFrom, sellerName: seller, photoArray: photoArray))
            }
        } catch {
            print("Failed to fetch")
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
//    func getPlistData() {
//        let plistPath = Bundle.main.path(forResource: "Data", ofType: "plist")
//        if let plistDataArray = NSArray(contentsOfFile: plistPath!) as? [[String:Any]] {
//            for dictionary in plistDataArray {
//                let brand = dictionary["brand"] as? String
//                let title = dictionary["title"] as? String
//                let rating = dictionary["rating"] as? Double
//                let ratingNum = dictionary["ratingNum"] as? Double
//                let photo = dictionary["photo"] as? String
//                let dimensions = dictionary["dimensions"] as? String
//                let color = dictionary["color"] as? String
//                let weight = dictionary["weight"] as? String
//                let model = dictionary["modelNum"] as? String
//                let material = dictionary["material"] as? String
//                let mainPrice = dictionary["price"] as? Double
//                let saleNum = dictionary["sale%"] as? String
//                let oldPrice = dictionary["oldPrice"] as? Double
//                let tax = dictionary["tax"] as? String
//                let installment = dictionary["installment"] as? String
//                let shippedTo = dictionary["shippedTo"] as? String
//                let availability = dictionary["availability"] as? String
//                let spippedFromName = dictionary["spippedFromName"] as? String
//                let sellerName = dictionary["sellerName"] as? String
//                let sale = dictionary["sale"] as? String
//                let shippedAt = dictionary["shippedAt"] as? String
//                let shippedFrom = dictionary["shippedFrom"] as? String
//                let photoArray = dictionary["photoArray"] as? [String]
//
//
//                arrProduct.append(Product(photo: photo, title: title, price: mainPrice, sale: sale, shippedAt: shippedAt, shippedFrom: shippedFrom, rating: rating, brand: brand, ratingNum: ratingNum, dimensions: dimensions, color: color, material: material, weight: weight, model: model, mainPrice: mainPrice, saleNum: saleNum, oldPrice: oldPrice, tax: tax, installment: installment, shippedTo: shippedTo, availability: availability, shippedFromName: spippedFromName, sellerName: sellerName, photoArray: photoArray))
//            }
//        }
//    }
    @IBAction func addBtnAction(_ sender: Any) {
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
