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

public extension ToolbeltReader {
    static func `if`(enabled: Bool, @ViewBuilder content: @escaping () -> Content) -> ToolbeltReader<Content?> {
        .init { value in
            if value == enabled {
                content()
            }
        }
    }

    static func enabled(@ViewBuilder content: @escaping () -> Content) -> ToolbeltReader<Content?> {
        Self.if(enabled: true, content: content)
    }

    static func disabled(@ViewBuilder content: @escaping () -> Content) -> ToolbeltReader<Content?> {
        Self.if(enabled: false, content: content)
    }
}

struct ToolbeltReader_Previews: PreviewProvider {
    struct Preview: View {
        @State var enabled = true

        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    ToolbeltReader { value in
                        Text(verbatim: "value " + (value ? "enabled" : "disabled"))
                    }
                    ToolbeltReader.if(enabled: true) {
                        Text(verbatim: "if true")
                    }
                    ToolbeltReader.if(enabled: false) {
                        Text(verbatim: "if false")
                    }
                    ToolbeltReader.enabled {
                        Text(verbatim: "enabled")
                    }
                    ToolbeltReader.disabled {
                        Text(verbatim: "disabled")
                    }
                }
                Spacer()
                Button("Toggle") {
                    enabled.toggle()
                }
            }
            .padding()
            .toolbelt(enabled)
        }
    }

    static var previews: some View {
        Preview()
    }
}


//    public static func enabled(@ViewBuilder content: @escaping (Bool) -> Content)) -> some View {
//        ToolbeltReader { enabled in
//
//
//        }
//    }
