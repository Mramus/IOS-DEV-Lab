//
//  FastFoodTableViewcell.swift
//  Lab Exercise 1
//
//  Created by student on 2/22/23.
//

import UIKit

class FastFoodTableViewCell: UITableViewCell {
    let Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalToConstant: 100),imageView.widthAnchor.constraint(equalToConstant: 100)])
        return imageView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        setupUIV2()
    }

//    func setupUIV1() {
//        Label.translatesAutoresizingMaskIntoConstraints = false
//        ImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(Label)
//        contentView.addSubview(ImageView)
//
//        let constraints = [
//            Label.topAnchor.constraint(equalTo: ImageView.bottomAnchor),
//            Label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            Label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//
//            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }

    func setupUIV2() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(ImageView)
        stackView.addArrangedSubview(Label)

        let constraints = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    lazy var string: String = {
        print("Creating string...")
        return "Test"
    }()

    func onTap() {
        print(string)
    }
}
