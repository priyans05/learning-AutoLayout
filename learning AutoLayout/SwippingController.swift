
import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "Asset 3", headerText: "Let's start exploration of Camera!", bodyText: "\n\n\nAre you ready for an awesome fun! It's a good way to start your camera journey."),
        Page(imageName: "Camera 2", headerText: "We will explore each function in Camera!", bodyText: "\n\n\nAre Let's get ready!."),
        Page(imageName: "Camera 3", headerText: "We will find the best use of Camera!", bodyText: "\n\n\nBuckle up and it will be a long ride."),
        Page(imageName: "Camera 4", headerText: "We will find the best use of Camera!", bodyText: "\n\n\nAre Let's get ready!"),
        Page(imageName: "Camera 5", headerText: "Let's start learning about it!", bodyText: "\n\n\nNice to see you, now let's get to it!")
    ]
    
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrevious() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let pinkColor = UIColor(red: 0.02, green: 0.67, blue: 0.62, alpha: 1.00)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        //        let pinkColor = UIColor(red: 0.02, green: 0.67, blue: 0.62, alpha: 1.00)
        pc.currentPageIndicatorTintColor = UIColor(red: 0.02, green: 0.67, blue: 0.62, alpha: 1.00)
        pc.pageIndicatorTintColor = UIColor(red: 0.02, green: 0.67, blue: 0.62, alpha: 0.2)
        return pc
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.isPagingEnabled = true
        setupBottomControls()
    }
    
    
    
    func setupBottomControls() {
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        let botttomStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        botttomStackView.translatesAutoresizingMaskIntoConstraints = false
        botttomStackView.distribution = .fillEqually
        
        view.addSubview(botttomStackView)
        
        NSLayoutConstraint.activate([
            botttomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            botttomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            botttomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            botttomStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    
    
    
}
