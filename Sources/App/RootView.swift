
import SwiftUI
import Sync
import Model
import SyncWebSocketClient

let url = URL(string: "ws://localhost:8080/view_model")!

public struct RootView: View {
    public init() { }

    public var body: some View {
        Sync(ViewModel.self, using: WebSocketClientConnection(url: url)) { viewModel in
            ContentView(viewModel: viewModel)
        }
    }
}

struct ContentView: View {
    @SyncedObservedObject
    var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("This view is synced over the network!").bold()
            Text("Soo cool right?!")

            Toggle("Look at this toggle!", isOn: $viewModel.toggle)
                .animation(.easeIn, value: viewModel.toggle)
        }
        .padding(64)
    }
}
