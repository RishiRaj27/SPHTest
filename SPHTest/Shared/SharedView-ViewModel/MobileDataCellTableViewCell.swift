//
//  MobileDataCellTableViewCell.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import UIKit

class MobileDataCellTableViewCell: UITableViewCell {

  
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           
           super.init(coder: aDecoder)
           
       }
       
       let cellView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.red
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
        let titleYear: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 16)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
        let descriptionData: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
       
       let titleLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       let descriptionLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.textColor = UIColor.white
           label.font = UIFont.systemFont(ofSize: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
        let clickableImageView:UIImageView = {
            let img = UIImageView()
            img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
            img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            img.layer.cornerRadius = 30
            img.clipsToBounds = true
            return img
        }()

       func setupView() {
           addSubview(cellView)
           cellView.addSubview(titleLabel)
           cellView.addSubview(titleYear)
           cellView.addSubview(descriptionLabel)
           cellView.addSubview(descriptionData)
           cellView.addSubview(clickableImageView)
           let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
           clickableImageView.isUserInteractionEnabled = true
           clickableImageView.addGestureRecognizer(singleTap)
        
           NSLayoutConstraint.activate([
               cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
               cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
               cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
               cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8)
               ])
           
           NSLayoutConstraint.activate([
               titleLabel.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 2),
               titleLabel.leftAnchor.constraint(equalTo: self.cellView.leftAnchor, constant: 8),
               titleLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -8),
               titleLabel.widthAnchor.constraint(equalToConstant: 80)
               ])
        
            NSLayoutConstraint.activate([
                     titleYear.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 2),
                     titleYear.rightAnchor.constraint(equalTo: self.cellView.rightAnchor, constant: 0),
                     titleYear.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8),
                     titleYear.bottomAnchor.constraint(equalTo: self.descriptionData.topAnchor, constant: -8)
                     ])
           
           NSLayoutConstraint.activate([
               descriptionLabel.leftAnchor.constraint(equalTo: self.cellView.leftAnchor, constant: 8),
               descriptionLabel.bottomAnchor.constraint(equalTo: self.cellView.bottomAnchor, constant: -8),
               descriptionLabel.widthAnchor.constraint(equalToConstant: 80)

            
               ])
          NSLayoutConstraint.activate([
                      descriptionData.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 8),
                      descriptionData.bottomAnchor.constraint(equalTo: self.cellView.bottomAnchor, constant: -8)
                      ])
        
        NSLayoutConstraint.activate([
                        clickableImageView.rightAnchor.constraint(equalTo: self.cellView.rightAnchor, constant: 0),
                        clickableImageView.leftAnchor.constraint(equalTo: descriptionData.rightAnchor, constant: 8),
                        clickableImageView.centerYAnchor.constraint(equalTo: self.cellView.centerYAnchor, constant: 0),
                        clickableImageView.widthAnchor.constraint(equalToConstant: 60),
                        clickableImageView.heightAnchor.constraint(equalToConstant: 60)
                        ])
       }
       
       func setUpData(data:MobileDataFieldsViewModel){
            titleLabel.text = "Year: "
            descriptionLabel.text = "Volume: "
            titleYear.text = data.quarter
            descriptionData.text = data.volume
            if data.volumeDataDecrease == true {
                clickableImageView.image = UIImage(named:"chart")
            }else {
                clickableImageView.isHidden = true
            }
            
       }
       
        //Action
        @objc func tapDetected() {
           let alert = UIAlertController(title: "Alert", message: "Decrease in volume data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                // topController should now be your topmost view controller
            
        }
       

}


struct MobileDataFieldsViewModel : Equatable {
    var volume: String = ""
    var quarter: String = ""
    var year: String = ""
    var id: Int = 0
    var volumeDataDecrease: Bool = false
}


func ==(lhs: MobileDataFieldsViewModel, rhs: MobileDataFieldsViewModel) -> Bool {
    return (lhs.volume == rhs.volume || lhs.quarter == rhs.quarter || lhs.year == rhs.year ||  lhs.id == rhs.id || lhs.volumeDataDecrease == rhs.volumeDataDecrease)
}

