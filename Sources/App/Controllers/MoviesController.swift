//
//  MoviesController.swift
//
//
//  Created by Adlet Zhantassov on 08.04.2024.
//

import Foundation
import Vapor

struct MoviesController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        movies.get(use: index)
        movies.get(":movieId", use: show)
    }
    
    func index(req: Request) async throws -> String {
        return "Index"
    }
    
    func show(req: Request) async throws -> String {
        guard let movieId = req.parameters.get("movieId") else {
            throw Abort(.internalServerError)
        }
        
        return "\(movieId)"
    }
}
