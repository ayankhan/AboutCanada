//
//  FactsTableViewCell.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    let factImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.backgroundColor = UIColor.lightGray
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 40
        img.clipsToBounds = true
        return img
    }()
    
    let factTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let factDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCellView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    private func setupCellView(){
        
        //Add ImageView and labels to contentView
        self.contentView.addSubview(factImageView)
        self.contentView.addSubview(factTitleLabel)
        self.contentView.addSubview(factDescriptionLabel)

        //FactImageView Constraints
        factImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        factImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        factImageView.widthAnchor.constraint(equalToConstant:80).isActive = true
        factImageView.heightAnchor.constraint(equalToConstant:80).isActive = true
        factImageView.bottomAnchor.constraint(lessThanOrEqualTo:self.contentView.bottomAnchor, constant:-10).isActive = true

        //FactTitleLabel Constraints
        factTitleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10).isActive = true
        factTitleLabel.leadingAnchor.constraint(equalTo:self.factImageView.trailingAnchor,constant: 10).isActive = true
        factTitleLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor,constant: -10).isActive = true
        
        //FactDescriptionLabel Constraints
        factDescriptionLabel.topAnchor.constraint(equalTo:self.factTitleLabel.bottomAnchor,constant: 4).isActive = true
        factDescriptionLabel.leadingAnchor.constraint(equalTo:self.factTitleLabel.leadingAnchor).isActive = true
        factDescriptionLabel.trailingAnchor.constraint(equalTo:self.factTitleLabel.trailingAnchor).isActive = true
        factDescriptionLabel.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor,constant: -10).isActive = true


    }
    

}
