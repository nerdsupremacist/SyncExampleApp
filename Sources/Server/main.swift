
import Foundation
import Model
import Vapor
import SyncWebSocketVapor

let app = Application(try .detect())

let viewModel = ViewModel()
app.syncObjectOverWebSocket("view_model") { _ in
    return viewModel
}

try app.run()
