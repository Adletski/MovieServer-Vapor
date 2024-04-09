import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes
    
    app.databases.use(.postgres(hostname: "flora.db.elephantsql.com", username: "ecytdsta", password: "ufcUrI46s4nkRwbaWUZuWSHUKXxtxjV4", database: "ecytdsta"), as: .psql)
    
    //register migration
    app.migrations.add(CreateMoviesTableMigration())
    
    try routes(app)
}
