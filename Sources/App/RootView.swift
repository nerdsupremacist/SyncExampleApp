
import SwiftUI
import Sync
import Model
import SyncWebSocketClient

let url = URL(string: "ws://localhost:8080/view_model")!

public struct RootView: View {
    public init() { }

    public var body: some View {
        Sync(ViewModel.self,
             using: .webSocket(url: url),
             reconnectionStrategy: .tryAgain(delay: 5)) { viewModel in
            
            ContentView(viewModel: viewModel)
        }
    }
}

struct ContentView: View {
    @SyncedObject
    var viewModel: ViewModel

    var body: some View {
        VStack {
            if $viewModel.connection.isConnected {
                Text("This view is synced over the network!").bold()
                Text("Soo cool right?!")
            }

            Toggle("Look at this toggle!", isOn: $viewModel.toggle)
                .animation(.easeIn, value: viewModel.toggle)
                .disabled(!$viewModel.connection.isConnected)
                .animation(.easeInOut, value: !$viewModel.connection.isConnected)


            if !$viewModel.connection.isConnected {
                Text("Currently not connected").foregroundColor(.red).bold().padding()
            }
        }
        .padding(64)
    }
}
