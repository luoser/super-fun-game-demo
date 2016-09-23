import ReactiveCocoa
import Result

public protocol ViewModelInputs {
  func actionButtonTapped()
}

public protocol ViewModelOutputs {
  var doSomething: Signal<String, NoError> { get }
}

public protocol ViewModelType {
  var inputs: ViewModelInputs { get }
  var outputs: ViewModelOutputs { get }
}

public final class ViewModel: ViewModelType, ViewModelInputs, ViewModelOutputs {

  public init() {

    self.doSomething = self.actionButtonTappedProperty.signal
      .map { "Leave me alone!" }

    self.doSomething
      .observeNext { _ in AppEnvironment.current.panda.trackButtonTapped() }
  }

  private let actionButtonTappedProperty = MutableProperty()
  public func actionButtonTapped() {
    self.actionButtonTappedProperty.value = ()
  }

  public let doSomething: Signal<String, NoError>

  public var inputs: ViewModelInputs { return self }
  public var outputs: ViewModelOutputs { return self }
}
