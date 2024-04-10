//
//  File.swift
//  
//
//  Created by Adlet Zhantassov on 09.04.2024.
//

import Foundation
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    func prepare(on database: FluentKit.Database) async throws {
        // create movies table
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    // this will run when u undo migration
    func revert(on database: Database) async throws {
        // delete movies table ) smtimes we want undo migration
        try await database.schema("movies")
            .delete()
    }
}
