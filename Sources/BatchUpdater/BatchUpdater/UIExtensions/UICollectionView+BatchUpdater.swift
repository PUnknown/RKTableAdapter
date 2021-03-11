import UIKit

extension UICollectionView {
    func performBatchUpdates(sectionsChanges: SectionsChanges, rowsChanges: RowsChanges, changedData: [CollectionChangedData], completion: ((Bool) -> Void)?) {
        // https://stackoverflow.com/questions/19199985/invalid-update-invalid-number-of-items-on-uicollectionview/46751421#46751421
        for i in 0..<numberOfSections {
            let _ = numberOfItems(inSection: i)
        }
        performBatchUpdates({
            updateActions(sectionsChanges: sectionsChanges, rowsChanges: rowsChanges, changedData: changedData)
        }, completion: completion)

        reloadItems(at: rowsChanges.updates.map { $0.new })
    }

    // MARK: - Private
    private func updateActions(sectionsChanges: SectionsChanges, rowsChanges: RowsChanges, changedData: [CollectionChangedData]) {
        // sections
        deleteSections(sectionsChanges.deletes)
        insertSections(sectionsChanges.inserts)
        for move in sectionsChanges.moves {
            moveSection(move.from, toSection: move.to)
        }
        reloadSections(sectionsChanges.updates)

        // items
        deleteItems(at: rowsChanges.deletes)
        insertItems(at: rowsChanges.inserts)
        for move in rowsChanges.moves {
            guard !sectionsChanges.deletes.contains(move.from.row) && !sectionsChanges.inserts.contains(move.to.row) else {
                continue
            }
            moveItem(at: move.from, to: move.to)
        }
        
        for changeData in changedData {
            guard let indexCell = indexPathsForVisibleItems.firstIndex(of: changeData.oldIndexPath) else { continue }

            let cell = visibleCells[indexCell]
            changeData.oldRow.cellVM.unbind()
            changeData.newRow.cellVM.unbind()
            changeData.newRow.configure(collectionCell: cell)
            if let cell = cell as? BindingCell & ConfigureCell {
                changeData.newRow.cellVM.bind(view: cell)
            }
        }
    }
}
