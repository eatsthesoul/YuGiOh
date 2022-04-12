//
//  CardListCell.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 12.04.22.
//

import UIKit
import Kingfisher

class CardListCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let imageViewAnimationInterval: TimeInterval = 0.5

    private lazy var cardImageView = UIImageView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, typeLabel, descriptionLabel])
        stackView.axis = .vertical
//        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10.0
        return stackView
    }()
    
    // MARK: - Initialization and deinitialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Overriding
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardImageView.kf.cancelDownloadTask()
        cardImageView.kf.setImage(with: URL(string: ""))
    }
}


// MARK: - Appearance methods

private extension CardListCell {
    
    func addSubviews() {
        addSubview(cardImageView)
        addSubview(labelsStackView)
    }
    
    func configureLayout() {
        
        cardImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(self).inset(16)
            make.trailing.equalTo(labelsStackView.snp.leading).offset(-16)
            make.height.equalTo(246)
            make.width.equalTo(168)
        }
        
        labelsStackView.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(16)
            make.centerY.equalTo(self)
        }
    }
    
    func setPlaceholderForCellImage() {
        self.cardImageView.alpha = 0
        UIView.animate(withDuration: imageViewAnimationInterval) {
            self.cardImageView.alpha = 1
            self.cardImageView.image = UIImage.cardPlaceholder
        }
    }
}

// MARK: - API

extension CardListCell {
    
    func configure(with cardInfo: CardInfo) {
        //labels text
        nameLabel.text = cardInfo.name
        typeLabel.text = cardInfo.type
        descriptionLabel.text = cardInfo.description
        
        //type label color
        typeLabel.textColor = UIColor.color(for: cardInfo.type)
        
        //check card image url
        guard let imageStringUrl = cardInfo.imageUrl,
              let imageUrl = URL(string: imageStringUrl)
        else {
            setPlaceholderForCellImage()
            return
        }
        
        //set card image
        cardImageView.kf.indicatorType = .activity
        cardImageView.kf.setImage(
            with: imageUrl,
            options: [
                .transition(.fade(imageViewAnimationInterval)),
                .cacheOriginalImage
            ])
        {
            switch $0 {
            case .success:
                return
            case .failure:
                self.setPlaceholderForCellImage()
            }
        }
    }
}
