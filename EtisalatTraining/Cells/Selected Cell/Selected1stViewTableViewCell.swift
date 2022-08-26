import UIKit
import Cosmos
import Kingfisher

class Selected1stViewTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
        
    var isClicked = true
    var selectedDefaults = UserDefaults.standard
    var cellProduct: Product?
    var arrPhotos = [String]()
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var ratingStars: CosmosView!
    @IBOutlet weak var lblRatingNum: UILabel!
    @IBOutlet weak var lblProductTitle: UITextView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var indicatorForImages: UIPageControl!
    @IBOutlet weak var imageColView: UICollectionView!
    
    override func prepareForReuse() {
        ratingStars.prepareForReuse()
    }
    var completionHandler: ((Double)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageViewNib = UINib(nibName: "ImageViewCollectionViewCell", bundle:  nil)
        imageColView.register(imageViewNib, forCellWithReuseIdentifier: "imageViewCell")

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.imageColView.frame.width , height: self.imageColView.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal

        imageColView!.collectionViewLayout = layout
        
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
        imageColView.delegate = self
        imageColView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        indicatorForImages.numberOfPages = arrPhotos.count
        return arrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageColView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)as! ImageViewCollectionViewCell
        let photoUrl = arrPhotos[indexPath.row]
        guard let imageURL = URL(string: photoUrl) else { return cell }
        cell.imgProductArray.kf.setImage(with: imageURL)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        indicatorForImages?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    func setupFirstCell(product:Product){
        cellProduct = product
        lblBrand.text = cellProduct?.brand
        ratingStars.rating = cellProduct?.rating ?? 0
        lblProductTitle.text = cellProduct?.title
        lblRatingNum.text = "\(String(describing: cellProduct!.ratingNum!))"
        if let arrayOfImage = cellProduct?.photoArray, arrayOfImage.count > 0  {
            arrPhotos = arrayOfImage

        }
        if cellProduct?.isFav == true {
            btnFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            btnFav.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    @IBAction func btnFavAction(_ sender: Any){
        
        if cellProduct?.isFav == false {
            cellProduct?.isFav = true
            btnFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            if var productsData = UserDefaults.standard.data(forKey: "FavoritProducts"){
                do {
                let decoder = JSONDecoder()
                var products = try decoder.decode([Product].self, from: productsData)
                    products.append(cellProduct!)
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(products)
                    UserDefaults.standard.set(data, forKey: "FavoritProducts")
                } catch {
                    print("Unable to Encode Note (\(error))")
                }
            } else {
                var arrSelectedProduct = [Product]()
                arrSelectedProduct.append(cellProduct!)
                do {
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(arrSelectedProduct)
                    UserDefaults.standard.set(data, forKey: "FavoritProducts")
                } catch {
                    print("Unable to Encode Note (\(error))")
                }
            }
        }else{
            cellProduct?.isFav = false
            btnFav.setImage(UIImage(systemName: "heart"), for: .normal)
            if var productsData = UserDefaults.standard.data(forKey: "FavoritProducts"){
                do {
                let decoder = JSONDecoder()
                var products = try decoder.decode([Product].self, from: productsData)
                    for (index,prod) in products.enumerated() {
                        if prod.title == cellProduct?.title {
                            products.remove(at: index)
                        }
                    }
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(products)
                    UserDefaults.standard.set(data, forKey: "FavoritProducts")
                } catch {
                    print("Unable to Encode Note (\(error))")
                }
            }
        }
    }
    @IBAction func btnShareAction(_ sender: Any) {
    }
    
    @IBAction func indicatorForImagesAction(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
