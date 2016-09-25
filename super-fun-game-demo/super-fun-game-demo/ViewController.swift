import UIKit

internal final class ViewController: UIViewController {
//  private let viewModel: ViewModelType = ViewModel()
  private var count: Int = 0

  @IBOutlet private weak var actionButton: UIButton!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var scoreLabel: UILabel!

  internal override func viewDidLoad() {
    super.viewDidLoad()

    self.imageView.image = nil
    self.scoreLabel.text = "0"

//    self.viewModel.outputs.image
//      .observeNext { [weak self] image in
//        self?.imageView.image = image
//    }
//
//    self.viewModel.outputs.hint
//      .observeNext { [weak self] hint in
//        self?.actionButton.accessibilityHint = hint
//    }
//
//    self.viewModel.outputs.scoreLabel
//      .observeNext { [weak self] score in
//        self?.scoreLabel.text = score
//    }
  }

  @IBAction private func actionButtonTapped() {
//    self.viewModel.inputs.actionButtonTapped()
    self.doSomething()
  }

  private func doSomething() {
    count += 1

    self.scoreLabel.text = String(count)

    switch count {
    case 0:
      self.imageView.image = nil
    case 1...5:
      self.imageView.image = UIImage(named: "1")
    case 5...10:
      self.imageView.image = UIImage(named: "2")
    case 10...20:
      self.imageView.image = UIImage(named: "3")
    default:
      self.imageView.image = UIImage(named: "4")
    }
  }
}
