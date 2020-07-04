//
//  FactsTableViewCell.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {

    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let factImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.backgroundColor = UIColor.lightGray
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 50
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
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
        
        //Add ImageView to contentView and labels to ContainerView
        self.contentView.addSubview(factImageView)
        containerView.addSubview(factTitleLabel)
        containerView.addSubview(factDescriptionLabel)
        self.contentView.addSubview(containerView)

        //FactImageView Constraints
        factImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        factImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        factImageView.widthAnchor.constraint(equalToConstant:100).isActive = true
        factImageView.heightAnchor.constraint(equalToConstant:100).isActive = true

        //ContainerView Constraints
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.factImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        //FactTitleLabel Constraints
        factTitleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        factTitleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        factTitleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        //FactDescriptionLabel Constraints
        factDescriptionLabel.topAnchor.constraint(equalTo:self.factTitleLabel.bottomAnchor).isActive = true
        factDescriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        factDescriptionLabel.topAnchor.constraint(equalTo:self.factTitleLabel.bottomAnchor).isActive = true
        factDescriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        factDescriptionLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:0).isActive = true

    }
    

}
