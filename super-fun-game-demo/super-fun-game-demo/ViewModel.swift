import ReactiveCocoa
import Result

public protocol ViewModelInputs {
}

public protocol ViewModelOutputs {
}

public final class ViewModel: ViewModelInputs, ViewModelOutputs {

  public init() {
  }
}


















private func imageNameFor(score score: Int) -> String {
  switch score {
  case 0...3:
    return "happy"
  case 4...7:
    return "content"
  default:
    return "grumpy"
  }
}
