public final class Panda {
  private let client: TrackingClientType

  public init(client: TrackingClientType) {
    self.client = client
  }

  public func trackButtonTapped() {
    self.client.track(event: "Button Tapped")
  }
}
