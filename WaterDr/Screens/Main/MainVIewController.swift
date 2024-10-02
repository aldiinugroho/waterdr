//
//  ViewController.swift
//  WaterDr
//
//  Created by ngr on 25/09/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let histories: UIViewController = HistoriesViewController()
    
    private let centerAlignt: NSParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()
    
    private lazy var ulTargetML: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "0 ML", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.blueLightWord,
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var ulProgressML: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "0% dari 0 ML", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var svTargetnProg: UIStackView = {
        let ctx = UIStackView()
        ctx.alignment = .center
        ctx.distribution = .equalSpacing
        ctx.axis = .vertical
        return ctx
    }()
    
    private lazy var svInfoBar: UIStackView = {
        let ctx = UIStackView()
        ctx.alignment = .center
        ctx.distribution = .equalSpacing
        ctx.axis = .vertical
        return ctx
    }()
    
    private lazy var uvHolderIndicator: UIView = {
        let ctx = UIView()
        ctx.backgroundColor = .softBrown
        ctx.layer.borderColor = UIColor.white.cgColor
        ctx.layer.borderWidth = 5
        ctx.layer.cornerRadius = 200 / 2
        ctx.layer.masksToBounds = true
        return ctx
    }()
    
    private lazy var ulEmoji: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "😌", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100, weight: .bold),
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var uivHistory: UIImageView = {
        let ctx = UIImageView()
        ctx.image = UIImage(named: "icHistory")
        return ctx
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBase()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showModalHistories()
    }
    
    private func setupLayout() {
        self.view.addSubview(svInfoBar)
        svInfoBar.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(ScreenUtils.inset().top)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        svInfoBar.addArrangedSubview(self.svTargetnProg)
        svTargetnProg.addArrangedSubview(self.ulTargetML)
        svTargetnProg.addArrangedSubview(self.ulProgressML)
        svInfoBar.addArrangedSubview(self.uvHolderIndicator)
        self.uvHolderIndicator.addSubview(self.ulEmoji)
        svInfoBar.addArrangedSubview(self.uivHistory)
        self.ulTargetML.snp.makeConstraints{(make) -> Void in
            make.width.equalToSuperview()
        }
        self.ulProgressML.snp.makeConstraints{(make) -> Void in
            make.width.equalToSuperview()
        }
        self.uvHolderIndicator.snp.makeConstraints{(make) -> Void in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
        self.ulEmoji.snp.makeConstraints {(make) -> Void in
            make.center.equalToSuperview()
        }
        self.uivHistory.snp.makeConstraints {(make) -> Void in
            make.width.height.equalTo(25)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupBase() {
        self.view.backgroundColor = UIColor.blueLight
    }
    
    private func showModalHistories() {
        histories.modalPresentationStyle = .custom
        histories.isModalInPresentation = true
        histories.transitioningDelegate = self
        present(histories, animated: true)
    }
}

// Extend MainViewController for transitioning delegate
extension MainViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

class CustomPresentationController: UIPresentationController {
    private var panGestureRecognizer: UIPanGestureRecognizer!

    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        // Add the pan gesture recognizer to the presented view
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        presentedView?.addGestureRecognizer(panGestureRecognizer)
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        // Remove the pan gesture recognizer
        if let gesture = panGestureRecognizer {
            presentedView?.removeGestureRecognizer(gesture)
        }
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        let height = ScreenUtils.size().height * 0.4
        return CGRect(x: 0,
                      y: ScreenUtils.size().height - height,
                      width: ScreenUtils.size().width,
                      height: ScreenUtils.size().height)
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let presentedView = presentedView else { return }

        let translation = gesture.translation(in: presentedView.superview)
        // Move the presented view based on the drag
        let newY = presentedView.frame.origin.y + translation.y
        let origin = self.frameOfPresentedViewInContainerView.origin.y
        let maxScreenHeight = ScreenUtils.size().height / 4
        switch gesture.state {
        case .changed:
            // Update the presented view's position
            presentedView.frame.origin.y = newY
            // Reset the translation to zero after applying
            gesture.setTranslation(.zero, in: presentedView.superview)
        case .ended:
            // Animate back to the original position
            UIView.animate(withDuration: 0.8,
                           delay: 0,
                           usingSpringWithDamping: 0.5, // Use spring damping for the bounce effect
                           initialSpringVelocity: 0.5, // Set an initial velocity for the bounce
                           options: [],
                           animations: {
                presentedView.frame.origin.y = origin < newY ? origin : (newY < maxScreenHeight ? maxScreenHeight : newY)
                           }, completion: nil)
        default:
            break
        }
    }
}

