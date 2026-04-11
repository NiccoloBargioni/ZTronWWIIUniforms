import SwiftUI
import SwiftUIIntrospect

internal extension View {
    /// Properly disables List scrolling across all iOS versions, accounting for:
    /// - iOS 15: UITableView (no .scrollDisabled available) - uses KVO
    /// - iOS 16: UICollectionView + .scrollDisabled - uses KVO
    /// - iOS 17+: Uses onGeometryChange (preferred, native SwiftUI)
    /// Also ensures proper content sizing when scroll is disabled
    @ViewBuilder
    func disableListScroll() -> some View {
        if #available(iOS 17, *) {
            self
                .scrollDisabled(true)
                .introspect(.list, on: .iOS(.v17, .v18, .v26)) { scrollView in
                    // Just disable scrolling, let SwiftUI handle sizing via layout system
                    if let collectionView = scrollView as? UICollectionView {
                        collectionView.isScrollEnabled = false
                        collectionView.bounces = false
                        collectionView.alwaysBounceVertical = false
                    }
                }
                // Force SwiftUI to invalidate layout when content size changes
                // This ensures the parent's .frameGetter() picks up new dimensions
                .onGeometryChange(for: CGSize.self) { proxy in
                    proxy.size
                } action: { newSize in
                    // The size change triggers SwiftUI's layout pass
                    // Parent views with .frameGetter() will detect this change
                }
        } else if #available(iOS 16, *) {
            // iOS 16: Use KVO fallback for UICollectionView
            self
                .scrollDisabled(true)
                .introspect(.list, on: .iOS(.v16)) { collectionView in
                    configureNonScrollableCollectionView(collectionView)
                }
        } else {
            // iOS 15: Use KVO fallback for UITableView
            self
                .introspect(.list, on: .iOS(.v15)) { tableView in
                    configureNonScrollableTableView(tableView)
                }
        }
    }
    
    private func configureNonScrollableCollectionView(_ collectionView: UICollectionView) {
        // Disable scrolling
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.alwaysBounceVertical = false
        
        // Remove existing observer to avoid duplicates
        collectionView.removeObserver(forKeyPath: "contentSize")
        
        // Observe contentSize changes for dynamic updates (rotation, content changes)
        collectionView.observeContentSize { newContentSize in
            DispatchQueue.main.async {
                collectionView.invalidateIntrinsicContentSize()
                
                if let constraint = collectionView.constraints.first(where: { $0.firstAttribute == .height && $0.firstItem as? UICollectionView == collectionView }) {
                    constraint.constant = newContentSize.height
                } else {
                    var frame = collectionView.frame
                    frame.size.height = newContentSize.height
                    collectionView.frame = frame
                }
                
                collectionView.superview?.setNeedsLayout()
                collectionView.superview?.layoutIfNeeded()
            }
        }
    }
    
    private func configureNonScrollableTableView(_ tableView: UITableView) {
        // Disable scrolling
        tableView.isScrollEnabled = false
        tableView.bounces = false
        tableView.alwaysBounceVertical = false
        
        // Remove existing observer to avoid duplicates
        tableView.removeObserver(forKeyPath: "contentSize")
        
        // Observe contentSize changes for dynamic updates (rotation, content changes)
        tableView.observeContentSize { newContentSize in
            DispatchQueue.main.async {
                tableView.invalidateIntrinsicContentSize()
                
                if let constraint = tableView.constraints.first(where: { $0.firstAttribute == .height && $0.firstItem as? UITableView == tableView }) {
                    constraint.constant = newContentSize.height
                } else {
                    var frame = tableView.frame
                    frame.size.height = newContentSize.height
                    tableView.frame = frame
                }
                
                tableView.superview?.setNeedsLayout()
                tableView.superview?.layoutIfNeeded()
            }
        }
    }
}

// MARK: - ContentSize Observer Helper

private extension UIScrollView {
    nonisolated(unsafe) private static var contentSizeObserverKey: UInt8 = 0
    
    func observeContentSize(_ handler: @escaping (CGSize) -> Void) {
        let observer = ContentSizeObserver(handler: handler)
        objc_setAssociatedObject(self, &Self.contentSizeObserverKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.addObserver(observer, forKeyPath: "contentSize", options: [.new], context: nil)
    }
    
    func removeObserver(forKeyPath keyPath: String) {
        if let observer = objc_getAssociatedObject(self, &Self.contentSizeObserverKey) as? ContentSizeObserver {
            self.removeObserver(observer, forKeyPath: keyPath)
            objc_setAssociatedObject(self, &Self.contentSizeObserverKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

private class ContentSizeObserver: NSObject {
    let handler: (CGSize) -> Void
    
    init(handler: @escaping (CGSize) -> Void) {
        self.handler = handler
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize", let newSize = change?[.newKey] as? CGSize {
            handler(newSize)
        }
    }
}


