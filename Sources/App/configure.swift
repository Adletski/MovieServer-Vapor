import Vapor
import TelegramVaporBot
import Fluent
import FluentPostgresDriver

let TGBOT: TGBotConnection = .init()

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes
    
    let tgApi: String = "6764009840:AAH2W6yaxmvq67Qbe83JffU8B9dbldstQiQ"
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGLongPollingConnection(bot: bot))
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()
    
    try routes(app)
}
