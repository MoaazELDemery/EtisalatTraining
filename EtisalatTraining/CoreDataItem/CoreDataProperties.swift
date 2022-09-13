import Foundation
import CoreData
import UIKit


extension ProductData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "ProductData")
    }
    @NSManaged public var title: String
    @NSManaged public var photo1: Data?
    @NSManaged public var photo2: Data?
    @NSManaged public var photo3: Data?
    @NSManaged public var price: String
    @NSManaged public var sale: String
    @NSManaged public var shippedAt: String
    @NSManaged public var shippedFrom: String
    @NSManaged public var rating: String
    @NSManaged public var brand: String
    @NSManaged public var salePerc: String
    @NSManaged public var oldPrice: String
    @NSManaged public var seller: String
    @NSManaged public var tax: String
    @NSManaged public var installment: String
    @NSManaged public var availability: String
    @NSManaged public var weight: String
    @NSManaged public var color: String
    @NSManaged public var material: String
    @NSManaged public var dimensions: String
}

extension ProductData : Identifiable {

}
