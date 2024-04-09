//
//  File.swift
//  
//
//  Created by Adlet Zhantassov on 08.04.2024.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        //headers: authorization: Bearer token
        guard let authorization = request.headers.bearerAuthorization else { throw Abort(.unauthorized) }
        print(authorization.token)
        return try await next.respond(to: request)
    }
}
