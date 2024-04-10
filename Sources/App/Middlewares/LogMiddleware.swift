//
//  LogMiddleware.swift
//
//
//  Created by Adlet Zhantassov on 08.04.2024.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        print("LOG middleware")
        return try await next.respond(to: request)
    }
}
