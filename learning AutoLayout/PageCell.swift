

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {return}
            cameraImageView.image = UIImage(named: page.imageName)
            let attributedString = NSMutableAttributedString(string: page.headerText, attributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)
                ])
            
            attributedString.append(NSAttributedString(string: page.bodyText, attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor : UIColor.gray
                ]))
            
            descriptionTextView.attributedText = attributedString
            descriptionTextView.textAlignment = .center
        }
    }
    
    let cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let topImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
 
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("initialisation\(aDecoder) is not implemented.")
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        
        
        topImageContainerView.addSubview(cameraImageView)
        
        NSLayoutConstraint.activate([
            cameraImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            cameraImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 0),
            cameraImageView.widthAnchor.constraint(equalToConstant: 200),
            cameraImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
            ])
        
        
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
    
}

