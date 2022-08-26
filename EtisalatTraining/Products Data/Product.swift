import Foundation

class Product: NSObject, Codable{
    var title: String?
    var sale: String?
    var shippedAt: String?
    var shippedFrom: String?
    var photo: String?
    var price: Double?, rating: Double?
    var brand: String?
    var ratingNum: Double?
    var dimensions: String?
    var color: String?
    var material: String?
    var weight: String?
    var model: String?
    var mainPrice: Double?
    var saleNum: String?
    var oldPrice: Double?
    var tax: String?
    var installment: String?
    var shippedTo: String?
    var availability: String?
    var shippedFromName: String?
    var sellerName: String?
    var isFav = false
    var photoArray: [String]?
    
    init(photo: String?, title: String?, price: Double?, sale: String?, shippedAt: String?, shippedFrom: String?, rating:Double?, brand: String?, ratingNum:Double?, dimensions: String?, color: String?, material: String?, weight: String?, model: String?, mainPrice: Double?, saleNum: String?, oldPrice: Double?, tax: String?, installment: String?, shippedTo: String?, availability: String?, shippedFromName: String?, sellerName: String?,photoArray: [String]?) {
        self.photo = photo
        self.title = title
        self.price = price
        self.shippedAt = shippedAt
        self.shippedFrom = shippedFrom
        self.sale = sale
        self.rating = rating
        self.brand = brand
        self.ratingNum = ratingNum
        self.rating = rating
        self.dimensions = dimensions
        self.color = color
        self.material = material
        self.weight = weight
        self.model = model
        self.mainPrice = mainPrice
        self.saleNum = saleNum
        self.oldPrice = oldPrice
        self.tax = tax
        self.installment = installment
        self.shippedTo = shippedTo
        self.availability = availability
        self.shippedFromName = shippedFromName
        self.sellerName = sellerName
        self.photoArray = photoArray

    }
}
