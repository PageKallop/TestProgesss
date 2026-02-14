// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct ProgressRingView: View {
  public var current: Double
  public var total: Double
  var progress: Double { current / total }
  
  public init(current: Double, total: Double) {
    self.current = current
    self.total = total
  }
  
  public var body: some View {
    ZStack {
      Circle().stroke(lineWidth: 10).opacity(0.3).foregroundColor(.blue)
      Circle()
        .trim(from: 0, to: CGFloat(progress))
        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
        .foregroundColor(.green)
        .rotationEffect(.degrees((-90)))
      Text("\(Int(progress * 100))%")
        .bold()
    }.frame(width: 100, height: 100)
  }
}

#Preview {
    // Basic static preview
    ProgressRingView(current: 75, total: 100)
}
