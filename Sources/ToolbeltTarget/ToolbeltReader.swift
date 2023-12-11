import SwiftUI

public struct ToolbeltReader<Content: View>: View {
    let content: (Bool) -> Content

    @Environment(\.toolbelt)
    private var toolbelt

    public init(@ViewBuilder content: @escaping (Bool) -> Content) {
        self.content = content
    }

    public var body: some View {
        content(toolbelt)
    }
}
