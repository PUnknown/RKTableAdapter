import UIKit

open class CollectionSection: AdapterSection<CollectionItemConfigurable> {
    // MARK: - Variables
    public var insets: UIEdgeInsets?
    public var minimumInteritemSpacing: CGFloat?
    public var minimumLineSpacing: CGFloat?
    
    public static func == (lhs: CollectionSection, rhs: CollectionSection) -> Bool {
        guard lhs.id == rhs.id else { return false }
        guard lhs.insets == rhs.insets else { return false }
        guard lhs.minimumInteritemSpacing == rhs.minimumInteritemSpacing else { return false }
        guard lhs.minimumLineSpacing == rhs.minimumLineSpacing else { return false }
        
        return true
    }

    public override func equal(object: Any?) -> Bool {
        guard let object = object as? CollectionSection else { return false }
        return self == object
    }
}
