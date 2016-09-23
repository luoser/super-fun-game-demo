public protocol TrackingClientType {
  func track(event event: String)
}

public extension TrackingClientType {
  public func track(event event: String) {
    self.track(event: event)
  }
}
