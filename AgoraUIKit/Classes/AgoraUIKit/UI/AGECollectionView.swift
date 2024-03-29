//
//  VideoView.swift
//  BreakoutRoom
//
//  Created by zhaoyongqiang on 2021/10/29.
//

import UIKit

@objc
public protocol AGECollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    @objc optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       sizeForItemAt indexPath: IndexPath) -> CGSize
    
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       viewForSupplementaryElementOfKind kind: String,
                                       at indexPath: IndexPath) -> UICollectionReusableView
    
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       referenceSizeForHeaderInSection section: Int) -> CGSize
    
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       referenceSizeForFooterInSection section: Int) -> CGSize
    
    @objc optional func collectionView(_ collectionView: UICollectionView,
                                       layout collectionViewLayout: UICollectionViewLayout,
                                       insetForSectionAt section: Int) -> UIEdgeInsets
    
    @objc optional func pullToRefreshHandler()
}

open class AGECollectionView: UIView {
    //MARK: Public
    public var itemSize: CGSize = .zero {
        didSet {
            flowLayout.itemSize = itemSize
        }
    }
    public var estimatedItemSize: CGSize = .zero {
        didSet {
            flowLayout.estimatedItemSize = estimatedItemSize
        }
    }
    public var edge: UIEdgeInsets = .zero
    public var minLineSpacing: CGFloat = 0
    public var minInteritemSpacing: CGFloat = 0
    public var scrollDirection: UICollectionView.ScrollDirection = .horizontal
    public var showsHorizontalScrollIndicator: Bool = false {
        didSet {
            collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        }
    }
    public var showsVerticalScrollIndicator: Bool = false {
        didSet {
            collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        }
    }
    public var isPagingEnabled: Bool = false {
        didSet {
            collectionView.isPagingEnabled = isPagingEnabled
        }
    }
    public var isScrollEnabled: Bool = true {
        didSet {
            collectionView.isScrollEnabled = isScrollEnabled
        }
    }
    weak open var delegate: AGECollectionViewDelegate?
    public var dataArray: [Any]? {
        didSet {
            flowLayout.scrollDirection = scrollDirection
            emptyView.isHidden = !(dataArray?.isEmpty ?? true)
            collectionView.reloadData()
        }
    }
    public var visibleCells: [UICollectionViewCell] {
        collectionView.visibleCells
    }
    public var emptyTitle: String? {
        didSet {
            emptyView.setEmptyTitle(emptyTitle)
        }
    }
    public var emptyTitleColor: UIColor? {
        didSet {
            emptyView.setEmptyTitleColor(emptyTitleColor)
        }
    }
    public var emptyImage: UIImage? {
        didSet {
            emptyView.setEmptyImage(emptyImage)
        }
    }
    public var emptyTopMargin: CGFloat = 0 {
        didSet {
            emptyView.updateImageTopMargin(margin: emptyTopMargin)
        }
    }
    public var isRefreshing: Bool {
        refreshControl.isRefreshing
    }
    public func reloadData() {
        collectionView.reloadData()
    }
    public func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        collectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) {
        collectionView.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
    }
    
    public func addRefresh() {
        collectionView.refreshControl = refreshControl
    }
    public func beginRefreshing() {
        refreshControl.beginRefreshing()
    }
    public func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    private var flowLayout: UICollectionViewFlowLayout {
        _layout ?? defaultLayout
    }
    private var _layout: UICollectionViewFlowLayout?
    private lazy var defaultLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        return layout
    }()
    private(set) lazy var collectionView: AGECustomCollectionView = {
        let collectionView = AGECustomCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        let attr = NSMutableAttributedString(string: "pull to refresh", attributes: [.foregroundColor: UIColor.black])
        refresh.attributedTitle = NSAttributedString(attributedString: attr)
        refresh.addTarget(self, action: #selector(pullRefreshHandler), for: .valueChanged)
        return refresh
    }()
    private lazy var emptyView: BaseEmptyView = {
        let view = BaseEmptyView()
        view.isHidden = true
        return view
    }()
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
   public init(frame: CGRect, layout: UICollectionViewFlowLayout) {
        super.init(frame: frame)
        _layout = layout
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.addSubview(emptyView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        emptyView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor).isActive = true
        emptyView.topAnchor.constraint(equalTo: collectionView.frameLayoutGuide.topAnchor).isActive = true
        emptyView.widthAnchor.constraint(equalTo: collectionView.widthAnchor).isActive = true
        emptyView.heightAnchor.constraint(equalTo: collectionView.heightAnchor).isActive = true
    }
    
    @objc
    private func pullRefreshHandler() {
        delegate?.pullToRefreshHandler?()
    }
}

extension AGECollectionView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataArray?.first is [Any] ? dataArray?.count ?? 0 : 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataArray?.first is [Any], let array = dataArray as? [[Any]] {
            return array[section].count
        }
        return dataArray?.count ?? 0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = delegate?.collectionView(collectionView, cellForItemAt: indexPath) else { return UICollectionViewCell() }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = delegate?.collectionView?(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath) else { return UICollectionReusableView() }
        return view
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        delegate?.collectionView?(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section) ?? .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        delegate?.collectionView?(collectionView, layout: collectionViewLayout, referenceSizeForFooterInSection: section) ?? .zero
    }
}
extension AGECollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }
}

extension AGECollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        minLineSpacing
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        minInteritemSpacing
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        delegate?.collectionView?(collectionView, layout: collectionViewLayout, insetForSectionAt: section) ?? edge
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        delegate?.collectionView?(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath) ?? itemSize
    }
}


class BaseEmptyView: UIView {
    private lazy var imageView = UIImageView(image: UIImage(named: "pic-placeholding"))
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "请创建一个房间"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private var imageTopCons: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(descriptionLabel)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageTopCons = imageView.bottomAnchor.constraint(equalTo: centerYAnchor)
        imageTopCons?.isActive = true
        
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
    }
    func updateImageTopMargin(margin: CGFloat) {
        imageTopCons?.constant = margin
        imageTopCons?.isActive = true
    }
    
    func setEmptyImage(_ image: UIImage?) {
        imageView.image = image
    }
    func setEmptyTitle(_ title: String?) {
        descriptionLabel.text = title
    }
    func setEmptyTitleColor(_ textColor: UIColor?) {
        descriptionLabel.textColor = textColor
    }
}

class AGECustomCollectionView: UICollectionView {
    // Auto Layout Height
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        contentSize
    }
}
