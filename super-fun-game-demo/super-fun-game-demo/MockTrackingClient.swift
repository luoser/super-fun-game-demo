public final class MockTrackingClient: TrackingClientType {
  internal var tracks: [(String)] = []

  public func track(event event: String) {
    self.tracks.append((event: event))
  }

  internal var events: [String] {
    return self.tracks.map { $0 }
  }
}
