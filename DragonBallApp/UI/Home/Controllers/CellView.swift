//
//  CellView.swift
//  DragonBallApp
//
//  Created by sergio serrano on 25/7/22.
//

import UIKit

class CellView: UICollectionViewCell {
    static var cellIdentifier: String {
        String(describing: CellView.self)
    }
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = 4.0
        cellView.layer.cornerRadius = 4.0
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowRadius = 4.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellImage.image = nil
        cellTitle.text = nil
    }
    
    func updateViews(data: HomeCellModel) {
        update(image: data.image)
        update(title: data.title)
    }
    
    private func update(image: String?) {
        cellImage.image = UIImage(named: image ?? "")
    
    }
    
    private func update(title: String?) {
        cellTitle.text = title
    }
}
