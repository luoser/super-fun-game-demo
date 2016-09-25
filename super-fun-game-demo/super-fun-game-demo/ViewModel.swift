import ReactiveCocoa
import Result

public protocol ViewModelInputs {
  func actionButtonTapped()
  func viewDidLoad()
}

public protocol ViewModelOutputs {
  var buttonTitle: Signal<String, NoError> { get }
  var hint: Signal<String, NoError> { get }
  var image: Signal<UIImage?, NoError> { get }
  var scoreLabel: Signal<String, NoError> { get }
}

public protocol ViewModelType {
  var inputs: ViewModelInputs { get }
  var outputs: ViewModelOutputs { get }
}

public final class ViewModel: ViewModelType, ViewModelInputs, ViewModelOutputs {

  public init() {

    let count = self.actionButtonTappedProperty.signal
      .scan(0) { acc, _ in acc + 1 }

    self.buttonTitle = count
      .map { _ in "Don't press me" }

    self.image = count
      .map {
        switch $0 {
        case 0:
          return nil
        case 1...5:
          return UIImage(named: "1")
        case 5...10:
          return UIImage(named: "2")
        case 10...20:
          return UIImage(named: "3")
        default:
          return UIImage(named: "4")
        }
    }

    self.scoreLabel = count.map { String($0) }

    // a11y
    self.hint = self.actionButtonTappedProperty.signal
      .map { "Prints message." }

    // Tracking
    self.actionButtonTappedProperty.signal
      .observeNext { _ in AppEnvironment.current.panda.trackButtonTapped() }
  }

  private let actionButtonTappedProperty = MutableProperty()
  public func actionButtonTapped() {
    self.actionButtonTappedProperty.value = ()
  }

  private let viewDidLoadProperty = MutableProperty()
  public func viewDidLoad() {
    self.viewDidLoadProperty.value = ()
  }

  public let buttonTitle: Signal<String, NoError>
  public let hint: Signal<String, NoError>
  public let image: Signal<UIImage?, NoError>
  public let scoreLabel: Signal<String, NoError>

  public var inputs: ViewModelInputs { return self }
  public var outputs: ViewModelOutputs { return self }
}

private func isGameOver(score score: Int) -> Bool {
  return score == 6
}
