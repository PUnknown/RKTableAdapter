import UIKit

struct ChangedData {
    let oldRow: TableRowConfigurable
    let oldIndexPath: IndexPath
    let newRow: TableRowConfigurable
    let newIndexPath: IndexPath
}

struct CollectionChangedData {
    let oldRow: CollectionItemConfigurable
    let oldIndexPath: IndexPath
    let newRow: CollectionItemConfigurable
    let newIndexPath: IndexPath
}
