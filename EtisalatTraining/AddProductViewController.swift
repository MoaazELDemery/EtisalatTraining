import UIKit
import CoreData

class AddProductViewController: UIViewController{

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var products: [ProductData] = []
    var cellCount: Int = 1
    var imagePicker = UIImagePickerController()
    var selectedImg = UIImageView()
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var saleTxtField: UITextField!
    @IBOutlet weak var shippedAtTxtField: UITextField!
    @IBOutlet weak var shippedFromTxtField: UITextField!
    @IBOutlet weak var priceTxtField: UITextField!
    @IBOutlet weak var ratingTxtField: UITextField!
    @IBOutlet weak var brandTxtField: UITextField!
    @IBOutlet weak var salePercentageTxtField: UITextField!
    @IBOutlet weak var oldPriceTxtField: UITextField!
    @IBOutlet weak var sellerTxtField: UITextField!
    @IBOutlet weak var taxTxtField: UITextField!
    @IBOutlet weak var installTxtField: UITextField!
    @IBOutlet weak var availabilityTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var colorTxtField: UITextField!
    @IBOutlet weak var materialTxtField: UITextField!
    @IBOutlet weak var dimentionsTxtField: UITextField!
    @IBOutlet weak var selectPhotoBtn1: UIButton!
    @IBOutlet weak var selectPhotoBtn2: UIButton!
    @IBOutlet weak var selectPhotoBtn3: UIButton!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var photoLbl2: UILabel!
    @IBOutlet weak var photoLbl3: UILabel!
    @IBOutlet weak var addPhotoBtn: UIButton!
    @IBOutlet weak var addProductBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoLbl2.isHidden = true
        photoLbl3.isHidden = true
        selectPhotoBtn3.isHidden = true
        selectPhotoBtn2.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func selectPhotoBtn1Action(_ sender: Any) {
        pickerController()
        selectedImg = imageView1
    }
     
    @IBAction func selectPhotoBtn2Action(_ sender: Any) {
        pickerController()
        selectedImg = imageView2
    }
    @IBAction func selectPhotoBtn3Action(_ sender: Any) {
        pickerController()
        selectedImg = imageView3

    }
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addPhotoBtnAction(_ sender: Any) {
            cellCount += 1
        if cellCount == 2 {
            photoLbl2.isHidden = false
            selectPhotoBtn2.isHidden = false
        }else if cellCount == 3{
            photoLbl3.isHidden = false
            selectPhotoBtn3.isHidden = false
        }
    }
    @IBAction func addProductBtnAction(_ sender: Any) {
        guard let title = titleTxtField.text, title.count > 0 else {
            print("Invalid title")
            let alert = UIAlertController(title: "Error", message: "Please enter Title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel))
            present(alert, animated: true)
            return
        }
        guard let sale = saleTxtField.text else {
            print("Invalid title")
            return
        }
        guard let shippedAt = shippedAtTxtField.text else {
            print("Invalid title")
            return
        }
        guard let shippedFrom = shippedFromTxtField.text else {
            print("Invalid title")
            return
        }
        guard let price = priceTxtField.text, price.count > 0 else {
            print("Invalid title")
            let alert = UIAlertController(title: "Error", message: "Please enter Price", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel))
            present(alert, animated: true)
            return
        }
        guard let rating = ratingTxtField.text, rating.count > 0 else {
            print("Invalid title")
            let alert = UIAlertController(title: "Error", message: "Please enter Rating", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel))
            present(alert, animated: true)
            return
        }
        guard let brand = ratingTxtField.text, brand.count > 0 else {
            print("Invalid title")
            let alert = UIAlertController(title: "Error", message: "Please enter Title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel))
            present(alert, animated: true)
            return
        }
        guard let salePerc = salePercentageTxtField.text else {
            print("Invalid title")
            return
        }
        guard let oldPrice = oldPriceTxtField.text else {
            print("Invalid title")
            return
        }
        guard let seller = sellerTxtField.text else {
            print("Invalid title")
            return
        }
        guard let tax = taxTxtField.text else {
            print("Invalid title")
            return
        }
        guard let installment = installTxtField.text else {
            print("Invalid title")
            return
        }
        guard let availability = availabilityTxtField.text else {
            print("Invalid title")
            return
        }
        guard let weight = weightTxtField.text else {
            print("Invalid title")
            return
        }
        guard let color = colorTxtField.text else {
            print("Invalid title")
            return
        }
        guard let material = materialTxtField.text else {
            print("Invalid title")
            return
        }
        guard let dimensions = dimentionsTxtField.text else {
            print("Invalid title")
            return
        }
        
        
        let photo1 = imageView1.image
        let photo2 = imageView2.image
        let photo3 = imageView3.image
        
        if photo1 == nil {
            let alert = UIAlertController(title: "Error", message: "Please enter Photo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel))
            present(alert, animated: true)
            return
        }
                
        let imageData1: Data? = photo1?.pngData()
        let imageData2: Data? = photo2?.pngData()
        let imageData3: Data? = photo3?.pngData()

        
        let product = AppDelegate.shared.addProduct(photo1: imageData1, photo2: imageData2, photo3: imageData3, title: title, sale: sale, shippedAt: shippedAt, ShippedFrom: shippedFrom, price: price, rating: rating,brand: brand,salePerc: salePerc,oldPrice: oldPrice,seller: seller,tax: tax,installment: installment,availability: availability,weight: weight,color: color,material: material,dimensions: dimensions)
        products.append(product)
        AppDelegate.shared.saveContext()
        
        titleTxtField.text = ""
        saleTxtField.text = ""
        shippedAtTxtField.text = ""
        shippedFromTxtField.text = ""
        priceTxtField.text = ""
        brandTxtField.text = ""
        salePercentageTxtField.text = ""
        oldPriceTxtField.text = ""
        sellerTxtField.text = ""
        taxTxtField.text = ""
        installTxtField.text = ""
        availabilityTxtField.text = ""
        weightTxtField.text = ""
        materialTxtField.text = ""
        dimentionsTxtField.text = ""
        imageView1.image = nil
        imageView2.image = nil
        imageView3.image = nil

        navigationController?.popViewController(animated: true)

    }
    func pickerController(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func toBase64(data: Data?) -> String? {
        guard let newData = data else {
            return ""
        }
        return String(decoding: newData, as: UTF8.self)

    }
}

extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){

        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            selectedImg.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


extension Data {
    func toBase64() -> String? {
        return self.base64EncodedString(options: .lineLength64Characters)
    }
}
