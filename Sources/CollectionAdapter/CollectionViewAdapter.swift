import Foundation
import UIKit

open class CollectionViewAdapter {
    // MARK: - Properties
    private var _list: CollectionList = CollectionList()
    private var cachedList: CollectionList?
    private var isUpdating: Bool = false
    private var completion: (() -> Void)?
    /// Описание данных таблицы
    public var list: CollectionList { return _list }

    private var collectionViewDelegate: CollectionViewAdapterDelegate!

    private let batchUpdater = BatchUpdater()

    // MARK: - Callbacks
    /// Обработка методов таблицы
    public let callbacks: CollectionAdapterCallbacks = CollectionAdapterCallbacks()

    /// Обработка методов scrollView
    public let scrollViewCallbacks: AdapterScrollViewCallbacks = AdapterScrollViewCallbacks()

    // MARK: - Dependencies
    public var collectionView: UICollectionView

    // MARK: - LifeCycle
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView

        self.collectionViewDelegate = CollectionViewAdapterDelegate(holder: self)
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDelegate
    }

    // MARK: - Private
    fileprivate func registerCells(sections: [CollectionSection]) {
        for section in sections {
            for row in section.rows {
                collectionView.register(row.cellType, forCellWithReuseIdentifier: row.reuseId)
            }
        }
    }
    
    fileprivate func reloadCachedList() {
        if let cachedList = self.cachedList {
            reload(with: cachedList)
            self.cachedList = nil
        } else {
            isUpdating = false
            callbacks.reloadCompletion?()
        }
    }

    // MARK: - Reload
    public func reload(with collectionList: CollectionList? = nil) {
        guard !isUpdating else {
            cachedList = collectionList
            return
        }
        
        isUpdating = true
        registerCells(sections: collectionList?.sections ?? [])
        
        let oldList = self._list
        
        if let list = collectionList {
            self._list = list
        } else {
            self._list = CollectionList()
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let sself = self else { return }
            
            if oldList.sections.isEmpty || sself._list.sections.isEmpty {
                sself.collectionView.reloadData()
                sself.isUpdating = false
                sself.reloadCachedList()
            } else {
                sself.batchUpdater.batchUpdate(
                  collectionView: sself.collectionView,
                  oldSections: oldList.sections,
                  newSections: sself.list.sections) { [weak self] _ in
                    guard let sself = self else { return }
                    
                    sself.isUpdating = false
                    sself.reloadCachedList()
                }
            }
        }
    }
}
